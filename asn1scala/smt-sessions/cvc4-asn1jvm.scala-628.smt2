; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17756 () Bool)

(assert start!17756)

(declare-fun b!85938 () Bool)

(declare-fun res!70567 () Bool)

(declare-fun e!57204 () Bool)

(assert (=> b!85938 (=> (not res!70567) (not e!57204))))

(declare-datatypes ((array!4081 0))(
  ( (array!4082 (arr!2480 (Array (_ BitVec 32) (_ BitVec 8))) (size!1843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3248 0))(
  ( (BitStream!3249 (buf!2233 array!4081) (currentByte!4439 (_ BitVec 32)) (currentBit!4434 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3248)

(declare-fun thiss!1151 () BitStream!3248)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85938 (= res!70567 (and (bvsle i!576 nBits!336) (= (size!1843 (buf!2233 thiss!1152)) (size!1843 (buf!2233 thiss!1151)))))))

(declare-fun b!85939 () Bool)

(declare-fun res!70565 () Bool)

(declare-fun e!57201 () Bool)

(assert (=> b!85939 (=> res!70565 e!57201)))

(assert (=> b!85939 (= res!70565 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!85940 () Bool)

(declare-fun res!70563 () Bool)

(assert (=> b!85940 (=> (not res!70563) (not e!57204))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85940 (= res!70563 (invariant!0 (currentBit!4434 thiss!1151) (currentByte!4439 thiss!1151) (size!1843 (buf!2233 thiss!1151))))))

(declare-fun b!85941 () Bool)

(declare-fun e!57203 () Bool)

(declare-fun e!57200 () Bool)

(assert (=> b!85941 (= e!57203 e!57200)))

(declare-fun res!70566 () Bool)

(assert (=> b!85941 (=> (not res!70566) (not e!57200))))

(declare-fun lt!134961 () Bool)

(declare-datatypes ((Unit!5702 0))(
  ( (Unit!5703) )
))
(declare-datatypes ((tuple2!7302 0))(
  ( (tuple2!7303 (_1!3868 Unit!5702) (_2!3868 BitStream!3248)) )
))
(declare-fun lt!134958 () tuple2!7302)

(declare-datatypes ((tuple2!7304 0))(
  ( (tuple2!7305 (_1!3869 BitStream!3248) (_2!3869 Bool)) )
))
(declare-fun lt!134956 () tuple2!7304)

(assert (=> b!85941 (= res!70566 (and (= (_2!3869 lt!134956) lt!134961) (= (_1!3869 lt!134956) (_2!3868 lt!134958))))))

(declare-fun readBitPure!0 (BitStream!3248) tuple2!7304)

(declare-fun readerFrom!0 (BitStream!3248 (_ BitVec 32) (_ BitVec 32)) BitStream!3248)

(assert (=> b!85941 (= lt!134956 (readBitPure!0 (readerFrom!0 (_2!3868 lt!134958) (currentBit!4434 thiss!1152) (currentByte!4439 thiss!1152))))))

(declare-fun b!85942 () Bool)

(declare-fun e!57202 () Bool)

(assert (=> b!85942 (= e!57204 e!57202)))

(declare-fun res!70554 () Bool)

(assert (=> b!85942 (=> (not res!70554) (not e!57202))))

(declare-fun lt!134959 () (_ BitVec 64))

(declare-fun lt!134957 () (_ BitVec 64))

(assert (=> b!85942 (= res!70554 (= lt!134959 (bvadd lt!134957 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85942 (= lt!134959 (bitIndex!0 (size!1843 (buf!2233 thiss!1152)) (currentByte!4439 thiss!1152) (currentBit!4434 thiss!1152)))))

(assert (=> b!85942 (= lt!134957 (bitIndex!0 (size!1843 (buf!2233 thiss!1151)) (currentByte!4439 thiss!1151) (currentBit!4434 thiss!1151)))))

(declare-fun b!85943 () Bool)

(declare-fun res!70560 () Bool)

(assert (=> b!85943 (=> (not res!70560) (not e!57204))))

(assert (=> b!85943 (= res!70560 (invariant!0 (currentBit!4434 thiss!1152) (currentByte!4439 thiss!1152) (size!1843 (buf!2233 thiss!1152))))))

(declare-fun b!85944 () Bool)

(declare-fun res!70558 () Bool)

(assert (=> b!85944 (=> (not res!70558) (not e!57203))))

(declare-fun isPrefixOf!0 (BitStream!3248 BitStream!3248) Bool)

(assert (=> b!85944 (= res!70558 (isPrefixOf!0 thiss!1152 (_2!3868 lt!134958)))))

(declare-fun b!85945 () Bool)

(declare-fun res!70556 () Bool)

(assert (=> b!85945 (=> (not res!70556) (not e!57202))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85945 (= res!70556 (validate_offset_bits!1 ((_ sign_extend 32) (size!1843 (buf!2233 thiss!1152))) ((_ sign_extend 32) (currentByte!4439 thiss!1152)) ((_ sign_extend 32) (currentBit!4434 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85947 () Bool)

(declare-fun e!57207 () Bool)

(declare-fun array_inv!1689 (array!4081) Bool)

(assert (=> b!85947 (= e!57207 (array_inv!1689 (buf!2233 thiss!1151)))))

(declare-fun b!85948 () Bool)

(declare-fun lt!134955 () (_ BitVec 64))

(assert (=> b!85948 (= e!57200 (= (bitIndex!0 (size!1843 (buf!2233 (_1!3869 lt!134956))) (currentByte!4439 (_1!3869 lt!134956)) (currentBit!4434 (_1!3869 lt!134956))) lt!134955))))

(declare-fun b!85949 () Bool)

(declare-fun e!57205 () Bool)

(assert (=> b!85949 (= e!57205 (array_inv!1689 (buf!2233 thiss!1152)))))

(declare-fun b!85950 () Bool)

(declare-fun res!70553 () Bool)

(assert (=> b!85950 (=> (not res!70553) (not e!57204))))

(assert (=> b!85950 (= res!70553 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85951 () Bool)

(declare-fun res!70562 () Bool)

(assert (=> b!85951 (=> (not res!70562) (not e!57204))))

(assert (=> b!85951 (= res!70562 (validate_offset_bits!1 ((_ sign_extend 32) (size!1843 (buf!2233 thiss!1151))) ((_ sign_extend 32) (currentByte!4439 thiss!1151)) ((_ sign_extend 32) (currentBit!4434 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85952 () Bool)

(assert (=> b!85952 (= e!57202 (not e!57201))))

(declare-fun res!70557 () Bool)

(assert (=> b!85952 (=> res!70557 e!57201)))

(assert (=> b!85952 (= res!70557 (not (invariant!0 (currentBit!4434 (_2!3868 lt!134958)) (currentByte!4439 (_2!3868 lt!134958)) (size!1843 (buf!2233 (_2!3868 lt!134958))))))))

(declare-fun e!57199 () Bool)

(assert (=> b!85952 e!57199))

(declare-fun res!70564 () Bool)

(assert (=> b!85952 (=> (not res!70564) (not e!57199))))

(assert (=> b!85952 (= res!70564 (= (size!1843 (buf!2233 thiss!1152)) (size!1843 (buf!2233 (_2!3868 lt!134958)))))))

(declare-fun appendBit!0 (BitStream!3248 Bool) tuple2!7302)

(assert (=> b!85952 (= lt!134958 (appendBit!0 thiss!1152 lt!134961))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85952 (= lt!134961 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85953 () Bool)

(assert (=> b!85953 (= e!57201 true)))

(declare-datatypes ((tuple3!386 0))(
  ( (tuple3!387 (_1!3870 Unit!5702) (_2!3870 BitStream!3248) (_3!217 (_ BitVec 32))) )
))
(declare-fun lt!134960 () tuple3!386)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3248 (_ BitVec 64) BitStream!3248 (_ BitVec 32)) tuple3!386)

(assert (=> b!85953 (= lt!134960 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3868 lt!134958) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!85954 () Bool)

(assert (=> b!85954 (= e!57199 e!57203)))

(declare-fun res!70561 () Bool)

(assert (=> b!85954 (=> (not res!70561) (not e!57203))))

(assert (=> b!85954 (= res!70561 (= lt!134955 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134959)))))

(assert (=> b!85954 (= lt!134955 (bitIndex!0 (size!1843 (buf!2233 (_2!3868 lt!134958))) (currentByte!4439 (_2!3868 lt!134958)) (currentBit!4434 (_2!3868 lt!134958))))))

(declare-fun b!85946 () Bool)

(declare-fun res!70559 () Bool)

(assert (=> b!85946 (=> (not res!70559) (not e!57202))))

(assert (=> b!85946 (= res!70559 (bvslt i!576 nBits!336))))

(declare-fun res!70555 () Bool)

(assert (=> start!17756 (=> (not res!70555) (not e!57204))))

(assert (=> start!17756 (= res!70555 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17756 e!57204))

(declare-fun inv!12 (BitStream!3248) Bool)

(assert (=> start!17756 (and (inv!12 thiss!1152) e!57205)))

(assert (=> start!17756 (and (inv!12 thiss!1151) e!57207)))

(assert (=> start!17756 true))

(assert (= (and start!17756 res!70555) b!85951))

(assert (= (and b!85951 res!70562) b!85940))

(assert (= (and b!85940 res!70563) b!85950))

(assert (= (and b!85950 res!70553) b!85943))

(assert (= (and b!85943 res!70560) b!85938))

(assert (= (and b!85938 res!70567) b!85942))

(assert (= (and b!85942 res!70554) b!85945))

(assert (= (and b!85945 res!70556) b!85946))

(assert (= (and b!85946 res!70559) b!85952))

(assert (= (and b!85952 res!70564) b!85954))

(assert (= (and b!85954 res!70561) b!85944))

(assert (= (and b!85944 res!70558) b!85941))

(assert (= (and b!85941 res!70566) b!85948))

(assert (= (and b!85952 (not res!70557)) b!85939))

(assert (= (and b!85939 (not res!70565)) b!85953))

(assert (= start!17756 b!85949))

(assert (= start!17756 b!85947))

(declare-fun m!131945 () Bool)

(assert (=> b!85948 m!131945))

(declare-fun m!131947 () Bool)

(assert (=> b!85952 m!131947))

(declare-fun m!131949 () Bool)

(assert (=> b!85952 m!131949))

(declare-fun m!131951 () Bool)

(assert (=> b!85945 m!131951))

(declare-fun m!131953 () Bool)

(assert (=> b!85954 m!131953))

(declare-fun m!131955 () Bool)

(assert (=> b!85951 m!131955))

(declare-fun m!131957 () Bool)

(assert (=> b!85943 m!131957))

(declare-fun m!131959 () Bool)

(assert (=> b!85947 m!131959))

(declare-fun m!131961 () Bool)

(assert (=> b!85940 m!131961))

(declare-fun m!131963 () Bool)

(assert (=> b!85942 m!131963))

(declare-fun m!131965 () Bool)

(assert (=> b!85942 m!131965))

(declare-fun m!131967 () Bool)

(assert (=> b!85953 m!131967))

(declare-fun m!131969 () Bool)

(assert (=> b!85941 m!131969))

(assert (=> b!85941 m!131969))

(declare-fun m!131971 () Bool)

(assert (=> b!85941 m!131971))

(declare-fun m!131973 () Bool)

(assert (=> b!85949 m!131973))

(declare-fun m!131975 () Bool)

(assert (=> b!85944 m!131975))

(declare-fun m!131977 () Bool)

(assert (=> start!17756 m!131977))

(declare-fun m!131979 () Bool)

(assert (=> start!17756 m!131979))

(push 1)

(assert (not b!85949))

(assert (not b!85952))

(assert (not b!85943))

(assert (not b!85942))

(assert (not b!85941))

(assert (not b!85947))

(assert (not b!85944))

(assert (not b!85951))

(assert (not b!85940))

(assert (not b!85954))

(assert (not b!85945))

(assert (not b!85948))

(assert (not b!85953))

(assert (not start!17756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

