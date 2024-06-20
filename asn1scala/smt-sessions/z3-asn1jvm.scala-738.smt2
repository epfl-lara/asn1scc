; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20598 () Bool)

(assert start!20598)

(declare-fun b!104023 () Bool)

(declare-fun e!68125 () Bool)

(declare-datatypes ((array!4856 0))(
  ( (array!4857 (arr!2809 (Array (_ BitVec 32) (_ BitVec 8))) (size!2216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3906 0))(
  ( (BitStream!3907 (buf!2582 array!4856) (currentByte!5067 (_ BitVec 32)) (currentBit!5062 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3906)

(declare-datatypes ((Unit!6376 0))(
  ( (Unit!6377) )
))
(declare-datatypes ((tuple2!8574 0))(
  ( (tuple2!8575 (_1!4542 Unit!6376) (_2!4542 BitStream!3906)) )
))
(declare-fun lt!152386 () tuple2!8574)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104023 (= e!68125 (invariant!0 (currentBit!5062 thiss!1305) (currentByte!5067 thiss!1305) (size!2216 (buf!2582 (_2!4542 lt!152386)))))))

(declare-fun b!104024 () Bool)

(declare-fun e!68132 () Bool)

(declare-datatypes ((tuple2!8576 0))(
  ( (tuple2!8577 (_1!4543 BitStream!3906) (_2!4543 Bool)) )
))
(declare-fun lt!152365 () tuple2!8576)

(declare-fun lt!152387 () tuple2!8576)

(assert (=> b!104024 (= e!68132 (= (_2!4543 lt!152365) (_2!4543 lt!152387)))))

(declare-fun res!85627 () Bool)

(declare-fun e!68130 () Bool)

(assert (=> start!20598 (=> (not res!85627) (not e!68130))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20598 (= res!85627 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20598 e!68130))

(assert (=> start!20598 true))

(declare-fun e!68127 () Bool)

(declare-fun inv!12 (BitStream!3906) Bool)

(assert (=> start!20598 (and (inv!12 thiss!1305) e!68127)))

(declare-fun b!104025 () Bool)

(declare-fun res!85630 () Bool)

(declare-fun e!68124 () Bool)

(assert (=> b!104025 (=> res!85630 e!68124)))

(declare-datatypes ((tuple2!8578 0))(
  ( (tuple2!8579 (_1!4544 BitStream!3906) (_2!4544 BitStream!3906)) )
))
(declare-fun lt!152379 () tuple2!8578)

(declare-fun lt!152381 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104025 (= res!85630 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2216 (buf!2582 (_1!4544 lt!152379)))) ((_ sign_extend 32) (currentByte!5067 (_1!4544 lt!152379))) ((_ sign_extend 32) (currentBit!5062 (_1!4544 lt!152379))) lt!152381)))))

(declare-fun b!104026 () Bool)

(declare-fun res!85626 () Bool)

(declare-fun e!68123 () Bool)

(assert (=> b!104026 (=> (not res!85626) (not e!68123))))

(declare-fun lt!152380 () tuple2!8574)

(declare-fun isPrefixOf!0 (BitStream!3906 BitStream!3906) Bool)

(assert (=> b!104026 (= res!85626 (isPrefixOf!0 thiss!1305 (_2!4542 lt!152380)))))

(declare-fun b!104027 () Bool)

(assert (=> b!104027 (= e!68124 true)))

(declare-datatypes ((tuple2!8580 0))(
  ( (tuple2!8581 (_1!4545 BitStream!3906) (_2!4545 (_ BitVec 64))) )
))
(declare-fun lt!152377 () tuple2!8580)

(declare-fun lt!152385 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8580)

(declare-fun withMovedBitIndex!0 (BitStream!3906 (_ BitVec 64)) BitStream!3906)

(assert (=> b!104027 (= lt!152377 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4544 lt!152379) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152385))))

(declare-fun b!104028 () Bool)

(declare-fun e!68133 () Bool)

(assert (=> b!104028 (= e!68133 e!68123)))

(declare-fun res!85636 () Bool)

(assert (=> b!104028 (=> (not res!85636) (not e!68123))))

(declare-fun lt!152378 () (_ BitVec 64))

(declare-fun lt!152376 () (_ BitVec 64))

(assert (=> b!104028 (= res!85636 (= lt!152378 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152376)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104028 (= lt!152378 (bitIndex!0 (size!2216 (buf!2582 (_2!4542 lt!152380))) (currentByte!5067 (_2!4542 lt!152380)) (currentBit!5062 (_2!4542 lt!152380))))))

(assert (=> b!104028 (= lt!152376 (bitIndex!0 (size!2216 (buf!2582 thiss!1305)) (currentByte!5067 thiss!1305) (currentBit!5062 thiss!1305)))))

(declare-fun b!104029 () Bool)

(declare-fun e!68128 () Bool)

(assert (=> b!104029 (= e!68130 e!68128)))

(declare-fun res!85628 () Bool)

(assert (=> b!104029 (=> (not res!85628) (not e!68128))))

(assert (=> b!104029 (= res!85628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2216 (buf!2582 thiss!1305))) ((_ sign_extend 32) (currentByte!5067 thiss!1305)) ((_ sign_extend 32) (currentBit!5062 thiss!1305)) lt!152381))))

(assert (=> b!104029 (= lt!152381 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!104030 () Bool)

(declare-fun e!68126 () Bool)

(assert (=> b!104030 (= e!68128 e!68126)))

(declare-fun res!85629 () Bool)

(assert (=> b!104030 (=> (not res!85629) (not e!68126))))

(declare-fun lt!152373 () (_ BitVec 64))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!104030 (= res!85629 (and (= (bvand v!199 lt!152373) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104030 (= lt!152373 (onesLSBLong!0 nBits!396))))

(declare-fun b!104031 () Bool)

(declare-fun e!68129 () Bool)

(assert (=> b!104031 (= e!68123 e!68129)))

(declare-fun res!85631 () Bool)

(assert (=> b!104031 (=> (not res!85631) (not e!68129))))

(declare-fun lt!152383 () Bool)

(declare-fun lt!152389 () tuple2!8576)

(assert (=> b!104031 (= res!85631 (and (= (_2!4543 lt!152389) lt!152383) (= (_1!4543 lt!152389) (_2!4542 lt!152380))))))

(declare-fun readBitPure!0 (BitStream!3906) tuple2!8576)

(declare-fun readerFrom!0 (BitStream!3906 (_ BitVec 32) (_ BitVec 32)) BitStream!3906)

(assert (=> b!104031 (= lt!152389 (readBitPure!0 (readerFrom!0 (_2!4542 lt!152380) (currentBit!5062 thiss!1305) (currentByte!5067 thiss!1305))))))

(declare-fun b!104032 () Bool)

(assert (=> b!104032 (= e!68126 (not e!68124))))

(declare-fun res!85632 () Bool)

(assert (=> b!104032 (=> res!85632 e!68124)))

(declare-fun lt!152382 () tuple2!8578)

(assert (=> b!104032 (= res!85632 (not (= (_1!4545 (readNLeastSignificantBitsLoopPure!0 (_1!4544 lt!152382) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152385)) (_2!4544 lt!152382))))))

(declare-fun lt!152375 () (_ BitVec 64))

(assert (=> b!104032 (validate_offset_bits!1 ((_ sign_extend 32) (size!2216 (buf!2582 (_2!4542 lt!152386)))) ((_ sign_extend 32) (currentByte!5067 (_2!4542 lt!152380))) ((_ sign_extend 32) (currentBit!5062 (_2!4542 lt!152380))) lt!152375)))

(declare-fun lt!152370 () Unit!6376)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3906 array!4856 (_ BitVec 64)) Unit!6376)

(assert (=> b!104032 (= lt!152370 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4542 lt!152380) (buf!2582 (_2!4542 lt!152386)) lt!152375))))

(assert (=> b!104032 (= lt!152375 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152372 () (_ BitVec 64))

(declare-fun lt!152367 () tuple2!8576)

(declare-fun lt!152368 () (_ BitVec 64))

(assert (=> b!104032 (= lt!152385 (bvor lt!152368 (ite (_2!4543 lt!152367) lt!152372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152384 () tuple2!8580)

(assert (=> b!104032 (= lt!152384 (readNLeastSignificantBitsLoopPure!0 (_1!4544 lt!152379) nBits!396 i!615 lt!152368))))

(assert (=> b!104032 (validate_offset_bits!1 ((_ sign_extend 32) (size!2216 (buf!2582 (_2!4542 lt!152386)))) ((_ sign_extend 32) (currentByte!5067 thiss!1305)) ((_ sign_extend 32) (currentBit!5062 thiss!1305)) lt!152381)))

(declare-fun lt!152374 () Unit!6376)

(assert (=> b!104032 (= lt!152374 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2582 (_2!4542 lt!152386)) lt!152381))))

(declare-fun lt!152371 () (_ BitVec 64))

(assert (=> b!104032 (= lt!152368 (bvand v!199 (bvnot lt!152371)))))

(assert (=> b!104032 (= lt!152371 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!104032 (= (_2!4543 lt!152367) lt!152383)))

(assert (=> b!104032 (= lt!152367 (readBitPure!0 (_1!4544 lt!152379)))))

(declare-fun reader!0 (BitStream!3906 BitStream!3906) tuple2!8578)

(assert (=> b!104032 (= lt!152382 (reader!0 (_2!4542 lt!152380) (_2!4542 lt!152386)))))

(assert (=> b!104032 (= lt!152379 (reader!0 thiss!1305 (_2!4542 lt!152386)))))

(assert (=> b!104032 e!68132))

(declare-fun res!85637 () Bool)

(assert (=> b!104032 (=> (not res!85637) (not e!68132))))

(assert (=> b!104032 (= res!85637 (= (bitIndex!0 (size!2216 (buf!2582 (_1!4543 lt!152365))) (currentByte!5067 (_1!4543 lt!152365)) (currentBit!5062 (_1!4543 lt!152365))) (bitIndex!0 (size!2216 (buf!2582 (_1!4543 lt!152387))) (currentByte!5067 (_1!4543 lt!152387)) (currentBit!5062 (_1!4543 lt!152387)))))))

(declare-fun lt!152366 () Unit!6376)

(declare-fun lt!152369 () BitStream!3906)

(declare-fun readBitPrefixLemma!0 (BitStream!3906 BitStream!3906) Unit!6376)

(assert (=> b!104032 (= lt!152366 (readBitPrefixLemma!0 lt!152369 (_2!4542 lt!152386)))))

(assert (=> b!104032 (= lt!152387 (readBitPure!0 (BitStream!3907 (buf!2582 (_2!4542 lt!152386)) (currentByte!5067 thiss!1305) (currentBit!5062 thiss!1305))))))

(assert (=> b!104032 (= lt!152365 (readBitPure!0 lt!152369))))

(assert (=> b!104032 (= lt!152369 (BitStream!3907 (buf!2582 (_2!4542 lt!152380)) (currentByte!5067 thiss!1305) (currentBit!5062 thiss!1305)))))

(assert (=> b!104032 e!68125))

(declare-fun res!85634 () Bool)

(assert (=> b!104032 (=> (not res!85634) (not e!68125))))

(assert (=> b!104032 (= res!85634 (isPrefixOf!0 thiss!1305 (_2!4542 lt!152386)))))

(declare-fun lt!152388 () Unit!6376)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3906 BitStream!3906 BitStream!3906) Unit!6376)

(assert (=> b!104032 (= lt!152388 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4542 lt!152380) (_2!4542 lt!152386)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3906 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8574)

(assert (=> b!104032 (= lt!152386 (appendNLeastSignificantBitsLoop!0 (_2!4542 lt!152380) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!104032 e!68133))

(declare-fun res!85635 () Bool)

(assert (=> b!104032 (=> (not res!85635) (not e!68133))))

(assert (=> b!104032 (= res!85635 (= (size!2216 (buf!2582 thiss!1305)) (size!2216 (buf!2582 (_2!4542 lt!152380)))))))

(declare-fun appendBit!0 (BitStream!3906 Bool) tuple2!8574)

(assert (=> b!104032 (= lt!152380 (appendBit!0 thiss!1305 lt!152383))))

(assert (=> b!104032 (= lt!152383 (not (= (bvand v!199 lt!152372) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104032 (= lt!152372 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104033 () Bool)

(assert (=> b!104033 (= e!68129 (= (bitIndex!0 (size!2216 (buf!2582 (_1!4543 lt!152389))) (currentByte!5067 (_1!4543 lt!152389)) (currentBit!5062 (_1!4543 lt!152389))) lt!152378))))

(declare-fun b!104034 () Bool)

(declare-fun res!85625 () Bool)

(assert (=> b!104034 (=> res!85625 e!68124)))

(assert (=> b!104034 (= res!85625 (or (not (= (bvand lt!152368 lt!152371) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152368 lt!152373) lt!152368))))))

(declare-fun b!104035 () Bool)

(declare-fun res!85633 () Bool)

(assert (=> b!104035 (=> (not res!85633) (not e!68125))))

(assert (=> b!104035 (= res!85633 (invariant!0 (currentBit!5062 thiss!1305) (currentByte!5067 thiss!1305) (size!2216 (buf!2582 (_2!4542 lt!152380)))))))

(declare-fun b!104036 () Bool)

(declare-fun array_inv!2018 (array!4856) Bool)

(assert (=> b!104036 (= e!68127 (array_inv!2018 (buf!2582 thiss!1305)))))

(assert (= (and start!20598 res!85627) b!104029))

(assert (= (and b!104029 res!85628) b!104030))

(assert (= (and b!104030 res!85629) b!104032))

(assert (= (and b!104032 res!85635) b!104028))

(assert (= (and b!104028 res!85636) b!104026))

(assert (= (and b!104026 res!85626) b!104031))

(assert (= (and b!104031 res!85631) b!104033))

(assert (= (and b!104032 res!85634) b!104035))

(assert (= (and b!104035 res!85633) b!104023))

(assert (= (and b!104032 res!85637) b!104024))

(assert (= (and b!104032 (not res!85632)) b!104025))

(assert (= (and b!104025 (not res!85630)) b!104034))

(assert (= (and b!104034 (not res!85625)) b!104027))

(assert (= start!20598 b!104036))

(declare-fun m!151977 () Bool)

(assert (=> b!104033 m!151977))

(declare-fun m!151979 () Bool)

(assert (=> b!104036 m!151979))

(declare-fun m!151981 () Bool)

(assert (=> b!104026 m!151981))

(declare-fun m!151983 () Bool)

(assert (=> b!104027 m!151983))

(assert (=> b!104027 m!151983))

(declare-fun m!151985 () Bool)

(assert (=> b!104027 m!151985))

(declare-fun m!151987 () Bool)

(assert (=> b!104031 m!151987))

(assert (=> b!104031 m!151987))

(declare-fun m!151989 () Bool)

(assert (=> b!104031 m!151989))

(declare-fun m!151991 () Bool)

(assert (=> b!104030 m!151991))

(declare-fun m!151993 () Bool)

(assert (=> b!104023 m!151993))

(declare-fun m!151995 () Bool)

(assert (=> b!104035 m!151995))

(declare-fun m!151997 () Bool)

(assert (=> b!104032 m!151997))

(declare-fun m!151999 () Bool)

(assert (=> b!104032 m!151999))

(declare-fun m!152001 () Bool)

(assert (=> b!104032 m!152001))

(declare-fun m!152003 () Bool)

(assert (=> b!104032 m!152003))

(declare-fun m!152005 () Bool)

(assert (=> b!104032 m!152005))

(declare-fun m!152007 () Bool)

(assert (=> b!104032 m!152007))

(declare-fun m!152009 () Bool)

(assert (=> b!104032 m!152009))

(declare-fun m!152011 () Bool)

(assert (=> b!104032 m!152011))

(declare-fun m!152013 () Bool)

(assert (=> b!104032 m!152013))

(declare-fun m!152015 () Bool)

(assert (=> b!104032 m!152015))

(declare-fun m!152017 () Bool)

(assert (=> b!104032 m!152017))

(declare-fun m!152019 () Bool)

(assert (=> b!104032 m!152019))

(declare-fun m!152021 () Bool)

(assert (=> b!104032 m!152021))

(declare-fun m!152023 () Bool)

(assert (=> b!104032 m!152023))

(declare-fun m!152025 () Bool)

(assert (=> b!104032 m!152025))

(declare-fun m!152027 () Bool)

(assert (=> b!104032 m!152027))

(declare-fun m!152029 () Bool)

(assert (=> b!104032 m!152029))

(declare-fun m!152031 () Bool)

(assert (=> b!104032 m!152031))

(declare-fun m!152033 () Bool)

(assert (=> b!104032 m!152033))

(declare-fun m!152035 () Bool)

(assert (=> start!20598 m!152035))

(declare-fun m!152037 () Bool)

(assert (=> b!104025 m!152037))

(declare-fun m!152039 () Bool)

(assert (=> b!104028 m!152039))

(declare-fun m!152041 () Bool)

(assert (=> b!104028 m!152041))

(declare-fun m!152043 () Bool)

(assert (=> b!104029 m!152043))

(check-sat (not b!104028) (not b!104033) (not b!104035) (not b!104029) (not b!104027) (not b!104032) (not b!104023) (not b!104025) (not b!104036) (not b!104030) (not b!104031) (not b!104026) (not start!20598))
