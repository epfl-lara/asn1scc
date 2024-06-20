; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69834 () Bool)

(assert start!69834)

(declare-fun b!314940 () Bool)

(declare-fun res!258086 () Bool)

(declare-fun e!226525 () Bool)

(assert (=> b!314940 (=> (not res!258086) (not e!226525))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19398 0))(
  ( (array!19399 (arr!9503 (Array (_ BitVec 32) (_ BitVec 8))) (size!8423 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19398)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19398)

(declare-fun arrayBitRangesEq!0 (array!19398 array!19398 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314940 (= res!258086 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314941 () Bool)

(declare-fun res!258090 () Bool)

(assert (=> b!314941 (=> (not res!258090) (not e!226525))))

(declare-fun a3!79 () array!19398)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314941 (= res!258090 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314942 () Bool)

(declare-fun res!258088 () Bool)

(assert (=> b!314942 (=> (not res!258088) (not e!226525))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314942 (= res!258088 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314943 () Bool)

(declare-fun res!258087 () Bool)

(assert (=> b!314943 (=> (not res!258087) (not e!226525))))

(assert (=> b!314943 (= res!258087 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314944 () Bool)

(declare-fun res!258092 () Bool)

(assert (=> b!314944 (=> (not res!258092) (not e!226525))))

(assert (=> b!314944 (= res!258092 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258091 () Bool)

(assert (=> start!69834 (=> (not res!258091) (not e!226525))))

(assert (=> start!69834 (= res!258091 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8423 a1!825) (size!8423 a2!825)) (= (size!8423 a2!825) (size!8423 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8423 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8423 a2!825))))))))

(assert (=> start!69834 e!226525))

(assert (=> start!69834 true))

(declare-fun array_inv!7975 (array!19398) Bool)

(assert (=> start!69834 (array_inv!7975 a1!825)))

(assert (=> start!69834 (array_inv!7975 a3!79)))

(assert (=> start!69834 (array_inv!7975 a2!825)))

(declare-fun b!314945 () Bool)

(assert (=> b!314945 (= e!226525 (and (not (= (bvand to!845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!845 i!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!314946 () Bool)

(declare-fun res!258089 () Bool)

(assert (=> b!314946 (=> (not res!258089) (not e!226525))))

(assert (=> b!314946 (= res!258089 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69834 res!258091) b!314942))

(assert (= (and b!314942 res!258088) b!314943))

(assert (= (and b!314943 res!258087) b!314944))

(assert (= (and b!314944 res!258092) b!314940))

(assert (= (and b!314940 res!258086) b!314941))

(assert (= (and b!314941 res!258090) b!314946))

(assert (= (and b!314946 res!258089) b!314945))

(declare-fun m!452565 () Bool)

(assert (=> b!314946 m!452565))

(declare-fun m!452567 () Bool)

(assert (=> b!314943 m!452567))

(declare-fun m!452569 () Bool)

(assert (=> start!69834 m!452569))

(declare-fun m!452571 () Bool)

(assert (=> start!69834 m!452571))

(declare-fun m!452573 () Bool)

(assert (=> start!69834 m!452573))

(declare-fun m!452575 () Bool)

(assert (=> b!314942 m!452575))

(declare-fun m!452577 () Bool)

(assert (=> b!314940 m!452577))

(declare-fun m!452579 () Bool)

(assert (=> b!314941 m!452579))

(check-sat (not b!314941) (not b!314940) (not b!314943) (not b!314942) (not b!314946) (not start!69834))
(check-sat)
