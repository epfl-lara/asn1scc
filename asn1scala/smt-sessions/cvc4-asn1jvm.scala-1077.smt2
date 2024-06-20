; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31040 () Bool)

(assert start!31040)

(declare-fun b!156677 () Bool)

(declare-fun e!105925 () Bool)

(declare-datatypes ((array!7198 0))(
  ( (array!7199 (arr!4093 (Array (_ BitVec 32) (_ BitVec 8))) (size!3228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5714 0))(
  ( (BitStream!5715 (buf!3731 array!7198) (currentByte!6858 (_ BitVec 32)) (currentBit!6853 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5714)

(declare-fun array_inv!3017 (array!7198) Bool)

(assert (=> b!156677 (= e!105925 (array_inv!3017 (buf!3731 bs!65)))))

(declare-fun res!130946 () Bool)

(declare-fun e!105924 () Bool)

(assert (=> start!31040 (=> (not res!130946) (not e!105924))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7198)

(assert (=> start!31040 (= res!130946 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3228 arr!153))))))

(assert (=> start!31040 e!105924))

(assert (=> start!31040 true))

(assert (=> start!31040 (array_inv!3017 arr!153)))

(declare-fun inv!12 (BitStream!5714) Bool)

(assert (=> start!31040 (and (inv!12 bs!65) e!105925)))

(declare-fun b!156678 () Bool)

(declare-fun e!105926 () Bool)

(assert (=> b!156678 (= e!105926 false)))

(declare-fun lt!245294 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156678 (= lt!245294 (bitIndex!0 (size!3228 (buf!3731 bs!65)) (currentByte!6858 bs!65) (currentBit!6853 bs!65)))))

(declare-fun b!156679 () Bool)

(declare-fun res!130949 () Bool)

(assert (=> b!156679 (=> (not res!130949) (not e!105924))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156679 (= res!130949 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3228 (buf!3731 bs!65))) ((_ sign_extend 32) (currentByte!6858 bs!65)) ((_ sign_extend 32) (currentBit!6853 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156680 () Bool)

(declare-fun e!105929 () Bool)

(assert (=> b!156680 (= e!105924 e!105929)))

(declare-fun res!130945 () Bool)

(assert (=> b!156680 (=> (not res!130945) (not e!105929))))

(assert (=> b!156680 (= res!130945 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245296 () BitStream!5714)

(declare-datatypes ((tuple2!14052 0))(
  ( (tuple2!14053 (_1!7470 BitStream!5714) (_2!7470 array!7198)) )
))
(declare-fun lt!245293 () tuple2!14052)

(declare-fun readByteArrayLoopPure!0 (BitStream!5714 array!7198 (_ BitVec 32) (_ BitVec 32)) tuple2!14052)

(declare-datatypes ((tuple2!14054 0))(
  ( (tuple2!14055 (_1!7471 BitStream!5714) (_2!7471 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5714) tuple2!14054)

(assert (=> b!156680 (= lt!245293 (readByteArrayLoopPure!0 lt!245296 (array!7199 (store (arr!4093 arr!153) from!240 (_2!7471 (readBytePure!0 bs!65))) (size!3228 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5714 (_ BitVec 32)) BitStream!5714)

(assert (=> b!156680 (= lt!245296 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245292 () tuple2!14052)

(assert (=> b!156680 (= lt!245292 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156681 () Bool)

(declare-fun res!130948 () Bool)

(assert (=> b!156681 (=> (not res!130948) (not e!105926))))

(assert (=> b!156681 (= res!130948 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3228 (buf!3731 lt!245296)) (currentByte!6858 lt!245296) (currentBit!6853 lt!245296))))))

(declare-fun b!156682 () Bool)

(assert (=> b!156682 (= e!105929 e!105926)))

(declare-fun res!130947 () Bool)

(assert (=> b!156682 (=> (not res!130947) (not e!105926))))

(assert (=> b!156682 (= res!130947 (= (size!3228 (buf!3731 bs!65)) (size!3228 (buf!3731 lt!245296))))))

(declare-fun lt!245295 () tuple2!14054)

(assert (=> b!156682 (= lt!245295 (readBytePure!0 lt!245296))))

(assert (= (and start!31040 res!130946) b!156679))

(assert (= (and b!156679 res!130949) b!156680))

(assert (= (and b!156680 res!130945) b!156682))

(assert (= (and b!156682 res!130947) b!156681))

(assert (= (and b!156681 res!130948) b!156678))

(assert (= start!31040 b!156677))

(declare-fun m!244281 () Bool)

(assert (=> b!156677 m!244281))

(declare-fun m!244283 () Bool)

(assert (=> start!31040 m!244283))

(declare-fun m!244285 () Bool)

(assert (=> start!31040 m!244285))

(declare-fun m!244287 () Bool)

(assert (=> b!156682 m!244287))

(declare-fun m!244289 () Bool)

(assert (=> b!156679 m!244289))

(declare-fun m!244291 () Bool)

(assert (=> b!156681 m!244291))

(declare-fun m!244293 () Bool)

(assert (=> b!156678 m!244293))

(declare-fun m!244295 () Bool)

(assert (=> b!156680 m!244295))

(declare-fun m!244297 () Bool)

(assert (=> b!156680 m!244297))

(declare-fun m!244299 () Bool)

(assert (=> b!156680 m!244299))

(declare-fun m!244301 () Bool)

(assert (=> b!156680 m!244301))

(declare-fun m!244303 () Bool)

(assert (=> b!156680 m!244303))

(push 1)

