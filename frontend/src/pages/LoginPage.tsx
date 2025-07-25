import { useState } from "react";
import TierListLogo from "../images/TierListLogo.png";
import LoginForm from "../components/LoginForm.tsx";
import ForgotPasswordModal from "../components/ForgotPasswordModal.tsx";

function Login() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [isForgotPasswordModalOpen, setIsForgotPasswordModalOpen] =
    useState(false);
  return (
    <>
      <header className="bg-gray-800 p-4">
        <nav
          className="mx-auto flex items-center justify-between p-2 lg:px-8 rounded-lg bg-gray-600"
          aria-label="Global"
        >
          <div className="flex lg:flex-1">
            <a href="./" className="-m-1.5 p-1.5">
              <span className="sr-only">Tier Builder</span>
              <img className="h-8 w-auto" src={TierListLogo} alt="" />
            </a>
          </div>
          <div className="hidden lg:flex lg:flex-1 lg:justify-end lg:gap-x-4">
            <a
              href="./register"
              className="text-sm/6 font-semibold text-white hover:text-blue-200"
            >
              Create Account<span aria-hidden="true"></span>
            </a>
            <a
              href="./login"
              className="text-sm/6 font-semibold text-white hover:text-blue-200"
            >
              Log in <span aria-hidden="true">&rarr;</span>
            </a>
          </div>
        </nav>
      </header>
      <div className="min-h-screen bg-gray-800 flex items-center justify-center">
        <div className="bg-gray-600 p-8 rounded-lg shadow-md w-full max-w-md">
          <h1 className="text-2xl font-bold text-center text-white mb-8">
            Login
          </h1>
          <LoginForm
            username={username}
            password={password}
            setUsername={setUsername}
            setPassword={setPassword}
          />
          <div className="mt-6 text-center">
            <p className="text-sm text-white">
              Don't have an account?{" "}
              <a
                href="/register"
                className="text-blue-500 hover:text-white font-medium"
              >
                Sign up
              </a>
            </p>
            <p className="mt-2 text-sm">
              <button
                onClick={() => setIsForgotPasswordModalOpen(true)}
                className="text-blue-500 hover:text-white font-medium underline"
              >
                Forgot your password?
              </button>
            </p>
          </div>
        </div>
      </div>

      <ForgotPasswordModal
        isOpen={isForgotPasswordModalOpen}
        onClose={() => setIsForgotPasswordModalOpen(false)}
      />
    </>
  );
}

export default Login;
