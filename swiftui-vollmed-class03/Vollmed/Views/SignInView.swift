//
//  SignInView.swift
//  Vollmed
//
//  Created by Leandro Rodrigues on 10.04.2024.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    
    let service = WebService()
    
    func login() async {
        do {
            if let response = try await service.loginPatient(email: email, password: password) {
                print(response)
            } else {
                showAlert = true
            }
        } catch {
            print("Ocorreu um erro no login: \(error)")
            showAlert = true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 36.0, alignment: .center)
            
            Text("Ola")
                .font(.title2)
                .bold()
                .foregroundStyle(.accent)
            
            Text("Preencha para acessar sua conta.")
                .font(.title3)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            Text("Email")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
            
            TextField("Insira seu email", text: $email)
                .padding(14)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14.0)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            Text("Senha")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
            
            SecureField("Insira sua senha", text: $password)
                .padding(14)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14.0)
            
            Button(action: {
                Task {
                    await login()
                }
            }, label: {
                ButtonView(text: "Entrar")
            })
            
            NavigationLink(destination: {
                SignUpView()
            }, label: {
                Text("Ainda nao possui uma conta? Cadastra-se")
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            })
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        .alert("Ops, Algo deu errado", isPresented: $showAlert) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Ok")
                
            })
        } message: {
            Text("Houve um erro ao entrar na sua conta. Por favor tente novamente")
        }
    }
}

#Preview {
    SignInView()
}
