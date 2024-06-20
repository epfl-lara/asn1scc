; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17760 () Bool)

(assert start!17760)

(declare-fun b!86040 () Bool)

(declare-fun res!70652 () Bool)

(declare-fun e!57264 () Bool)

(assert (=> b!86040 (=> (not res!70652) (not e!57264))))

(declare-datatypes ((array!4085 0))(
  ( (array!4086 (arr!2482 (Array (_ BitVec 32) (_ BitVec 8))) (size!1845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3252 0))(
  ( (BitStream!3253 (buf!2235 array!4085) (currentByte!4441 (_ BitVec 32)) (currentBit!4436 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3252)

(declare-datatypes ((Unit!5706 0))(
  ( (Unit!5707) )
))
(declare-datatypes ((tuple2!7310 0))(
  ( (tuple2!7311 (_1!3874 Unit!5706) (_2!3874 BitStream!3252)) )
))
(declare-fun lt!135000 () tuple2!7310)

(declare-fun isPrefixOf!0 (BitStream!3252 BitStream!3252) Bool)

(assert (=> b!86040 (= res!70652 (isPrefixOf!0 thiss!1152 (_2!3874 lt!135000)))))

(declare-fun res!70653 () Bool)

(declare-fun e!57262 () Bool)

(assert (=> start!17760 (=> (not res!70653) (not e!57262))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17760 (= res!70653 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17760 e!57262))

(declare-fun e!57260 () Bool)

(declare-fun inv!12 (BitStream!3252) Bool)

(assert (=> start!17760 (and (inv!12 thiss!1152) e!57260)))

(declare-fun thiss!1151 () BitStream!3252)

(declare-fun e!57259 () Bool)

(assert (=> start!17760 (and (inv!12 thiss!1151) e!57259)))

(assert (=> start!17760 true))

(declare-fun b!86041 () Bool)

(declare-fun res!70655 () Bool)

(declare-fun e!57266 () Bool)

(assert (=> b!86041 (=> (not res!70655) (not e!57266))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!86041 (= res!70655 (bvslt i!576 nBits!336))))

(declare-fun b!86042 () Bool)

(declare-fun res!70645 () Bool)

(assert (=> b!86042 (=> (not res!70645) (not e!57262))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86042 (= res!70645 (validate_offset_bits!1 ((_ sign_extend 32) (size!1845 (buf!2235 thiss!1151))) ((_ sign_extend 32) (currentByte!4441 thiss!1151)) ((_ sign_extend 32) (currentBit!4436 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86043 () Bool)

(declare-fun res!70646 () Bool)

(assert (=> b!86043 (=> (not res!70646) (not e!57262))))

(assert (=> b!86043 (= res!70646 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86044 () Bool)

(declare-fun res!70649 () Bool)

(assert (=> b!86044 (=> (not res!70649) (not e!57262))))

(assert (=> b!86044 (= res!70649 (and (bvsle i!576 nBits!336) (= (size!1845 (buf!2235 thiss!1152)) (size!1845 (buf!2235 thiss!1151)))))))

(declare-fun b!86045 () Bool)

(assert (=> b!86045 (= e!57262 e!57266)))

(declare-fun res!70647 () Bool)

(assert (=> b!86045 (=> (not res!70647) (not e!57266))))

(declare-fun lt!134997 () (_ BitVec 64))

(declare-fun lt!135002 () (_ BitVec 64))

(assert (=> b!86045 (= res!70647 (= lt!135002 (bvadd lt!134997 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86045 (= lt!135002 (bitIndex!0 (size!1845 (buf!2235 thiss!1152)) (currentByte!4441 thiss!1152) (currentBit!4436 thiss!1152)))))

(assert (=> b!86045 (= lt!134997 (bitIndex!0 (size!1845 (buf!2235 thiss!1151)) (currentByte!4441 thiss!1151) (currentBit!4436 thiss!1151)))))

(declare-fun b!86046 () Bool)

(declare-fun e!57265 () Bool)

(assert (=> b!86046 (= e!57264 e!57265)))

(declare-fun res!70644 () Bool)

(assert (=> b!86046 (=> (not res!70644) (not e!57265))))

(declare-fun lt!134999 () Bool)

(declare-datatypes ((tuple2!7312 0))(
  ( (tuple2!7313 (_1!3875 BitStream!3252) (_2!3875 Bool)) )
))
(declare-fun lt!135003 () tuple2!7312)

(assert (=> b!86046 (= res!70644 (and (= (_2!3875 lt!135003) lt!134999) (= (_1!3875 lt!135003) (_2!3874 lt!135000))))))

(declare-fun readBitPure!0 (BitStream!3252) tuple2!7312)

(declare-fun readerFrom!0 (BitStream!3252 (_ BitVec 32) (_ BitVec 32)) BitStream!3252)

(assert (=> b!86046 (= lt!135003 (readBitPure!0 (readerFrom!0 (_2!3874 lt!135000) (currentBit!4436 thiss!1152) (currentByte!4441 thiss!1152))))))

(declare-fun b!86047 () Bool)

(declare-fun res!70648 () Bool)

(assert (=> b!86047 (=> (not res!70648) (not e!57262))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86047 (= res!70648 (invariant!0 (currentBit!4436 thiss!1152) (currentByte!4441 thiss!1152) (size!1845 (buf!2235 thiss!1152))))))

(declare-fun b!86048 () Bool)

(declare-fun array_inv!1691 (array!4085) Bool)

(assert (=> b!86048 (= e!57260 (array_inv!1691 (buf!2235 thiss!1152)))))

(declare-fun b!86049 () Bool)

(declare-fun lt!134998 () (_ BitVec 64))

(assert (=> b!86049 (= e!57265 (= (bitIndex!0 (size!1845 (buf!2235 (_1!3875 lt!135003))) (currentByte!4441 (_1!3875 lt!135003)) (currentBit!4436 (_1!3875 lt!135003))) lt!134998))))

(declare-fun b!86050 () Bool)

(declare-fun e!57267 () Bool)

(assert (=> b!86050 (= e!57266 (not e!57267))))

(declare-fun res!70654 () Bool)

(assert (=> b!86050 (=> res!70654 e!57267)))

(assert (=> b!86050 (= res!70654 (not (invariant!0 (currentBit!4436 (_2!3874 lt!135000)) (currentByte!4441 (_2!3874 lt!135000)) (size!1845 (buf!2235 (_2!3874 lt!135000))))))))

(declare-fun e!57263 () Bool)

(assert (=> b!86050 e!57263))

(declare-fun res!70643 () Bool)

(assert (=> b!86050 (=> (not res!70643) (not e!57263))))

(assert (=> b!86050 (= res!70643 (= (size!1845 (buf!2235 thiss!1152)) (size!1845 (buf!2235 (_2!3874 lt!135000)))))))

(declare-fun appendBit!0 (BitStream!3252 Bool) tuple2!7310)

(assert (=> b!86050 (= lt!135000 (appendBit!0 thiss!1152 lt!134999))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86050 (= lt!134999 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86051 () Bool)

(assert (=> b!86051 (= e!57267 true)))

(declare-datatypes ((tuple3!390 0))(
  ( (tuple3!391 (_1!3876 Unit!5706) (_2!3876 BitStream!3252) (_3!219 (_ BitVec 32))) )
))
(declare-fun lt!135001 () tuple3!390)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3252 (_ BitVec 64) BitStream!3252 (_ BitVec 32)) tuple3!390)

(assert (=> b!86051 (= lt!135001 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3874 lt!135000) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86052 () Bool)

(declare-fun res!70657 () Bool)

(assert (=> b!86052 (=> (not res!70657) (not e!57262))))

(assert (=> b!86052 (= res!70657 (invariant!0 (currentBit!4436 thiss!1151) (currentByte!4441 thiss!1151) (size!1845 (buf!2235 thiss!1151))))))

(declare-fun b!86053 () Bool)

(declare-fun res!70650 () Bool)

(assert (=> b!86053 (=> (not res!70650) (not e!57266))))

(assert (=> b!86053 (= res!70650 (validate_offset_bits!1 ((_ sign_extend 32) (size!1845 (buf!2235 thiss!1152))) ((_ sign_extend 32) (currentByte!4441 thiss!1152)) ((_ sign_extend 32) (currentBit!4436 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86054 () Bool)

(declare-fun res!70656 () Bool)

(assert (=> b!86054 (=> res!70656 e!57267)))

(assert (=> b!86054 (= res!70656 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86055 () Bool)

(assert (=> b!86055 (= e!57259 (array_inv!1691 (buf!2235 thiss!1151)))))

(declare-fun b!86056 () Bool)

(assert (=> b!86056 (= e!57263 e!57264)))

(declare-fun res!70651 () Bool)

(assert (=> b!86056 (=> (not res!70651) (not e!57264))))

(assert (=> b!86056 (= res!70651 (= lt!134998 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135002)))))

(assert (=> b!86056 (= lt!134998 (bitIndex!0 (size!1845 (buf!2235 (_2!3874 lt!135000))) (currentByte!4441 (_2!3874 lt!135000)) (currentBit!4436 (_2!3874 lt!135000))))))

(assert (= (and start!17760 res!70653) b!86042))

(assert (= (and b!86042 res!70645) b!86052))

(assert (= (and b!86052 res!70657) b!86043))

(assert (= (and b!86043 res!70646) b!86047))

(assert (= (and b!86047 res!70648) b!86044))

(assert (= (and b!86044 res!70649) b!86045))

(assert (= (and b!86045 res!70647) b!86053))

(assert (= (and b!86053 res!70650) b!86041))

(assert (= (and b!86041 res!70655) b!86050))

(assert (= (and b!86050 res!70643) b!86056))

(assert (= (and b!86056 res!70651) b!86040))

(assert (= (and b!86040 res!70652) b!86046))

(assert (= (and b!86046 res!70644) b!86049))

(assert (= (and b!86050 (not res!70654)) b!86054))

(assert (= (and b!86054 (not res!70656)) b!86051))

(assert (= start!17760 b!86048))

(assert (= start!17760 b!86055))

(declare-fun m!132017 () Bool)

(assert (=> b!86051 m!132017))

(declare-fun m!132019 () Bool)

(assert (=> b!86050 m!132019))

(declare-fun m!132021 () Bool)

(assert (=> b!86050 m!132021))

(declare-fun m!132023 () Bool)

(assert (=> start!17760 m!132023))

(declare-fun m!132025 () Bool)

(assert (=> start!17760 m!132025))

(declare-fun m!132027 () Bool)

(assert (=> b!86056 m!132027))

(declare-fun m!132029 () Bool)

(assert (=> b!86045 m!132029))

(declare-fun m!132031 () Bool)

(assert (=> b!86045 m!132031))

(declare-fun m!132033 () Bool)

(assert (=> b!86040 m!132033))

(declare-fun m!132035 () Bool)

(assert (=> b!86053 m!132035))

(declare-fun m!132037 () Bool)

(assert (=> b!86048 m!132037))

(declare-fun m!132039 () Bool)

(assert (=> b!86049 m!132039))

(declare-fun m!132041 () Bool)

(assert (=> b!86046 m!132041))

(assert (=> b!86046 m!132041))

(declare-fun m!132043 () Bool)

(assert (=> b!86046 m!132043))

(declare-fun m!132045 () Bool)

(assert (=> b!86055 m!132045))

(declare-fun m!132047 () Bool)

(assert (=> b!86047 m!132047))

(declare-fun m!132049 () Bool)

(assert (=> b!86042 m!132049))

(declare-fun m!132051 () Bool)

(assert (=> b!86052 m!132051))

(check-sat (not b!86047) (not b!86045) (not b!86055) (not start!17760) (not b!86050) (not b!86056) (not b!86052) (not b!86046) (not b!86051) (not b!86040) (not b!86049) (not b!86053) (not b!86048) (not b!86042))
