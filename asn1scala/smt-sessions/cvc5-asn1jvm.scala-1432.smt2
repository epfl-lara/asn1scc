; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39356 () Bool)

(assert start!39356)

(declare-fun b!176887 () Bool)

(declare-fun e!123275 () Bool)

(declare-datatypes ((array!9548 0))(
  ( (array!9549 (arr!5140 (Array (_ BitVec 32) (_ BitVec 8))) (size!4210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7528 0))(
  ( (BitStream!7529 (buf!4653 array!9548) (currentByte!8824 (_ BitVec 32)) (currentBit!8819 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7528)

(declare-fun array_inv!3951 (array!9548) Bool)

(assert (=> b!176887 (= e!123275 (array_inv!3951 (buf!4653 thiss!1204)))))

(declare-fun b!176888 () Bool)

(declare-fun e!123276 () Bool)

(declare-fun e!123279 () Bool)

(assert (=> b!176888 (= e!123276 e!123279)))

(declare-fun res!146586 () Bool)

(assert (=> b!176888 (=> (not res!146586) (not e!123279))))

(declare-fun lt!272087 () (_ BitVec 64))

(declare-fun lt!272081 () (_ BitVec 64))

(assert (=> b!176888 (= res!146586 (= lt!272087 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272081)))))

(declare-datatypes ((Unit!12734 0))(
  ( (Unit!12735) )
))
(declare-datatypes ((tuple2!15230 0))(
  ( (tuple2!15231 (_1!8260 Unit!12734) (_2!8260 BitStream!7528)) )
))
(declare-fun lt!272083 () tuple2!15230)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176888 (= lt!272087 (bitIndex!0 (size!4210 (buf!4653 (_2!8260 lt!272083))) (currentByte!8824 (_2!8260 lt!272083)) (currentBit!8819 (_2!8260 lt!272083))))))

(assert (=> b!176888 (= lt!272081 (bitIndex!0 (size!4210 (buf!4653 thiss!1204)) (currentByte!8824 thiss!1204) (currentBit!8819 thiss!1204)))))

(declare-fun b!176890 () Bool)

(declare-fun e!123278 () Bool)

(declare-datatypes ((tuple2!15232 0))(
  ( (tuple2!15233 (_1!8261 BitStream!7528) (_2!8261 Bool)) )
))
(declare-fun lt!272086 () tuple2!15232)

(assert (=> b!176890 (= e!123278 (= (bitIndex!0 (size!4210 (buf!4653 (_1!8261 lt!272086))) (currentByte!8824 (_1!8261 lt!272086)) (currentBit!8819 (_1!8261 lt!272086))) lt!272087))))

(declare-fun b!176891 () Bool)

(declare-fun res!146588 () Bool)

(declare-fun e!123280 () Bool)

(assert (=> b!176891 (=> (not res!146588) (not e!123280))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176891 (= res!146588 (not (= i!590 nBits!348)))))

(declare-fun b!176892 () Bool)

(assert (=> b!176892 (= e!123280 (not true))))

(declare-fun lt!272085 () (_ BitVec 64))

(assert (=> b!176892 (= lt!272085 (bitIndex!0 (size!4210 (buf!4653 (_2!8260 lt!272083))) (currentByte!8824 (_2!8260 lt!272083)) (currentBit!8819 (_2!8260 lt!272083))))))

(declare-fun lt!272082 () (_ BitVec 64))

(assert (=> b!176892 (= lt!272082 (bitIndex!0 (size!4210 (buf!4653 thiss!1204)) (currentByte!8824 thiss!1204) (currentBit!8819 thiss!1204)))))

(assert (=> b!176892 e!123276))

(declare-fun res!146591 () Bool)

(assert (=> b!176892 (=> (not res!146591) (not e!123276))))

(assert (=> b!176892 (= res!146591 (= (size!4210 (buf!4653 thiss!1204)) (size!4210 (buf!4653 (_2!8260 lt!272083)))))))

(declare-fun lt!272084 () Bool)

(declare-fun appendBit!0 (BitStream!7528 Bool) tuple2!15230)

(assert (=> b!176892 (= lt!272083 (appendBit!0 thiss!1204 lt!272084))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176892 (= lt!272084 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176893 () Bool)

(declare-fun res!146585 () Bool)

(assert (=> b!176893 (=> (not res!146585) (not e!123280))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176893 (= res!146585 (validate_offset_bits!1 ((_ sign_extend 32) (size!4210 (buf!4653 thiss!1204))) ((_ sign_extend 32) (currentByte!8824 thiss!1204)) ((_ sign_extend 32) (currentBit!8819 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176894 () Bool)

(assert (=> b!176894 (= e!123279 e!123278)))

(declare-fun res!146587 () Bool)

(assert (=> b!176894 (=> (not res!146587) (not e!123278))))

(assert (=> b!176894 (= res!146587 (and (= (_2!8261 lt!272086) lt!272084) (= (_1!8261 lt!272086) (_2!8260 lt!272083))))))

(declare-fun readBitPure!0 (BitStream!7528) tuple2!15232)

(declare-fun readerFrom!0 (BitStream!7528 (_ BitVec 32) (_ BitVec 32)) BitStream!7528)

(assert (=> b!176894 (= lt!272086 (readBitPure!0 (readerFrom!0 (_2!8260 lt!272083) (currentBit!8819 thiss!1204) (currentByte!8824 thiss!1204))))))

(declare-fun b!176895 () Bool)

(declare-fun res!146590 () Bool)

(assert (=> b!176895 (=> (not res!146590) (not e!123280))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176895 (= res!146590 (invariant!0 (currentBit!8819 thiss!1204) (currentByte!8824 thiss!1204) (size!4210 (buf!4653 thiss!1204))))))

(declare-fun b!176889 () Bool)

(declare-fun res!146589 () Bool)

(assert (=> b!176889 (=> (not res!146589) (not e!123279))))

(declare-fun isPrefixOf!0 (BitStream!7528 BitStream!7528) Bool)

(assert (=> b!176889 (= res!146589 (isPrefixOf!0 thiss!1204 (_2!8260 lt!272083)))))

(declare-fun res!146592 () Bool)

(assert (=> start!39356 (=> (not res!146592) (not e!123280))))

(assert (=> start!39356 (= res!146592 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39356 e!123280))

(assert (=> start!39356 true))

(declare-fun inv!12 (BitStream!7528) Bool)

(assert (=> start!39356 (and (inv!12 thiss!1204) e!123275)))

(assert (= (and start!39356 res!146592) b!176893))

(assert (= (and b!176893 res!146585) b!176895))

(assert (= (and b!176895 res!146590) b!176891))

(assert (= (and b!176891 res!146588) b!176892))

(assert (= (and b!176892 res!146591) b!176888))

(assert (= (and b!176888 res!146586) b!176889))

(assert (= (and b!176889 res!146589) b!176894))

(assert (= (and b!176894 res!146587) b!176890))

(assert (= start!39356 b!176887))

(declare-fun m!276907 () Bool)

(assert (=> b!176889 m!276907))

(declare-fun m!276909 () Bool)

(assert (=> start!39356 m!276909))

(declare-fun m!276911 () Bool)

(assert (=> b!176893 m!276911))

(declare-fun m!276913 () Bool)

(assert (=> b!176895 m!276913))

(declare-fun m!276915 () Bool)

(assert (=> b!176892 m!276915))

(declare-fun m!276917 () Bool)

(assert (=> b!176892 m!276917))

(declare-fun m!276919 () Bool)

(assert (=> b!176892 m!276919))

(assert (=> b!176888 m!276915))

(assert (=> b!176888 m!276917))

(declare-fun m!276921 () Bool)

(assert (=> b!176887 m!276921))

(declare-fun m!276923 () Bool)

(assert (=> b!176894 m!276923))

(assert (=> b!176894 m!276923))

(declare-fun m!276925 () Bool)

(assert (=> b!176894 m!276925))

(declare-fun m!276927 () Bool)

(assert (=> b!176890 m!276927))

(push 1)

(assert (not b!176892))

(assert (not b!176888))

(assert (not start!39356))

(assert (not b!176889))

(assert (not b!176893))

(assert (not b!176894))

(assert (not b!176890))

(assert (not b!176887))

(assert (not b!176895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

