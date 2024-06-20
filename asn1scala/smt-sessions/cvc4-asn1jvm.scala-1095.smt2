; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31530 () Bool)

(assert start!31530)

(declare-fun b!157924 () Bool)

(declare-fun e!107155 () Bool)

(declare-fun e!107157 () Bool)

(assert (=> b!157924 (= e!107155 e!107157)))

(declare-fun res!131939 () Bool)

(assert (=> b!157924 (=> (not res!131939) (not e!107157))))

(declare-datatypes ((array!7321 0))(
  ( (array!7322 (arr!4217 (Array (_ BitVec 32) (_ BitVec 8))) (size!3312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5816 0))(
  ( (BitStream!5817 (buf!3782 array!7321) (currentByte!6953 (_ BitVec 32)) (currentBit!6948 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5816)

(declare-fun lt!248836 () BitStream!5816)

(assert (=> b!157924 (= res!131939 (= (size!3312 (buf!3782 bs!65)) (size!3312 (buf!3782 lt!248836))))))

(declare-datatypes ((tuple2!14342 0))(
  ( (tuple2!14343 (_1!7630 BitStream!5816) (_2!7630 (_ BitVec 8))) )
))
(declare-fun lt!248833 () tuple2!14342)

(declare-fun readBytePure!0 (BitStream!5816) tuple2!14342)

(assert (=> b!157924 (= lt!248833 (readBytePure!0 lt!248836))))

(declare-fun res!131937 () Bool)

(declare-fun e!107158 () Bool)

(assert (=> start!31530 (=> (not res!131937) (not e!107158))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7321)

(assert (=> start!31530 (= res!131937 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3312 arr!153))))))

(assert (=> start!31530 e!107158))

(assert (=> start!31530 true))

(declare-fun array_inv!3071 (array!7321) Bool)

(assert (=> start!31530 (array_inv!3071 arr!153)))

(declare-fun e!107156 () Bool)

(declare-fun inv!12 (BitStream!5816) Bool)

(assert (=> start!31530 (and (inv!12 bs!65) e!107156)))

(declare-fun b!157925 () Bool)

(assert (=> b!157925 (= e!107156 (array_inv!3071 (buf!3782 bs!65)))))

(declare-fun b!157926 () Bool)

(assert (=> b!157926 (= e!107157 false)))

(declare-fun lt!248837 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157926 (= lt!248837 (bitIndex!0 (size!3312 (buf!3782 lt!248836)) (currentByte!6953 lt!248836) (currentBit!6948 lt!248836)))))

(declare-fun b!157927 () Bool)

(assert (=> b!157927 (= e!107158 e!107155)))

(declare-fun res!131938 () Bool)

(assert (=> b!157927 (=> (not res!131938) (not e!107155))))

(assert (=> b!157927 (= res!131938 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14344 0))(
  ( (tuple2!14345 (_1!7631 BitStream!5816) (_2!7631 array!7321)) )
))
(declare-fun lt!248834 () tuple2!14344)

(declare-fun readByteArrayLoopPure!0 (BitStream!5816 array!7321 (_ BitVec 32) (_ BitVec 32)) tuple2!14344)

(assert (=> b!157927 (= lt!248834 (readByteArrayLoopPure!0 lt!248836 (array!7322 (store (arr!4217 arr!153) from!240 (_2!7630 (readBytePure!0 bs!65))) (size!3312 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5816 (_ BitVec 32)) BitStream!5816)

(assert (=> b!157927 (= lt!248836 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248835 () tuple2!14344)

(assert (=> b!157927 (= lt!248835 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157928 () Bool)

(declare-fun res!131936 () Bool)

(assert (=> b!157928 (=> (not res!131936) (not e!107158))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157928 (= res!131936 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3312 (buf!3782 bs!65))) ((_ sign_extend 32) (currentByte!6953 bs!65)) ((_ sign_extend 32) (currentBit!6948 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31530 res!131937) b!157928))

(assert (= (and b!157928 res!131936) b!157927))

(assert (= (and b!157927 res!131938) b!157924))

(assert (= (and b!157924 res!131939) b!157926))

(assert (= start!31530 b!157925))

(declare-fun m!247559 () Bool)

(assert (=> b!157928 m!247559))

(declare-fun m!247561 () Bool)

(assert (=> b!157925 m!247561))

(declare-fun m!247563 () Bool)

(assert (=> b!157926 m!247563))

(declare-fun m!247565 () Bool)

(assert (=> b!157924 m!247565))

(declare-fun m!247567 () Bool)

(assert (=> b!157927 m!247567))

(declare-fun m!247569 () Bool)

(assert (=> b!157927 m!247569))

(declare-fun m!247571 () Bool)

(assert (=> b!157927 m!247571))

(declare-fun m!247573 () Bool)

(assert (=> b!157927 m!247573))

(declare-fun m!247575 () Bool)

(assert (=> b!157927 m!247575))

(declare-fun m!247577 () Bool)

(assert (=> start!31530 m!247577))

(declare-fun m!247579 () Bool)

(assert (=> start!31530 m!247579))

(push 1)

