; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31532 () Bool)

(assert start!31532)

(declare-fun b!157939 () Bool)

(declare-fun e!107171 () Bool)

(declare-fun e!107176 () Bool)

(assert (=> b!157939 (= e!107171 e!107176)))

(declare-fun res!131950 () Bool)

(assert (=> b!157939 (=> (not res!131950) (not e!107176))))

(declare-datatypes ((array!7323 0))(
  ( (array!7324 (arr!4218 (Array (_ BitVec 32) (_ BitVec 8))) (size!3313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5818 0))(
  ( (BitStream!5819 (buf!3783 array!7323) (currentByte!6954 (_ BitVec 32)) (currentBit!6949 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5818)

(declare-fun lt!248852 () BitStream!5818)

(assert (=> b!157939 (= res!131950 (= (size!3313 (buf!3783 bs!65)) (size!3313 (buf!3783 lt!248852))))))

(declare-datatypes ((tuple2!14346 0))(
  ( (tuple2!14347 (_1!7632 BitStream!5818) (_2!7632 (_ BitVec 8))) )
))
(declare-fun lt!248851 () tuple2!14346)

(declare-fun readBytePure!0 (BitStream!5818) tuple2!14346)

(assert (=> b!157939 (= lt!248851 (readBytePure!0 lt!248852))))

(declare-fun res!131949 () Bool)

(declare-fun e!107172 () Bool)

(assert (=> start!31532 (=> (not res!131949) (not e!107172))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7323)

(assert (=> start!31532 (= res!131949 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3313 arr!153))))))

(assert (=> start!31532 e!107172))

(assert (=> start!31532 true))

(declare-fun array_inv!3072 (array!7323) Bool)

(assert (=> start!31532 (array_inv!3072 arr!153)))

(declare-fun e!107174 () Bool)

(declare-fun inv!12 (BitStream!5818) Bool)

(assert (=> start!31532 (and (inv!12 bs!65) e!107174)))

(declare-fun b!157940 () Bool)

(assert (=> b!157940 (= e!107172 e!107171)))

(declare-fun res!131951 () Bool)

(assert (=> b!157940 (=> (not res!131951) (not e!107171))))

(assert (=> b!157940 (= res!131951 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14348 0))(
  ( (tuple2!14349 (_1!7633 BitStream!5818) (_2!7633 array!7323)) )
))
(declare-fun lt!248850 () tuple2!14348)

(declare-fun readByteArrayLoopPure!0 (BitStream!5818 array!7323 (_ BitVec 32) (_ BitVec 32)) tuple2!14348)

(assert (=> b!157940 (= lt!248850 (readByteArrayLoopPure!0 lt!248852 (array!7324 (store (arr!4218 arr!153) from!240 (_2!7632 (readBytePure!0 bs!65))) (size!3313 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5818 (_ BitVec 32)) BitStream!5818)

(assert (=> b!157940 (= lt!248852 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248849 () tuple2!14348)

(assert (=> b!157940 (= lt!248849 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157941 () Bool)

(assert (=> b!157941 (= e!107176 false)))

(declare-fun lt!248848 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157941 (= lt!248848 (bitIndex!0 (size!3313 (buf!3783 lt!248852)) (currentByte!6954 lt!248852) (currentBit!6949 lt!248852)))))

(declare-fun b!157942 () Bool)

(declare-fun res!131948 () Bool)

(assert (=> b!157942 (=> (not res!131948) (not e!107172))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157942 (= res!131948 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3313 (buf!3783 bs!65))) ((_ sign_extend 32) (currentByte!6954 bs!65)) ((_ sign_extend 32) (currentBit!6949 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157943 () Bool)

(assert (=> b!157943 (= e!107174 (array_inv!3072 (buf!3783 bs!65)))))

(assert (= (and start!31532 res!131949) b!157942))

(assert (= (and b!157942 res!131948) b!157940))

(assert (= (and b!157940 res!131951) b!157939))

(assert (= (and b!157939 res!131950) b!157941))

(assert (= start!31532 b!157943))

(declare-fun m!247581 () Bool)

(assert (=> b!157939 m!247581))

(declare-fun m!247583 () Bool)

(assert (=> b!157942 m!247583))

(declare-fun m!247585 () Bool)

(assert (=> b!157943 m!247585))

(declare-fun m!247587 () Bool)

(assert (=> b!157940 m!247587))

(declare-fun m!247589 () Bool)

(assert (=> b!157940 m!247589))

(declare-fun m!247591 () Bool)

(assert (=> b!157940 m!247591))

(declare-fun m!247593 () Bool)

(assert (=> b!157940 m!247593))

(declare-fun m!247595 () Bool)

(assert (=> b!157940 m!247595))

(declare-fun m!247597 () Bool)

(assert (=> start!31532 m!247597))

(declare-fun m!247599 () Bool)

(assert (=> start!31532 m!247599))

(declare-fun m!247601 () Bool)

(assert (=> b!157941 m!247601))

(push 1)

(assert (not b!157943))

(assert (not b!157939))

(assert (not b!157940))

(assert (not b!157942))

(assert (not b!157941))

(assert (not start!31532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

