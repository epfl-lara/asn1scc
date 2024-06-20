; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70656 () Bool)

(assert start!70656)

(declare-datatypes ((Unit!21917 0))(
  ( (Unit!21918) )
))
(declare-fun lt!443660 () Unit!21917)

(declare-datatypes ((array!20024 0))(
  ( (array!20025 (arr!9817 (Array (_ BitVec 32) (_ BitVec 8))) (size!8725 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20024)

(declare-fun lt!443659 () (_ BitVec 64))

(declare-fun rec!17 (array!20024 (_ BitVec 64)) Unit!21917)

(assert (=> start!70656 (= lt!443660 (rec!17 a!422 lt!443659))))

(assert (=> start!70656 (= lt!443659 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8725 a!422))))))

(assert (=> start!70656 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443659)))

(declare-fun array_inv!8277 (array!20024) Bool)

(assert (=> start!70656 (array_inv!8277 a!422)))

(declare-fun bs!27470 () Bool)

(assert (= bs!27470 start!70656))

(declare-fun m!458273 () Bool)

(assert (=> bs!27470 m!458273))

(declare-fun m!458275 () Bool)

(assert (=> bs!27470 m!458275))

(push 1)

(assert (not start!70656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104781 () Bool)

(declare-fun e!229999 () Bool)

(assert (=> d!104781 e!229999))

(declare-fun res!262765 () Bool)

(assert (=> d!104781 (=> (not res!262765) (not e!229999))))

(declare-fun lt!443682 () (_ BitVec 64))

(assert (=> d!104781 (= res!262765 (or (= lt!443682 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443682 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443682))))))

(assert (=> d!104781 (= lt!443682 ((_ sign_extend 32) (size!8725 a!422)))))

(declare-fun lt!443684 () Unit!21917)

(declare-fun e!230000 () Unit!21917)

(assert (=> d!104781 (= lt!443684 e!230000)))

(declare-fun c!15310 () Bool)

(assert (=> d!104781 (= c!15310 (= lt!443659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104781 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443659) (bvsle lt!443659 (bvmul ((_ sign_extend 32) (size!8725 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104781 (= (rec!17 a!422 lt!443659) lt!443684)))

(declare-fun b!319812 () Bool)

(declare-fun Unit!21923 () Unit!21917)

(assert (=> b!319812 (= e!230000 Unit!21923)))

(declare-fun b!319814 () Bool)

(assert (=> b!319814 (= e!230000 (rec!17 a!422 (bvsub lt!443659 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!319816 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20024 array!20024 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319816 (= e!229999 (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8725 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104781 c!15310) b!319812))

(assert (= (and d!104781 (not c!15310)) b!319814))

(assert (= (and d!104781 res!262765) b!319816))

(declare-fun m!458287 () Bool)

(assert (=> b!319814 m!458287))

(declare-fun m!458291 () Bool)

(assert (=> b!319816 m!458291))

(assert (=> start!70656 d!104781))

(declare-fun d!104788 () Bool)

(assert (=> d!104788 (= (array_inv!8277 a!422) (bvsge (size!8725 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70656 d!104788))

(push 1)

(assert (not b!319814))

(assert (not b!319816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

