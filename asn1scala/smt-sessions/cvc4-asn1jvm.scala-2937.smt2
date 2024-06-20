; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69788 () Bool)

(assert start!69788)

(declare-fun b!314375 () Bool)

(declare-fun res!257525 () Bool)

(declare-fun e!226230 () Bool)

(assert (=> b!314375 (=> (not res!257525) (not e!226230))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314375 (= res!257525 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314376 () Bool)

(assert (=> b!314376 (= e!226230 (not true))))

(declare-datatypes ((array!19352 0))(
  ( (array!19353 (arr!9480 (Array (_ BitVec 32) (_ BitVec 8))) (size!8400 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19352)

(declare-fun a2!825 () array!19352)

(declare-fun arrayBitRangesEq!0 (array!19352 array!19352 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314376 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21591 0))(
  ( (Unit!21592) )
))
(declare-fun lt!442430 () Unit!21591)

(declare-fun arrayBitRangesEqDrop1!0 (array!19352 array!19352 (_ BitVec 64) (_ BitVec 64)) Unit!21591)

(assert (=> b!314376 (= lt!442430 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19352)

(assert (=> b!314376 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442429 () Unit!21591)

(declare-fun arrayBitRangesEqAppend!0 (array!19352 array!19352 (_ BitVec 64) (_ BitVec 64)) Unit!21591)

(assert (=> b!314376 (= lt!442429 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314377 () Bool)

(declare-fun res!257527 () Bool)

(assert (=> b!314377 (=> (not res!257527) (not e!226230))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314377 (= res!257527 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314379 () Bool)

(declare-fun res!257524 () Bool)

(assert (=> b!314379 (=> (not res!257524) (not e!226230))))

(assert (=> b!314379 (= res!257524 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314380 () Bool)

(declare-fun res!257523 () Bool)

(assert (=> b!314380 (=> (not res!257523) (not e!226230))))

(assert (=> b!314380 (= res!257523 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314381 () Bool)

(declare-fun res!257528 () Bool)

(assert (=> b!314381 (=> (not res!257528) (not e!226230))))

(assert (=> b!314381 (= res!257528 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314382 () Bool)

(declare-fun res!257526 () Bool)

(assert (=> b!314382 (=> (not res!257526) (not e!226230))))

(assert (=> b!314382 (= res!257526 (not (= i!1020 mid!82)))))

(declare-fun res!257521 () Bool)

(assert (=> start!69788 (=> (not res!257521) (not e!226230))))

(assert (=> start!69788 (= res!257521 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8400 a1!825) (size!8400 a2!825)) (= (size!8400 a2!825) (size!8400 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8400 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8400 a2!825))))))))

(assert (=> start!69788 e!226230))

(assert (=> start!69788 true))

(declare-fun array_inv!7952 (array!19352) Bool)

(assert (=> start!69788 (array_inv!7952 a1!825)))

(assert (=> start!69788 (array_inv!7952 a3!79)))

(assert (=> start!69788 (array_inv!7952 a2!825)))

(declare-fun b!314378 () Bool)

(declare-fun res!257522 () Bool)

(assert (=> b!314378 (=> (not res!257522) (not e!226230))))

(assert (=> b!314378 (= res!257522 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69788 res!257521) b!314381))

(assert (= (and b!314381 res!257528) b!314380))

(assert (= (and b!314380 res!257523) b!314375))

(assert (= (and b!314375 res!257525) b!314378))

(assert (= (and b!314378 res!257522) b!314377))

(assert (= (and b!314377 res!257527) b!314379))

(assert (= (and b!314379 res!257524) b!314382))

(assert (= (and b!314382 res!257526) b!314376))

(declare-fun m!451925 () Bool)

(assert (=> b!314377 m!451925))

(declare-fun m!451927 () Bool)

(assert (=> b!314378 m!451927))

(declare-fun m!451929 () Bool)

(assert (=> start!69788 m!451929))

(declare-fun m!451931 () Bool)

(assert (=> start!69788 m!451931))

(declare-fun m!451933 () Bool)

(assert (=> start!69788 m!451933))

(declare-fun m!451935 () Bool)

(assert (=> b!314379 m!451935))

(declare-fun m!451937 () Bool)

(assert (=> b!314380 m!451937))

(declare-fun m!451939 () Bool)

(assert (=> b!314381 m!451939))

(declare-fun m!451941 () Bool)

(assert (=> b!314376 m!451941))

(declare-fun m!451943 () Bool)

(assert (=> b!314376 m!451943))

(declare-fun m!451945 () Bool)

(assert (=> b!314376 m!451945))

(declare-fun m!451947 () Bool)

(assert (=> b!314376 m!451947))

(push 1)

(assert (not b!314381))

(assert (not start!69788))

