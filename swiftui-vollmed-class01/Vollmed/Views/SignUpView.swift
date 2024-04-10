//
//  SignUpView.swift
//  Vollmed
//
//  Created by Leandro Rodrigues on 10.04.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var cpf: String = ""
    @State private var phoneNumber: String = ""
    @State private var healthPlan: String = ""
    @State private var password: String = ""
    
    let healthPlans: [String] = [
    "Amil", "Unimed", "Bradesco Saude", "SulAmerica", "Hapvida", "Notedrame Intermedica", "Sao Francisco", "Outro"]
    
    init() {
        self.healthPlan = healthPlans[0]
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16.0) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 36.0, alignment: .center)
                
                Text("Ola, Boas vindas")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.accent)
                
                Text("Insira seus dados para criar uma conta.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                                
                Text("Nome")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu nome completo", text: $name)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .autocorrectionDisabled()
                    .keyboardType(.namePhonePad)
                
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
                
                Text("Cpf")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu CPF", text: $cpf)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .autocorrectionDisabled()
                    .keyboardType(.numberPad)
                
                Text("Telefone")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu Telefone", text: $phoneNumber)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.numberPad)
                
                Text("Senha")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                SecureField("Insira sua senha", text: $password)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                
                Text("Seleciona seu plano de saude")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                Picker("Plano de saude", selection: $healthPlan) {
                    ForEach(healthPlans, id: \.self) {
                        healthPlan in Text(healthPlan)
                    }
                }
                
                Button(action: {
                    print(healthPlan)
                }, label: {
                    ButtonView(text: "Cadastrar")
                })
                
                NavigationLink(destination: {
                    SignInView()
                }, label: {
                    Text("Ja possui uma conta? faca o login")
                        .bold()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                })
                
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    SignUpView()
}
