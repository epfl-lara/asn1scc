; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31038 () Bool)

(assert start!31038)

(declare-fun b!156659 () Bool)

(declare-fun e!105909 () Bool)

(declare-fun e!105910 () Bool)

(assert (=> b!156659 (= e!105909 e!105910)))

(declare-fun res!130932 () Bool)

(assert (=> b!156659 (=> (not res!130932) (not e!105910))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156659 (= res!130932 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7196 0))(
  ( (array!7197 (arr!4092 (Array (_ BitVec 32) (_ BitVec 8))) (size!3227 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7196)

(declare-datatypes ((BitStream!5712 0))(
  ( (BitStream!5713 (buf!3730 array!7196) (currentByte!6857 (_ BitVec 32)) (currentBit!6852 (_ BitVec 32))) )
))
(declare-fun lt!245280 () BitStream!5712)

(declare-fun bs!65 () BitStream!5712)

(declare-datatypes ((tuple2!14048 0))(
  ( (tuple2!14049 (_1!7468 BitStream!5712) (_2!7468 array!7196)) )
))
(declare-fun lt!245279 () tuple2!14048)

(declare-fun readByteArrayLoopPure!0 (BitStream!5712 array!7196 (_ BitVec 32) (_ BitVec 32)) tuple2!14048)

(declare-datatypes ((tuple2!14050 0))(
  ( (tuple2!14051 (_1!7469 BitStream!5712) (_2!7469 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5712) tuple2!14050)

(assert (=> b!156659 (= lt!245279 (readByteArrayLoopPure!0 lt!245280 (array!7197 (store (arr!4092 arr!153) from!240 (_2!7469 (readBytePure!0 bs!65))) (size!3227 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5712 (_ BitVec 32)) BitStream!5712)

(assert (=> b!156659 (= lt!245280 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245277 () tuple2!14048)

(assert (=> b!156659 (= lt!245277 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156660 () Bool)

(declare-fun e!105906 () Bool)

(declare-fun array_inv!3016 (array!7196) Bool)

(assert (=> b!156660 (= e!105906 (array_inv!3016 (buf!3730 bs!65)))))

(declare-fun b!156661 () Bool)

(declare-fun e!105911 () Bool)

(assert (=> b!156661 (= e!105910 e!105911)))

(declare-fun res!130930 () Bool)

(assert (=> b!156661 (=> (not res!130930) (not e!105911))))

(assert (=> b!156661 (= res!130930 (= (size!3227 (buf!3730 bs!65)) (size!3227 (buf!3730 lt!245280))))))

(declare-fun lt!245281 () tuple2!14050)

(assert (=> b!156661 (= lt!245281 (readBytePure!0 lt!245280))))

(declare-fun b!156662 () Bool)

(declare-fun res!130933 () Bool)

(assert (=> b!156662 (=> (not res!130933) (not e!105911))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156662 (= res!130933 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3227 (buf!3730 lt!245280)) (currentByte!6857 lt!245280) (currentBit!6852 lt!245280))))))

(declare-fun res!130931 () Bool)

(assert (=> start!31038 (=> (not res!130931) (not e!105909))))

(assert (=> start!31038 (= res!130931 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3227 arr!153))))))

(assert (=> start!31038 e!105909))

(assert (=> start!31038 true))

(assert (=> start!31038 (array_inv!3016 arr!153)))

(declare-fun inv!12 (BitStream!5712) Bool)

(assert (=> start!31038 (and (inv!12 bs!65) e!105906)))

(declare-fun b!156663 () Bool)

(declare-fun res!130934 () Bool)

(assert (=> b!156663 (=> (not res!130934) (not e!105909))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156663 (= res!130934 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3227 (buf!3730 bs!65))) ((_ sign_extend 32) (currentByte!6857 bs!65)) ((_ sign_extend 32) (currentBit!6852 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156664 () Bool)

(assert (=> b!156664 (= e!105911 false)))

(declare-fun lt!245278 () (_ BitVec 64))

(assert (=> b!156664 (= lt!245278 (bitIndex!0 (size!3227 (buf!3730 bs!65)) (currentByte!6857 bs!65) (currentBit!6852 bs!65)))))

(assert (= (and start!31038 res!130931) b!156663))

(assert (= (and b!156663 res!130934) b!156659))

(assert (= (and b!156659 res!130932) b!156661))

(assert (= (and b!156661 res!130930) b!156662))

(assert (= (and b!156662 res!130933) b!156664))

(assert (= start!31038 b!156660))

(declare-fun m!244257 () Bool)

(assert (=> b!156660 m!244257))

(declare-fun m!244259 () Bool)

(assert (=> b!156659 m!244259))

(declare-fun m!244261 () Bool)

(assert (=> b!156659 m!244261))

(declare-fun m!244263 () Bool)

(assert (=> b!156659 m!244263))

(declare-fun m!244265 () Bool)

(assert (=> b!156659 m!244265))

(declare-fun m!244267 () Bool)

(assert (=> b!156659 m!244267))

(declare-fun m!244269 () Bool)

(assert (=> b!156661 m!244269))

(declare-fun m!244271 () Bool)

(assert (=> start!31038 m!244271))

(declare-fun m!244273 () Bool)

(assert (=> start!31038 m!244273))

(declare-fun m!244275 () Bool)

(assert (=> b!156664 m!244275))

(declare-fun m!244277 () Bool)

(assert (=> b!156663 m!244277))

(declare-fun m!244279 () Bool)

(assert (=> b!156662 m!244279))

(check-sat (not b!156661) (not b!156659) (not b!156662) (not b!156663) (not b!156660) (not start!31038) (not b!156664))
