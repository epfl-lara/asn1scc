; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70658 () Bool)

(assert start!70658)

(declare-datatypes ((Unit!21919 0))(
  ( (Unit!21920) )
))
(declare-fun lt!443666 () Unit!21919)

(declare-datatypes ((array!20026 0))(
  ( (array!20027 (arr!9818 (Array (_ BitVec 32) (_ BitVec 8))) (size!8726 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20026)

(declare-fun lt!443665 () (_ BitVec 64))

(declare-fun rec!17 (array!20026 (_ BitVec 64)) Unit!21919)

(assert (=> start!70658 (= lt!443666 (rec!17 a!422 lt!443665))))

(assert (=> start!70658 (= lt!443665 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8726 a!422))))))

(assert (=> start!70658 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443665)))

(declare-fun array_inv!8278 (array!20026) Bool)

(assert (=> start!70658 (array_inv!8278 a!422)))

(declare-fun bs!27471 () Bool)

(assert (= bs!27471 start!70658))

(declare-fun m!458277 () Bool)

(assert (=> bs!27471 m!458277))

(declare-fun m!458279 () Bool)

(assert (=> bs!27471 m!458279))

(check-sat (not start!70658))
(check-sat)
(get-model)

(declare-fun d!104784 () Bool)

(declare-fun e!230007 () Bool)

(assert (=> d!104784 e!230007))

(declare-fun res!262768 () Bool)

(assert (=> d!104784 (=> (not res!262768) (not e!230007))))

(declare-fun lt!443689 () (_ BitVec 64))

(assert (=> d!104784 (= res!262768 (or (= lt!443689 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443689 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443689))))))

(assert (=> d!104784 (= lt!443689 ((_ sign_extend 32) (size!8726 a!422)))))

(declare-fun lt!443690 () Unit!21919)

(declare-fun e!230006 () Unit!21919)

(assert (=> d!104784 (= lt!443690 e!230006)))

(declare-fun c!15313 () Bool)

(assert (=> d!104784 (= c!15313 (= lt!443665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104784 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443665) (bvsle lt!443665 (bvmul ((_ sign_extend 32) (size!8726 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104784 (= (rec!17 a!422 lt!443665) lt!443690)))

(declare-fun b!319824 () Bool)

(declare-fun Unit!21925 () Unit!21919)

(assert (=> b!319824 (= e!230006 Unit!21925)))

(declare-fun b!319825 () Bool)

(assert (=> b!319825 (= e!230006 (rec!17 a!422 (bvsub lt!443665 #b0000000000000000000000000000000000000000000000000000000000000001)))))

