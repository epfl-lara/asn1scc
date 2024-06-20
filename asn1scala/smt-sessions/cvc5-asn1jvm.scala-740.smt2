; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20608 () Bool)

(assert start!20608)

(declare-fun b!104222 () Bool)

(declare-fun res!85810 () Bool)

(declare-fun e!68279 () Bool)

(assert (=> b!104222 (=> (not res!85810) (not e!68279))))

(declare-datatypes ((array!4866 0))(
  ( (array!4867 (arr!2814 (Array (_ BitVec 32) (_ BitVec 8))) (size!2221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3916 0))(
  ( (BitStream!3917 (buf!2587 array!4866) (currentByte!5072 (_ BitVec 32)) (currentBit!5067 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3916)

(declare-datatypes ((Unit!6386 0))(
  ( (Unit!6387) )
))
(declare-datatypes ((tuple2!8614 0))(
  ( (tuple2!8615 (_1!4562 Unit!6386) (_2!4562 BitStream!3916)) )
))
(declare-fun lt!152731 () tuple2!8614)

(declare-fun isPrefixOf!0 (BitStream!3916 BitStream!3916) Bool)

(assert (=> b!104222 (= res!85810 (isPrefixOf!0 thiss!1305 (_2!4562 lt!152731)))))

(declare-fun b!104223 () Bool)

(declare-fun res!85815 () Bool)

(declare-fun e!68280 () Bool)

(assert (=> b!104223 (=> (not res!85815) (not e!68280))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!104223 (= res!85815 (bvslt i!615 nBits!396))))

(declare-fun b!104224 () Bool)

(declare-fun e!68282 () Bool)

(declare-fun array_inv!2023 (array!4866) Bool)

(assert (=> b!104224 (= e!68282 (array_inv!2023 (buf!2587 thiss!1305)))))

(declare-fun b!104225 () Bool)

(declare-fun e!68285 () Bool)

(declare-fun lt!152744 () tuple2!8614)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104225 (= e!68285 (invariant!0 (currentBit!5067 (_2!4562 lt!152744)) (currentByte!5072 (_2!4562 lt!152744)) (size!2221 (buf!2587 (_2!4562 lt!152744)))))))

(declare-fun lt!152752 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104225 (= lt!152752 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(declare-datatypes ((tuple2!8616 0))(
  ( (tuple2!8617 (_1!4563 BitStream!3916) (_2!4563 (_ BitVec 64))) )
))
(declare-fun lt!152734 () tuple2!8616)

(declare-fun lt!152743 () tuple2!8616)

(assert (=> b!104225 (and (= (_2!4563 lt!152734) (_2!4563 lt!152743)) (= (_1!4563 lt!152734) (_1!4563 lt!152743)))))

(declare-fun lt!152746 () Unit!6386)

(declare-datatypes ((tuple2!8618 0))(
  ( (tuple2!8619 (_1!4564 BitStream!3916) (_2!4564 BitStream!3916)) )
))
(declare-fun lt!152740 () tuple2!8618)

(declare-fun lt!152745 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6386)

(assert (=> b!104225 (= lt!152746 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4564 lt!152740) nBits!396 i!615 lt!152745))))

(declare-fun lt!152751 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8616)

(declare-fun withMovedBitIndex!0 (BitStream!3916 (_ BitVec 64)) BitStream!3916)

(assert (=> b!104225 (= lt!152743 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152751))))

(declare-fun b!104226 () Bool)

(declare-fun e!68283 () Bool)

(assert (=> b!104226 (= e!68283 (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152744)))))))

(declare-fun b!104227 () Bool)

(declare-fun res!85817 () Bool)

(assert (=> b!104227 (=> (not res!85817) (not e!68283))))

(assert (=> b!104227 (= res!85817 (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(declare-fun b!104229 () Bool)

(declare-fun e!68286 () Bool)

(assert (=> b!104229 (= e!68286 e!68280)))

(declare-fun res!85814 () Bool)

(assert (=> b!104229 (=> (not res!85814) (not e!68280))))

(declare-fun lt!152739 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104229 (= res!85814 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305)) lt!152739))))

(assert (=> b!104229 (= lt!152739 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!104230 () Bool)

(declare-fun e!68281 () Bool)

(declare-datatypes ((tuple2!8620 0))(
  ( (tuple2!8621 (_1!4565 BitStream!3916) (_2!4565 Bool)) )
))
(declare-fun lt!152737 () tuple2!8620)

(declare-fun lt!152742 () tuple2!8620)

(assert (=> b!104230 (= e!68281 (= (_2!4565 lt!152737) (_2!4565 lt!152742)))))

(declare-fun b!104231 () Bool)

(declare-fun e!68278 () Bool)

(assert (=> b!104231 (= e!68278 e!68279)))

(declare-fun res!85812 () Bool)

(assert (=> b!104231 (=> (not res!85812) (not e!68279))))

(declare-fun lt!152755 () (_ BitVec 64))

(declare-fun lt!152733 () (_ BitVec 64))

(assert (=> b!104231 (= res!85812 (= lt!152755 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152733)))))

(assert (=> b!104231 (= lt!152755 (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))))))

(assert (=> b!104231 (= lt!152733 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(declare-fun b!104232 () Bool)

(declare-fun res!85818 () Bool)

(assert (=> b!104232 (=> (not res!85818) (not e!68280))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104232 (= res!85818 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!104233 () Bool)

(declare-fun e!68284 () Bool)

(assert (=> b!104233 (= e!68279 e!68284)))

(declare-fun res!85809 () Bool)

(assert (=> b!104233 (=> (not res!85809) (not e!68284))))

(declare-fun lt!152754 () Bool)

(declare-fun lt!152741 () tuple2!8620)

(assert (=> b!104233 (= res!85809 (and (= (_2!4565 lt!152741) lt!152754) (= (_1!4565 lt!152741) (_2!4562 lt!152731))))))

(declare-fun readBitPure!0 (BitStream!3916) tuple2!8620)

(declare-fun readerFrom!0 (BitStream!3916 (_ BitVec 32) (_ BitVec 32)) BitStream!3916)

(assert (=> b!104233 (= lt!152741 (readBitPure!0 (readerFrom!0 (_2!4562 lt!152731) (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305))))))

(declare-fun b!104234 () Bool)

(assert (=> b!104234 (= e!68280 (not e!68285))))

(declare-fun res!85816 () Bool)

(assert (=> b!104234 (=> res!85816 e!68285)))

(declare-fun lt!152738 () tuple2!8618)

(assert (=> b!104234 (= res!85816 (not (= (_1!4563 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!152738) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152751)) (_2!4564 lt!152738))))))

(declare-fun lt!152753 () (_ BitVec 64))

(assert (=> b!104234 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731))) lt!152753)))

(declare-fun lt!152735 () Unit!6386)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3916 array!4866 (_ BitVec 64)) Unit!6386)

(assert (=> b!104234 (= lt!152735 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4562 lt!152731) (buf!2587 (_2!4562 lt!152744)) lt!152753))))

(assert (=> b!104234 (= lt!152753 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152749 () tuple2!8620)

(declare-fun lt!152750 () (_ BitVec 64))

(assert (=> b!104234 (= lt!152751 (bvor lt!152745 (ite (_2!4565 lt!152749) lt!152750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104234 (= lt!152734 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!152740) nBits!396 i!615 lt!152745))))

(assert (=> b!104234 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305)) lt!152739)))

(declare-fun lt!152732 () Unit!6386)

(assert (=> b!104234 (= lt!152732 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2587 (_2!4562 lt!152744)) lt!152739))))

(assert (=> b!104234 (= lt!152745 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!104234 (= (_2!4565 lt!152749) lt!152754)))

(assert (=> b!104234 (= lt!152749 (readBitPure!0 (_1!4564 lt!152740)))))

(declare-fun reader!0 (BitStream!3916 BitStream!3916) tuple2!8618)

(assert (=> b!104234 (= lt!152738 (reader!0 (_2!4562 lt!152731) (_2!4562 lt!152744)))))

(assert (=> b!104234 (= lt!152740 (reader!0 thiss!1305 (_2!4562 lt!152744)))))

(assert (=> b!104234 e!68281))

(declare-fun res!85820 () Bool)

(assert (=> b!104234 (=> (not res!85820) (not e!68281))))

(assert (=> b!104234 (= res!85820 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!152737))) (currentByte!5072 (_1!4565 lt!152737)) (currentBit!5067 (_1!4565 lt!152737))) (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!152742))) (currentByte!5072 (_1!4565 lt!152742)) (currentBit!5067 (_1!4565 lt!152742)))))))

(declare-fun lt!152748 () Unit!6386)

(declare-fun lt!152747 () BitStream!3916)

(declare-fun readBitPrefixLemma!0 (BitStream!3916 BitStream!3916) Unit!6386)

(assert (=> b!104234 (= lt!152748 (readBitPrefixLemma!0 lt!152747 (_2!4562 lt!152744)))))

(assert (=> b!104234 (= lt!152742 (readBitPure!0 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305))))))

(assert (=> b!104234 (= lt!152737 (readBitPure!0 lt!152747))))

(assert (=> b!104234 (= lt!152747 (BitStream!3917 (buf!2587 (_2!4562 lt!152731)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(assert (=> b!104234 e!68283))

(declare-fun res!85813 () Bool)

(assert (=> b!104234 (=> (not res!85813) (not e!68283))))

(assert (=> b!104234 (= res!85813 (isPrefixOf!0 thiss!1305 (_2!4562 lt!152744)))))

(declare-fun lt!152736 () Unit!6386)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3916 BitStream!3916 BitStream!3916) Unit!6386)

(assert (=> b!104234 (= lt!152736 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4562 lt!152731) (_2!4562 lt!152744)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3916 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8614)

(assert (=> b!104234 (= lt!152744 (appendNLeastSignificantBitsLoop!0 (_2!4562 lt!152731) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!104234 e!68278))

(declare-fun res!85811 () Bool)

(assert (=> b!104234 (=> (not res!85811) (not e!68278))))

(assert (=> b!104234 (= res!85811 (= (size!2221 (buf!2587 thiss!1305)) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(declare-fun appendBit!0 (BitStream!3916 Bool) tuple2!8614)

(assert (=> b!104234 (= lt!152731 (appendBit!0 thiss!1305 lt!152754))))

(assert (=> b!104234 (= lt!152754 (not (= (bvand v!199 lt!152750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104234 (= lt!152750 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!85819 () Bool)

(assert (=> start!20608 (=> (not res!85819) (not e!68286))))

(assert (=> start!20608 (= res!85819 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20608 e!68286))

(assert (=> start!20608 true))

(declare-fun inv!12 (BitStream!3916) Bool)

(assert (=> start!20608 (and (inv!12 thiss!1305) e!68282)))

(declare-fun b!104228 () Bool)

(assert (=> b!104228 (= e!68284 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!152741))) (currentByte!5072 (_1!4565 lt!152741)) (currentBit!5067 (_1!4565 lt!152741))) lt!152755))))

(assert (= (and start!20608 res!85819) b!104229))

(assert (= (and b!104229 res!85814) b!104232))

(assert (= (and b!104232 res!85818) b!104223))

(assert (= (and b!104223 res!85815) b!104234))

(assert (= (and b!104234 res!85811) b!104231))

(assert (= (and b!104231 res!85812) b!104222))

(assert (= (and b!104222 res!85810) b!104233))

(assert (= (and b!104233 res!85809) b!104228))

(assert (= (and b!104234 res!85813) b!104227))

(assert (= (and b!104227 res!85817) b!104226))

(assert (= (and b!104234 res!85820) b!104230))

(assert (= (and b!104234 (not res!85816)) b!104225))

(assert (= start!20608 b!104224))

(declare-fun m!152323 () Bool)

(assert (=> b!104228 m!152323))

(declare-fun m!152325 () Bool)

(assert (=> b!104229 m!152325))

(declare-fun m!152327 () Bool)

(assert (=> b!104232 m!152327))

(declare-fun m!152329 () Bool)

(assert (=> b!104234 m!152329))

(declare-fun m!152331 () Bool)

(assert (=> b!104234 m!152331))

(declare-fun m!152333 () Bool)

(assert (=> b!104234 m!152333))

(declare-fun m!152335 () Bool)

(assert (=> b!104234 m!152335))

(declare-fun m!152337 () Bool)

(assert (=> b!104234 m!152337))

(declare-fun m!152339 () Bool)

(assert (=> b!104234 m!152339))

(declare-fun m!152341 () Bool)

(assert (=> b!104234 m!152341))

(declare-fun m!152343 () Bool)

(assert (=> b!104234 m!152343))

(declare-fun m!152345 () Bool)

(assert (=> b!104234 m!152345))

(declare-fun m!152347 () Bool)

(assert (=> b!104234 m!152347))

(declare-fun m!152349 () Bool)

(assert (=> b!104234 m!152349))

(declare-fun m!152351 () Bool)

(assert (=> b!104234 m!152351))

(declare-fun m!152353 () Bool)

(assert (=> b!104234 m!152353))

(declare-fun m!152355 () Bool)

(assert (=> b!104234 m!152355))

(declare-fun m!152357 () Bool)

(assert (=> b!104234 m!152357))

(declare-fun m!152359 () Bool)

(assert (=> b!104234 m!152359))

(declare-fun m!152361 () Bool)

(assert (=> b!104234 m!152361))

(declare-fun m!152363 () Bool)

(assert (=> b!104234 m!152363))

(declare-fun m!152365 () Bool)

(assert (=> b!104234 m!152365))

(declare-fun m!152367 () Bool)

(assert (=> b!104227 m!152367))

(declare-fun m!152369 () Bool)

(assert (=> b!104222 m!152369))

(declare-fun m!152371 () Bool)

(assert (=> start!20608 m!152371))

(declare-fun m!152373 () Bool)

(assert (=> b!104231 m!152373))

(declare-fun m!152375 () Bool)

(assert (=> b!104231 m!152375))

(declare-fun m!152377 () Bool)

(assert (=> b!104225 m!152377))

(declare-fun m!152379 () Bool)

(assert (=> b!104225 m!152379))

(declare-fun m!152381 () Bool)

(assert (=> b!104225 m!152381))

(assert (=> b!104225 m!152375))

(assert (=> b!104225 m!152377))

(declare-fun m!152383 () Bool)

(assert (=> b!104225 m!152383))

(declare-fun m!152385 () Bool)

(assert (=> b!104224 m!152385))

(declare-fun m!152387 () Bool)

(assert (=> b!104226 m!152387))

(declare-fun m!152389 () Bool)

(assert (=> b!104233 m!152389))

(assert (=> b!104233 m!152389))

(declare-fun m!152391 () Bool)

(assert (=> b!104233 m!152391))

(push 1)

(assert (not b!104226))

(assert (not b!104231))

(assert (not b!104225))

(assert (not b!104222))

(assert (not start!20608))

(assert (not b!104228))

(assert (not b!104234))

(assert (not b!104233))

(assert (not b!104229))

(assert (not b!104232))

(assert (not b!104227))

(assert (not b!104224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!32280 () Bool)

(assert (=> d!32280 (= (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152731)))) (and (bvsge (currentBit!5067 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5067 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5072 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152731)))) (and (= (currentBit!5067 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152731))))))))))

(assert (=> b!104227 d!32280))

(declare-fun d!32282 () Bool)

(assert (=> d!32282 (= (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152744)))) (and (bvsge (currentBit!5067 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5067 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5072 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152744)))) (and (= (currentBit!5067 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152744))))))))))

(assert (=> b!104226 d!32282))

(declare-fun d!32284 () Bool)

(declare-fun lt!153047 () tuple2!8616)

(declare-fun lt!153049 () tuple2!8616)

(assert (=> d!32284 (and (= (_2!4563 lt!153047) (_2!4563 lt!153049)) (= (_1!4563 lt!153047) (_1!4563 lt!153049)))))

(declare-fun lt!153045 () Bool)

(declare-fun lt!153046 () BitStream!3916)

(declare-fun lt!153048 () Unit!6386)

(declare-fun lt!153044 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8616 tuple2!8616 BitStream!3916 (_ BitVec 64) Bool BitStream!3916 (_ BitVec 64) tuple2!8616 tuple2!8616 BitStream!3916 (_ BitVec 64)) Unit!6386)

(assert (=> d!32284 (= lt!153048 (choose!45 (_1!4564 lt!152740) nBits!396 i!615 lt!152745 lt!153047 (tuple2!8617 (_1!4563 lt!153047) (_2!4563 lt!153047)) (_1!4563 lt!153047) (_2!4563 lt!153047) lt!153045 lt!153046 lt!153044 lt!153049 (tuple2!8617 (_1!4563 lt!153049) (_2!4563 lt!153049)) (_1!4563 lt!153049) (_2!4563 lt!153049)))))

(assert (=> d!32284 (= lt!153049 (readNLeastSignificantBitsLoopPure!0 lt!153046 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153044))))

(assert (=> d!32284 (= lt!153044 (bvor lt!152745 (ite lt!153045 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32284 (= lt!153046 (withMovedBitIndex!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!32284 (= lt!153045 (_2!4565 (readBitPure!0 (_1!4564 lt!152740))))))

(assert (=> d!32284 (= lt!153047 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!152740) nBits!396 i!615 lt!152745))))

(assert (=> d!32284 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4564 lt!152740) nBits!396 i!615 lt!152745) lt!153048)))

(declare-fun bs!7927 () Bool)

(assert (= bs!7927 d!32284))

(assert (=> bs!7927 m!152377))

(assert (=> bs!7927 m!152353))

(declare-fun m!152623 () Bool)

(assert (=> bs!7927 m!152623))

(assert (=> bs!7927 m!152357))

(declare-fun m!152625 () Bool)

(assert (=> bs!7927 m!152625))

(assert (=> b!104225 d!32284))

(declare-datatypes ((tuple2!8640 0))(
  ( (tuple2!8641 (_1!4575 (_ BitVec 64)) (_2!4575 BitStream!3916)) )
))
(declare-fun lt!153052 () tuple2!8640)

(declare-fun d!32286 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8640)

(assert (=> d!32286 (= lt!153052 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152751))))

(assert (=> d!32286 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152751) (tuple2!8617 (_2!4575 lt!153052) (_1!4575 lt!153052)))))

(declare-fun bs!7928 () Bool)

(assert (= bs!7928 d!32286))

(assert (=> bs!7928 m!152377))

(declare-fun m!152627 () Bool)

(assert (=> bs!7928 m!152627))

(assert (=> b!104225 d!32286))

(declare-fun d!32288 () Bool)

(declare-fun e!68363 () Bool)

(assert (=> d!32288 e!68363))

(declare-fun res!85916 () Bool)

(assert (=> d!32288 (=> (not res!85916) (not e!68363))))

(declare-fun lt!153058 () (_ BitVec 64))

(declare-fun lt!153057 () BitStream!3916)

(assert (=> d!32288 (= res!85916 (= (bvadd lt!153058 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2221 (buf!2587 lt!153057)) (currentByte!5072 lt!153057) (currentBit!5067 lt!153057))))))

(assert (=> d!32288 (or (not (= (bvand lt!153058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153058 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32288 (= lt!153058 (bitIndex!0 (size!2221 (buf!2587 (_1!4564 lt!152740))) (currentByte!5072 (_1!4564 lt!152740)) (currentBit!5067 (_1!4564 lt!152740))))))

(declare-fun moveBitIndex!0 (BitStream!3916 (_ BitVec 64)) tuple2!8614)

(assert (=> d!32288 (= lt!153057 (_2!4562 (moveBitIndex!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3916 (_ BitVec 64)) Bool)

(assert (=> d!32288 (moveBitIndexPrecond!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!32288 (= (withMovedBitIndex!0 (_1!4564 lt!152740) #b0000000000000000000000000000000000000000000000000000000000000001) lt!153057)))

(declare-fun b!104344 () Bool)

(assert (=> b!104344 (= e!68363 (= (size!2221 (buf!2587 (_1!4564 lt!152740))) (size!2221 (buf!2587 lt!153057))))))

(assert (= (and d!32288 res!85916) b!104344))

(declare-fun m!152629 () Bool)

(assert (=> d!32288 m!152629))

(declare-fun m!152631 () Bool)

(assert (=> d!32288 m!152631))

(declare-fun m!152633 () Bool)

(assert (=> d!32288 m!152633))

(declare-fun m!152635 () Bool)

(assert (=> d!32288 m!152635))

(assert (=> b!104225 d!32288))

(declare-fun d!32290 () Bool)

(assert (=> d!32290 (= (invariant!0 (currentBit!5067 (_2!4562 lt!152744)) (currentByte!5072 (_2!4562 lt!152744)) (size!2221 (buf!2587 (_2!4562 lt!152744)))) (and (bvsge (currentBit!5067 (_2!4562 lt!152744)) #b00000000000000000000000000000000) (bvslt (currentBit!5067 (_2!4562 lt!152744)) #b00000000000000000000000000001000) (bvsge (currentByte!5072 (_2!4562 lt!152744)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5072 (_2!4562 lt!152744)) (size!2221 (buf!2587 (_2!4562 lt!152744)))) (and (= (currentBit!5067 (_2!4562 lt!152744)) #b00000000000000000000000000000000) (= (currentByte!5072 (_2!4562 lt!152744)) (size!2221 (buf!2587 (_2!4562 lt!152744))))))))))

(assert (=> b!104225 d!32290))

(declare-fun d!32292 () Bool)

(declare-fun e!68366 () Bool)

(assert (=> d!32292 e!68366))

(declare-fun res!85921 () Bool)

(assert (=> d!32292 (=> (not res!85921) (not e!68366))))

(declare-fun lt!153071 () (_ BitVec 64))

(declare-fun lt!153073 () (_ BitVec 64))

(declare-fun lt!153076 () (_ BitVec 64))

(assert (=> d!32292 (= res!85921 (= lt!153076 (bvsub lt!153071 lt!153073)))))

(assert (=> d!32292 (or (= (bvand lt!153071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153071 lt!153073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32292 (= lt!153073 (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305))))))

(declare-fun lt!153072 () (_ BitVec 64))

(declare-fun lt!153074 () (_ BitVec 64))

(assert (=> d!32292 (= lt!153071 (bvmul lt!153072 lt!153074))))

(assert (=> d!32292 (or (= lt!153072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153074 (bvsdiv (bvmul lt!153072 lt!153074) lt!153072)))))

(assert (=> d!32292 (= lt!153074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32292 (= lt!153072 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))))))

(assert (=> d!32292 (= lt!153076 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5072 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5067 thiss!1305))))))

(assert (=> d!32292 (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 thiss!1305)))))

(assert (=> d!32292 (= (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)) lt!153076)))

(declare-fun b!104349 () Bool)

(declare-fun res!85922 () Bool)

(assert (=> b!104349 (=> (not res!85922) (not e!68366))))

(assert (=> b!104349 (= res!85922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153076))))

(declare-fun b!104350 () Bool)

(declare-fun lt!153075 () (_ BitVec 64))

(assert (=> b!104350 (= e!68366 (bvsle lt!153076 (bvmul lt!153075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104350 (or (= lt!153075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153075)))))

(assert (=> b!104350 (= lt!153075 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))))))

(assert (= (and d!32292 res!85921) b!104349))

(assert (= (and b!104349 res!85922) b!104350))

(declare-fun m!152637 () Bool)

(assert (=> d!32292 m!152637))

(declare-fun m!152639 () Bool)

(assert (=> d!32292 m!152639))

(assert (=> b!104225 d!32292))

(declare-fun d!32294 () Bool)

(assert (=> d!32294 (= (array_inv!2023 (buf!2587 thiss!1305)) (bvsge (size!2221 (buf!2587 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!104224 d!32294))

(declare-fun d!32296 () Bool)

(assert (=> d!32296 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 thiss!1305))))))

(declare-fun bs!7929 () Bool)

(assert (= bs!7929 d!32296))

(assert (=> bs!7929 m!152639))

(assert (=> start!20608 d!32296))

(declare-fun d!32298 () Bool)

(declare-fun res!85929 () Bool)

(declare-fun e!68371 () Bool)

(assert (=> d!32298 (=> (not res!85929) (not e!68371))))

(assert (=> d!32298 (= res!85929 (= (size!2221 (buf!2587 thiss!1305)) (size!2221 (buf!2587 (_2!4562 lt!152744)))))))

(assert (=> d!32298 (= (isPrefixOf!0 thiss!1305 (_2!4562 lt!152744)) e!68371)))

(declare-fun b!104357 () Bool)

(declare-fun res!85930 () Bool)

(assert (=> b!104357 (=> (not res!85930) (not e!68371))))

(assert (=> b!104357 (= res!85930 (bvsle (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)) (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152744))) (currentByte!5072 (_2!4562 lt!152744)) (currentBit!5067 (_2!4562 lt!152744)))))))

(declare-fun b!104358 () Bool)

(declare-fun e!68372 () Bool)

(assert (=> b!104358 (= e!68371 e!68372)))

(declare-fun res!85931 () Bool)

(assert (=> b!104358 (=> res!85931 e!68372)))

(assert (=> b!104358 (= res!85931 (= (size!2221 (buf!2587 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104359 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4866 array!4866 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104359 (= e!68372 (arrayBitRangesEq!0 (buf!2587 thiss!1305) (buf!2587 (_2!4562 lt!152744)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305))))))

(assert (= (and d!32298 res!85929) b!104357))

(assert (= (and b!104357 res!85930) b!104358))

(assert (= (and b!104358 (not res!85931)) b!104359))

(assert (=> b!104357 m!152375))

(declare-fun m!152641 () Bool)

(assert (=> b!104357 m!152641))

(assert (=> b!104359 m!152375))

(assert (=> b!104359 m!152375))

(declare-fun m!152643 () Bool)

(assert (=> b!104359 m!152643))

(assert (=> b!104234 d!32298))

(declare-fun d!32300 () Bool)

(assert (=> d!32300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731))) lt!152753) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731)))) lt!152753))))

(declare-fun bs!7930 () Bool)

(assert (= bs!7930 d!32300))

(declare-fun m!152645 () Bool)

(assert (=> bs!7930 m!152645))

(assert (=> b!104234 d!32300))

(declare-fun d!32302 () Bool)

(declare-fun e!68375 () Bool)

(assert (=> d!32302 e!68375))

(declare-fun res!85934 () Bool)

(assert (=> d!32302 (=> (not res!85934) (not e!68375))))

(declare-fun lt!153086 () tuple2!8620)

(declare-fun lt!153087 () tuple2!8620)

(assert (=> d!32302 (= res!85934 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!153086))) (currentByte!5072 (_1!4565 lt!153086)) (currentBit!5067 (_1!4565 lt!153086))) (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!153087))) (currentByte!5072 (_1!4565 lt!153087)) (currentBit!5067 (_1!4565 lt!153087)))))))

(declare-fun lt!153085 () Unit!6386)

(declare-fun lt!153088 () BitStream!3916)

(declare-fun choose!50 (BitStream!3916 BitStream!3916 BitStream!3916 tuple2!8620 tuple2!8620 BitStream!3916 Bool tuple2!8620 tuple2!8620 BitStream!3916 Bool) Unit!6386)

(assert (=> d!32302 (= lt!153085 (choose!50 lt!152747 (_2!4562 lt!152744) lt!153088 lt!153086 (tuple2!8621 (_1!4565 lt!153086) (_2!4565 lt!153086)) (_1!4565 lt!153086) (_2!4565 lt!153086) lt!153087 (tuple2!8621 (_1!4565 lt!153087) (_2!4565 lt!153087)) (_1!4565 lt!153087) (_2!4565 lt!153087)))))

(assert (=> d!32302 (= lt!153087 (readBitPure!0 lt!153088))))

(assert (=> d!32302 (= lt!153086 (readBitPure!0 lt!152747))))

(assert (=> d!32302 (= lt!153088 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 lt!152747) (currentBit!5067 lt!152747)))))

(assert (=> d!32302 (invariant!0 (currentBit!5067 lt!152747) (currentByte!5072 lt!152747) (size!2221 (buf!2587 (_2!4562 lt!152744))))))

(assert (=> d!32302 (= (readBitPrefixLemma!0 lt!152747 (_2!4562 lt!152744)) lt!153085)))

(declare-fun b!104362 () Bool)

(assert (=> b!104362 (= e!68375 (= (_2!4565 lt!153086) (_2!4565 lt!153087)))))

(assert (= (and d!32302 res!85934) b!104362))

(declare-fun m!152647 () Bool)

(assert (=> d!32302 m!152647))

(declare-fun m!152649 () Bool)

(assert (=> d!32302 m!152649))

(assert (=> d!32302 m!152365))

(declare-fun m!152651 () Bool)

(assert (=> d!32302 m!152651))

(declare-fun m!152653 () Bool)

(assert (=> d!32302 m!152653))

(declare-fun m!152655 () Bool)

(assert (=> d!32302 m!152655))

(assert (=> b!104234 d!32302))

(declare-fun d!32304 () Bool)

(declare-fun e!68376 () Bool)

(assert (=> d!32304 e!68376))

(declare-fun res!85935 () Bool)

(assert (=> d!32304 (=> (not res!85935) (not e!68376))))

(declare-fun lt!153091 () (_ BitVec 64))

(declare-fun lt!153089 () (_ BitVec 64))

(declare-fun lt!153094 () (_ BitVec 64))

(assert (=> d!32304 (= res!85935 (= lt!153094 (bvsub lt!153089 lt!153091)))))

(assert (=> d!32304 (or (= (bvand lt!153089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153089 lt!153091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32304 (= lt!153091 (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152742)))) ((_ sign_extend 32) (currentByte!5072 (_1!4565 lt!152742))) ((_ sign_extend 32) (currentBit!5067 (_1!4565 lt!152742)))))))

(declare-fun lt!153090 () (_ BitVec 64))

(declare-fun lt!153092 () (_ BitVec 64))

(assert (=> d!32304 (= lt!153089 (bvmul lt!153090 lt!153092))))

(assert (=> d!32304 (or (= lt!153090 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153092 (bvsdiv (bvmul lt!153090 lt!153092) lt!153090)))))

(assert (=> d!32304 (= lt!153092 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32304 (= lt!153090 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152742)))))))

(assert (=> d!32304 (= lt!153094 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5072 (_1!4565 lt!152742))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5067 (_1!4565 lt!152742)))))))

(assert (=> d!32304 (invariant!0 (currentBit!5067 (_1!4565 lt!152742)) (currentByte!5072 (_1!4565 lt!152742)) (size!2221 (buf!2587 (_1!4565 lt!152742))))))

(assert (=> d!32304 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!152742))) (currentByte!5072 (_1!4565 lt!152742)) (currentBit!5067 (_1!4565 lt!152742))) lt!153094)))

(declare-fun b!104363 () Bool)

(declare-fun res!85936 () Bool)

(assert (=> b!104363 (=> (not res!85936) (not e!68376))))

(assert (=> b!104363 (= res!85936 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153094))))

(declare-fun b!104364 () Bool)

(declare-fun lt!153093 () (_ BitVec 64))

(assert (=> b!104364 (= e!68376 (bvsle lt!153094 (bvmul lt!153093 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104364 (or (= lt!153093 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153093 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153093)))))

(assert (=> b!104364 (= lt!153093 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152742)))))))

(assert (= (and d!32304 res!85935) b!104363))

(assert (= (and b!104363 res!85936) b!104364))

(declare-fun m!152657 () Bool)

(assert (=> d!32304 m!152657))

(declare-fun m!152659 () Bool)

(assert (=> d!32304 m!152659))

(assert (=> b!104234 d!32304))

(declare-fun d!32306 () Bool)

(declare-fun e!68382 () Bool)

(assert (=> d!32306 e!68382))

(declare-fun res!85944 () Bool)

(assert (=> d!32306 (=> (not res!85944) (not e!68382))))

(declare-fun lt!153145 () tuple2!8618)

(assert (=> d!32306 (= res!85944 (isPrefixOf!0 (_1!4564 lt!153145) (_2!4564 lt!153145)))))

(declare-fun lt!153140 () BitStream!3916)

(assert (=> d!32306 (= lt!153145 (tuple2!8619 lt!153140 (_2!4562 lt!152744)))))

(declare-fun lt!153142 () Unit!6386)

(declare-fun lt!153146 () Unit!6386)

(assert (=> d!32306 (= lt!153142 lt!153146)))

(assert (=> d!32306 (isPrefixOf!0 lt!153140 (_2!4562 lt!152744))))

(assert (=> d!32306 (= lt!153146 (lemmaIsPrefixTransitive!0 lt!153140 (_2!4562 lt!152744) (_2!4562 lt!152744)))))

(declare-fun lt!153150 () Unit!6386)

(declare-fun lt!153139 () Unit!6386)

(assert (=> d!32306 (= lt!153150 lt!153139)))

(assert (=> d!32306 (isPrefixOf!0 lt!153140 (_2!4562 lt!152744))))

(assert (=> d!32306 (= lt!153139 (lemmaIsPrefixTransitive!0 lt!153140 (_2!4562 lt!152731) (_2!4562 lt!152744)))))

(declare-fun lt!153153 () Unit!6386)

(declare-fun e!68381 () Unit!6386)

(assert (=> d!32306 (= lt!153153 e!68381)))

(declare-fun c!6423 () Bool)

(assert (=> d!32306 (= c!6423 (not (= (size!2221 (buf!2587 (_2!4562 lt!152731))) #b00000000000000000000000000000000)))))

(declare-fun lt!153138 () Unit!6386)

(declare-fun lt!153152 () Unit!6386)

(assert (=> d!32306 (= lt!153138 lt!153152)))

(assert (=> d!32306 (isPrefixOf!0 (_2!4562 lt!152744) (_2!4562 lt!152744))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3916) Unit!6386)

(assert (=> d!32306 (= lt!153152 (lemmaIsPrefixRefl!0 (_2!4562 lt!152744)))))

(declare-fun lt!153136 () Unit!6386)

(declare-fun lt!153141 () Unit!6386)

(assert (=> d!32306 (= lt!153136 lt!153141)))

(assert (=> d!32306 (= lt!153141 (lemmaIsPrefixRefl!0 (_2!4562 lt!152744)))))

(declare-fun lt!153154 () Unit!6386)

(declare-fun lt!153143 () Unit!6386)

(assert (=> d!32306 (= lt!153154 lt!153143)))

(assert (=> d!32306 (isPrefixOf!0 lt!153140 lt!153140)))

(assert (=> d!32306 (= lt!153143 (lemmaIsPrefixRefl!0 lt!153140))))

(declare-fun lt!153151 () Unit!6386)

(declare-fun lt!153148 () Unit!6386)

(assert (=> d!32306 (= lt!153151 lt!153148)))

(assert (=> d!32306 (isPrefixOf!0 (_2!4562 lt!152731) (_2!4562 lt!152731))))

(assert (=> d!32306 (= lt!153148 (lemmaIsPrefixRefl!0 (_2!4562 lt!152731)))))

(assert (=> d!32306 (= lt!153140 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))))))

(assert (=> d!32306 (isPrefixOf!0 (_2!4562 lt!152731) (_2!4562 lt!152744))))

(assert (=> d!32306 (= (reader!0 (_2!4562 lt!152731) (_2!4562 lt!152744)) lt!153145)))

(declare-fun b!104375 () Bool)

(declare-fun res!85943 () Bool)

(assert (=> b!104375 (=> (not res!85943) (not e!68382))))

(assert (=> b!104375 (= res!85943 (isPrefixOf!0 (_2!4564 lt!153145) (_2!4562 lt!152744)))))

(declare-fun b!104376 () Bool)

(declare-fun lt!153137 () Unit!6386)

(assert (=> b!104376 (= e!68381 lt!153137)))

(declare-fun lt!153144 () (_ BitVec 64))

(assert (=> b!104376 (= lt!153144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!153147 () (_ BitVec 64))

(assert (=> b!104376 (= lt!153147 (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4866 array!4866 (_ BitVec 64) (_ BitVec 64)) Unit!6386)

(assert (=> b!104376 (= lt!153137 (arrayBitRangesEqSymmetric!0 (buf!2587 (_2!4562 lt!152731)) (buf!2587 (_2!4562 lt!152744)) lt!153144 lt!153147))))

(assert (=> b!104376 (arrayBitRangesEq!0 (buf!2587 (_2!4562 lt!152744)) (buf!2587 (_2!4562 lt!152731)) lt!153144 lt!153147)))

(declare-fun b!104377 () Bool)

(declare-fun res!85945 () Bool)

(assert (=> b!104377 (=> (not res!85945) (not e!68382))))

(assert (=> b!104377 (= res!85945 (isPrefixOf!0 (_1!4564 lt!153145) (_2!4562 lt!152731)))))

(declare-fun lt!153135 () (_ BitVec 64))

(declare-fun b!104378 () Bool)

(declare-fun lt!153149 () (_ BitVec 64))

(assert (=> b!104378 (= e!68382 (= (_1!4564 lt!153145) (withMovedBitIndex!0 (_2!4564 lt!153145) (bvsub lt!153135 lt!153149))))))

(assert (=> b!104378 (or (= (bvand lt!153135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153149 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153135 lt!153149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104378 (= lt!153149 (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152744))) (currentByte!5072 (_2!4562 lt!152744)) (currentBit!5067 (_2!4562 lt!152744))))))

(assert (=> b!104378 (= lt!153135 (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))))))

(declare-fun b!104379 () Bool)

(declare-fun Unit!6400 () Unit!6386)

(assert (=> b!104379 (= e!68381 Unit!6400)))

(assert (= (and d!32306 c!6423) b!104376))

(assert (= (and d!32306 (not c!6423)) b!104379))

(assert (= (and d!32306 res!85944) b!104377))

(assert (= (and b!104377 res!85945) b!104375))

(assert (= (and b!104375 res!85943) b!104378))

(declare-fun m!152661 () Bool)

(assert (=> b!104378 m!152661))

(assert (=> b!104378 m!152641))

(assert (=> b!104378 m!152373))

(declare-fun m!152663 () Bool)

(assert (=> d!32306 m!152663))

(declare-fun m!152665 () Bool)

(assert (=> d!32306 m!152665))

(declare-fun m!152667 () Bool)

(assert (=> d!32306 m!152667))

(declare-fun m!152669 () Bool)

(assert (=> d!32306 m!152669))

(declare-fun m!152671 () Bool)

(assert (=> d!32306 m!152671))

(declare-fun m!152673 () Bool)

(assert (=> d!32306 m!152673))

(declare-fun m!152675 () Bool)

(assert (=> d!32306 m!152675))

(declare-fun m!152677 () Bool)

(assert (=> d!32306 m!152677))

(declare-fun m!152679 () Bool)

(assert (=> d!32306 m!152679))

(declare-fun m!152681 () Bool)

(assert (=> d!32306 m!152681))

(declare-fun m!152683 () Bool)

(assert (=> d!32306 m!152683))

(declare-fun m!152685 () Bool)

(assert (=> b!104377 m!152685))

(assert (=> b!104376 m!152373))

(declare-fun m!152687 () Bool)

(assert (=> b!104376 m!152687))

(declare-fun m!152689 () Bool)

(assert (=> b!104376 m!152689))

(declare-fun m!152691 () Bool)

(assert (=> b!104375 m!152691))

(assert (=> b!104234 d!32306))

(declare-fun d!32308 () Bool)

(declare-datatypes ((tuple2!8646 0))(
  ( (tuple2!8647 (_1!4578 Bool) (_2!4578 BitStream!3916)) )
))
(declare-fun lt!153157 () tuple2!8646)

(declare-fun readBit!0 (BitStream!3916) tuple2!8646)

(assert (=> d!32308 (= lt!153157 (readBit!0 (_1!4564 lt!152740)))))

(assert (=> d!32308 (= (readBitPure!0 (_1!4564 lt!152740)) (tuple2!8621 (_2!4578 lt!153157) (_1!4578 lt!153157)))))

(declare-fun bs!7931 () Bool)

(assert (= bs!7931 d!32308))

(declare-fun m!152693 () Bool)

(assert (=> bs!7931 m!152693))

(assert (=> b!104234 d!32308))

(declare-fun d!32310 () Bool)

(assert (=> d!32310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305)) lt!152739) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305))) lt!152739))))

(declare-fun bs!7932 () Bool)

(assert (= bs!7932 d!32310))

(declare-fun m!152695 () Bool)

(assert (=> bs!7932 m!152695))

(assert (=> b!104234 d!32310))

(declare-fun d!32312 () Bool)

(declare-fun lt!153158 () tuple2!8646)

(assert (=> d!32312 (= lt!153158 (readBit!0 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305))))))

(assert (=> d!32312 (= (readBitPure!0 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305))) (tuple2!8621 (_2!4578 lt!153158) (_1!4578 lt!153158)))))

(declare-fun bs!7933 () Bool)

(assert (= bs!7933 d!32312))

(declare-fun m!152697 () Bool)

(assert (=> bs!7933 m!152697))

(assert (=> b!104234 d!32312))

(declare-fun b!104540 () Bool)

(declare-fun e!68469 () tuple2!8614)

(declare-fun lt!153668 () tuple2!8614)

(declare-fun Unit!6401 () Unit!6386)

(assert (=> b!104540 (= e!68469 (tuple2!8615 Unit!6401 (_2!4562 lt!153668)))))

(declare-fun lt!153692 () Bool)

(assert (=> b!104540 (= lt!153692 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!153686 () tuple2!8614)

(assert (=> b!104540 (= lt!153686 (appendBit!0 (_2!4562 lt!152731) lt!153692))))

(declare-fun res!86072 () Bool)

(assert (=> b!104540 (= res!86072 (= (size!2221 (buf!2587 (_2!4562 lt!152731))) (size!2221 (buf!2587 (_2!4562 lt!153686)))))))

(declare-fun e!68472 () Bool)

(assert (=> b!104540 (=> (not res!86072) (not e!68472))))

(assert (=> b!104540 e!68472))

(declare-fun lt!153681 () tuple2!8614)

(assert (=> b!104540 (= lt!153681 lt!153686)))

(assert (=> b!104540 (= lt!153668 (appendNLeastSignificantBitsLoop!0 (_2!4562 lt!153681) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!153662 () Unit!6386)

(assert (=> b!104540 (= lt!153662 (lemmaIsPrefixTransitive!0 (_2!4562 lt!152731) (_2!4562 lt!153681) (_2!4562 lt!153668)))))

(declare-fun call!1300 () Bool)

(assert (=> b!104540 call!1300))

(declare-fun lt!153655 () Unit!6386)

(assert (=> b!104540 (= lt!153655 lt!153662)))

(assert (=> b!104540 (invariant!0 (currentBit!5067 (_2!4562 lt!152731)) (currentByte!5072 (_2!4562 lt!152731)) (size!2221 (buf!2587 (_2!4562 lt!153681))))))

(declare-fun lt!153675 () BitStream!3916)

(assert (=> b!104540 (= lt!153675 (BitStream!3917 (buf!2587 (_2!4562 lt!153681)) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))))))

(assert (=> b!104540 (invariant!0 (currentBit!5067 lt!153675) (currentByte!5072 lt!153675) (size!2221 (buf!2587 (_2!4562 lt!153668))))))

(declare-fun lt!153664 () BitStream!3916)

(assert (=> b!104540 (= lt!153664 (BitStream!3917 (buf!2587 (_2!4562 lt!153668)) (currentByte!5072 lt!153675) (currentBit!5067 lt!153675)))))

(declare-fun lt!153685 () tuple2!8620)

(assert (=> b!104540 (= lt!153685 (readBitPure!0 lt!153675))))

(declare-fun lt!153671 () tuple2!8620)

(assert (=> b!104540 (= lt!153671 (readBitPure!0 lt!153664))))

(declare-fun lt!153674 () Unit!6386)

(assert (=> b!104540 (= lt!153674 (readBitPrefixLemma!0 lt!153675 (_2!4562 lt!153668)))))

(declare-fun res!86064 () Bool)

(assert (=> b!104540 (= res!86064 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!153685))) (currentByte!5072 (_1!4565 lt!153685)) (currentBit!5067 (_1!4565 lt!153685))) (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!153671))) (currentByte!5072 (_1!4565 lt!153671)) (currentBit!5067 (_1!4565 lt!153671)))))))

(declare-fun e!68468 () Bool)

(assert (=> b!104540 (=> (not res!86064) (not e!68468))))

(assert (=> b!104540 e!68468))

(declare-fun lt!153666 () Unit!6386)

(assert (=> b!104540 (= lt!153666 lt!153674)))

(declare-fun lt!153672 () tuple2!8618)

(assert (=> b!104540 (= lt!153672 (reader!0 (_2!4562 lt!152731) (_2!4562 lt!153668)))))

(declare-fun lt!153693 () tuple2!8618)

(assert (=> b!104540 (= lt!153693 (reader!0 (_2!4562 lt!153681) (_2!4562 lt!153668)))))

(declare-fun lt!153679 () tuple2!8620)

(assert (=> b!104540 (= lt!153679 (readBitPure!0 (_1!4564 lt!153672)))))

(assert (=> b!104540 (= (_2!4565 lt!153679) lt!153692)))

(declare-fun lt!153652 () Unit!6386)

(declare-fun Unit!6403 () Unit!6386)

(assert (=> b!104540 (= lt!153652 Unit!6403)))

(declare-fun lt!153651 () (_ BitVec 64))

(assert (=> b!104540 (= lt!153651 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!153680 () (_ BitVec 64))

(assert (=> b!104540 (= lt!153680 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!153656 () Unit!6386)

(assert (=> b!104540 (= lt!153656 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4562 lt!152731) (buf!2587 (_2!4562 lt!153668)) lt!153680))))

(assert (=> b!104540 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!153668)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731))) lt!153680)))

(declare-fun lt!153653 () Unit!6386)

(assert (=> b!104540 (= lt!153653 lt!153656)))

(declare-fun lt!153661 () tuple2!8616)

(assert (=> b!104540 (= lt!153661 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!153672) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153651))))

(declare-fun lt!153676 () (_ BitVec 64))

(assert (=> b!104540 (= lt!153676 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!153659 () Unit!6386)

(assert (=> b!104540 (= lt!153659 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4562 lt!153681) (buf!2587 (_2!4562 lt!153668)) lt!153676))))

(assert (=> b!104540 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!153668)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!153681))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!153681))) lt!153676)))

(declare-fun lt!153683 () Unit!6386)

(assert (=> b!104540 (= lt!153683 lt!153659)))

(declare-fun lt!153678 () tuple2!8616)

(assert (=> b!104540 (= lt!153678 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!153693) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153651 (ite (_2!4565 lt!153679) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!153660 () tuple2!8616)

(assert (=> b!104540 (= lt!153660 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!153672) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153651))))

(declare-fun c!6444 () Bool)

(assert (=> b!104540 (= c!6444 (_2!4565 (readBitPure!0 (_1!4564 lt!153672))))))

(declare-fun lt!153688 () tuple2!8616)

(declare-fun e!68473 () (_ BitVec 64))

(assert (=> b!104540 (= lt!153688 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4564 lt!153672) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153651 e!68473)))))

(declare-fun lt!153687 () Unit!6386)

(assert (=> b!104540 (= lt!153687 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4564 lt!153672) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153651))))

(assert (=> b!104540 (and (= (_2!4563 lt!153660) (_2!4563 lt!153688)) (= (_1!4563 lt!153660) (_1!4563 lt!153688)))))

(declare-fun lt!153690 () Unit!6386)

(assert (=> b!104540 (= lt!153690 lt!153687)))

(assert (=> b!104540 (= (_1!4564 lt!153672) (withMovedBitIndex!0 (_2!4564 lt!153672) (bvsub (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))) (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153668))) (currentByte!5072 (_2!4562 lt!153668)) (currentBit!5067 (_2!4562 lt!153668))))))))

(declare-fun lt!153677 () Unit!6386)

(declare-fun Unit!6405 () Unit!6386)

(assert (=> b!104540 (= lt!153677 Unit!6405)))

(assert (=> b!104540 (= (_1!4564 lt!153693) (withMovedBitIndex!0 (_2!4564 lt!153693) (bvsub (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153681))) (currentByte!5072 (_2!4562 lt!153681)) (currentBit!5067 (_2!4562 lt!153681))) (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153668))) (currentByte!5072 (_2!4562 lt!153668)) (currentBit!5067 (_2!4562 lt!153668))))))))

(declare-fun lt!153689 () Unit!6386)

(declare-fun Unit!6406 () Unit!6386)

(assert (=> b!104540 (= lt!153689 Unit!6406)))

(assert (=> b!104540 (= (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))) (bvsub (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153681))) (currentByte!5072 (_2!4562 lt!153681)) (currentBit!5067 (_2!4562 lt!153681))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!153654 () Unit!6386)

(declare-fun Unit!6407 () Unit!6386)

(assert (=> b!104540 (= lt!153654 Unit!6407)))

(assert (=> b!104540 (= (_2!4563 lt!153661) (_2!4563 lt!153678))))

(declare-fun lt!153665 () Unit!6386)

(declare-fun Unit!6408 () Unit!6386)

(assert (=> b!104540 (= lt!153665 Unit!6408)))

(assert (=> b!104540 (= (_1!4563 lt!153661) (_2!4564 lt!153672))))

(declare-fun b!104541 () Bool)

(declare-fun e!68467 () Bool)

(declare-fun lt!153658 () (_ BitVec 64))

(assert (=> b!104541 (= e!68467 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152731)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731))) lt!153658))))

(declare-fun bm!1297 () Bool)

(declare-fun lt!153669 () BitStream!3916)

(declare-fun c!6445 () Bool)

(assert (=> bm!1297 (= call!1300 (isPrefixOf!0 (ite c!6445 (_2!4562 lt!152731) lt!153669) (ite c!6445 (_2!4562 lt!153668) lt!153669)))))

(declare-fun b!104542 () Bool)

(assert (=> b!104542 (= e!68473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!104543 () Bool)

(declare-fun res!86068 () Bool)

(assert (=> b!104543 (= res!86068 (= (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153686))) (currentByte!5072 (_2!4562 lt!153686)) (currentBit!5067 (_2!4562 lt!153686))) (bvadd (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!104543 (=> (not res!86068) (not e!68472))))

(declare-fun b!104544 () Bool)

(declare-fun lt!153657 () tuple2!8620)

(assert (=> b!104544 (= lt!153657 (readBitPure!0 (readerFrom!0 (_2!4562 lt!153686) (currentBit!5067 (_2!4562 lt!152731)) (currentByte!5072 (_2!4562 lt!152731)))))))

(declare-fun res!86070 () Bool)

(assert (=> b!104544 (= res!86070 (and (= (_2!4565 lt!153657) lt!153692) (= (_1!4565 lt!153657) (_2!4562 lt!153686))))))

(declare-fun e!68471 () Bool)

(assert (=> b!104544 (=> (not res!86070) (not e!68471))))

(assert (=> b!104544 (= e!68472 e!68471)))

(declare-fun b!104545 () Bool)

(assert (=> b!104545 (= e!68468 (= (_2!4565 lt!153685) (_2!4565 lt!153671)))))

(declare-fun b!104547 () Bool)

(assert (=> b!104547 (= e!68473 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!104548 () Bool)

(assert (=> b!104548 (= e!68471 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!153657))) (currentByte!5072 (_1!4565 lt!153657)) (currentBit!5067 (_1!4565 lt!153657))) (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153686))) (currentByte!5072 (_2!4562 lt!153686)) (currentBit!5067 (_2!4562 lt!153686)))))))

(declare-fun lt!153650 () tuple2!8616)

(declare-fun e!68470 () Bool)

(declare-fun lt!153682 () tuple2!8618)

(declare-fun b!104549 () Bool)

(assert (=> b!104549 (= e!68470 (and (= (_2!4563 lt!153650) v!199) (= (_1!4563 lt!153650) (_2!4564 lt!153682))))))

(declare-fun lt!153667 () (_ BitVec 64))

(assert (=> b!104549 (= lt!153650 (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!153682) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153667))))

(declare-fun lt!153684 () Unit!6386)

(declare-fun lt!153670 () Unit!6386)

(assert (=> b!104549 (= lt!153684 lt!153670)))

(declare-fun lt!153673 () tuple2!8614)

(assert (=> b!104549 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!153673)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731))) lt!153658)))

(assert (=> b!104549 (= lt!153670 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4562 lt!152731) (buf!2587 (_2!4562 lt!153673)) lt!153658))))

(assert (=> b!104549 e!68467))

(declare-fun res!86067 () Bool)

(assert (=> b!104549 (=> (not res!86067) (not e!68467))))

(assert (=> b!104549 (= res!86067 (and (= (size!2221 (buf!2587 (_2!4562 lt!152731))) (size!2221 (buf!2587 (_2!4562 lt!153673)))) (bvsge lt!153658 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104549 (= lt!153658 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104549 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104549 (= lt!153667 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!104549 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104549 (= lt!153682 (reader!0 (_2!4562 lt!152731) (_2!4562 lt!153673)))))

(declare-fun b!104550 () Bool)

(declare-fun res!86065 () Bool)

(assert (=> b!104550 (=> (not res!86065) (not e!68470))))

(assert (=> b!104550 (= res!86065 (isPrefixOf!0 (_2!4562 lt!152731) (_2!4562 lt!153673)))))

(declare-fun b!104551 () Bool)

(declare-fun res!86066 () Bool)

(assert (=> b!104551 (= res!86066 (isPrefixOf!0 (_2!4562 lt!152731) (_2!4562 lt!153686)))))

(assert (=> b!104551 (=> (not res!86066) (not e!68472))))

(declare-fun b!104552 () Bool)

(declare-fun lt!153663 () Unit!6386)

(assert (=> b!104552 (= e!68469 (tuple2!8615 lt!153663 (_2!4562 lt!152731)))))

(assert (=> b!104552 (= lt!153669 (_2!4562 lt!152731))))

(assert (=> b!104552 (= lt!153663 (lemmaIsPrefixRefl!0 lt!153669))))

(assert (=> b!104552 call!1300))

(declare-fun d!32314 () Bool)

(assert (=> d!32314 e!68470))

(declare-fun res!86071 () Bool)

(assert (=> d!32314 (=> (not res!86071) (not e!68470))))

(assert (=> d!32314 (= res!86071 (= (size!2221 (buf!2587 (_2!4562 lt!152731))) (size!2221 (buf!2587 (_2!4562 lt!153673)))))))

(assert (=> d!32314 (= lt!153673 e!68469)))

(assert (=> d!32314 (= c!6445 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32314 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32314 (= (appendNLeastSignificantBitsLoop!0 (_2!4562 lt!152731) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!153673)))

(declare-fun b!104546 () Bool)

(declare-fun res!86069 () Bool)

(assert (=> b!104546 (=> (not res!86069) (not e!68470))))

(declare-fun lt!153691 () (_ BitVec 64))

(declare-fun lt!153694 () (_ BitVec 64))

(assert (=> b!104546 (= res!86069 (= (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153673))) (currentByte!5072 (_2!4562 lt!153673)) (currentBit!5067 (_2!4562 lt!153673))) (bvadd lt!153691 lt!153694)))))

(assert (=> b!104546 (or (not (= (bvand lt!153691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153694 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153691 lt!153694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104546 (= lt!153694 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104546 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104546 (= lt!153691 (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))))))

(assert (= (and d!32314 c!6445) b!104540))

(assert (= (and d!32314 (not c!6445)) b!104552))

(assert (= (and b!104540 res!86072) b!104543))

(assert (= (and b!104543 res!86068) b!104551))

(assert (= (and b!104551 res!86066) b!104544))

(assert (= (and b!104544 res!86070) b!104548))

(assert (= (and b!104540 res!86064) b!104545))

(assert (= (and b!104540 c!6444) b!104547))

(assert (= (and b!104540 (not c!6444)) b!104542))

(assert (= (or b!104540 b!104552) bm!1297))

(assert (= (and d!32314 res!86071) b!104546))

(assert (= (and b!104546 res!86069) b!104550))

(assert (= (and b!104550 res!86065) b!104549))

(assert (= (and b!104549 res!86067) b!104541))

(declare-fun m!152981 () Bool)

(assert (=> b!104546 m!152981))

(assert (=> b!104546 m!152373))

(declare-fun m!152983 () Bool)

(assert (=> bm!1297 m!152983))

(declare-fun m!152985 () Bool)

(assert (=> b!104543 m!152985))

(assert (=> b!104543 m!152373))

(declare-fun m!152987 () Bool)

(assert (=> b!104540 m!152987))

(declare-fun m!152989 () Bool)

(assert (=> b!104540 m!152989))

(declare-fun m!152991 () Bool)

(assert (=> b!104540 m!152991))

(declare-fun m!152993 () Bool)

(assert (=> b!104540 m!152993))

(declare-fun m!152995 () Bool)

(assert (=> b!104540 m!152995))

(declare-fun m!152997 () Bool)

(assert (=> b!104540 m!152997))

(declare-fun m!152999 () Bool)

(assert (=> b!104540 m!152999))

(declare-fun m!153001 () Bool)

(assert (=> b!104540 m!153001))

(declare-fun m!153003 () Bool)

(assert (=> b!104540 m!153003))

(declare-fun m!153005 () Bool)

(assert (=> b!104540 m!153005))

(declare-fun m!153007 () Bool)

(assert (=> b!104540 m!153007))

(declare-fun m!153009 () Bool)

(assert (=> b!104540 m!153009))

(declare-fun m!153011 () Bool)

(assert (=> b!104540 m!153011))

(declare-fun m!153013 () Bool)

(assert (=> b!104540 m!153013))

(declare-fun m!153015 () Bool)

(assert (=> b!104540 m!153015))

(declare-fun m!153017 () Bool)

(assert (=> b!104540 m!153017))

(declare-fun m!153021 () Bool)

(assert (=> b!104540 m!153021))

(declare-fun m!153023 () Bool)

(assert (=> b!104540 m!153023))

(declare-fun m!153025 () Bool)

(assert (=> b!104540 m!153025))

(declare-fun m!153027 () Bool)

(assert (=> b!104540 m!153027))

(declare-fun m!153029 () Bool)

(assert (=> b!104540 m!153029))

(declare-fun m!153031 () Bool)

(assert (=> b!104540 m!153031))

(assert (=> b!104540 m!153011))

(declare-fun m!153033 () Bool)

(assert (=> b!104540 m!153033))

(declare-fun m!153035 () Bool)

(assert (=> b!104540 m!153035))

(declare-fun m!153037 () Bool)

(assert (=> b!104540 m!153037))

(assert (=> b!104540 m!152373))

(declare-fun m!153039 () Bool)

(assert (=> b!104540 m!153039))

(declare-fun m!153041 () Bool)

(assert (=> b!104540 m!153041))

(declare-fun m!153043 () Bool)

(assert (=> b!104548 m!153043))

(assert (=> b!104548 m!152985))

(declare-fun m!153049 () Bool)

(assert (=> b!104550 m!153049))

(declare-fun m!153051 () Bool)

(assert (=> b!104549 m!153051))

(declare-fun m!153053 () Bool)

(assert (=> b!104549 m!153053))

(assert (=> b!104549 m!153035))

(declare-fun m!153055 () Bool)

(assert (=> b!104549 m!153055))

(declare-fun m!153057 () Bool)

(assert (=> b!104549 m!153057))

(declare-fun m!153059 () Bool)

(assert (=> b!104544 m!153059))

(assert (=> b!104544 m!153059))

(declare-fun m!153061 () Bool)

(assert (=> b!104544 m!153061))

(declare-fun m!153063 () Bool)

(assert (=> b!104551 m!153063))

(declare-fun m!153067 () Bool)

(assert (=> b!104552 m!153067))

(declare-fun m!153069 () Bool)

(assert (=> b!104541 m!153069))

(assert (=> b!104234 d!32314))

(declare-fun d!32354 () Bool)

(declare-fun lt!153717 () tuple2!8640)

(assert (=> d!32354 (= lt!153717 (readNLeastSignificantBitsLoop!0 (_1!4564 lt!152738) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152751))))

(assert (=> d!32354 (= (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!152738) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152751) (tuple2!8617 (_2!4575 lt!153717) (_1!4575 lt!153717)))))

(declare-fun bs!7943 () Bool)

(assert (= bs!7943 d!32354))

(declare-fun m!153071 () Bool)

(assert (=> bs!7943 m!153071))

(assert (=> b!104234 d!32354))

(declare-fun d!32356 () Bool)

(assert (=> d!32356 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731))) lt!152753)))

(declare-fun lt!153730 () Unit!6386)

(declare-fun choose!9 (BitStream!3916 array!4866 (_ BitVec 64) BitStream!3916) Unit!6386)

(assert (=> d!32356 (= lt!153730 (choose!9 (_2!4562 lt!152731) (buf!2587 (_2!4562 lt!152744)) lt!152753 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731)))))))

(assert (=> d!32356 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4562 lt!152731) (buf!2587 (_2!4562 lt!152744)) lt!152753) lt!153730)))

(declare-fun bs!7949 () Bool)

(assert (= bs!7949 d!32356))

(assert (=> bs!7949 m!152351))

(declare-fun m!153087 () Bool)

(assert (=> bs!7949 m!153087))

(assert (=> b!104234 d!32356))

(declare-fun d!32370 () Bool)

(assert (=> d!32370 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!104234 d!32370))

(declare-fun d!32372 () Bool)

(assert (=> d!32372 (isPrefixOf!0 thiss!1305 (_2!4562 lt!152744))))

(declare-fun lt!153745 () Unit!6386)

(declare-fun choose!30 (BitStream!3916 BitStream!3916 BitStream!3916) Unit!6386)

(assert (=> d!32372 (= lt!153745 (choose!30 thiss!1305 (_2!4562 lt!152731) (_2!4562 lt!152744)))))

(assert (=> d!32372 (isPrefixOf!0 thiss!1305 (_2!4562 lt!152731))))

(assert (=> d!32372 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4562 lt!152731) (_2!4562 lt!152744)) lt!153745)))

(declare-fun bs!7951 () Bool)

(assert (= bs!7951 d!32372))

(assert (=> bs!7951 m!152329))

(declare-fun m!153102 () Bool)

(assert (=> bs!7951 m!153102))

(assert (=> bs!7951 m!152369))

(assert (=> b!104234 d!32372))

(declare-fun d!32386 () Bool)

(declare-fun lt!153747 () tuple2!8640)

(assert (=> d!32386 (= lt!153747 (readNLeastSignificantBitsLoop!0 (_1!4564 lt!152740) nBits!396 i!615 lt!152745))))

(assert (=> d!32386 (= (readNLeastSignificantBitsLoopPure!0 (_1!4564 lt!152740) nBits!396 i!615 lt!152745) (tuple2!8617 (_2!4575 lt!153747) (_1!4575 lt!153747)))))

(declare-fun bs!7953 () Bool)

(assert (= bs!7953 d!32386))

(declare-fun m!153105 () Bool)

(assert (=> bs!7953 m!153105))

(assert (=> b!104234 d!32386))

(declare-fun b!104599 () Bool)

(declare-fun res!86121 () Bool)

(declare-fun e!68503 () Bool)

(assert (=> b!104599 (=> (not res!86121) (not e!68503))))

(declare-fun lt!153782 () tuple2!8614)

(declare-fun lt!153785 () (_ BitVec 64))

(declare-fun lt!153783 () (_ BitVec 64))

(assert (=> b!104599 (= res!86121 (= (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153782))) (currentByte!5072 (_2!4562 lt!153782)) (currentBit!5067 (_2!4562 lt!153782))) (bvadd lt!153783 lt!153785)))))

(assert (=> b!104599 (or (not (= (bvand lt!153783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153785 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153783 lt!153785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104599 (= lt!153785 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104599 (= lt!153783 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(declare-fun d!32388 () Bool)

(assert (=> d!32388 e!68503))

(declare-fun res!86123 () Bool)

(assert (=> d!32388 (=> (not res!86123) (not e!68503))))

(assert (=> d!32388 (= res!86123 (= (size!2221 (buf!2587 thiss!1305)) (size!2221 (buf!2587 (_2!4562 lt!153782)))))))

(declare-fun choose!16 (BitStream!3916 Bool) tuple2!8614)

(assert (=> d!32388 (= lt!153782 (choose!16 thiss!1305 lt!152754))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32388 (validate_offset_bit!0 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305)))))

(assert (=> d!32388 (= (appendBit!0 thiss!1305 lt!152754) lt!153782)))

(declare-fun b!104602 () Bool)

(declare-fun e!68504 () Bool)

(declare-fun lt!153784 () tuple2!8620)

(assert (=> b!104602 (= e!68504 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!153784))) (currentByte!5072 (_1!4565 lt!153784)) (currentBit!5067 (_1!4565 lt!153784))) (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!153782))) (currentByte!5072 (_2!4562 lt!153782)) (currentBit!5067 (_2!4562 lt!153782)))))))

(declare-fun b!104601 () Bool)

(assert (=> b!104601 (= e!68503 e!68504)))

(declare-fun res!86120 () Bool)

(assert (=> b!104601 (=> (not res!86120) (not e!68504))))

(assert (=> b!104601 (= res!86120 (and (= (_2!4565 lt!153784) lt!152754) (= (_1!4565 lt!153784) (_2!4562 lt!153782))))))

(assert (=> b!104601 (= lt!153784 (readBitPure!0 (readerFrom!0 (_2!4562 lt!153782) (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305))))))

(declare-fun b!104600 () Bool)

(declare-fun res!86122 () Bool)

(assert (=> b!104600 (=> (not res!86122) (not e!68503))))

(assert (=> b!104600 (= res!86122 (isPrefixOf!0 thiss!1305 (_2!4562 lt!153782)))))

(assert (= (and d!32388 res!86123) b!104599))

(assert (= (and b!104599 res!86121) b!104600))

(assert (= (and b!104600 res!86122) b!104601))

(assert (= (and b!104601 res!86120) b!104602))

(declare-fun m!153125 () Bool)

(assert (=> b!104599 m!153125))

(assert (=> b!104599 m!152375))

(declare-fun m!153127 () Bool)

(assert (=> b!104600 m!153127))

(declare-fun m!153129 () Bool)

(assert (=> d!32388 m!153129))

(declare-fun m!153131 () Bool)

(assert (=> d!32388 m!153131))

(declare-fun m!153133 () Bool)

(assert (=> b!104602 m!153133))

(assert (=> b!104602 m!153125))

(declare-fun m!153135 () Bool)

(assert (=> b!104601 m!153135))

(assert (=> b!104601 m!153135))

(declare-fun m!153137 () Bool)

(assert (=> b!104601 m!153137))

(assert (=> b!104234 d!32388))

(declare-fun d!32414 () Bool)

(declare-fun e!68505 () Bool)

(assert (=> d!32414 e!68505))

(declare-fun res!86124 () Bool)

(assert (=> d!32414 (=> (not res!86124) (not e!68505))))

(declare-fun lt!153788 () (_ BitVec 64))

(declare-fun lt!153786 () (_ BitVec 64))

(declare-fun lt!153791 () (_ BitVec 64))

(assert (=> d!32414 (= res!86124 (= lt!153791 (bvsub lt!153786 lt!153788)))))

(assert (=> d!32414 (or (= (bvand lt!153786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153788 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153786 lt!153788) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32414 (= lt!153788 (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152737)))) ((_ sign_extend 32) (currentByte!5072 (_1!4565 lt!152737))) ((_ sign_extend 32) (currentBit!5067 (_1!4565 lt!152737)))))))

(declare-fun lt!153787 () (_ BitVec 64))

(declare-fun lt!153789 () (_ BitVec 64))

(assert (=> d!32414 (= lt!153786 (bvmul lt!153787 lt!153789))))

(assert (=> d!32414 (or (= lt!153787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153789 (bvsdiv (bvmul lt!153787 lt!153789) lt!153787)))))

(assert (=> d!32414 (= lt!153789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32414 (= lt!153787 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152737)))))))

(assert (=> d!32414 (= lt!153791 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5072 (_1!4565 lt!152737))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5067 (_1!4565 lt!152737)))))))

(assert (=> d!32414 (invariant!0 (currentBit!5067 (_1!4565 lt!152737)) (currentByte!5072 (_1!4565 lt!152737)) (size!2221 (buf!2587 (_1!4565 lt!152737))))))

(assert (=> d!32414 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!152737))) (currentByte!5072 (_1!4565 lt!152737)) (currentBit!5067 (_1!4565 lt!152737))) lt!153791)))

(declare-fun b!104603 () Bool)

(declare-fun res!86125 () Bool)

(assert (=> b!104603 (=> (not res!86125) (not e!68505))))

(assert (=> b!104603 (= res!86125 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153791))))

(declare-fun b!104604 () Bool)

(declare-fun lt!153790 () (_ BitVec 64))

(assert (=> b!104604 (= e!68505 (bvsle lt!153791 (bvmul lt!153790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104604 (or (= lt!153790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153790)))))

(assert (=> b!104604 (= lt!153790 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152737)))))))

(assert (= (and d!32414 res!86124) b!104603))

(assert (= (and b!104603 res!86125) b!104604))

(declare-fun m!153139 () Bool)

(assert (=> d!32414 m!153139))

(declare-fun m!153141 () Bool)

(assert (=> d!32414 m!153141))

(assert (=> b!104234 d!32414))

(declare-fun d!32416 () Bool)

(declare-fun lt!153792 () tuple2!8646)

(assert (=> d!32416 (= lt!153792 (readBit!0 lt!152747))))

(assert (=> d!32416 (= (readBitPure!0 lt!152747) (tuple2!8621 (_2!4578 lt!153792) (_1!4578 lt!153792)))))

(declare-fun bs!7959 () Bool)

(assert (= bs!7959 d!32416))

(declare-fun m!153143 () Bool)

(assert (=> bs!7959 m!153143))

(assert (=> b!104234 d!32416))

(declare-fun d!32418 () Bool)

(declare-fun e!68507 () Bool)

(assert (=> d!32418 e!68507))

(declare-fun res!86127 () Bool)

(assert (=> d!32418 (=> (not res!86127) (not e!68507))))

(declare-fun lt!153803 () tuple2!8618)

(assert (=> d!32418 (= res!86127 (isPrefixOf!0 (_1!4564 lt!153803) (_2!4564 lt!153803)))))

(declare-fun lt!153798 () BitStream!3916)

(assert (=> d!32418 (= lt!153803 (tuple2!8619 lt!153798 (_2!4562 lt!152744)))))

(declare-fun lt!153800 () Unit!6386)

(declare-fun lt!153804 () Unit!6386)

(assert (=> d!32418 (= lt!153800 lt!153804)))

(assert (=> d!32418 (isPrefixOf!0 lt!153798 (_2!4562 lt!152744))))

(assert (=> d!32418 (= lt!153804 (lemmaIsPrefixTransitive!0 lt!153798 (_2!4562 lt!152744) (_2!4562 lt!152744)))))

(declare-fun lt!153808 () Unit!6386)

(declare-fun lt!153797 () Unit!6386)

(assert (=> d!32418 (= lt!153808 lt!153797)))

(assert (=> d!32418 (isPrefixOf!0 lt!153798 (_2!4562 lt!152744))))

(assert (=> d!32418 (= lt!153797 (lemmaIsPrefixTransitive!0 lt!153798 thiss!1305 (_2!4562 lt!152744)))))

(declare-fun lt!153811 () Unit!6386)

(declare-fun e!68506 () Unit!6386)

(assert (=> d!32418 (= lt!153811 e!68506)))

(declare-fun c!6446 () Bool)

(assert (=> d!32418 (= c!6446 (not (= (size!2221 (buf!2587 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!153796 () Unit!6386)

(declare-fun lt!153810 () Unit!6386)

(assert (=> d!32418 (= lt!153796 lt!153810)))

(assert (=> d!32418 (isPrefixOf!0 (_2!4562 lt!152744) (_2!4562 lt!152744))))

(assert (=> d!32418 (= lt!153810 (lemmaIsPrefixRefl!0 (_2!4562 lt!152744)))))

(declare-fun lt!153794 () Unit!6386)

(declare-fun lt!153799 () Unit!6386)

(assert (=> d!32418 (= lt!153794 lt!153799)))

(assert (=> d!32418 (= lt!153799 (lemmaIsPrefixRefl!0 (_2!4562 lt!152744)))))

(declare-fun lt!153812 () Unit!6386)

(declare-fun lt!153801 () Unit!6386)

(assert (=> d!32418 (= lt!153812 lt!153801)))

(assert (=> d!32418 (isPrefixOf!0 lt!153798 lt!153798)))

(assert (=> d!32418 (= lt!153801 (lemmaIsPrefixRefl!0 lt!153798))))

(declare-fun lt!153809 () Unit!6386)

(declare-fun lt!153806 () Unit!6386)

(assert (=> d!32418 (= lt!153809 lt!153806)))

(assert (=> d!32418 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32418 (= lt!153806 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32418 (= lt!153798 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(assert (=> d!32418 (isPrefixOf!0 thiss!1305 (_2!4562 lt!152744))))

(assert (=> d!32418 (= (reader!0 thiss!1305 (_2!4562 lt!152744)) lt!153803)))

(declare-fun b!104605 () Bool)

(declare-fun res!86126 () Bool)

(assert (=> b!104605 (=> (not res!86126) (not e!68507))))

(assert (=> b!104605 (= res!86126 (isPrefixOf!0 (_2!4564 lt!153803) (_2!4562 lt!152744)))))

(declare-fun b!104606 () Bool)

(declare-fun lt!153795 () Unit!6386)

(assert (=> b!104606 (= e!68506 lt!153795)))

(declare-fun lt!153802 () (_ BitVec 64))

(assert (=> b!104606 (= lt!153802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!153805 () (_ BitVec 64))

(assert (=> b!104606 (= lt!153805 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(assert (=> b!104606 (= lt!153795 (arrayBitRangesEqSymmetric!0 (buf!2587 thiss!1305) (buf!2587 (_2!4562 lt!152744)) lt!153802 lt!153805))))

(assert (=> b!104606 (arrayBitRangesEq!0 (buf!2587 (_2!4562 lt!152744)) (buf!2587 thiss!1305) lt!153802 lt!153805)))

(declare-fun b!104607 () Bool)

(declare-fun res!86128 () Bool)

(assert (=> b!104607 (=> (not res!86128) (not e!68507))))

(assert (=> b!104607 (= res!86128 (isPrefixOf!0 (_1!4564 lt!153803) thiss!1305))))

(declare-fun b!104608 () Bool)

(declare-fun lt!153793 () (_ BitVec 64))

(declare-fun lt!153807 () (_ BitVec 64))

(assert (=> b!104608 (= e!68507 (= (_1!4564 lt!153803) (withMovedBitIndex!0 (_2!4564 lt!153803) (bvsub lt!153793 lt!153807))))))

(assert (=> b!104608 (or (= (bvand lt!153793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153793 lt!153807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104608 (= lt!153807 (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152744))) (currentByte!5072 (_2!4562 lt!152744)) (currentBit!5067 (_2!4562 lt!152744))))))

(assert (=> b!104608 (= lt!153793 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(declare-fun b!104609 () Bool)

(declare-fun Unit!6415 () Unit!6386)

(assert (=> b!104609 (= e!68506 Unit!6415)))

(assert (= (and d!32418 c!6446) b!104606))

(assert (= (and d!32418 (not c!6446)) b!104609))

(assert (= (and d!32418 res!86127) b!104607))

(assert (= (and b!104607 res!86128) b!104605))

(assert (= (and b!104605 res!86126) b!104608))

(declare-fun m!153145 () Bool)

(assert (=> b!104608 m!153145))

(assert (=> b!104608 m!152641))

(assert (=> b!104608 m!152375))

(assert (=> d!32418 m!152329))

(declare-fun m!153147 () Bool)

(assert (=> d!32418 m!153147))

(declare-fun m!153149 () Bool)

(assert (=> d!32418 m!153149))

(assert (=> d!32418 m!152669))

(declare-fun m!153151 () Bool)

(assert (=> d!32418 m!153151))

(declare-fun m!153153 () Bool)

(assert (=> d!32418 m!153153))

(assert (=> d!32418 m!152675))

(declare-fun m!153155 () Bool)

(assert (=> d!32418 m!153155))

(declare-fun m!153157 () Bool)

(assert (=> d!32418 m!153157))

(declare-fun m!153159 () Bool)

(assert (=> d!32418 m!153159))

(declare-fun m!153161 () Bool)

(assert (=> d!32418 m!153161))

(declare-fun m!153163 () Bool)

(assert (=> b!104607 m!153163))

(assert (=> b!104606 m!152375))

(declare-fun m!153165 () Bool)

(assert (=> b!104606 m!153165))

(declare-fun m!153167 () Bool)

(assert (=> b!104606 m!153167))

(declare-fun m!153169 () Bool)

(assert (=> b!104605 m!153169))

(assert (=> b!104234 d!32418))

(declare-fun d!32420 () Bool)

(assert (=> d!32420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152744)))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305)) lt!152739)))

(declare-fun lt!153817 () Unit!6386)

(assert (=> d!32420 (= lt!153817 (choose!9 thiss!1305 (buf!2587 (_2!4562 lt!152744)) lt!152739 (BitStream!3917 (buf!2587 (_2!4562 lt!152744)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305))))))

(assert (=> d!32420 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2587 (_2!4562 lt!152744)) lt!152739) lt!153817)))

(declare-fun bs!7961 () Bool)

(assert (= bs!7961 d!32420))

(assert (=> bs!7961 m!152359))

(declare-fun m!153171 () Bool)

(assert (=> bs!7961 m!153171))

(assert (=> b!104234 d!32420))

(declare-fun d!32422 () Bool)

(declare-fun lt!153826 () tuple2!8646)

(assert (=> d!32422 (= lt!153826 (readBit!0 (readerFrom!0 (_2!4562 lt!152731) (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305))))))

(assert (=> d!32422 (= (readBitPure!0 (readerFrom!0 (_2!4562 lt!152731) (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305))) (tuple2!8621 (_2!4578 lt!153826) (_1!4578 lt!153826)))))

(declare-fun bs!7962 () Bool)

(assert (= bs!7962 d!32422))

(assert (=> bs!7962 m!152389))

(declare-fun m!153173 () Bool)

(assert (=> bs!7962 m!153173))

(assert (=> b!104233 d!32422))

(declare-fun d!32424 () Bool)

(declare-fun e!68512 () Bool)

(assert (=> d!32424 e!68512))

(declare-fun res!86134 () Bool)

(assert (=> d!32424 (=> (not res!86134) (not e!68512))))

(assert (=> d!32424 (= res!86134 (invariant!0 (currentBit!5067 (_2!4562 lt!152731)) (currentByte!5072 (_2!4562 lt!152731)) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(assert (=> d!32424 (= (readerFrom!0 (_2!4562 lt!152731) (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305)) (BitStream!3917 (buf!2587 (_2!4562 lt!152731)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)))))

(declare-fun b!104614 () Bool)

(assert (=> b!104614 (= e!68512 (invariant!0 (currentBit!5067 thiss!1305) (currentByte!5072 thiss!1305) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(assert (= (and d!32424 res!86134) b!104614))

(declare-fun m!153179 () Bool)

(assert (=> d!32424 m!153179))

(assert (=> b!104614 m!152367))

(assert (=> b!104233 d!32424))

(declare-fun d!32432 () Bool)

(declare-fun res!86138 () Bool)

(declare-fun e!68515 () Bool)

(assert (=> d!32432 (=> (not res!86138) (not e!68515))))

(assert (=> d!32432 (= res!86138 (= (size!2221 (buf!2587 thiss!1305)) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(assert (=> d!32432 (= (isPrefixOf!0 thiss!1305 (_2!4562 lt!152731)) e!68515)))

(declare-fun b!104618 () Bool)

(declare-fun res!86139 () Bool)

(assert (=> b!104618 (=> (not res!86139) (not e!68515))))

(assert (=> b!104618 (= res!86139 (bvsle (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305)) (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731)))))))

(declare-fun b!104619 () Bool)

(declare-fun e!68516 () Bool)

(assert (=> b!104619 (= e!68515 e!68516)))

(declare-fun res!86140 () Bool)

(assert (=> b!104619 (=> res!86140 e!68516)))

(assert (=> b!104619 (= res!86140 (= (size!2221 (buf!2587 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104620 () Bool)

(assert (=> b!104620 (= e!68516 (arrayBitRangesEq!0 (buf!2587 thiss!1305) (buf!2587 (_2!4562 lt!152731)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2221 (buf!2587 thiss!1305)) (currentByte!5072 thiss!1305) (currentBit!5067 thiss!1305))))))

(assert (= (and d!32432 res!86138) b!104618))

(assert (= (and b!104618 res!86139) b!104619))

(assert (= (and b!104619 (not res!86140)) b!104620))

(assert (=> b!104618 m!152375))

(assert (=> b!104618 m!152373))

(assert (=> b!104620 m!152375))

(assert (=> b!104620 m!152375))

(declare-fun m!153189 () Bool)

(assert (=> b!104620 m!153189))

(assert (=> b!104222 d!32432))

(declare-fun d!32436 () Bool)

(assert (=> d!32436 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!104232 d!32436))

(declare-fun d!32440 () Bool)

(declare-fun e!68520 () Bool)

(assert (=> d!32440 e!68520))

(declare-fun res!86146 () Bool)

(assert (=> d!32440 (=> (not res!86146) (not e!68520))))

(declare-fun lt!153856 () (_ BitVec 64))

(declare-fun lt!153853 () (_ BitVec 64))

(declare-fun lt!153851 () (_ BitVec 64))

(assert (=> d!32440 (= res!86146 (= lt!153856 (bvsub lt!153851 lt!153853)))))

(assert (=> d!32440 (or (= (bvand lt!153851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153851 lt!153853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32440 (= lt!153853 (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152731)))) ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731)))))))

(declare-fun lt!153852 () (_ BitVec 64))

(declare-fun lt!153854 () (_ BitVec 64))

(assert (=> d!32440 (= lt!153851 (bvmul lt!153852 lt!153854))))

(assert (=> d!32440 (or (= lt!153852 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153854 (bvsdiv (bvmul lt!153852 lt!153854) lt!153852)))))

(assert (=> d!32440 (= lt!153854 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32440 (= lt!153852 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(assert (=> d!32440 (= lt!153856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5072 (_2!4562 lt!152731))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5067 (_2!4562 lt!152731)))))))

(assert (=> d!32440 (invariant!0 (currentBit!5067 (_2!4562 lt!152731)) (currentByte!5072 (_2!4562 lt!152731)) (size!2221 (buf!2587 (_2!4562 lt!152731))))))

(assert (=> d!32440 (= (bitIndex!0 (size!2221 (buf!2587 (_2!4562 lt!152731))) (currentByte!5072 (_2!4562 lt!152731)) (currentBit!5067 (_2!4562 lt!152731))) lt!153856)))

(declare-fun b!104626 () Bool)

(declare-fun res!86147 () Bool)

(assert (=> b!104626 (=> (not res!86147) (not e!68520))))

(assert (=> b!104626 (= res!86147 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153856))))

(declare-fun b!104627 () Bool)

(declare-fun lt!153855 () (_ BitVec 64))

(assert (=> b!104627 (= e!68520 (bvsle lt!153856 (bvmul lt!153855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104627 (or (= lt!153855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153855)))))

(assert (=> b!104627 (= lt!153855 ((_ sign_extend 32) (size!2221 (buf!2587 (_2!4562 lt!152731)))))))

(assert (= (and d!32440 res!86146) b!104626))

(assert (= (and b!104626 res!86147) b!104627))

(declare-fun m!153197 () Bool)

(assert (=> d!32440 m!153197))

(assert (=> d!32440 m!153179))

(assert (=> b!104231 d!32440))

(assert (=> b!104231 d!32292))

(declare-fun d!32444 () Bool)

(assert (=> d!32444 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305)) lt!152739) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 thiss!1305))) ((_ sign_extend 32) (currentByte!5072 thiss!1305)) ((_ sign_extend 32) (currentBit!5067 thiss!1305))) lt!152739))))

(declare-fun bs!7964 () Bool)

(assert (= bs!7964 d!32444))

(assert (=> bs!7964 m!152637))

(assert (=> b!104229 d!32444))

(declare-fun d!32448 () Bool)

(declare-fun e!68521 () Bool)

(assert (=> d!32448 e!68521))

(declare-fun res!86148 () Bool)

(assert (=> d!32448 (=> (not res!86148) (not e!68521))))

(declare-fun lt!153857 () (_ BitVec 64))

(declare-fun lt!153859 () (_ BitVec 64))

(declare-fun lt!153862 () (_ BitVec 64))

(assert (=> d!32448 (= res!86148 (= lt!153862 (bvsub lt!153857 lt!153859)))))

(assert (=> d!32448 (or (= (bvand lt!153857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153857 lt!153859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32448 (= lt!153859 (remainingBits!0 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152741)))) ((_ sign_extend 32) (currentByte!5072 (_1!4565 lt!152741))) ((_ sign_extend 32) (currentBit!5067 (_1!4565 lt!152741)))))))

(declare-fun lt!153858 () (_ BitVec 64))

(declare-fun lt!153860 () (_ BitVec 64))

(assert (=> d!32448 (= lt!153857 (bvmul lt!153858 lt!153860))))

(assert (=> d!32448 (or (= lt!153858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153860 (bvsdiv (bvmul lt!153858 lt!153860) lt!153858)))))

(assert (=> d!32448 (= lt!153860 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32448 (= lt!153858 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152741)))))))

(assert (=> d!32448 (= lt!153862 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5072 (_1!4565 lt!152741))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5067 (_1!4565 lt!152741)))))))

(assert (=> d!32448 (invariant!0 (currentBit!5067 (_1!4565 lt!152741)) (currentByte!5072 (_1!4565 lt!152741)) (size!2221 (buf!2587 (_1!4565 lt!152741))))))

(assert (=> d!32448 (= (bitIndex!0 (size!2221 (buf!2587 (_1!4565 lt!152741))) (currentByte!5072 (_1!4565 lt!152741)) (currentBit!5067 (_1!4565 lt!152741))) lt!153862)))

(declare-fun b!104628 () Bool)

(declare-fun res!86149 () Bool)

(assert (=> b!104628 (=> (not res!86149) (not e!68521))))

(assert (=> b!104628 (= res!86149 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153862))))

(declare-fun b!104629 () Bool)

(declare-fun lt!153861 () (_ BitVec 64))

(assert (=> b!104629 (= e!68521 (bvsle lt!153862 (bvmul lt!153861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104629 (or (= lt!153861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153861)))))

(assert (=> b!104629 (= lt!153861 ((_ sign_extend 32) (size!2221 (buf!2587 (_1!4565 lt!152741)))))))

(assert (= (and d!32448 res!86148) b!104628))

(assert (= (and b!104628 res!86149) b!104629))

(declare-fun m!153201 () Bool)

(assert (=> d!32448 m!153201))

(declare-fun m!153203 () Bool)

(assert (=> d!32448 m!153203))

(assert (=> b!104228 d!32448))

(push 1)

(assert (not d!32296))

(assert (not b!104540))

(assert (not bm!1297))

(assert (not d!32312))

(assert (not d!32356))

(assert (not d!32302))

(assert (not d!32310))

(assert (not b!104605))

(assert (not b!104377))

(assert (not b!104376))

(assert (not b!104357))

(assert (not b!104359))

(assert (not b!104614))

(assert (not d!32420))

(assert (not b!104620))

(assert (not b!104544))

(assert (not b!104375))

(assert (not b!104600))

(assert (not d!32308))

(assert (not b!104550))

(assert (not b!104543))

(assert (not d!32444))

(assert (not d!32388))

(assert (not b!104378))

(assert (not d!32304))

(assert (not b!104607))

(assert (not b!104549))

(assert (not d!32424))

(assert (not b!104551))

(assert (not b!104601))

(assert (not d!32440))

(assert (not d!32306))

(assert (not b!104602))

(assert (not d!32386))

(assert (not b!104548))

(assert (not b!104546))

(assert (not d!32284))

(assert (not d!32300))

(assert (not d!32286))

(assert (not b!104608))

(assert (not b!104606))

(assert (not b!104618))

(assert (not d!32354))

(assert (not d!32416))

(assert (not d!32288))

(assert (not d!32292))

(assert (not b!104552))

(assert (not d!32414))

(assert (not d!32372))

(assert (not d!32418))

(assert (not b!104541))

(assert (not b!104599))

(assert (not d!32422))

(assert (not d!32448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

