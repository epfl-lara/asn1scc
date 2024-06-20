; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69838 () Bool)

(assert start!69838)

(declare-fun b!314982 () Bool)

(declare-fun res!258128 () Bool)

(declare-fun e!226547 () Bool)

(assert (=> b!314982 (=> (not res!258128) (not e!226547))))

(declare-datatypes ((array!19402 0))(
  ( (array!19403 (arr!9505 (Array (_ BitVec 32) (_ BitVec 8))) (size!8425 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19402)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19402)

(declare-fun arrayBitRangesEq!0 (array!19402 array!19402 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314982 (= res!258128 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314983 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314983 (= e!226547 (bvslt (bvsub to!845 i!1020) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314984 () Bool)

(declare-fun res!258129 () Bool)

(assert (=> b!314984 (=> (not res!258129) (not e!226547))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314984 (= res!258129 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258134 () Bool)

(assert (=> start!69838 (=> (not res!258134) (not e!226547))))

(declare-fun a1!825 () array!19402)

(assert (=> start!69838 (= res!258134 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8425 a1!825) (size!8425 a2!825)) (= (size!8425 a2!825) (size!8425 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8425 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8425 a2!825))))))))

(assert (=> start!69838 e!226547))

(assert (=> start!69838 true))

(declare-fun array_inv!7977 (array!19402) Bool)

(assert (=> start!69838 (array_inv!7977 a1!825)))

(assert (=> start!69838 (array_inv!7977 a3!79)))

(assert (=> start!69838 (array_inv!7977 a2!825)))

(declare-fun b!314985 () Bool)

(declare-fun res!258132 () Bool)

(assert (=> b!314985 (=> (not res!258132) (not e!226547))))

(assert (=> b!314985 (= res!258132 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314986 () Bool)

(declare-fun res!258130 () Bool)

(assert (=> b!314986 (=> (not res!258130) (not e!226547))))

(assert (=> b!314986 (= res!258130 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314987 () Bool)

(declare-fun res!258133 () Bool)

(assert (=> b!314987 (=> (not res!258133) (not e!226547))))

(assert (=> b!314987 (= res!258133 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314988 () Bool)

(declare-fun res!258131 () Bool)

(assert (=> b!314988 (=> (not res!258131) (not e!226547))))

(assert (=> b!314988 (= res!258131 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69838 res!258134) b!314986))

(assert (= (and b!314986 res!258130) b!314982))

(assert (= (and b!314982 res!258128) b!314984))

(assert (= (and b!314984 res!258129) b!314985))

(assert (= (and b!314985 res!258132) b!314987))

(assert (= (and b!314987 res!258133) b!314988))

(assert (= (and b!314988 res!258131) b!314983))

(declare-fun m!452597 () Bool)

(assert (=> b!314987 m!452597))

(declare-fun m!452599 () Bool)

(assert (=> b!314988 m!452599))

(declare-fun m!452601 () Bool)

(assert (=> b!314986 m!452601))

(declare-fun m!452603 () Bool)

(assert (=> b!314982 m!452603))

(declare-fun m!452605 () Bool)

(assert (=> b!314985 m!452605))

(declare-fun m!452607 () Bool)

(assert (=> start!69838 m!452607))

(declare-fun m!452609 () Bool)

(assert (=> start!69838 m!452609))

(declare-fun m!452611 () Bool)

(assert (=> start!69838 m!452611))

(push 1)

(assert (not b!314988))

(assert (not b!314987))

(assert (not b!314982))

(assert (not b!314986))

(assert (not b!314985))

(assert (not start!69838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

