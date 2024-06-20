; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70660 () Bool)

(assert start!70660)

(declare-datatypes ((Unit!21921 0))(
  ( (Unit!21922) )
))
(declare-fun lt!443672 () Unit!21921)

(declare-datatypes ((array!20028 0))(
  ( (array!20029 (arr!9819 (Array (_ BitVec 32) (_ BitVec 8))) (size!8727 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20028)

(declare-fun lt!443671 () (_ BitVec 64))

(declare-fun rec!17 (array!20028 (_ BitVec 64)) Unit!21921)

(assert (=> start!70660 (= lt!443672 (rec!17 a!422 lt!443671))))

(assert (=> start!70660 (= lt!443671 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8727 a!422))))))

(assert (=> start!70660 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!443671)))

(declare-fun array_inv!8279 (array!20028) Bool)

(assert (=> start!70660 (array_inv!8279 a!422)))

(declare-fun bs!27472 () Bool)

(assert (= bs!27472 start!70660))

(declare-fun m!458281 () Bool)

(assert (=> bs!27472 m!458281))

(declare-fun m!458283 () Bool)

(assert (=> bs!27472 m!458283))

(push 1)

(assert (not start!70660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104782 () Bool)

(declare-fun e!229998 () Bool)

(assert (=> d!104782 e!229998))

(declare-fun res!262764 () Bool)

(assert (=> d!104782 (=> (not res!262764) (not e!229998))))

(declare-fun lt!443683 () (_ BitVec 64))

(assert (=> d!104782 (= res!262764 (or (= lt!443683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443683))))))

(assert (=> d!104782 (= lt!443683 ((_ sign_extend 32) (size!8727 a!422)))))

(declare-fun lt!443681 () Unit!21921)

(declare-fun e!230001 () Unit!21921)

(assert (=> d!104782 (= lt!443681 e!230001)))

(declare-fun c!15309 () Bool)

(assert (=> d!104782 (= c!15309 (= lt!443671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104782 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443671) (bvsle lt!443671 (bvmul ((_ sign_extend 32) (size!8727 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104782 (= (rec!17 a!422 lt!443671) lt!443681)))

(declare-fun b!319813 () Bool)

(declare-fun Unit!21924 () Unit!21921)

(assert (=> b!319813 (= e!230001 Unit!21924)))

(declare-fun b!319815 () Bool)

(assert (=> b!319815 (= e!230001 (rec!17 a!422 (bvsub lt!443671 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!319817 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20028 array!20028 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319817 (= e!229998 (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8727 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104782 c!15309) b!319813))

(assert (= (and d!104782 (not c!15309)) b!319815))

(assert (= (and d!104782 res!262764) b!319817))

(declare-fun m!458285 () Bool)

(assert (=> b!319815 m!458285))

(declare-fun m!458289 () Bool)

(assert (=> b!319817 m!458289))

(assert (=> start!70660 d!104782))

(declare-fun d!104786 () Bool)

(assert (=> d!104786 (= (array_inv!8279 a!422) (bvsge (size!8727 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70660 d!104786))

(push 1)

(assert (not b!319817))

