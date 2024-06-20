; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69850 () Bool)

(assert start!69850)

(declare-fun res!258266 () Bool)

(declare-fun e!226621 () Bool)

(assert (=> start!69850 (=> (not res!258266) (not e!226621))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19414 0))(
  ( (array!19415 (arr!9511 (Array (_ BitVec 32) (_ BitVec 8))) (size!8431 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19414)

(declare-fun a3!79 () array!19414)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19414)

(assert (=> start!69850 (= res!258266 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8431 a1!825) (size!8431 a2!825)) (= (size!8431 a2!825) (size!8431 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8431 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8431 a2!825))))))))

(assert (=> start!69850 e!226621))

(assert (=> start!69850 true))

(declare-fun array_inv!7983 (array!19414) Bool)

(assert (=> start!69850 (array_inv!7983 a1!825)))

(assert (=> start!69850 (array_inv!7983 a3!79)))

(assert (=> start!69850 (array_inv!7983 a2!825)))

(declare-fun b!315117 () Bool)

(declare-fun res!258263 () Bool)

(assert (=> b!315117 (=> (not res!258263) (not e!226621))))

(declare-fun arrayBitRangesEq!0 (array!19414 array!19414 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315117 (= res!258263 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315118 () Bool)

(declare-fun res!258265 () Bool)

(assert (=> b!315118 (=> (not res!258265) (not e!226621))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315118 (= res!258265 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315119 () Bool)

(declare-fun res!258268 () Bool)

(assert (=> b!315119 (=> (not res!258268) (not e!226621))))

(assert (=> b!315119 (= res!258268 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315120 () Bool)

(declare-fun res!258264 () Bool)

(assert (=> b!315120 (=> (not res!258264) (not e!226621))))

(assert (=> b!315120 (= res!258264 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315121 () Bool)

(declare-fun res!258269 () Bool)

(assert (=> b!315121 (=> (not res!258269) (not e!226621))))

(assert (=> b!315121 (= res!258269 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315122 () Bool)

(declare-fun res!258267 () Bool)

(assert (=> b!315122 (=> (not res!258267) (not e!226621))))

(assert (=> b!315122 (= res!258267 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315123 () Bool)

(assert (=> b!315123 (= e!226621 (and (not (= i!1020 mid!82)) (not (= (size!8431 a1!825) (size!8431 a3!79)))))))

(assert (= (and start!69850 res!258266) b!315117))

(assert (= (and b!315117 res!258263) b!315120))

(assert (= (and b!315120 res!258264) b!315122))

(assert (= (and b!315122 res!258267) b!315118))

(assert (= (and b!315118 res!258265) b!315121))

(assert (= (and b!315121 res!258269) b!315119))

(assert (= (and b!315119 res!258268) b!315123))

(declare-fun m!452699 () Bool)

(assert (=> b!315118 m!452699))

(declare-fun m!452701 () Bool)

(assert (=> b!315121 m!452701))

(declare-fun m!452703 () Bool)

(assert (=> b!315119 m!452703))

(declare-fun m!452705 () Bool)

(assert (=> b!315120 m!452705))

(declare-fun m!452707 () Bool)

(assert (=> start!69850 m!452707))

(declare-fun m!452709 () Bool)

(assert (=> start!69850 m!452709))

(declare-fun m!452711 () Bool)

(assert (=> start!69850 m!452711))

(declare-fun m!452713 () Bool)

(assert (=> b!315117 m!452713))

(push 1)

(assert (not b!315117))

(assert (not b!315119))

(assert (not start!69850))

(assert (not b!315120))

(assert (not b!315121))

(assert (not b!315118))

(check-sat)

