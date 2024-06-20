; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31036 () Bool)

(assert start!31036)

(declare-fun b!156641 () Bool)

(declare-fun e!105888 () Bool)

(declare-fun e!105892 () Bool)

(assert (=> b!156641 (= e!105888 e!105892)))

(declare-fun res!130919 () Bool)

(assert (=> b!156641 (=> (not res!130919) (not e!105892))))

(declare-datatypes ((array!7194 0))(
  ( (array!7195 (arr!4091 (Array (_ BitVec 32) (_ BitVec 8))) (size!3226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5710 0))(
  ( (BitStream!5711 (buf!3729 array!7194) (currentByte!6856 (_ BitVec 32)) (currentBit!6851 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5710)

(declare-fun lt!245266 () BitStream!5710)

(assert (=> b!156641 (= res!130919 (= (size!3226 (buf!3729 bs!65)) (size!3226 (buf!3729 lt!245266))))))

(declare-datatypes ((tuple2!14044 0))(
  ( (tuple2!14045 (_1!7466 BitStream!5710) (_2!7466 (_ BitVec 8))) )
))
(declare-fun lt!245265 () tuple2!14044)

(declare-fun readBytePure!0 (BitStream!5710) tuple2!14044)

(assert (=> b!156641 (= lt!245265 (readBytePure!0 lt!245266))))

(declare-fun b!156642 () Bool)

(assert (=> b!156642 (= e!105892 false)))

(declare-fun lt!245262 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156642 (= lt!245262 (bitIndex!0 (size!3226 (buf!3729 bs!65)) (currentByte!6856 bs!65) (currentBit!6851 bs!65)))))

(declare-fun b!156643 () Bool)

(declare-fun e!105893 () Bool)

(declare-fun array_inv!3015 (array!7194) Bool)

(assert (=> b!156643 (= e!105893 (array_inv!3015 (buf!3729 bs!65)))))

(declare-fun b!156644 () Bool)

(declare-fun res!130916 () Bool)

(declare-fun e!105891 () Bool)

(assert (=> b!156644 (=> (not res!130916) (not e!105891))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156644 (= res!130916 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3226 (buf!3729 bs!65))) ((_ sign_extend 32) (currentByte!6856 bs!65)) ((_ sign_extend 32) (currentBit!6851 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!130918 () Bool)

(assert (=> start!31036 (=> (not res!130918) (not e!105891))))

(declare-fun arr!153 () array!7194)

(assert (=> start!31036 (= res!130918 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3226 arr!153))))))

(assert (=> start!31036 e!105891))

(assert (=> start!31036 true))

(assert (=> start!31036 (array_inv!3015 arr!153)))

(declare-fun inv!12 (BitStream!5710) Bool)

(assert (=> start!31036 (and (inv!12 bs!65) e!105893)))

(declare-fun b!156645 () Bool)

(declare-fun res!130915 () Bool)

(assert (=> b!156645 (=> (not res!130915) (not e!105892))))

(assert (=> b!156645 (= res!130915 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3226 (buf!3729 lt!245266)) (currentByte!6856 lt!245266) (currentBit!6851 lt!245266))))))

(declare-fun b!156646 () Bool)

(assert (=> b!156646 (= e!105891 e!105888)))

(declare-fun res!130917 () Bool)

(assert (=> b!156646 (=> (not res!130917) (not e!105888))))

(assert (=> b!156646 (= res!130917 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14046 0))(
  ( (tuple2!14047 (_1!7467 BitStream!5710) (_2!7467 array!7194)) )
))
(declare-fun lt!245263 () tuple2!14046)

(declare-fun readByteArrayLoopPure!0 (BitStream!5710 array!7194 (_ BitVec 32) (_ BitVec 32)) tuple2!14046)

(assert (=> b!156646 (= lt!245263 (readByteArrayLoopPure!0 lt!245266 (array!7195 (store (arr!4091 arr!153) from!240 (_2!7466 (readBytePure!0 bs!65))) (size!3226 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5710 (_ BitVec 32)) BitStream!5710)

(assert (=> b!156646 (= lt!245266 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245264 () tuple2!14046)

(assert (=> b!156646 (= lt!245264 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31036 res!130918) b!156644))

(assert (= (and b!156644 res!130916) b!156646))

(assert (= (and b!156646 res!130917) b!156641))

(assert (= (and b!156641 res!130919) b!156645))

(assert (= (and b!156645 res!130915) b!156642))

(assert (= start!31036 b!156643))

(declare-fun m!244233 () Bool)

(assert (=> b!156644 m!244233))

(declare-fun m!244235 () Bool)

(assert (=> start!31036 m!244235))

(declare-fun m!244237 () Bool)

(assert (=> start!31036 m!244237))

(declare-fun m!244239 () Bool)

(assert (=> b!156646 m!244239))

(declare-fun m!244241 () Bool)

(assert (=> b!156646 m!244241))

(declare-fun m!244243 () Bool)

(assert (=> b!156646 m!244243))

(declare-fun m!244245 () Bool)

(assert (=> b!156646 m!244245))

(declare-fun m!244247 () Bool)

(assert (=> b!156646 m!244247))

(declare-fun m!244249 () Bool)

(assert (=> b!156645 m!244249))

(declare-fun m!244251 () Bool)

(assert (=> b!156642 m!244251))

(declare-fun m!244253 () Bool)

(assert (=> b!156641 m!244253))

(declare-fun m!244255 () Bool)

(assert (=> b!156643 m!244255))

(push 1)

(assert (not b!156645))

(assert (not b!156642))

(assert (not b!156646))

(assert (not b!156643))

(assert (not b!156644))

(assert (not b!156641))

(assert (not start!31036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

