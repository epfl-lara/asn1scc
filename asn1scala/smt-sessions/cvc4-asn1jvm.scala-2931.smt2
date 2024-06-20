; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69752 () Bool)

(assert start!69752)

(declare-fun b!313943 () Bool)

(declare-fun res!257090 () Bool)

(declare-fun e!226015 () Bool)

(assert (=> b!313943 (=> (not res!257090) (not e!226015))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!313943 (= res!257090 (not (= i!1020 mid!82)))))

(declare-fun b!313944 () Bool)

(declare-fun res!257093 () Bool)

(assert (=> b!313944 (=> (not res!257093) (not e!226015))))

(declare-datatypes ((array!19316 0))(
  ( (array!19317 (arr!9462 (Array (_ BitVec 32) (_ BitVec 8))) (size!8382 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19316)

(declare-fun a2!825 () array!19316)

(declare-fun arrayBitRangesEq!0 (array!19316 array!19316 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313944 (= res!257093 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313946 () Bool)

(declare-fun res!257094 () Bool)

(assert (=> b!313946 (=> (not res!257094) (not e!226015))))

(declare-fun a3!79 () array!19316)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!313946 (= res!257094 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313947 () Bool)

(declare-fun res!257089 () Bool)

(assert (=> b!313947 (=> (not res!257089) (not e!226015))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!313947 (= res!257089 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313948 () Bool)

(declare-fun res!257096 () Bool)

(assert (=> b!313948 (=> (not res!257096) (not e!226015))))

(assert (=> b!313948 (= res!257096 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313949 () Bool)

(declare-fun res!257091 () Bool)

(assert (=> b!313949 (=> (not res!257091) (not e!226015))))

(assert (=> b!313949 (= res!257091 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313950 () Bool)

(declare-fun res!257092 () Bool)

(assert (=> b!313950 (=> (not res!257092) (not e!226015))))

(assert (=> b!313950 (= res!257092 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257095 () Bool)

(assert (=> start!69752 (=> (not res!257095) (not e!226015))))

(assert (=> start!69752 (= res!257095 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8382 a1!825) (size!8382 a2!825)) (= (size!8382 a2!825) (size!8382 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8382 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8382 a2!825))))))))

(assert (=> start!69752 e!226015))

(assert (=> start!69752 true))

(declare-fun array_inv!7934 (array!19316) Bool)

(assert (=> start!69752 (array_inv!7934 a1!825)))

(assert (=> start!69752 (array_inv!7934 a3!79)))

(assert (=> start!69752 (array_inv!7934 a2!825)))

(declare-fun b!313945 () Bool)

(assert (=> b!313945 (= e!226015 (not true))))

(assert (=> b!313945 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21555 0))(
  ( (Unit!21556) )
))
(declare-fun lt!442349 () Unit!21555)

(declare-fun arrayBitRangesEqAppend!0 (array!19316 array!19316 (_ BitVec 64) (_ BitVec 64)) Unit!21555)

(assert (=> b!313945 (= lt!442349 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69752 res!257095) b!313949))

(assert (= (and b!313949 res!257091) b!313947))

(assert (= (and b!313947 res!257089) b!313948))

(assert (= (and b!313948 res!257096) b!313944))

(assert (= (and b!313944 res!257093) b!313946))

(assert (= (and b!313946 res!257094) b!313950))

(assert (= (and b!313950 res!257092) b!313943))

(assert (= (and b!313943 res!257090) b!313945))

(declare-fun m!451533 () Bool)

(assert (=> b!313944 m!451533))

(declare-fun m!451535 () Bool)

(assert (=> start!69752 m!451535))

(declare-fun m!451537 () Bool)

(assert (=> start!69752 m!451537))

(declare-fun m!451539 () Bool)

(assert (=> start!69752 m!451539))

(declare-fun m!451541 () Bool)

(assert (=> b!313947 m!451541))

(declare-fun m!451543 () Bool)

(assert (=> b!313949 m!451543))

(declare-fun m!451545 () Bool)

(assert (=> b!313946 m!451545))

(declare-fun m!451547 () Bool)

(assert (=> b!313950 m!451547))

(declare-fun m!451549 () Bool)

(assert (=> b!313945 m!451549))

(declare-fun m!451551 () Bool)

(assert (=> b!313945 m!451551))

(push 1)

(assert (not b!313944))

