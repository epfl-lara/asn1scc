; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43616 () Bool)

(assert start!43616)

(declare-fun b!206696 () Bool)

(declare-fun e!141318 () Bool)

(declare-datatypes ((array!10399 0))(
  ( (array!10400 (arr!5501 (Array (_ BitVec 32) (_ BitVec 8))) (size!4571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8250 0))(
  ( (BitStream!8251 (buf!5076 array!10399) (currentByte!9594 (_ BitVec 32)) (currentBit!9589 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17674 0))(
  ( (tuple2!17675 (_1!9492 BitStream!8250) (_2!9492 Bool)) )
))
(declare-fun lt!322894 () tuple2!17674)

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!206696 (= e!141318 (or (not (_2!9492 lt!322894)) (and (bvsge ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!17676 0))(
  ( (tuple2!17677 (_1!9493 BitStream!8250) (_2!9493 (_ BitVec 64))) )
))
(declare-fun lt!322895 () tuple2!17676)

(declare-datatypes ((tuple2!17678 0))(
  ( (tuple2!17679 (_1!9494 BitStream!8250) (_2!9494 BitStream!8250)) )
))
(declare-fun lt!322896 () tuple2!17678)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17676)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206696 (= lt!322895 (readNBitsLSBFirstsLoopPure!0 (_1!9494 lt!322896) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!14736 0))(
  ( (Unit!14737) )
))
(declare-datatypes ((tuple2!17680 0))(
  ( (tuple2!17681 (_1!9495 Unit!14736) (_2!9495 BitStream!8250)) )
))
(declare-fun lt!322886 () tuple2!17680)

(declare-fun thiss!1204 () BitStream!8250)

(declare-fun lt!322901 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206696 (validate_offset_bits!1 ((_ sign_extend 32) (size!4571 (buf!5076 (_2!9495 lt!322886)))) ((_ sign_extend 32) (currentByte!9594 thiss!1204)) ((_ sign_extend 32) (currentBit!9589 thiss!1204)) lt!322901)))

(declare-fun lt!322890 () Unit!14736)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8250 array!10399 (_ BitVec 64)) Unit!14736)

(assert (=> b!206696 (= lt!322890 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5076 (_2!9495 lt!322886)) lt!322901))))

(declare-fun lt!322882 () Bool)

(assert (=> b!206696 (= (_2!9492 lt!322894) lt!322882)))

(declare-fun readBitPure!0 (BitStream!8250) tuple2!17674)

(assert (=> b!206696 (= lt!322894 (readBitPure!0 (_1!9494 lt!322896)))))

(declare-fun lt!322899 () tuple2!17678)

(declare-fun lt!322891 () tuple2!17680)

(declare-fun reader!0 (BitStream!8250 BitStream!8250) tuple2!17678)

(assert (=> b!206696 (= lt!322899 (reader!0 (_2!9495 lt!322891) (_2!9495 lt!322886)))))

(assert (=> b!206696 (= lt!322896 (reader!0 thiss!1204 (_2!9495 lt!322886)))))

(declare-fun e!141312 () Bool)

(assert (=> b!206696 e!141312))

(declare-fun res!173346 () Bool)

(assert (=> b!206696 (=> (not res!173346) (not e!141312))))

(declare-fun lt!322885 () tuple2!17674)

(declare-fun lt!322884 () tuple2!17674)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206696 (= res!173346 (= (bitIndex!0 (size!4571 (buf!5076 (_1!9492 lt!322885))) (currentByte!9594 (_1!9492 lt!322885)) (currentBit!9589 (_1!9492 lt!322885))) (bitIndex!0 (size!4571 (buf!5076 (_1!9492 lt!322884))) (currentByte!9594 (_1!9492 lt!322884)) (currentBit!9589 (_1!9492 lt!322884)))))))

(declare-fun lt!322889 () Unit!14736)

(declare-fun lt!322883 () BitStream!8250)

(declare-fun readBitPrefixLemma!0 (BitStream!8250 BitStream!8250) Unit!14736)

(assert (=> b!206696 (= lt!322889 (readBitPrefixLemma!0 lt!322883 (_2!9495 lt!322886)))))

(assert (=> b!206696 (= lt!322884 (readBitPure!0 (BitStream!8251 (buf!5076 (_2!9495 lt!322886)) (currentByte!9594 thiss!1204) (currentBit!9589 thiss!1204))))))

(assert (=> b!206696 (= lt!322885 (readBitPure!0 lt!322883))))

(declare-fun e!141316 () Bool)

(assert (=> b!206696 e!141316))

(declare-fun res!173341 () Bool)

(assert (=> b!206696 (=> (not res!173341) (not e!141316))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206696 (= res!173341 (invariant!0 (currentBit!9589 thiss!1204) (currentByte!9594 thiss!1204) (size!4571 (buf!5076 (_2!9495 lt!322891)))))))

(assert (=> b!206696 (= lt!322883 (BitStream!8251 (buf!5076 (_2!9495 lt!322891)) (currentByte!9594 thiss!1204) (currentBit!9589 thiss!1204)))))

(declare-fun b!206697 () Bool)

(declare-fun res!173345 () Bool)

(assert (=> b!206697 (=> res!173345 e!141318)))

(assert (=> b!206697 (= res!173345 (not (invariant!0 (currentBit!9589 (_2!9495 lt!322886)) (currentByte!9594 (_2!9495 lt!322886)) (size!4571 (buf!5076 (_2!9495 lt!322886))))))))

(declare-fun b!206698 () Bool)

(declare-fun res!173347 () Bool)

(assert (=> b!206698 (=> res!173347 e!141318)))

(declare-fun isPrefixOf!0 (BitStream!8250 BitStream!8250) Bool)

(assert (=> b!206698 (= res!173347 (not (isPrefixOf!0 thiss!1204 (_2!9495 lt!322891))))))

(declare-fun b!206699 () Bool)

(assert (=> b!206699 (= e!141316 (invariant!0 (currentBit!9589 thiss!1204) (currentByte!9594 thiss!1204) (size!4571 (buf!5076 (_2!9495 lt!322886)))))))

(declare-fun res!173354 () Bool)

(declare-fun e!141315 () Bool)

(assert (=> start!43616 (=> (not res!173354) (not e!141315))))

(assert (=> start!43616 (= res!173354 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43616 e!141315))

(assert (=> start!43616 true))

(declare-fun e!141311 () Bool)

(declare-fun inv!12 (BitStream!8250) Bool)

(assert (=> start!43616 (and (inv!12 thiss!1204) e!141311)))

(declare-fun b!206700 () Bool)

(declare-fun e!141313 () Bool)

(declare-fun e!141317 () Bool)

(assert (=> b!206700 (= e!141313 (not e!141317))))

(declare-fun res!173340 () Bool)

(assert (=> b!206700 (=> res!173340 e!141317)))

(declare-fun lt!322888 () (_ BitVec 64))

(declare-fun lt!322892 () (_ BitVec 64))

(assert (=> b!206700 (= res!173340 (not (= lt!322888 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322892))))))

(assert (=> b!206700 (= lt!322888 (bitIndex!0 (size!4571 (buf!5076 (_2!9495 lt!322891))) (currentByte!9594 (_2!9495 lt!322891)) (currentBit!9589 (_2!9495 lt!322891))))))

(assert (=> b!206700 (= lt!322892 (bitIndex!0 (size!4571 (buf!5076 thiss!1204)) (currentByte!9594 thiss!1204) (currentBit!9589 thiss!1204)))))

(declare-fun e!141314 () Bool)

(assert (=> b!206700 e!141314))

(declare-fun res!173348 () Bool)

(assert (=> b!206700 (=> (not res!173348) (not e!141314))))

(assert (=> b!206700 (= res!173348 (= (size!4571 (buf!5076 thiss!1204)) (size!4571 (buf!5076 (_2!9495 lt!322891)))))))

(declare-fun appendBit!0 (BitStream!8250 Bool) tuple2!17680)

(assert (=> b!206700 (= lt!322891 (appendBit!0 thiss!1204 lt!322882))))

(assert (=> b!206700 (= lt!322882 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206701 () Bool)

(declare-fun e!141320 () Bool)

(declare-fun lt!322898 () tuple2!17674)

(declare-fun lt!322893 () (_ BitVec 64))

(assert (=> b!206701 (= e!141320 (= (bitIndex!0 (size!4571 (buf!5076 (_1!9492 lt!322898))) (currentByte!9594 (_1!9492 lt!322898)) (currentBit!9589 (_1!9492 lt!322898))) lt!322893))))

(declare-fun b!206702 () Bool)

(declare-fun res!173351 () Bool)

(declare-fun e!141321 () Bool)

(assert (=> b!206702 (=> (not res!173351) (not e!141321))))

(assert (=> b!206702 (= res!173351 (isPrefixOf!0 thiss!1204 (_2!9495 lt!322891)))))

(declare-fun b!206703 () Bool)

(declare-fun res!173349 () Bool)

(assert (=> b!206703 (=> res!173349 e!141318)))

(declare-fun lt!322897 () (_ BitVec 64))

(assert (=> b!206703 (= res!173349 (or (not (= (size!4571 (buf!5076 (_2!9495 lt!322886))) (size!4571 (buf!5076 thiss!1204)))) (not (= lt!322897 (bvsub (bvadd lt!322892 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206704 () Bool)

(declare-fun array_inv!4312 (array!10399) Bool)

(assert (=> b!206704 (= e!141311 (array_inv!4312 (buf!5076 thiss!1204)))))

(declare-fun b!206705 () Bool)

(assert (=> b!206705 (= e!141315 e!141313)))

(declare-fun res!173342 () Bool)

(assert (=> b!206705 (=> (not res!173342) (not e!141313))))

(assert (=> b!206705 (= res!173342 (validate_offset_bits!1 ((_ sign_extend 32) (size!4571 (buf!5076 thiss!1204))) ((_ sign_extend 32) (currentByte!9594 thiss!1204)) ((_ sign_extend 32) (currentBit!9589 thiss!1204)) lt!322901))))

(assert (=> b!206705 (= lt!322901 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206706 () Bool)

(declare-fun res!173344 () Bool)

(assert (=> b!206706 (=> (not res!173344) (not e!141313))))

(assert (=> b!206706 (= res!173344 (not (= i!590 nBits!348)))))

(declare-fun b!206707 () Bool)

(assert (=> b!206707 (= e!141312 (= (_2!9492 lt!322885) (_2!9492 lt!322884)))))

(declare-fun b!206708 () Bool)

(assert (=> b!206708 (= e!141321 e!141320)))

(declare-fun res!173343 () Bool)

(assert (=> b!206708 (=> (not res!173343) (not e!141320))))

(assert (=> b!206708 (= res!173343 (and (= (_2!9492 lt!322898) lt!322882) (= (_1!9492 lt!322898) (_2!9495 lt!322891))))))

(declare-fun readerFrom!0 (BitStream!8250 (_ BitVec 32) (_ BitVec 32)) BitStream!8250)

(assert (=> b!206708 (= lt!322898 (readBitPure!0 (readerFrom!0 (_2!9495 lt!322891) (currentBit!9589 thiss!1204) (currentByte!9594 thiss!1204))))))

(declare-fun b!206709 () Bool)

(declare-fun res!173353 () Bool)

(assert (=> b!206709 (=> res!173353 e!141318)))

(assert (=> b!206709 (= res!173353 (not (isPrefixOf!0 (_2!9495 lt!322891) (_2!9495 lt!322886))))))

(declare-fun b!206710 () Bool)

(assert (=> b!206710 (= e!141317 e!141318)))

(declare-fun res!173350 () Bool)

(assert (=> b!206710 (=> res!173350 e!141318)))

(assert (=> b!206710 (= res!173350 (not (= lt!322897 (bvsub (bvsub (bvadd lt!322888 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206710 (= lt!322897 (bitIndex!0 (size!4571 (buf!5076 (_2!9495 lt!322886))) (currentByte!9594 (_2!9495 lt!322886)) (currentBit!9589 (_2!9495 lt!322886))))))

(assert (=> b!206710 (isPrefixOf!0 thiss!1204 (_2!9495 lt!322886))))

(declare-fun lt!322887 () Unit!14736)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8250 BitStream!8250 BitStream!8250) Unit!14736)

(assert (=> b!206710 (= lt!322887 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9495 lt!322891) (_2!9495 lt!322886)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8250 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17680)

(assert (=> b!206710 (= lt!322886 (appendBitsLSBFirstLoopTR!0 (_2!9495 lt!322891) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206711 () Bool)

(assert (=> b!206711 (= e!141314 e!141321)))

(declare-fun res!173352 () Bool)

(assert (=> b!206711 (=> (not res!173352) (not e!141321))))

(declare-fun lt!322900 () (_ BitVec 64))

(assert (=> b!206711 (= res!173352 (= lt!322893 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322900)))))

(assert (=> b!206711 (= lt!322893 (bitIndex!0 (size!4571 (buf!5076 (_2!9495 lt!322891))) (currentByte!9594 (_2!9495 lt!322891)) (currentBit!9589 (_2!9495 lt!322891))))))

(assert (=> b!206711 (= lt!322900 (bitIndex!0 (size!4571 (buf!5076 thiss!1204)) (currentByte!9594 thiss!1204) (currentBit!9589 thiss!1204)))))

(declare-fun b!206712 () Bool)

(declare-fun res!173339 () Bool)

(assert (=> b!206712 (=> (not res!173339) (not e!141313))))

(assert (=> b!206712 (= res!173339 (invariant!0 (currentBit!9589 thiss!1204) (currentByte!9594 thiss!1204) (size!4571 (buf!5076 thiss!1204))))))

(assert (= (and start!43616 res!173354) b!206705))

(assert (= (and b!206705 res!173342) b!206712))

(assert (= (and b!206712 res!173339) b!206706))

(assert (= (and b!206706 res!173344) b!206700))

(assert (= (and b!206700 res!173348) b!206711))

(assert (= (and b!206711 res!173352) b!206702))

(assert (= (and b!206702 res!173351) b!206708))

(assert (= (and b!206708 res!173343) b!206701))

(assert (= (and b!206700 (not res!173340)) b!206710))

(assert (= (and b!206710 (not res!173350)) b!206697))

(assert (= (and b!206697 (not res!173345)) b!206703))

(assert (= (and b!206703 (not res!173349)) b!206709))

(assert (= (and b!206709 (not res!173353)) b!206698))

(assert (= (and b!206698 (not res!173347)) b!206696))

(assert (= (and b!206696 res!173341) b!206699))

(assert (= (and b!206696 res!173346) b!206707))

(assert (= start!43616 b!206704))

(declare-fun m!318281 () Bool)

(assert (=> b!206699 m!318281))

(declare-fun m!318283 () Bool)

(assert (=> b!206712 m!318283))

(declare-fun m!318285 () Bool)

(assert (=> b!206709 m!318285))

(declare-fun m!318287 () Bool)

(assert (=> b!206698 m!318287))

(declare-fun m!318289 () Bool)

(assert (=> b!206710 m!318289))

(declare-fun m!318291 () Bool)

(assert (=> b!206710 m!318291))

(declare-fun m!318293 () Bool)

(assert (=> b!206710 m!318293))

(declare-fun m!318295 () Bool)

(assert (=> b!206710 m!318295))

(declare-fun m!318297 () Bool)

(assert (=> b!206700 m!318297))

(declare-fun m!318299 () Bool)

(assert (=> b!206700 m!318299))

(declare-fun m!318301 () Bool)

(assert (=> b!206700 m!318301))

(assert (=> b!206711 m!318297))

(assert (=> b!206711 m!318299))

(declare-fun m!318303 () Bool)

(assert (=> b!206704 m!318303))

(assert (=> b!206702 m!318287))

(declare-fun m!318305 () Bool)

(assert (=> b!206705 m!318305))

(declare-fun m!318307 () Bool)

(assert (=> b!206697 m!318307))

(declare-fun m!318309 () Bool)

(assert (=> start!43616 m!318309))

(declare-fun m!318311 () Bool)

(assert (=> b!206696 m!318311))

(declare-fun m!318313 () Bool)

(assert (=> b!206696 m!318313))

(declare-fun m!318315 () Bool)

(assert (=> b!206696 m!318315))

(declare-fun m!318317 () Bool)

(assert (=> b!206696 m!318317))

(declare-fun m!318319 () Bool)

(assert (=> b!206696 m!318319))

(declare-fun m!318321 () Bool)

(assert (=> b!206696 m!318321))

(declare-fun m!318323 () Bool)

(assert (=> b!206696 m!318323))

(declare-fun m!318325 () Bool)

(assert (=> b!206696 m!318325))

(declare-fun m!318327 () Bool)

(assert (=> b!206696 m!318327))

(declare-fun m!318329 () Bool)

(assert (=> b!206696 m!318329))

(declare-fun m!318331 () Bool)

(assert (=> b!206696 m!318331))

(declare-fun m!318333 () Bool)

(assert (=> b!206696 m!318333))

(declare-fun m!318335 () Bool)

(assert (=> b!206696 m!318335))

(declare-fun m!318337 () Bool)

(assert (=> b!206708 m!318337))

(assert (=> b!206708 m!318337))

(declare-fun m!318339 () Bool)

(assert (=> b!206708 m!318339))

(declare-fun m!318341 () Bool)

(assert (=> b!206701 m!318341))

(check-sat (not b!206697) (not b!206711) (not b!206712) (not b!206705) (not b!206700) (not b!206710) (not b!206704) (not b!206709) (not b!206698) (not start!43616) (not b!206708) (not b!206696) (not b!206702) (not b!206699) (not b!206701))
(check-sat)
