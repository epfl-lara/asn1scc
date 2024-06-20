; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44430 () Bool)

(assert start!44430)

(declare-fun res!177729 () Bool)

(declare-fun e!144289 () Bool)

(assert (=> start!44430 (=> (not res!177729) (not e!144289))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!44430 (= res!177729 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44430 e!144289))

(assert (=> start!44430 true))

(declare-datatypes ((array!10508 0))(
  ( (array!10509 (arr!5545 (Array (_ BitVec 32) (_ BitVec 8))) (size!4615 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8338 0))(
  ( (BitStream!8339 (buf!5141 array!10508) (currentByte!9701 (_ BitVec 32)) (currentBit!9696 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8338)

(declare-fun e!144281 () Bool)

(declare-fun inv!12 (BitStream!8338) Bool)

(assert (=> start!44430 (and (inv!12 thiss!1204) e!144281)))

(declare-fun b!211625 () Bool)

(declare-fun array_inv!4356 (array!10508) Bool)

(assert (=> b!211625 (= e!144281 (array_inv!4356 (buf!5141 thiss!1204)))))

(declare-fun b!211626 () Bool)

(declare-fun res!177732 () Bool)

(declare-fun e!144284 () Bool)

(assert (=> b!211626 (=> (not res!177732) (not e!144284))))

(declare-fun lt!333333 () (_ BitVec 64))

(declare-datatypes ((tuple2!18110 0))(
  ( (tuple2!18111 (_1!9710 BitStream!8338) (_2!9710 BitStream!8338)) )
))
(declare-fun lt!333351 () tuple2!18110)

(declare-fun lt!333344 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8338 (_ BitVec 64)) BitStream!8338)

(assert (=> b!211626 (= res!177732 (= (_1!9710 lt!333351) (withMovedBitIndex!0 (_2!9710 lt!333351) (bvsub lt!333344 lt!333333))))))

(declare-fun b!211627 () Bool)

(declare-fun e!144279 () Bool)

(declare-fun e!144287 () Bool)

(assert (=> b!211627 (= e!144279 e!144287)))

(declare-fun res!177730 () Bool)

(assert (=> b!211627 (=> (not res!177730) (not e!144287))))

(declare-fun lt!333331 () (_ BitVec 64))

(declare-fun lt!333330 () (_ BitVec 64))

(assert (=> b!211627 (= res!177730 (= lt!333331 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!333330)))))

(declare-datatypes ((Unit!15097 0))(
  ( (Unit!15098) )
))
(declare-datatypes ((tuple2!18112 0))(
  ( (tuple2!18113 (_1!9711 Unit!15097) (_2!9711 BitStream!8338)) )
))
(declare-fun lt!333354 () tuple2!18112)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211627 (= lt!333331 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(assert (=> b!211627 (= lt!333330 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(declare-fun b!211628 () Bool)

(declare-fun e!144290 () Bool)

(assert (=> b!211628 (= e!144289 e!144290)))

(declare-fun res!177716 () Bool)

(assert (=> b!211628 (=> (not res!177716) (not e!144290))))

(declare-fun lt!333356 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211628 (= res!177716 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204)) lt!333356))))

(assert (=> b!211628 (= lt!333356 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!211629 () Bool)

(declare-fun e!144291 () Bool)

(declare-datatypes ((tuple2!18114 0))(
  ( (tuple2!18115 (_1!9712 BitStream!8338) (_2!9712 Bool)) )
))
(declare-fun lt!333347 () tuple2!18114)

(assert (=> b!211629 (= e!144291 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333347))) (currentByte!9701 (_1!9712 lt!333347)) (currentBit!9696 (_1!9712 lt!333347))) lt!333331))))

(declare-fun b!211630 () Bool)

(declare-fun res!177721 () Bool)

(declare-fun e!144283 () Bool)

(assert (=> b!211630 (=> res!177721 e!144283)))

(declare-fun isPrefixOf!0 (BitStream!8338 BitStream!8338) Bool)

(assert (=> b!211630 (= res!177721 (not (isPrefixOf!0 thiss!1204 (_2!9711 lt!333354))))))

(declare-fun b!211631 () Bool)

(declare-fun res!177727 () Bool)

(assert (=> b!211631 (=> res!177727 e!144283)))

(declare-fun lt!333329 () tuple2!18112)

(assert (=> b!211631 (= res!177727 (not (isPrefixOf!0 (_2!9711 lt!333354) (_2!9711 lt!333329))))))

(declare-fun b!211632 () Bool)

(declare-fun res!177717 () Bool)

(assert (=> b!211632 (=> (not res!177717) (not e!144287))))

(assert (=> b!211632 (= res!177717 (isPrefixOf!0 thiss!1204 (_2!9711 lt!333354)))))

(declare-fun b!211633 () Bool)

(declare-fun res!177725 () Bool)

(assert (=> b!211633 (=> (not res!177725) (not e!144290))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!211633 (= res!177725 (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 thiss!1204))))))

(declare-fun b!211634 () Bool)

(declare-fun res!177723 () Bool)

(assert (=> b!211634 (=> res!177723 e!144283)))

(assert (=> b!211634 (= res!177723 (or (not (= (size!4615 (buf!5141 (_2!9711 lt!333329))) (size!4615 (buf!5141 thiss!1204)))) (not (= lt!333333 (bvsub (bvadd lt!333344 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!211635 () Bool)

(declare-fun e!144288 () Bool)

(declare-fun lt!333349 () tuple2!18114)

(declare-fun lt!333340 () tuple2!18114)

(assert (=> b!211635 (= e!144288 (= (_2!9712 lt!333349) (_2!9712 lt!333340)))))

(declare-fun b!211636 () Bool)

(declare-fun res!177726 () Bool)

(assert (=> b!211636 (=> (not res!177726) (not e!144290))))

(assert (=> b!211636 (= res!177726 (not (= i!590 nBits!348)))))

(declare-fun b!211637 () Bool)

(declare-fun e!144285 () Bool)

(declare-fun lt!333350 () (_ BitVec 64))

(declare-fun lt!333338 () (_ BitVec 64))

(assert (=> b!211637 (= e!144285 (or (= lt!333350 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333350 (bvand (bvsub lt!333338 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211637 (= lt!333350 (bvand lt!333338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!211637 e!144284))

(declare-fun res!177718 () Bool)

(assert (=> b!211637 (=> (not res!177718) (not e!144284))))

(declare-datatypes ((tuple2!18116 0))(
  ( (tuple2!18117 (_1!9713 BitStream!8338) (_2!9713 (_ BitVec 64))) )
))
(declare-fun lt!333335 () tuple2!18116)

(declare-fun lt!333334 () tuple2!18116)

(assert (=> b!211637 (= res!177718 (and (= (_2!9713 lt!333335) (_2!9713 lt!333334)) (= (_1!9713 lt!333335) (_1!9713 lt!333334))))))

(declare-fun lt!333332 () (_ BitVec 64))

(declare-fun lt!333339 () Unit!15097)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15097)

(assert (=> b!211637 (= lt!333339 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9710 lt!333351) nBits!348 i!590 lt!333332))))

(declare-fun lt!333353 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18116)

(assert (=> b!211637 (= lt!333334 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333353))))

(declare-fun b!211638 () Bool)

(assert (=> b!211638 (= e!144287 e!144291)))

(declare-fun res!177719 () Bool)

(assert (=> b!211638 (=> (not res!177719) (not e!144291))))

(declare-fun lt!333336 () Bool)

(assert (=> b!211638 (= res!177719 (and (= (_2!9712 lt!333347) lt!333336) (= (_1!9712 lt!333347) (_2!9711 lt!333354))))))

(declare-fun readBitPure!0 (BitStream!8338) tuple2!18114)

(declare-fun readerFrom!0 (BitStream!8338 (_ BitVec 32) (_ BitVec 32)) BitStream!8338)

(assert (=> b!211638 (= lt!333347 (readBitPure!0 (readerFrom!0 (_2!9711 lt!333354) (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204))))))

(declare-fun b!211639 () Bool)

(declare-fun e!144282 () Bool)

(assert (=> b!211639 (= e!144282 (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333329)))))))

(declare-fun b!211640 () Bool)

(assert (=> b!211640 (= e!144283 e!144285)))

(declare-fun res!177724 () Bool)

(assert (=> b!211640 (=> res!177724 e!144285)))

(declare-fun lt!333355 () tuple2!18110)

(assert (=> b!211640 (= res!177724 (not (= (_1!9713 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333353)) (_2!9710 lt!333355))))))

(declare-fun lt!333346 () (_ BitVec 64))

(assert (=> b!211640 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333346)))

(declare-fun lt!333337 () Unit!15097)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8338 array!10508 (_ BitVec 64)) Unit!15097)

(assert (=> b!211640 (= lt!333337 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9711 lt!333354) (buf!5141 (_2!9711 lt!333329)) lt!333346))))

(assert (=> b!211640 (= lt!333346 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!333348 () (_ BitVec 64))

(declare-fun lt!333343 () tuple2!18114)

(assert (=> b!211640 (= lt!333353 (bvor lt!333332 (ite (_2!9712 lt!333343) lt!333348 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211640 (= lt!333335 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333351) nBits!348 i!590 lt!333332))))

(assert (=> b!211640 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204)) lt!333356)))

(declare-fun lt!333345 () Unit!15097)

(assert (=> b!211640 (= lt!333345 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5141 (_2!9711 lt!333329)) lt!333356))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211640 (= lt!333332 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!211640 (= (_2!9712 lt!333343) lt!333336)))

(assert (=> b!211640 (= lt!333343 (readBitPure!0 (_1!9710 lt!333351)))))

(declare-fun reader!0 (BitStream!8338 BitStream!8338) tuple2!18110)

(assert (=> b!211640 (= lt!333355 (reader!0 (_2!9711 lt!333354) (_2!9711 lt!333329)))))

(assert (=> b!211640 (= lt!333351 (reader!0 thiss!1204 (_2!9711 lt!333329)))))

(assert (=> b!211640 e!144288))

(declare-fun res!177720 () Bool)

(assert (=> b!211640 (=> (not res!177720) (not e!144288))))

(assert (=> b!211640 (= res!177720 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333349))) (currentByte!9701 (_1!9712 lt!333349)) (currentBit!9696 (_1!9712 lt!333349))) (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333340))) (currentByte!9701 (_1!9712 lt!333340)) (currentBit!9696 (_1!9712 lt!333340)))))))

(declare-fun lt!333341 () Unit!15097)

(declare-fun lt!333352 () BitStream!8338)

(declare-fun readBitPrefixLemma!0 (BitStream!8338 BitStream!8338) Unit!15097)

(assert (=> b!211640 (= lt!333341 (readBitPrefixLemma!0 lt!333352 (_2!9711 lt!333329)))))

(assert (=> b!211640 (= lt!333340 (readBitPure!0 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204))))))

(assert (=> b!211640 (= lt!333349 (readBitPure!0 lt!333352))))

(assert (=> b!211640 e!144282))

(declare-fun res!177733 () Bool)

(assert (=> b!211640 (=> (not res!177733) (not e!144282))))

(assert (=> b!211640 (= res!177733 (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(assert (=> b!211640 (= lt!333352 (BitStream!8339 (buf!5141 (_2!9711 lt!333354)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(declare-fun b!211641 () Bool)

(declare-fun res!177728 () Bool)

(assert (=> b!211641 (=> res!177728 e!144283)))

(assert (=> b!211641 (= res!177728 (not (invariant!0 (currentBit!9696 (_2!9711 lt!333329)) (currentByte!9701 (_2!9711 lt!333329)) (size!4615 (buf!5141 (_2!9711 lt!333329))))))))

(declare-fun b!211642 () Bool)

(declare-fun e!144286 () Bool)

(assert (=> b!211642 (= e!144286 e!144283)))

(declare-fun res!177731 () Bool)

(assert (=> b!211642 (=> res!177731 e!144283)))

(assert (=> b!211642 (= res!177731 (not (= lt!333333 (bvsub (bvsub (bvadd lt!333338 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!211642 (= lt!333333 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333329))) (currentByte!9701 (_2!9711 lt!333329)) (currentBit!9696 (_2!9711 lt!333329))))))

(assert (=> b!211642 (isPrefixOf!0 thiss!1204 (_2!9711 lt!333329))))

(declare-fun lt!333342 () Unit!15097)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8338 BitStream!8338 BitStream!8338) Unit!15097)

(assert (=> b!211642 (= lt!333342 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9711 lt!333354) (_2!9711 lt!333329)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18112)

(assert (=> b!211642 (= lt!333329 (appendBitsLSBFirstLoopTR!0 (_2!9711 lt!333354) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!211643 () Bool)

(assert (=> b!211643 (= e!144290 (not e!144286))))

(declare-fun res!177734 () Bool)

(assert (=> b!211643 (=> res!177734 e!144286)))

(assert (=> b!211643 (= res!177734 (not (= lt!333338 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!333344))))))

(assert (=> b!211643 (= lt!333338 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(assert (=> b!211643 (= lt!333344 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(assert (=> b!211643 e!144279))

(declare-fun res!177722 () Bool)

(assert (=> b!211643 (=> (not res!177722) (not e!144279))))

(assert (=> b!211643 (= res!177722 (= (size!4615 (buf!5141 thiss!1204)) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(declare-fun appendBit!0 (BitStream!8338 Bool) tuple2!18112)

(assert (=> b!211643 (= lt!333354 (appendBit!0 thiss!1204 lt!333336))))

(assert (=> b!211643 (= lt!333336 (not (= (bvand v!189 lt!333348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211643 (= lt!333348 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!211644 () Bool)

(assert (=> b!211644 (= e!144284 (= (_1!9710 lt!333355) (withMovedBitIndex!0 (_2!9710 lt!333355) (bvsub lt!333338 lt!333333))))))

(assert (= (and start!44430 res!177729) b!211628))

(assert (= (and b!211628 res!177716) b!211633))

(assert (= (and b!211633 res!177725) b!211636))

(assert (= (and b!211636 res!177726) b!211643))

(assert (= (and b!211643 res!177722) b!211627))

(assert (= (and b!211627 res!177730) b!211632))

(assert (= (and b!211632 res!177717) b!211638))

(assert (= (and b!211638 res!177719) b!211629))

(assert (= (and b!211643 (not res!177734)) b!211642))

(assert (= (and b!211642 (not res!177731)) b!211641))

(assert (= (and b!211641 (not res!177728)) b!211634))

(assert (= (and b!211634 (not res!177723)) b!211631))

(assert (= (and b!211631 (not res!177727)) b!211630))

(assert (= (and b!211630 (not res!177721)) b!211640))

(assert (= (and b!211640 res!177733) b!211639))

(assert (= (and b!211640 res!177720) b!211635))

(assert (= (and b!211640 (not res!177724)) b!211637))

(assert (= (and b!211637 res!177718) b!211626))

(assert (= (and b!211626 res!177732) b!211644))

(assert (= start!44430 b!211625))

(declare-fun m!326175 () Bool)

(assert (=> b!211631 m!326175))

(declare-fun m!326177 () Bool)

(assert (=> b!211628 m!326177))

(declare-fun m!326179 () Bool)

(assert (=> b!211644 m!326179))

(declare-fun m!326181 () Bool)

(assert (=> b!211638 m!326181))

(assert (=> b!211638 m!326181))

(declare-fun m!326183 () Bool)

(assert (=> b!211638 m!326183))

(declare-fun m!326185 () Bool)

(assert (=> b!211641 m!326185))

(declare-fun m!326187 () Bool)

(assert (=> b!211639 m!326187))

(declare-fun m!326189 () Bool)

(assert (=> b!211630 m!326189))

(assert (=> b!211632 m!326189))

(declare-fun m!326191 () Bool)

(assert (=> b!211626 m!326191))

(declare-fun m!326193 () Bool)

(assert (=> b!211642 m!326193))

(declare-fun m!326195 () Bool)

(assert (=> b!211642 m!326195))

(declare-fun m!326197 () Bool)

(assert (=> b!211642 m!326197))

(declare-fun m!326199 () Bool)

(assert (=> b!211642 m!326199))

(declare-fun m!326201 () Bool)

(assert (=> b!211640 m!326201))

(declare-fun m!326203 () Bool)

(assert (=> b!211640 m!326203))

(declare-fun m!326205 () Bool)

(assert (=> b!211640 m!326205))

(declare-fun m!326207 () Bool)

(assert (=> b!211640 m!326207))

(declare-fun m!326209 () Bool)

(assert (=> b!211640 m!326209))

(declare-fun m!326211 () Bool)

(assert (=> b!211640 m!326211))

(declare-fun m!326213 () Bool)

(assert (=> b!211640 m!326213))

(declare-fun m!326215 () Bool)

(assert (=> b!211640 m!326215))

(declare-fun m!326217 () Bool)

(assert (=> b!211640 m!326217))

(declare-fun m!326219 () Bool)

(assert (=> b!211640 m!326219))

(declare-fun m!326221 () Bool)

(assert (=> b!211640 m!326221))

(declare-fun m!326223 () Bool)

(assert (=> b!211640 m!326223))

(declare-fun m!326225 () Bool)

(assert (=> b!211640 m!326225))

(declare-fun m!326227 () Bool)

(assert (=> b!211640 m!326227))

(declare-fun m!326229 () Bool)

(assert (=> b!211640 m!326229))

(declare-fun m!326231 () Bool)

(assert (=> b!211640 m!326231))

(declare-fun m!326233 () Bool)

(assert (=> b!211643 m!326233))

(declare-fun m!326235 () Bool)

(assert (=> b!211643 m!326235))

(declare-fun m!326237 () Bool)

(assert (=> b!211643 m!326237))

(declare-fun m!326239 () Bool)

(assert (=> b!211625 m!326239))

(assert (=> b!211627 m!326233))

(assert (=> b!211627 m!326235))

(declare-fun m!326241 () Bool)

(assert (=> b!211629 m!326241))

(declare-fun m!326243 () Bool)

(assert (=> start!44430 m!326243))

(declare-fun m!326245 () Bool)

(assert (=> b!211637 m!326245))

(declare-fun m!326247 () Bool)

(assert (=> b!211637 m!326247))

(assert (=> b!211637 m!326247))

(declare-fun m!326249 () Bool)

(assert (=> b!211637 m!326249))

(declare-fun m!326251 () Bool)

(assert (=> b!211633 m!326251))

(push 1)

(assert (not b!211644))

(assert (not b!211632))

(assert (not b!211640))

(assert (not b!211638))

(assert (not b!211633))

(assert (not b!211631))

(assert (not b!211637))

(assert (not b!211627))

(assert (not b!211642))

(assert (not b!211629))

(assert (not b!211641))

(assert (not b!211628))

(assert (not b!211639))

(assert (not b!211625))

(assert (not b!211630))

(assert (not b!211626))

(assert (not start!44430))

(assert (not b!211643))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71723 () Bool)

(assert (=> d!71723 (= (array_inv!4356 (buf!5141 thiss!1204)) (bvsge (size!4615 (buf!5141 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!211625 d!71723))

(declare-fun d!71725 () Bool)

(declare-fun e!144372 () Bool)

(assert (=> d!71725 e!144372))

(declare-fun res!177854 () Bool)

(assert (=> d!71725 (=> (not res!177854) (not e!144372))))

(declare-fun lt!333541 () (_ BitVec 64))

(declare-fun lt!333537 () (_ BitVec 64))

(declare-fun lt!333539 () (_ BitVec 64))

(assert (=> d!71725 (= res!177854 (= lt!333537 (bvsub lt!333539 lt!333541)))))

(assert (=> d!71725 (or (= (bvand lt!333539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333539 lt!333541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71725 (= lt!333541 (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333329))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333329)))))))

(declare-fun lt!333540 () (_ BitVec 64))

(declare-fun lt!333542 () (_ BitVec 64))

(assert (=> d!71725 (= lt!333539 (bvmul lt!333540 lt!333542))))

(assert (=> d!71725 (or (= lt!333540 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333542 (bvsdiv (bvmul lt!333540 lt!333542) lt!333540)))))

(assert (=> d!71725 (= lt!333542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71725 (= lt!333540 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))))))

(assert (=> d!71725 (= lt!333537 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333329))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333329)))))))

(assert (=> d!71725 (invariant!0 (currentBit!9696 (_2!9711 lt!333329)) (currentByte!9701 (_2!9711 lt!333329)) (size!4615 (buf!5141 (_2!9711 lt!333329))))))

(assert (=> d!71725 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333329))) (currentByte!9701 (_2!9711 lt!333329)) (currentBit!9696 (_2!9711 lt!333329))) lt!333537)))

(declare-fun b!211769 () Bool)

(declare-fun res!177853 () Bool)

(assert (=> b!211769 (=> (not res!177853) (not e!144372))))

(assert (=> b!211769 (= res!177853 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!333537))))

(declare-fun b!211770 () Bool)

(declare-fun lt!333538 () (_ BitVec 64))

(assert (=> b!211770 (= e!144372 (bvsle lt!333537 (bvmul lt!333538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211770 (or (= lt!333538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!333538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!333538)))))

(assert (=> b!211770 (= lt!333538 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))))))

(assert (= (and d!71725 res!177854) b!211769))

(assert (= (and b!211769 res!177853) b!211770))

(declare-fun m!326409 () Bool)

(assert (=> d!71725 m!326409))

(assert (=> d!71725 m!326185))

(assert (=> b!211642 d!71725))

(declare-fun d!71727 () Bool)

(declare-fun res!177863 () Bool)

(declare-fun e!144378 () Bool)

(assert (=> d!71727 (=> (not res!177863) (not e!144378))))

(assert (=> d!71727 (= res!177863 (= (size!4615 (buf!5141 thiss!1204)) (size!4615 (buf!5141 (_2!9711 lt!333329)))))))

(assert (=> d!71727 (= (isPrefixOf!0 thiss!1204 (_2!9711 lt!333329)) e!144378)))

(declare-fun b!211777 () Bool)

(declare-fun res!177861 () Bool)

(assert (=> b!211777 (=> (not res!177861) (not e!144378))))

(assert (=> b!211777 (= res!177861 (bvsle (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333329))) (currentByte!9701 (_2!9711 lt!333329)) (currentBit!9696 (_2!9711 lt!333329)))))))

(declare-fun b!211778 () Bool)

(declare-fun e!144377 () Bool)

(assert (=> b!211778 (= e!144378 e!144377)))

(declare-fun res!177862 () Bool)

(assert (=> b!211778 (=> res!177862 e!144377)))

(assert (=> b!211778 (= res!177862 (= (size!4615 (buf!5141 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211779 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10508 array!10508 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211779 (= e!144377 (arrayBitRangesEq!0 (buf!5141 thiss!1204) (buf!5141 (_2!9711 lt!333329)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204))))))

(assert (= (and d!71727 res!177863) b!211777))

(assert (= (and b!211777 res!177861) b!211778))

(assert (= (and b!211778 (not res!177862)) b!211779))

(assert (=> b!211777 m!326235))

(assert (=> b!211777 m!326193))

(assert (=> b!211779 m!326235))

(assert (=> b!211779 m!326235))

(declare-fun m!326411 () Bool)

(assert (=> b!211779 m!326411))

(assert (=> b!211642 d!71727))

(declare-fun d!71729 () Bool)

(assert (=> d!71729 (isPrefixOf!0 thiss!1204 (_2!9711 lt!333329))))

(declare-fun lt!333545 () Unit!15097)

(declare-fun choose!30 (BitStream!8338 BitStream!8338 BitStream!8338) Unit!15097)

(assert (=> d!71729 (= lt!333545 (choose!30 thiss!1204 (_2!9711 lt!333354) (_2!9711 lt!333329)))))

(assert (=> d!71729 (isPrefixOf!0 thiss!1204 (_2!9711 lt!333354))))

(assert (=> d!71729 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9711 lt!333354) (_2!9711 lt!333329)) lt!333545)))

(declare-fun bs!17601 () Bool)

(assert (= bs!17601 d!71729))

(assert (=> bs!17601 m!326195))

(declare-fun m!326413 () Bool)

(assert (=> bs!17601 m!326413))

(assert (=> bs!17601 m!326189))

(assert (=> b!211642 d!71729))

(declare-fun b!211833 () Bool)

(declare-fun e!144410 () Bool)

(declare-fun lt!333694 () tuple2!18114)

(declare-fun lt!333720 () tuple2!18112)

(assert (=> b!211833 (= e!144410 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333694))) (currentByte!9701 (_1!9712 lt!333694)) (currentBit!9696 (_1!9712 lt!333694))) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333720))) (currentByte!9701 (_2!9711 lt!333720)) (currentBit!9696 (_2!9711 lt!333720)))))))

(declare-fun b!211834 () Bool)

(declare-fun e!144415 () Bool)

(declare-fun lt!333703 () tuple2!18116)

(declare-fun lt!333696 () tuple2!18110)

(assert (=> b!211834 (= e!144415 (= (_1!9713 lt!333703) (_2!9710 lt!333696)))))

(declare-fun b!211835 () Bool)

(assert (=> b!211835 (= lt!333694 (readBitPure!0 (readerFrom!0 (_2!9711 lt!333720) (currentBit!9696 (_2!9711 lt!333354)) (currentByte!9701 (_2!9711 lt!333354)))))))

(declare-fun res!177913 () Bool)

(declare-fun lt!333707 () Bool)

(assert (=> b!211835 (= res!177913 (and (= (_2!9712 lt!333694) lt!333707) (= (_1!9712 lt!333694) (_2!9711 lt!333720))))))

(assert (=> b!211835 (=> (not res!177913) (not e!144410))))

(declare-fun e!144412 () Bool)

(assert (=> b!211835 (= e!144412 e!144410)))

(declare-fun b!211836 () Bool)

(declare-fun res!177909 () Bool)

(declare-fun e!144417 () Bool)

(assert (=> b!211836 (=> (not res!177909) (not e!144417))))

(declare-fun lt!333715 () tuple2!18112)

(assert (=> b!211836 (= res!177909 (isPrefixOf!0 (_2!9711 lt!333354) (_2!9711 lt!333715)))))

(declare-fun b!211837 () Bool)

(declare-fun e!144413 () Bool)

(declare-fun lt!333705 () (_ BitVec 64))

(assert (=> b!211837 (= e!144413 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333354)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333705))))

(declare-fun c!10424 () Bool)

(declare-fun bm!3333 () Bool)

(declare-fun call!3336 () Bool)

(assert (=> bm!3333 (= call!3336 (isPrefixOf!0 (_2!9711 lt!333354) (ite c!10424 (_2!9711 lt!333354) (_2!9711 lt!333720))))))

(declare-fun b!211838 () Bool)

(declare-fun res!177920 () Bool)

(assert (=> b!211838 (=> (not res!177920) (not e!144417))))

(declare-fun lt!333730 () (_ BitVec 64))

(declare-fun lt!333693 () (_ BitVec 64))

(assert (=> b!211838 (= res!177920 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333715))) (currentByte!9701 (_2!9711 lt!333715)) (currentBit!9696 (_2!9711 lt!333715))) (bvsub lt!333693 lt!333730)))))

(assert (=> b!211838 (or (= (bvand lt!333693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333693 lt!333730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211838 (= lt!333730 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!333680 () (_ BitVec 64))

(declare-fun lt!333729 () (_ BitVec 64))

(assert (=> b!211838 (= lt!333693 (bvadd lt!333680 lt!333729))))

(assert (=> b!211838 (or (not (= (bvand lt!333680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333729 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333680 lt!333729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211838 (= lt!333729 ((_ sign_extend 32) nBits!348))))

(assert (=> b!211838 (= lt!333680 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(declare-fun b!211839 () Bool)

(declare-fun e!144411 () Bool)

(declare-fun lt!333701 () tuple2!18116)

(declare-fun lt!333709 () tuple2!18110)

(assert (=> b!211839 (= e!144411 (= (_1!9713 lt!333701) (_2!9710 lt!333709)))))

(declare-fun b!211840 () Bool)

(declare-fun res!177919 () Bool)

(assert (=> b!211840 (= res!177919 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333720))) (currentByte!9701 (_2!9711 lt!333720)) (currentBit!9696 (_2!9711 lt!333720))) (bvadd (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!211840 (=> (not res!177919) (not e!144412))))

(declare-fun b!211841 () Bool)

(declare-fun e!144416 () (_ BitVec 64))

(assert (=> b!211841 (= e!144416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!211842 () Bool)

(assert (=> b!211842 (= e!144417 e!144415)))

(declare-fun res!177917 () Bool)

(assert (=> b!211842 (=> (not res!177917) (not e!144415))))

(assert (=> b!211842 (= res!177917 (= (_2!9713 lt!333703) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!211842 (= lt!333703 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333696) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!333704 () Unit!15097)

(declare-fun lt!333708 () Unit!15097)

(assert (=> b!211842 (= lt!333704 lt!333708)))

(assert (=> b!211842 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333715)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333705)))

(assert (=> b!211842 (= lt!333708 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9711 lt!333354) (buf!5141 (_2!9711 lt!333715)) lt!333705))))

(assert (=> b!211842 e!144413))

(declare-fun res!177918 () Bool)

(assert (=> b!211842 (=> (not res!177918) (not e!144413))))

(assert (=> b!211842 (= res!177918 (and (= (size!4615 (buf!5141 (_2!9711 lt!333354))) (size!4615 (buf!5141 (_2!9711 lt!333715)))) (bvsge lt!333705 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211842 (= lt!333705 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!211842 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!211842 (= lt!333696 (reader!0 (_2!9711 lt!333354) (_2!9711 lt!333715)))))

(declare-fun b!211843 () Bool)

(declare-fun res!177914 () Bool)

(assert (=> b!211843 (= res!177914 call!3336)))

(assert (=> b!211843 (=> (not res!177914) (not e!144412))))

(declare-fun b!211844 () Bool)

(declare-fun res!177916 () Bool)

(assert (=> b!211844 (=> (not res!177916) (not e!144417))))

(assert (=> b!211844 (= res!177916 (= (size!4615 (buf!5141 (_2!9711 lt!333354))) (size!4615 (buf!5141 (_2!9711 lt!333715)))))))

(declare-fun b!211845 () Bool)

(declare-fun e!144418 () Bool)

(declare-fun lt!333695 () tuple2!18114)

(declare-fun lt!333723 () tuple2!18114)

(assert (=> b!211845 (= e!144418 (= (_2!9712 lt!333695) (_2!9712 lt!333723)))))

(declare-fun b!211846 () Bool)

(declare-fun e!144414 () tuple2!18112)

(declare-fun lt!333725 () tuple2!18112)

(assert (=> b!211846 (= e!144414 (tuple2!18113 (_1!9711 lt!333725) (_2!9711 lt!333725)))))

(assert (=> b!211846 (= lt!333707 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211846 (= lt!333720 (appendBit!0 (_2!9711 lt!333354) lt!333707))))

(declare-fun res!177910 () Bool)

(assert (=> b!211846 (= res!177910 (= (size!4615 (buf!5141 (_2!9711 lt!333354))) (size!4615 (buf!5141 (_2!9711 lt!333720)))))))

(assert (=> b!211846 (=> (not res!177910) (not e!144412))))

(assert (=> b!211846 e!144412))

(declare-fun lt!333734 () tuple2!18112)

(assert (=> b!211846 (= lt!333734 lt!333720)))

(assert (=> b!211846 (= lt!333725 (appendBitsLSBFirstLoopTR!0 (_2!9711 lt!333734) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!333698 () Unit!15097)

(assert (=> b!211846 (= lt!333698 (lemmaIsPrefixTransitive!0 (_2!9711 lt!333354) (_2!9711 lt!333734) (_2!9711 lt!333725)))))

(assert (=> b!211846 (isPrefixOf!0 (_2!9711 lt!333354) (_2!9711 lt!333725))))

(declare-fun lt!333710 () Unit!15097)

(assert (=> b!211846 (= lt!333710 lt!333698)))

(assert (=> b!211846 (invariant!0 (currentBit!9696 (_2!9711 lt!333354)) (currentByte!9701 (_2!9711 lt!333354)) (size!4615 (buf!5141 (_2!9711 lt!333734))))))

(declare-fun lt!333713 () BitStream!8338)

(assert (=> b!211846 (= lt!333713 (BitStream!8339 (buf!5141 (_2!9711 lt!333734)) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(assert (=> b!211846 (invariant!0 (currentBit!9696 lt!333713) (currentByte!9701 lt!333713) (size!4615 (buf!5141 (_2!9711 lt!333725))))))

(declare-fun lt!333712 () BitStream!8338)

(assert (=> b!211846 (= lt!333712 (BitStream!8339 (buf!5141 (_2!9711 lt!333725)) (currentByte!9701 lt!333713) (currentBit!9696 lt!333713)))))

(assert (=> b!211846 (= lt!333695 (readBitPure!0 lt!333713))))

(assert (=> b!211846 (= lt!333723 (readBitPure!0 lt!333712))))

(declare-fun lt!333706 () Unit!15097)

(assert (=> b!211846 (= lt!333706 (readBitPrefixLemma!0 lt!333713 (_2!9711 lt!333725)))))

(declare-fun res!177915 () Bool)

(assert (=> b!211846 (= res!177915 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333695))) (currentByte!9701 (_1!9712 lt!333695)) (currentBit!9696 (_1!9712 lt!333695))) (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333723))) (currentByte!9701 (_1!9712 lt!333723)) (currentBit!9696 (_1!9712 lt!333723)))))))

(assert (=> b!211846 (=> (not res!177915) (not e!144418))))

(assert (=> b!211846 e!144418))

(declare-fun lt!333684 () Unit!15097)

(assert (=> b!211846 (= lt!333684 lt!333706)))

(declare-fun lt!333700 () tuple2!18110)

(assert (=> b!211846 (= lt!333700 (reader!0 (_2!9711 lt!333354) (_2!9711 lt!333725)))))

(declare-fun lt!333683 () tuple2!18110)

(assert (=> b!211846 (= lt!333683 (reader!0 (_2!9711 lt!333734) (_2!9711 lt!333725)))))

(declare-fun lt!333686 () tuple2!18114)

(assert (=> b!211846 (= lt!333686 (readBitPure!0 (_1!9710 lt!333700)))))

(assert (=> b!211846 (= (_2!9712 lt!333686) lt!333707)))

(declare-fun lt!333689 () Unit!15097)

(declare-fun Unit!15103 () Unit!15097)

(assert (=> b!211846 (= lt!333689 Unit!15103)))

(declare-fun lt!333733 () (_ BitVec 64))

(assert (=> b!211846 (= lt!333733 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333719 () (_ BitVec 64))

(assert (=> b!211846 (= lt!333719 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333685 () Unit!15097)

(assert (=> b!211846 (= lt!333685 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9711 lt!333354) (buf!5141 (_2!9711 lt!333725)) lt!333719))))

(assert (=> b!211846 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333725)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333719)))

(declare-fun lt!333711 () Unit!15097)

(assert (=> b!211846 (= lt!333711 lt!333685)))

(declare-fun lt!333688 () tuple2!18116)

(assert (=> b!211846 (= lt!333688 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333733))))

(declare-fun lt!333690 () (_ BitVec 64))

(assert (=> b!211846 (= lt!333690 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!333732 () Unit!15097)

(assert (=> b!211846 (= lt!333732 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9711 lt!333734) (buf!5141 (_2!9711 lt!333725)) lt!333690))))

(assert (=> b!211846 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333725)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333734))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333734))) lt!333690)))

(declare-fun lt!333721 () Unit!15097)

(assert (=> b!211846 (= lt!333721 lt!333732)))

(declare-fun lt!333716 () tuple2!18116)

(assert (=> b!211846 (= lt!333716 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333683) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333733 (ite (_2!9712 lt!333686) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!333682 () tuple2!18116)

(assert (=> b!211846 (= lt!333682 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333733))))

(declare-fun c!10423 () Bool)

(assert (=> b!211846 (= c!10423 (_2!9712 (readBitPure!0 (_1!9710 lt!333700))))))

(declare-fun lt!333679 () tuple2!18116)

(assert (=> b!211846 (= lt!333679 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9710 lt!333700) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333733 e!144416)))))

(declare-fun lt!333691 () Unit!15097)

(assert (=> b!211846 (= lt!333691 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9710 lt!333700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333733))))

(assert (=> b!211846 (and (= (_2!9713 lt!333682) (_2!9713 lt!333679)) (= (_1!9713 lt!333682) (_1!9713 lt!333679)))))

(declare-fun lt!333717 () Unit!15097)

(assert (=> b!211846 (= lt!333717 lt!333691)))

(assert (=> b!211846 (= (_1!9710 lt!333700) (withMovedBitIndex!0 (_2!9710 lt!333700) (bvsub (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333725))) (currentByte!9701 (_2!9711 lt!333725)) (currentBit!9696 (_2!9711 lt!333725))))))))

(declare-fun lt!333687 () Unit!15097)

(declare-fun Unit!15104 () Unit!15097)

(assert (=> b!211846 (= lt!333687 Unit!15104)))

(assert (=> b!211846 (= (_1!9710 lt!333683) (withMovedBitIndex!0 (_2!9710 lt!333683) (bvsub (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333734))) (currentByte!9701 (_2!9711 lt!333734)) (currentBit!9696 (_2!9711 lt!333734))) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333725))) (currentByte!9701 (_2!9711 lt!333725)) (currentBit!9696 (_2!9711 lt!333725))))))))

(declare-fun lt!333718 () Unit!15097)

(declare-fun Unit!15105 () Unit!15097)

(assert (=> b!211846 (= lt!333718 Unit!15105)))

(assert (=> b!211846 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))) (bvsub (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333734))) (currentByte!9701 (_2!9711 lt!333734)) (currentBit!9696 (_2!9711 lt!333734))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!333697 () Unit!15097)

(declare-fun Unit!15106 () Unit!15097)

(assert (=> b!211846 (= lt!333697 Unit!15106)))

(assert (=> b!211846 (= (_2!9713 lt!333688) (_2!9713 lt!333716))))

(declare-fun lt!333724 () Unit!15097)

(declare-fun Unit!15107 () Unit!15097)

(assert (=> b!211846 (= lt!333724 Unit!15107)))

(assert (=> b!211846 (invariant!0 (currentBit!9696 (_2!9711 lt!333725)) (currentByte!9701 (_2!9711 lt!333725)) (size!4615 (buf!5141 (_2!9711 lt!333725))))))

(declare-fun lt!333702 () Unit!15097)

(declare-fun Unit!15108 () Unit!15097)

(assert (=> b!211846 (= lt!333702 Unit!15108)))

(assert (=> b!211846 (= (size!4615 (buf!5141 (_2!9711 lt!333354))) (size!4615 (buf!5141 (_2!9711 lt!333725))))))

(declare-fun lt!333692 () Unit!15097)

(declare-fun Unit!15109 () Unit!15097)

(assert (=> b!211846 (= lt!333692 Unit!15109)))

(assert (=> b!211846 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333725))) (currentByte!9701 (_2!9711 lt!333725)) (currentBit!9696 (_2!9711 lt!333725))) (bvsub (bvadd (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333731 () Unit!15097)

(declare-fun Unit!15110 () Unit!15097)

(assert (=> b!211846 (= lt!333731 Unit!15110)))

(declare-fun lt!333714 () Unit!15097)

(declare-fun Unit!15111 () Unit!15097)

(assert (=> b!211846 (= lt!333714 Unit!15111)))

(assert (=> b!211846 (= lt!333709 (reader!0 (_2!9711 lt!333354) (_2!9711 lt!333725)))))

(declare-fun lt!333728 () (_ BitVec 64))

(assert (=> b!211846 (= lt!333728 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333681 () Unit!15097)

(assert (=> b!211846 (= lt!333681 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9711 lt!333354) (buf!5141 (_2!9711 lt!333725)) lt!333728))))

(assert (=> b!211846 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333725)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333728)))

(declare-fun lt!333722 () Unit!15097)

(assert (=> b!211846 (= lt!333722 lt!333681)))

(assert (=> b!211846 (= lt!333701 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333709) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177911 () Bool)

(assert (=> b!211846 (= res!177911 (= (_2!9713 lt!333701) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!211846 (=> (not res!177911) (not e!144411))))

(assert (=> b!211846 e!144411))

(declare-fun lt!333727 () Unit!15097)

(declare-fun Unit!15112 () Unit!15097)

(assert (=> b!211846 (= lt!333727 Unit!15112)))

(declare-fun b!211847 () Bool)

(assert (=> b!211847 (= e!144416 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!71731 () Bool)

(assert (=> d!71731 e!144417))

(declare-fun res!177912 () Bool)

(assert (=> d!71731 (=> (not res!177912) (not e!144417))))

(assert (=> d!71731 (= res!177912 (invariant!0 (currentBit!9696 (_2!9711 lt!333715)) (currentByte!9701 (_2!9711 lt!333715)) (size!4615 (buf!5141 (_2!9711 lt!333715)))))))

(assert (=> d!71731 (= lt!333715 e!144414)))

(assert (=> d!71731 (= c!10424 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71731 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71731 (= (appendBitsLSBFirstLoopTR!0 (_2!9711 lt!333354) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!333715)))

(declare-fun b!211848 () Bool)

(declare-fun Unit!15113 () Unit!15097)

(assert (=> b!211848 (= e!144414 (tuple2!18113 Unit!15113 (_2!9711 lt!333354)))))

(declare-fun lt!333699 () Unit!15097)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8338) Unit!15097)

(assert (=> b!211848 (= lt!333699 (lemmaIsPrefixRefl!0 (_2!9711 lt!333354)))))

(assert (=> b!211848 call!3336))

(declare-fun lt!333726 () Unit!15097)

(assert (=> b!211848 (= lt!333726 lt!333699)))

(assert (= (and d!71731 c!10424) b!211848))

(assert (= (and d!71731 (not c!10424)) b!211846))

(assert (= (and b!211846 res!177910) b!211840))

(assert (= (and b!211840 res!177919) b!211843))

(assert (= (and b!211843 res!177914) b!211835))

(assert (= (and b!211835 res!177913) b!211833))

(assert (= (and b!211846 res!177915) b!211845))

(assert (= (and b!211846 c!10423) b!211847))

(assert (= (and b!211846 (not c!10423)) b!211841))

(assert (= (and b!211846 res!177911) b!211839))

(assert (= (or b!211848 b!211843) bm!3333))

(assert (= (and d!71731 res!177912) b!211844))

(assert (= (and b!211844 res!177916) b!211838))

(assert (= (and b!211838 res!177920) b!211836))

(assert (= (and b!211836 res!177909) b!211842))

(assert (= (and b!211842 res!177918) b!211837))

(assert (= (and b!211842 res!177917) b!211834))

(declare-fun m!326427 () Bool)

(assert (=> b!211848 m!326427))

(declare-fun m!326429 () Bool)

(assert (=> b!211837 m!326429))

(declare-fun m!326431 () Bool)

(assert (=> b!211846 m!326431))

(declare-fun m!326433 () Bool)

(assert (=> b!211846 m!326433))

(declare-fun m!326435 () Bool)

(assert (=> b!211846 m!326435))

(declare-fun m!326437 () Bool)

(assert (=> b!211846 m!326437))

(declare-fun m!326439 () Bool)

(assert (=> b!211846 m!326439))

(declare-fun m!326441 () Bool)

(assert (=> b!211846 m!326441))

(declare-fun m!326443 () Bool)

(assert (=> b!211846 m!326443))

(declare-fun m!326445 () Bool)

(assert (=> b!211846 m!326445))

(declare-fun m!326447 () Bool)

(assert (=> b!211846 m!326447))

(declare-fun m!326449 () Bool)

(assert (=> b!211846 m!326449))

(declare-fun m!326451 () Bool)

(assert (=> b!211846 m!326451))

(declare-fun m!326453 () Bool)

(assert (=> b!211846 m!326453))

(declare-fun m!326455 () Bool)

(assert (=> b!211846 m!326455))

(declare-fun m!326457 () Bool)

(assert (=> b!211846 m!326457))

(declare-fun m!326459 () Bool)

(assert (=> b!211846 m!326459))

(declare-fun m!326461 () Bool)

(assert (=> b!211846 m!326461))

(declare-fun m!326463 () Bool)

(assert (=> b!211846 m!326463))

(declare-fun m!326465 () Bool)

(assert (=> b!211846 m!326465))

(declare-fun m!326467 () Bool)

(assert (=> b!211846 m!326467))

(declare-fun m!326469 () Bool)

(assert (=> b!211846 m!326469))

(declare-fun m!326471 () Bool)

(assert (=> b!211846 m!326471))

(declare-fun m!326473 () Bool)

(assert (=> b!211846 m!326473))

(declare-fun m!326475 () Bool)

(assert (=> b!211846 m!326475))

(declare-fun m!326477 () Bool)

(assert (=> b!211846 m!326477))

(declare-fun m!326479 () Bool)

(assert (=> b!211846 m!326479))

(declare-fun m!326481 () Bool)

(assert (=> b!211846 m!326481))

(assert (=> b!211846 m!326473))

(declare-fun m!326483 () Bool)

(assert (=> b!211846 m!326483))

(declare-fun m!326485 () Bool)

(assert (=> b!211846 m!326485))

(declare-fun m!326487 () Bool)

(assert (=> b!211846 m!326487))

(assert (=> b!211846 m!326233))

(declare-fun m!326489 () Bool)

(assert (=> b!211846 m!326489))

(declare-fun m!326491 () Bool)

(assert (=> b!211846 m!326491))

(declare-fun m!326493 () Bool)

(assert (=> b!211846 m!326493))

(declare-fun m!326495 () Bool)

(assert (=> b!211846 m!326495))

(declare-fun m!326497 () Bool)

(assert (=> d!71731 m!326497))

(declare-fun m!326499 () Bool)

(assert (=> b!211842 m!326499))

(declare-fun m!326501 () Bool)

(assert (=> b!211842 m!326501))

(declare-fun m!326503 () Bool)

(assert (=> b!211842 m!326503))

(assert (=> b!211842 m!326477))

(assert (=> b!211842 m!326489))

(declare-fun m!326505 () Bool)

(assert (=> b!211842 m!326505))

(declare-fun m!326507 () Bool)

(assert (=> b!211838 m!326507))

(assert (=> b!211838 m!326233))

(declare-fun m!326509 () Bool)

(assert (=> b!211836 m!326509))

(declare-fun m!326511 () Bool)

(assert (=> b!211840 m!326511))

(assert (=> b!211840 m!326233))

(declare-fun m!326513 () Bool)

(assert (=> b!211835 m!326513))

(assert (=> b!211835 m!326513))

(declare-fun m!326515 () Bool)

(assert (=> b!211835 m!326515))

(declare-fun m!326517 () Bool)

(assert (=> b!211833 m!326517))

(assert (=> b!211833 m!326511))

(declare-fun m!326519 () Bool)

(assert (=> bm!3333 m!326519))

(assert (=> b!211642 d!71731))

(declare-fun d!71753 () Bool)

(declare-fun res!177923 () Bool)

(declare-fun e!144420 () Bool)

(assert (=> d!71753 (=> (not res!177923) (not e!144420))))

(assert (=> d!71753 (= res!177923 (= (size!4615 (buf!5141 (_2!9711 lt!333354))) (size!4615 (buf!5141 (_2!9711 lt!333329)))))))

(assert (=> d!71753 (= (isPrefixOf!0 (_2!9711 lt!333354) (_2!9711 lt!333329)) e!144420)))

(declare-fun b!211849 () Bool)

(declare-fun res!177921 () Bool)

(assert (=> b!211849 (=> (not res!177921) (not e!144420))))

(assert (=> b!211849 (= res!177921 (bvsle (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333329))) (currentByte!9701 (_2!9711 lt!333329)) (currentBit!9696 (_2!9711 lt!333329)))))))

(declare-fun b!211850 () Bool)

(declare-fun e!144419 () Bool)

(assert (=> b!211850 (= e!144420 e!144419)))

(declare-fun res!177922 () Bool)

(assert (=> b!211850 (=> res!177922 e!144419)))

(assert (=> b!211850 (= res!177922 (= (size!4615 (buf!5141 (_2!9711 lt!333354))) #b00000000000000000000000000000000))))

(declare-fun b!211851 () Bool)

(assert (=> b!211851 (= e!144419 (arrayBitRangesEq!0 (buf!5141 (_2!9711 lt!333354)) (buf!5141 (_2!9711 lt!333329)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354)))))))

(assert (= (and d!71753 res!177923) b!211849))

(assert (= (and b!211849 res!177921) b!211850))

(assert (= (and b!211850 (not res!177922)) b!211851))

(assert (=> b!211849 m!326233))

(assert (=> b!211849 m!326193))

(assert (=> b!211851 m!326233))

(assert (=> b!211851 m!326233))

(declare-fun m!326521 () Bool)

(assert (=> b!211851 m!326521))

(assert (=> b!211631 d!71753))

(declare-fun d!71755 () Bool)

(declare-fun res!177926 () Bool)

(declare-fun e!144422 () Bool)

(assert (=> d!71755 (=> (not res!177926) (not e!144422))))

(assert (=> d!71755 (= res!177926 (= (size!4615 (buf!5141 thiss!1204)) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(assert (=> d!71755 (= (isPrefixOf!0 thiss!1204 (_2!9711 lt!333354)) e!144422)))

(declare-fun b!211852 () Bool)

(declare-fun res!177924 () Bool)

(assert (=> b!211852 (=> (not res!177924) (not e!144422))))

(assert (=> b!211852 (= res!177924 (bvsle (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354)))))))

(declare-fun b!211853 () Bool)

(declare-fun e!144421 () Bool)

(assert (=> b!211853 (= e!144422 e!144421)))

(declare-fun res!177925 () Bool)

(assert (=> b!211853 (=> res!177925 e!144421)))

(assert (=> b!211853 (= res!177925 (= (size!4615 (buf!5141 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211854 () Bool)

(assert (=> b!211854 (= e!144421 (arrayBitRangesEq!0 (buf!5141 thiss!1204) (buf!5141 (_2!9711 lt!333354)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204))))))

(assert (= (and d!71755 res!177926) b!211852))

(assert (= (and b!211852 res!177924) b!211853))

(assert (= (and b!211853 (not res!177925)) b!211854))

(assert (=> b!211852 m!326235))

(assert (=> b!211852 m!326233))

(assert (=> b!211854 m!326235))

(assert (=> b!211854 m!326235))

(declare-fun m!326523 () Bool)

(assert (=> b!211854 m!326523))

(assert (=> b!211632 d!71755))

(declare-fun d!71757 () Bool)

(declare-fun e!144423 () Bool)

(assert (=> d!71757 e!144423))

(declare-fun res!177928 () Bool)

(assert (=> d!71757 (=> (not res!177928) (not e!144423))))

(declare-fun lt!333737 () (_ BitVec 64))

(declare-fun lt!333735 () (_ BitVec 64))

(declare-fun lt!333739 () (_ BitVec 64))

(assert (=> d!71757 (= res!177928 (= lt!333735 (bvsub lt!333737 lt!333739)))))

(assert (=> d!71757 (or (= (bvand lt!333737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333739 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333737 lt!333739) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71757 (= lt!333739 (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333354)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354)))))))

(declare-fun lt!333738 () (_ BitVec 64))

(declare-fun lt!333740 () (_ BitVec 64))

(assert (=> d!71757 (= lt!333737 (bvmul lt!333738 lt!333740))))

(assert (=> d!71757 (or (= lt!333738 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333740 (bvsdiv (bvmul lt!333738 lt!333740) lt!333738)))))

(assert (=> d!71757 (= lt!333740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71757 (= lt!333738 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(assert (=> d!71757 (= lt!333735 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354)))))))

(assert (=> d!71757 (invariant!0 (currentBit!9696 (_2!9711 lt!333354)) (currentByte!9701 (_2!9711 lt!333354)) (size!4615 (buf!5141 (_2!9711 lt!333354))))))

(assert (=> d!71757 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))) lt!333735)))

(declare-fun b!211855 () Bool)

(declare-fun res!177927 () Bool)

(assert (=> b!211855 (=> (not res!177927) (not e!144423))))

(assert (=> b!211855 (= res!177927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!333735))))

(declare-fun b!211856 () Bool)

(declare-fun lt!333736 () (_ BitVec 64))

(assert (=> b!211856 (= e!144423 (bvsle lt!333735 (bvmul lt!333736 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211856 (or (= lt!333736 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!333736 #b0000000000000000000000000000000000000000000000000000000000001000) lt!333736)))))

(assert (=> b!211856 (= lt!333736 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(assert (= (and d!71757 res!177928) b!211855))

(assert (= (and b!211855 res!177927) b!211856))

(declare-fun m!326525 () Bool)

(assert (=> d!71757 m!326525))

(declare-fun m!326527 () Bool)

(assert (=> d!71757 m!326527))

(assert (=> b!211643 d!71757))

(declare-fun d!71759 () Bool)

(declare-fun e!144424 () Bool)

(assert (=> d!71759 e!144424))

(declare-fun res!177930 () Bool)

(assert (=> d!71759 (=> (not res!177930) (not e!144424))))

(declare-fun lt!333741 () (_ BitVec 64))

(declare-fun lt!333745 () (_ BitVec 64))

(declare-fun lt!333743 () (_ BitVec 64))

(assert (=> d!71759 (= res!177930 (= lt!333741 (bvsub lt!333743 lt!333745)))))

(assert (=> d!71759 (or (= (bvand lt!333743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333743 lt!333745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71759 (= lt!333745 (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204))))))

(declare-fun lt!333744 () (_ BitVec 64))

(declare-fun lt!333746 () (_ BitVec 64))

(assert (=> d!71759 (= lt!333743 (bvmul lt!333744 lt!333746))))

(assert (=> d!71759 (or (= lt!333744 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333746 (bvsdiv (bvmul lt!333744 lt!333746) lt!333744)))))

(assert (=> d!71759 (= lt!333746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71759 (= lt!333744 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))))))

(assert (=> d!71759 (= lt!333741 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9701 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9696 thiss!1204))))))

(assert (=> d!71759 (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 thiss!1204)))))

(assert (=> d!71759 (= (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)) lt!333741)))

(declare-fun b!211857 () Bool)

(declare-fun res!177929 () Bool)

(assert (=> b!211857 (=> (not res!177929) (not e!144424))))

(assert (=> b!211857 (= res!177929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!333741))))

(declare-fun b!211858 () Bool)

(declare-fun lt!333742 () (_ BitVec 64))

(assert (=> b!211858 (= e!144424 (bvsle lt!333741 (bvmul lt!333742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211858 (or (= lt!333742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!333742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!333742)))))

(assert (=> b!211858 (= lt!333742 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))))))

(assert (= (and d!71759 res!177930) b!211857))

(assert (= (and b!211857 res!177929) b!211858))

(declare-fun m!326529 () Bool)

(assert (=> d!71759 m!326529))

(assert (=> d!71759 m!326251))

(assert (=> b!211643 d!71759))

(declare-fun d!71761 () Bool)

(declare-fun e!144429 () Bool)

(assert (=> d!71761 e!144429))

(declare-fun res!177939 () Bool)

(assert (=> d!71761 (=> (not res!177939) (not e!144429))))

(declare-fun lt!333758 () tuple2!18112)

(assert (=> d!71761 (= res!177939 (= (size!4615 (buf!5141 thiss!1204)) (size!4615 (buf!5141 (_2!9711 lt!333758)))))))

(declare-fun choose!16 (BitStream!8338 Bool) tuple2!18112)

(assert (=> d!71761 (= lt!333758 (choose!16 thiss!1204 lt!333336))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71761 (validate_offset_bit!0 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204)))))

(assert (=> d!71761 (= (appendBit!0 thiss!1204 lt!333336) lt!333758)))

(declare-fun b!211869 () Bool)

(declare-fun res!177942 () Bool)

(assert (=> b!211869 (=> (not res!177942) (not e!144429))))

(assert (=> b!211869 (= res!177942 (isPrefixOf!0 thiss!1204 (_2!9711 lt!333758)))))

(declare-fun b!211871 () Bool)

(declare-fun e!144430 () Bool)

(declare-fun lt!333757 () tuple2!18114)

(assert (=> b!211871 (= e!144430 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333757))) (currentByte!9701 (_1!9712 lt!333757)) (currentBit!9696 (_1!9712 lt!333757))) (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333758))) (currentByte!9701 (_2!9711 lt!333758)) (currentBit!9696 (_2!9711 lt!333758)))))))

(declare-fun b!211870 () Bool)

(assert (=> b!211870 (= e!144429 e!144430)))

(declare-fun res!177940 () Bool)

(assert (=> b!211870 (=> (not res!177940) (not e!144430))))

(assert (=> b!211870 (= res!177940 (and (= (_2!9712 lt!333757) lt!333336) (= (_1!9712 lt!333757) (_2!9711 lt!333758))))))

(assert (=> b!211870 (= lt!333757 (readBitPure!0 (readerFrom!0 (_2!9711 lt!333758) (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204))))))

(declare-fun b!211868 () Bool)

(declare-fun res!177941 () Bool)

(assert (=> b!211868 (=> (not res!177941) (not e!144429))))

(declare-fun lt!333755 () (_ BitVec 64))

(declare-fun lt!333756 () (_ BitVec 64))

(assert (=> b!211868 (= res!177941 (= (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333758))) (currentByte!9701 (_2!9711 lt!333758)) (currentBit!9696 (_2!9711 lt!333758))) (bvadd lt!333756 lt!333755)))))

(assert (=> b!211868 (or (not (= (bvand lt!333756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333755 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333756 lt!333755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211868 (= lt!333755 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!211868 (= lt!333756 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(assert (= (and d!71761 res!177939) b!211868))

(assert (= (and b!211868 res!177941) b!211869))

(assert (= (and b!211869 res!177942) b!211870))

(assert (= (and b!211870 res!177940) b!211871))

(declare-fun m!326531 () Bool)

(assert (=> d!71761 m!326531))

(declare-fun m!326533 () Bool)

(assert (=> d!71761 m!326533))

(declare-fun m!326535 () Bool)

(assert (=> b!211871 m!326535))

(declare-fun m!326537 () Bool)

(assert (=> b!211871 m!326537))

(declare-fun m!326539 () Bool)

(assert (=> b!211870 m!326539))

(assert (=> b!211870 m!326539))

(declare-fun m!326541 () Bool)

(assert (=> b!211870 m!326541))

(assert (=> b!211868 m!326537))

(assert (=> b!211868 m!326235))

(declare-fun m!326543 () Bool)

(assert (=> b!211869 m!326543))

(assert (=> b!211643 d!71761))

(declare-fun d!71763 () Bool)

(declare-fun e!144433 () Bool)

(assert (=> d!71763 e!144433))

(declare-fun res!177945 () Bool)

(assert (=> d!71763 (=> (not res!177945) (not e!144433))))

(declare-fun lt!333764 () (_ BitVec 64))

(declare-fun lt!333763 () BitStream!8338)

(assert (=> d!71763 (= res!177945 (= (bvadd lt!333764 (bvsub lt!333338 lt!333333)) (bitIndex!0 (size!4615 (buf!5141 lt!333763)) (currentByte!9701 lt!333763) (currentBit!9696 lt!333763))))))

(assert (=> d!71763 (or (not (= (bvand lt!333764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333338 lt!333333) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333764 (bvsub lt!333338 lt!333333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71763 (= lt!333764 (bitIndex!0 (size!4615 (buf!5141 (_2!9710 lt!333355))) (currentByte!9701 (_2!9710 lt!333355)) (currentBit!9696 (_2!9710 lt!333355))))))

(declare-fun moveBitIndex!0 (BitStream!8338 (_ BitVec 64)) tuple2!18112)

(assert (=> d!71763 (= lt!333763 (_2!9711 (moveBitIndex!0 (_2!9710 lt!333355) (bvsub lt!333338 lt!333333))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8338 (_ BitVec 64)) Bool)

(assert (=> d!71763 (moveBitIndexPrecond!0 (_2!9710 lt!333355) (bvsub lt!333338 lt!333333))))

(assert (=> d!71763 (= (withMovedBitIndex!0 (_2!9710 lt!333355) (bvsub lt!333338 lt!333333)) lt!333763)))

(declare-fun b!211874 () Bool)

(assert (=> b!211874 (= e!144433 (= (size!4615 (buf!5141 (_2!9710 lt!333355))) (size!4615 (buf!5141 lt!333763))))))

(assert (= (and d!71763 res!177945) b!211874))

(declare-fun m!326545 () Bool)

(assert (=> d!71763 m!326545))

(declare-fun m!326547 () Bool)

(assert (=> d!71763 m!326547))

(declare-fun m!326549 () Bool)

(assert (=> d!71763 m!326549))

(declare-fun m!326551 () Bool)

(assert (=> d!71763 m!326551))

(assert (=> b!211644 d!71763))

(declare-fun d!71765 () Bool)

(assert (=> d!71765 (= (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 thiss!1204))) (and (bvsge (currentBit!9696 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9696 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9701 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9701 thiss!1204) (size!4615 (buf!5141 thiss!1204))) (and (= (currentBit!9696 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9701 thiss!1204) (size!4615 (buf!5141 thiss!1204)))))))))

(assert (=> b!211633 d!71765))

(declare-fun d!71767 () Bool)

(assert (=> d!71767 (= (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333329)))) (and (bvsge (currentBit!9696 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9696 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9701 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333329)))) (and (= (currentBit!9696 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333329))))))))))

(assert (=> b!211639 d!71767))

(declare-datatypes ((tuple2!18134 0))(
  ( (tuple2!18135 (_1!9722 (_ BitVec 64)) (_2!9722 BitStream!8338)) )
))
(declare-fun lt!333781 () tuple2!18134)

(declare-fun d!71769 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18134)

(assert (=> d!71769 (= lt!333781 (readNBitsLSBFirstsLoop!0 (_1!9710 lt!333351) nBits!348 i!590 lt!333332))))

(assert (=> d!71769 (= (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333351) nBits!348 i!590 lt!333332) (tuple2!18117 (_2!9722 lt!333781) (_1!9722 lt!333781)))))

(declare-fun bs!17604 () Bool)

(assert (= bs!17604 d!71769))

(declare-fun m!326553 () Bool)

(assert (=> bs!17604 m!326553))

(assert (=> b!211640 d!71769))

(declare-fun d!71771 () Bool)

(assert (=> d!71771 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!211640 d!71771))

(declare-fun b!211933 () Bool)

(declare-fun res!177988 () Bool)

(declare-fun e!144466 () Bool)

(assert (=> b!211933 (=> (not res!177988) (not e!144466))))

(declare-fun lt!333992 () tuple2!18110)

(assert (=> b!211933 (= res!177988 (isPrefixOf!0 (_2!9710 lt!333992) (_2!9711 lt!333329)))))

(declare-fun b!211934 () Bool)

(declare-fun e!144465 () Unit!15097)

(declare-fun Unit!15114 () Unit!15097)

(assert (=> b!211934 (= e!144465 Unit!15114)))

(declare-fun b!211935 () Bool)

(declare-fun res!177989 () Bool)

(assert (=> b!211935 (=> (not res!177989) (not e!144466))))

(assert (=> b!211935 (= res!177989 (isPrefixOf!0 (_1!9710 lt!333992) thiss!1204))))

(declare-fun lt!333995 () (_ BitVec 64))

(declare-fun lt!333986 () (_ BitVec 64))

(declare-fun b!211936 () Bool)

(assert (=> b!211936 (= e!144466 (= (_1!9710 lt!333992) (withMovedBitIndex!0 (_2!9710 lt!333992) (bvsub lt!333995 lt!333986))))))

(assert (=> b!211936 (or (= (bvand lt!333995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333995 lt!333986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211936 (= lt!333986 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333329))) (currentByte!9701 (_2!9711 lt!333329)) (currentBit!9696 (_2!9711 lt!333329))))))

(assert (=> b!211936 (= lt!333995 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(declare-fun b!211937 () Bool)

(declare-fun lt!333983 () Unit!15097)

(assert (=> b!211937 (= e!144465 lt!333983)))

(declare-fun lt!333984 () (_ BitVec 64))

(assert (=> b!211937 (= lt!333984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!333990 () (_ BitVec 64))

(assert (=> b!211937 (= lt!333990 (bitIndex!0 (size!4615 (buf!5141 thiss!1204)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10508 array!10508 (_ BitVec 64) (_ BitVec 64)) Unit!15097)

(assert (=> b!211937 (= lt!333983 (arrayBitRangesEqSymmetric!0 (buf!5141 thiss!1204) (buf!5141 (_2!9711 lt!333329)) lt!333984 lt!333990))))

(assert (=> b!211937 (arrayBitRangesEq!0 (buf!5141 (_2!9711 lt!333329)) (buf!5141 thiss!1204) lt!333984 lt!333990)))

(declare-fun d!71773 () Bool)

(assert (=> d!71773 e!144466))

(declare-fun res!177990 () Bool)

(assert (=> d!71773 (=> (not res!177990) (not e!144466))))

(assert (=> d!71773 (= res!177990 (isPrefixOf!0 (_1!9710 lt!333992) (_2!9710 lt!333992)))))

(declare-fun lt!333991 () BitStream!8338)

(assert (=> d!71773 (= lt!333992 (tuple2!18111 lt!333991 (_2!9711 lt!333329)))))

(declare-fun lt!333993 () Unit!15097)

(declare-fun lt!333981 () Unit!15097)

(assert (=> d!71773 (= lt!333993 lt!333981)))

(assert (=> d!71773 (isPrefixOf!0 lt!333991 (_2!9711 lt!333329))))

(assert (=> d!71773 (= lt!333981 (lemmaIsPrefixTransitive!0 lt!333991 (_2!9711 lt!333329) (_2!9711 lt!333329)))))

(declare-fun lt!333982 () Unit!15097)

(declare-fun lt!333976 () Unit!15097)

(assert (=> d!71773 (= lt!333982 lt!333976)))

(assert (=> d!71773 (isPrefixOf!0 lt!333991 (_2!9711 lt!333329))))

(assert (=> d!71773 (= lt!333976 (lemmaIsPrefixTransitive!0 lt!333991 thiss!1204 (_2!9711 lt!333329)))))

(declare-fun lt!333980 () Unit!15097)

(assert (=> d!71773 (= lt!333980 e!144465)))

(declare-fun c!10433 () Bool)

(assert (=> d!71773 (= c!10433 (not (= (size!4615 (buf!5141 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!333978 () Unit!15097)

(declare-fun lt!333988 () Unit!15097)

(assert (=> d!71773 (= lt!333978 lt!333988)))

(assert (=> d!71773 (isPrefixOf!0 (_2!9711 lt!333329) (_2!9711 lt!333329))))

(assert (=> d!71773 (= lt!333988 (lemmaIsPrefixRefl!0 (_2!9711 lt!333329)))))

(declare-fun lt!333994 () Unit!15097)

(declare-fun lt!333977 () Unit!15097)

(assert (=> d!71773 (= lt!333994 lt!333977)))

(assert (=> d!71773 (= lt!333977 (lemmaIsPrefixRefl!0 (_2!9711 lt!333329)))))

(declare-fun lt!333985 () Unit!15097)

(declare-fun lt!333989 () Unit!15097)

(assert (=> d!71773 (= lt!333985 lt!333989)))

(assert (=> d!71773 (isPrefixOf!0 lt!333991 lt!333991)))

(assert (=> d!71773 (= lt!333989 (lemmaIsPrefixRefl!0 lt!333991))))

(declare-fun lt!333979 () Unit!15097)

(declare-fun lt!333987 () Unit!15097)

(assert (=> d!71773 (= lt!333979 lt!333987)))

(assert (=> d!71773 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71773 (= lt!333987 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71773 (= lt!333991 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(assert (=> d!71773 (isPrefixOf!0 thiss!1204 (_2!9711 lt!333329))))

(assert (=> d!71773 (= (reader!0 thiss!1204 (_2!9711 lt!333329)) lt!333992)))

(assert (= (and d!71773 c!10433) b!211937))

(assert (= (and d!71773 (not c!10433)) b!211934))

(assert (= (and d!71773 res!177990) b!211935))

(assert (= (and b!211935 res!177989) b!211933))

(assert (= (and b!211933 res!177988) b!211936))

(declare-fun m!326555 () Bool)

(assert (=> b!211935 m!326555))

(declare-fun m!326557 () Bool)

(assert (=> b!211936 m!326557))

(assert (=> b!211936 m!326193))

(assert (=> b!211936 m!326235))

(declare-fun m!326559 () Bool)

(assert (=> d!71773 m!326559))

(declare-fun m!326561 () Bool)

(assert (=> d!71773 m!326561))

(declare-fun m!326563 () Bool)

(assert (=> d!71773 m!326563))

(declare-fun m!326565 () Bool)

(assert (=> d!71773 m!326565))

(declare-fun m!326567 () Bool)

(assert (=> d!71773 m!326567))

(declare-fun m!326569 () Bool)

(assert (=> d!71773 m!326569))

(assert (=> d!71773 m!326195))

(declare-fun m!326571 () Bool)

(assert (=> d!71773 m!326571))

(declare-fun m!326573 () Bool)

(assert (=> d!71773 m!326573))

(declare-fun m!326575 () Bool)

(assert (=> d!71773 m!326575))

(declare-fun m!326577 () Bool)

(assert (=> d!71773 m!326577))

(assert (=> b!211937 m!326235))

(declare-fun m!326579 () Bool)

(assert (=> b!211937 m!326579))

(declare-fun m!326581 () Bool)

(assert (=> b!211937 m!326581))

(declare-fun m!326583 () Bool)

(assert (=> b!211933 m!326583))

(assert (=> b!211640 d!71773))

(declare-fun d!71775 () Bool)

(assert (=> d!71775 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204)) lt!333356)))

(declare-fun lt!333998 () Unit!15097)

(declare-fun choose!9 (BitStream!8338 array!10508 (_ BitVec 64) BitStream!8338) Unit!15097)

(assert (=> d!71775 (= lt!333998 (choose!9 thiss!1204 (buf!5141 (_2!9711 lt!333329)) lt!333356 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204))))))

(assert (=> d!71775 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5141 (_2!9711 lt!333329)) lt!333356) lt!333998)))

(declare-fun bs!17605 () Bool)

(assert (= bs!17605 d!71775))

(assert (=> bs!17605 m!326215))

(declare-fun m!326639 () Bool)

(assert (=> bs!17605 m!326639))

(assert (=> b!211640 d!71775))

(declare-fun d!71777 () Bool)

(assert (=> d!71777 (= (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333354)))) (and (bvsge (currentBit!9696 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9696 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9701 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333354)))) (and (= (currentBit!9696 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333354))))))))))

(assert (=> b!211640 d!71777))

(declare-fun b!211938 () Bool)

(declare-fun res!177991 () Bool)

(declare-fun e!144468 () Bool)

(assert (=> b!211938 (=> (not res!177991) (not e!144468))))

(declare-fun lt!334015 () tuple2!18110)

(assert (=> b!211938 (= res!177991 (isPrefixOf!0 (_2!9710 lt!334015) (_2!9711 lt!333329)))))

(declare-fun b!211939 () Bool)

(declare-fun e!144467 () Unit!15097)

(declare-fun Unit!15115 () Unit!15097)

(assert (=> b!211939 (= e!144467 Unit!15115)))

(declare-fun b!211940 () Bool)

(declare-fun res!177992 () Bool)

(assert (=> b!211940 (=> (not res!177992) (not e!144468))))

(assert (=> b!211940 (= res!177992 (isPrefixOf!0 (_1!9710 lt!334015) (_2!9711 lt!333354)))))

(declare-fun b!211941 () Bool)

(declare-fun lt!334009 () (_ BitVec 64))

(declare-fun lt!334018 () (_ BitVec 64))

(assert (=> b!211941 (= e!144468 (= (_1!9710 lt!334015) (withMovedBitIndex!0 (_2!9710 lt!334015) (bvsub lt!334018 lt!334009))))))

(assert (=> b!211941 (or (= (bvand lt!334018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334018 lt!334009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211941 (= lt!334009 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333329))) (currentByte!9701 (_2!9711 lt!333329)) (currentBit!9696 (_2!9711 lt!333329))))))

(assert (=> b!211941 (= lt!334018 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(declare-fun b!211942 () Bool)

(declare-fun lt!334006 () Unit!15097)

(assert (=> b!211942 (= e!144467 lt!334006)))

(declare-fun lt!334007 () (_ BitVec 64))

(assert (=> b!211942 (= lt!334007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!334013 () (_ BitVec 64))

(assert (=> b!211942 (= lt!334013 (bitIndex!0 (size!4615 (buf!5141 (_2!9711 lt!333354))) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(assert (=> b!211942 (= lt!334006 (arrayBitRangesEqSymmetric!0 (buf!5141 (_2!9711 lt!333354)) (buf!5141 (_2!9711 lt!333329)) lt!334007 lt!334013))))

(assert (=> b!211942 (arrayBitRangesEq!0 (buf!5141 (_2!9711 lt!333329)) (buf!5141 (_2!9711 lt!333354)) lt!334007 lt!334013)))

(declare-fun d!71779 () Bool)

(assert (=> d!71779 e!144468))

(declare-fun res!177993 () Bool)

(assert (=> d!71779 (=> (not res!177993) (not e!144468))))

(assert (=> d!71779 (= res!177993 (isPrefixOf!0 (_1!9710 lt!334015) (_2!9710 lt!334015)))))

(declare-fun lt!334014 () BitStream!8338)

(assert (=> d!71779 (= lt!334015 (tuple2!18111 lt!334014 (_2!9711 lt!333329)))))

(declare-fun lt!334016 () Unit!15097)

(declare-fun lt!334004 () Unit!15097)

(assert (=> d!71779 (= lt!334016 lt!334004)))

(assert (=> d!71779 (isPrefixOf!0 lt!334014 (_2!9711 lt!333329))))

(assert (=> d!71779 (= lt!334004 (lemmaIsPrefixTransitive!0 lt!334014 (_2!9711 lt!333329) (_2!9711 lt!333329)))))

(declare-fun lt!334005 () Unit!15097)

(declare-fun lt!333999 () Unit!15097)

(assert (=> d!71779 (= lt!334005 lt!333999)))

(assert (=> d!71779 (isPrefixOf!0 lt!334014 (_2!9711 lt!333329))))

(assert (=> d!71779 (= lt!333999 (lemmaIsPrefixTransitive!0 lt!334014 (_2!9711 lt!333354) (_2!9711 lt!333329)))))

(declare-fun lt!334003 () Unit!15097)

(assert (=> d!71779 (= lt!334003 e!144467)))

(declare-fun c!10434 () Bool)

(assert (=> d!71779 (= c!10434 (not (= (size!4615 (buf!5141 (_2!9711 lt!333354))) #b00000000000000000000000000000000)))))

(declare-fun lt!334001 () Unit!15097)

(declare-fun lt!334011 () Unit!15097)

(assert (=> d!71779 (= lt!334001 lt!334011)))

(assert (=> d!71779 (isPrefixOf!0 (_2!9711 lt!333329) (_2!9711 lt!333329))))

(assert (=> d!71779 (= lt!334011 (lemmaIsPrefixRefl!0 (_2!9711 lt!333329)))))

(declare-fun lt!334017 () Unit!15097)

(declare-fun lt!334000 () Unit!15097)

(assert (=> d!71779 (= lt!334017 lt!334000)))

(assert (=> d!71779 (= lt!334000 (lemmaIsPrefixRefl!0 (_2!9711 lt!333329)))))

(declare-fun lt!334008 () Unit!15097)

(declare-fun lt!334012 () Unit!15097)

(assert (=> d!71779 (= lt!334008 lt!334012)))

(assert (=> d!71779 (isPrefixOf!0 lt!334014 lt!334014)))

(assert (=> d!71779 (= lt!334012 (lemmaIsPrefixRefl!0 lt!334014))))

(declare-fun lt!334002 () Unit!15097)

(declare-fun lt!334010 () Unit!15097)

(assert (=> d!71779 (= lt!334002 lt!334010)))

(assert (=> d!71779 (isPrefixOf!0 (_2!9711 lt!333354) (_2!9711 lt!333354))))

(assert (=> d!71779 (= lt!334010 (lemmaIsPrefixRefl!0 (_2!9711 lt!333354)))))

(assert (=> d!71779 (= lt!334014 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354))))))

(assert (=> d!71779 (isPrefixOf!0 (_2!9711 lt!333354) (_2!9711 lt!333329))))

(assert (=> d!71779 (= (reader!0 (_2!9711 lt!333354) (_2!9711 lt!333329)) lt!334015)))

(assert (= (and d!71779 c!10434) b!211942))

(assert (= (and d!71779 (not c!10434)) b!211939))

(assert (= (and d!71779 res!177993) b!211940))

(assert (= (and b!211940 res!177992) b!211938))

(assert (= (and b!211938 res!177991) b!211941))

(declare-fun m!326681 () Bool)

(assert (=> b!211940 m!326681))

(declare-fun m!326683 () Bool)

(assert (=> b!211941 m!326683))

(assert (=> b!211941 m!326193))

(assert (=> b!211941 m!326233))

(declare-fun m!326685 () Bool)

(assert (=> d!71779 m!326685))

(declare-fun m!326687 () Bool)

(assert (=> d!71779 m!326687))

(declare-fun m!326689 () Bool)

(assert (=> d!71779 m!326689))

(declare-fun m!326691 () Bool)

(assert (=> d!71779 m!326691))

(assert (=> d!71779 m!326567))

(declare-fun m!326693 () Bool)

(assert (=> d!71779 m!326693))

(assert (=> d!71779 m!326175))

(declare-fun m!326695 () Bool)

(assert (=> d!71779 m!326695))

(assert (=> d!71779 m!326427))

(assert (=> d!71779 m!326575))

(declare-fun m!326697 () Bool)

(assert (=> d!71779 m!326697))

(assert (=> b!211942 m!326233))

(declare-fun m!326699 () Bool)

(assert (=> b!211942 m!326699))

(declare-fun m!326701 () Bool)

(assert (=> b!211942 m!326701))

(declare-fun m!326705 () Bool)

(assert (=> b!211938 m!326705))

(assert (=> b!211640 d!71779))

(declare-fun d!71783 () Bool)

(declare-datatypes ((tuple2!18136 0))(
  ( (tuple2!18137 (_1!9723 Bool) (_2!9723 BitStream!8338)) )
))
(declare-fun lt!334033 () tuple2!18136)

(declare-fun readBit!0 (BitStream!8338) tuple2!18136)

(assert (=> d!71783 (= lt!334033 (readBit!0 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204))))))

(assert (=> d!71783 (= (readBitPure!0 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204))) (tuple2!18115 (_2!9723 lt!334033) (_1!9723 lt!334033)))))

(declare-fun bs!17606 () Bool)

(assert (= bs!17606 d!71783))

(declare-fun m!326709 () Bool)

(assert (=> bs!17606 m!326709))

(assert (=> b!211640 d!71783))

(declare-fun d!71789 () Bool)

(assert (=> d!71789 (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333346)))

(declare-fun lt!334034 () Unit!15097)

(assert (=> d!71789 (= lt!334034 (choose!9 (_2!9711 lt!333354) (buf!5141 (_2!9711 lt!333329)) lt!333346 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 (_2!9711 lt!333354)) (currentBit!9696 (_2!9711 lt!333354)))))))

(assert (=> d!71789 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9711 lt!333354) (buf!5141 (_2!9711 lt!333329)) lt!333346) lt!334034)))

(declare-fun bs!17607 () Bool)

(assert (= bs!17607 d!71789))

(assert (=> bs!17607 m!326209))

(declare-fun m!326711 () Bool)

(assert (=> bs!17607 m!326711))

(assert (=> b!211640 d!71789))

(declare-fun d!71791 () Bool)

(assert (=> d!71791 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204)) lt!333356) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204))) lt!333356))))

(declare-fun bs!17609 () Bool)

(assert (= bs!17609 d!71791))

(declare-fun m!326715 () Bool)

(assert (=> bs!17609 m!326715))

(assert (=> b!211640 d!71791))

(declare-fun d!71795 () Bool)

(declare-fun e!144471 () Bool)

(assert (=> d!71795 e!144471))

(declare-fun res!177999 () Bool)

(assert (=> d!71795 (=> (not res!177999) (not e!144471))))

(declare-fun lt!334040 () (_ BitVec 64))

(declare-fun lt!334038 () (_ BitVec 64))

(declare-fun lt!334042 () (_ BitVec 64))

(assert (=> d!71795 (= res!177999 (= lt!334038 (bvsub lt!334040 lt!334042)))))

(assert (=> d!71795 (or (= (bvand lt!334040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334040 lt!334042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71795 (= lt!334042 (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333340)))) ((_ sign_extend 32) (currentByte!9701 (_1!9712 lt!333340))) ((_ sign_extend 32) (currentBit!9696 (_1!9712 lt!333340)))))))

(declare-fun lt!334041 () (_ BitVec 64))

(declare-fun lt!334043 () (_ BitVec 64))

(assert (=> d!71795 (= lt!334040 (bvmul lt!334041 lt!334043))))

(assert (=> d!71795 (or (= lt!334041 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334043 (bvsdiv (bvmul lt!334041 lt!334043) lt!334041)))))

(assert (=> d!71795 (= lt!334043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71795 (= lt!334041 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333340)))))))

(assert (=> d!71795 (= lt!334038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9701 (_1!9712 lt!333340))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9696 (_1!9712 lt!333340)))))))

(assert (=> d!71795 (invariant!0 (currentBit!9696 (_1!9712 lt!333340)) (currentByte!9701 (_1!9712 lt!333340)) (size!4615 (buf!5141 (_1!9712 lt!333340))))))

(assert (=> d!71795 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333340))) (currentByte!9701 (_1!9712 lt!333340)) (currentBit!9696 (_1!9712 lt!333340))) lt!334038)))

(declare-fun b!211947 () Bool)

(declare-fun res!177998 () Bool)

(assert (=> b!211947 (=> (not res!177998) (not e!144471))))

(assert (=> b!211947 (= res!177998 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334038))))

(declare-fun b!211948 () Bool)

(declare-fun lt!334039 () (_ BitVec 64))

(assert (=> b!211948 (= e!144471 (bvsle lt!334038 (bvmul lt!334039 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211948 (or (= lt!334039 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334039 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334039)))))

(assert (=> b!211948 (= lt!334039 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333340)))))))

(assert (= (and d!71795 res!177999) b!211947))

(assert (= (and b!211947 res!177998) b!211948))

(declare-fun m!326717 () Bool)

(assert (=> d!71795 m!326717))

(declare-fun m!326719 () Bool)

(assert (=> d!71795 m!326719))

(assert (=> b!211640 d!71795))

(declare-fun d!71797 () Bool)

(declare-fun lt!334044 () tuple2!18136)

(assert (=> d!71797 (= lt!334044 (readBit!0 lt!333352))))

(assert (=> d!71797 (= (readBitPure!0 lt!333352) (tuple2!18115 (_2!9723 lt!334044) (_1!9723 lt!334044)))))

(declare-fun bs!17610 () Bool)

(assert (= bs!17610 d!71797))

(declare-fun m!326721 () Bool)

(assert (=> bs!17610 m!326721))

(assert (=> b!211640 d!71797))

(declare-fun d!71799 () Bool)

(declare-fun lt!334045 () tuple2!18134)

(assert (=> d!71799 (= lt!334045 (readNBitsLSBFirstsLoop!0 (_1!9710 lt!333355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333353))))

(assert (=> d!71799 (= (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333353) (tuple2!18117 (_2!9722 lt!334045) (_1!9722 lt!334045)))))

(declare-fun bs!17611 () Bool)

(assert (= bs!17611 d!71799))

(declare-fun m!326723 () Bool)

(assert (=> bs!17611 m!326723))

(assert (=> b!211640 d!71799))

(declare-fun d!71801 () Bool)

(assert (=> d!71801 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354))) lt!333346) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_2!9711 lt!333329)))) ((_ sign_extend 32) (currentByte!9701 (_2!9711 lt!333354))) ((_ sign_extend 32) (currentBit!9696 (_2!9711 lt!333354)))) lt!333346))))

(declare-fun bs!17612 () Bool)

(assert (= bs!17612 d!71801))

(declare-fun m!326725 () Bool)

(assert (=> bs!17612 m!326725))

(assert (=> b!211640 d!71801))

(declare-fun d!71803 () Bool)

(declare-fun e!144472 () Bool)

(assert (=> d!71803 e!144472))

(declare-fun res!178002 () Bool)

(assert (=> d!71803 (=> (not res!178002) (not e!144472))))

(declare-fun lt!334046 () (_ BitVec 64))

(declare-fun lt!334050 () (_ BitVec 64))

(declare-fun lt!334048 () (_ BitVec 64))

(assert (=> d!71803 (= res!178002 (= lt!334046 (bvsub lt!334048 lt!334050)))))

(assert (=> d!71803 (or (= (bvand lt!334048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334050 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334048 lt!334050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71803 (= lt!334050 (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333349)))) ((_ sign_extend 32) (currentByte!9701 (_1!9712 lt!333349))) ((_ sign_extend 32) (currentBit!9696 (_1!9712 lt!333349)))))))

(declare-fun lt!334049 () (_ BitVec 64))

(declare-fun lt!334051 () (_ BitVec 64))

(assert (=> d!71803 (= lt!334048 (bvmul lt!334049 lt!334051))))

(assert (=> d!71803 (or (= lt!334049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334051 (bvsdiv (bvmul lt!334049 lt!334051) lt!334049)))))

(assert (=> d!71803 (= lt!334051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71803 (= lt!334049 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333349)))))))

(assert (=> d!71803 (= lt!334046 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9701 (_1!9712 lt!333349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9696 (_1!9712 lt!333349)))))))

(assert (=> d!71803 (invariant!0 (currentBit!9696 (_1!9712 lt!333349)) (currentByte!9701 (_1!9712 lt!333349)) (size!4615 (buf!5141 (_1!9712 lt!333349))))))

(assert (=> d!71803 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333349))) (currentByte!9701 (_1!9712 lt!333349)) (currentBit!9696 (_1!9712 lt!333349))) lt!334046)))

(declare-fun b!211949 () Bool)

(declare-fun res!178001 () Bool)

(assert (=> b!211949 (=> (not res!178001) (not e!144472))))

(assert (=> b!211949 (= res!178001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334046))))

(declare-fun b!211950 () Bool)

(declare-fun lt!334047 () (_ BitVec 64))

(assert (=> b!211950 (= e!144472 (bvsle lt!334046 (bvmul lt!334047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211950 (or (= lt!334047 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334047 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334047)))))

(assert (=> b!211950 (= lt!334047 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333349)))))))

(assert (= (and d!71803 res!178002) b!211949))

(assert (= (and b!211949 res!178001) b!211950))

(declare-fun m!326727 () Bool)

(assert (=> d!71803 m!326727))

(declare-fun m!326729 () Bool)

(assert (=> d!71803 m!326729))

(assert (=> b!211640 d!71803))

(declare-fun d!71805 () Bool)

(declare-fun e!144478 () Bool)

(assert (=> d!71805 e!144478))

(declare-fun res!178008 () Bool)

(assert (=> d!71805 (=> (not res!178008) (not e!144478))))

(declare-fun lt!334062 () tuple2!18114)

(declare-fun lt!334063 () tuple2!18114)

(assert (=> d!71805 (= res!178008 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!334062))) (currentByte!9701 (_1!9712 lt!334062)) (currentBit!9696 (_1!9712 lt!334062))) (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!334063))) (currentByte!9701 (_1!9712 lt!334063)) (currentBit!9696 (_1!9712 lt!334063)))))))

(declare-fun lt!334060 () BitStream!8338)

(declare-fun lt!334061 () Unit!15097)

(declare-fun choose!50 (BitStream!8338 BitStream!8338 BitStream!8338 tuple2!18114 tuple2!18114 BitStream!8338 Bool tuple2!18114 tuple2!18114 BitStream!8338 Bool) Unit!15097)

(assert (=> d!71805 (= lt!334061 (choose!50 lt!333352 (_2!9711 lt!333329) lt!334060 lt!334062 (tuple2!18115 (_1!9712 lt!334062) (_2!9712 lt!334062)) (_1!9712 lt!334062) (_2!9712 lt!334062) lt!334063 (tuple2!18115 (_1!9712 lt!334063) (_2!9712 lt!334063)) (_1!9712 lt!334063) (_2!9712 lt!334063)))))

(assert (=> d!71805 (= lt!334063 (readBitPure!0 lt!334060))))

(assert (=> d!71805 (= lt!334062 (readBitPure!0 lt!333352))))

(assert (=> d!71805 (= lt!334060 (BitStream!8339 (buf!5141 (_2!9711 lt!333329)) (currentByte!9701 lt!333352) (currentBit!9696 lt!333352)))))

(assert (=> d!71805 (invariant!0 (currentBit!9696 lt!333352) (currentByte!9701 lt!333352) (size!4615 (buf!5141 (_2!9711 lt!333329))))))

(assert (=> d!71805 (= (readBitPrefixLemma!0 lt!333352 (_2!9711 lt!333329)) lt!334061)))

(declare-fun b!211956 () Bool)

(assert (=> b!211956 (= e!144478 (= (_2!9712 lt!334062) (_2!9712 lt!334063)))))

(assert (= (and d!71805 res!178008) b!211956))

(declare-fun m!326731 () Bool)

(assert (=> d!71805 m!326731))

(assert (=> d!71805 m!326203))

(declare-fun m!326733 () Bool)

(assert (=> d!71805 m!326733))

(declare-fun m!326735 () Bool)

(assert (=> d!71805 m!326735))

(declare-fun m!326737 () Bool)

(assert (=> d!71805 m!326737))

(declare-fun m!326739 () Bool)

(assert (=> d!71805 m!326739))

(assert (=> b!211640 d!71805))

(declare-fun d!71809 () Bool)

(declare-fun lt!334064 () tuple2!18136)

(assert (=> d!71809 (= lt!334064 (readBit!0 (_1!9710 lt!333351)))))

(assert (=> d!71809 (= (readBitPure!0 (_1!9710 lt!333351)) (tuple2!18115 (_2!9723 lt!334064) (_1!9723 lt!334064)))))

(declare-fun bs!17613 () Bool)

(assert (= bs!17613 d!71809))

(declare-fun m!326741 () Bool)

(assert (=> bs!17613 m!326741))

(assert (=> b!211640 d!71809))

(declare-fun d!71811 () Bool)

(declare-fun e!144479 () Bool)

(assert (=> d!71811 e!144479))

(declare-fun res!178010 () Bool)

(assert (=> d!71811 (=> (not res!178010) (not e!144479))))

(declare-fun lt!334069 () (_ BitVec 64))

(declare-fun lt!334067 () (_ BitVec 64))

(declare-fun lt!334065 () (_ BitVec 64))

(assert (=> d!71811 (= res!178010 (= lt!334065 (bvsub lt!334067 lt!334069)))))

(assert (=> d!71811 (or (= (bvand lt!334067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334067 lt!334069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71811 (= lt!334069 (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333347)))) ((_ sign_extend 32) (currentByte!9701 (_1!9712 lt!333347))) ((_ sign_extend 32) (currentBit!9696 (_1!9712 lt!333347)))))))

(declare-fun lt!334068 () (_ BitVec 64))

(declare-fun lt!334070 () (_ BitVec 64))

(assert (=> d!71811 (= lt!334067 (bvmul lt!334068 lt!334070))))

(assert (=> d!71811 (or (= lt!334068 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334070 (bvsdiv (bvmul lt!334068 lt!334070) lt!334068)))))

(assert (=> d!71811 (= lt!334070 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71811 (= lt!334068 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333347)))))))

(assert (=> d!71811 (= lt!334065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9701 (_1!9712 lt!333347))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9696 (_1!9712 lt!333347)))))))

(assert (=> d!71811 (invariant!0 (currentBit!9696 (_1!9712 lt!333347)) (currentByte!9701 (_1!9712 lt!333347)) (size!4615 (buf!5141 (_1!9712 lt!333347))))))

(assert (=> d!71811 (= (bitIndex!0 (size!4615 (buf!5141 (_1!9712 lt!333347))) (currentByte!9701 (_1!9712 lt!333347)) (currentBit!9696 (_1!9712 lt!333347))) lt!334065)))

(declare-fun b!211957 () Bool)

(declare-fun res!178009 () Bool)

(assert (=> b!211957 (=> (not res!178009) (not e!144479))))

(assert (=> b!211957 (= res!178009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334065))))

(declare-fun b!211958 () Bool)

(declare-fun lt!334066 () (_ BitVec 64))

(assert (=> b!211958 (= e!144479 (bvsle lt!334065 (bvmul lt!334066 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211958 (or (= lt!334066 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334066 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334066)))))

(assert (=> b!211958 (= lt!334066 ((_ sign_extend 32) (size!4615 (buf!5141 (_1!9712 lt!333347)))))))

(assert (= (and d!71811 res!178010) b!211957))

(assert (= (and b!211957 res!178009) b!211958))

(declare-fun m!326743 () Bool)

(assert (=> d!71811 m!326743))

(declare-fun m!326745 () Bool)

(assert (=> d!71811 m!326745))

(assert (=> b!211629 d!71811))

(assert (=> b!211630 d!71755))

(declare-fun d!71813 () Bool)

(assert (=> d!71813 (= (invariant!0 (currentBit!9696 (_2!9711 lt!333329)) (currentByte!9701 (_2!9711 lt!333329)) (size!4615 (buf!5141 (_2!9711 lt!333329)))) (and (bvsge (currentBit!9696 (_2!9711 lt!333329)) #b00000000000000000000000000000000) (bvslt (currentBit!9696 (_2!9711 lt!333329)) #b00000000000000000000000000001000) (bvsge (currentByte!9701 (_2!9711 lt!333329)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9701 (_2!9711 lt!333329)) (size!4615 (buf!5141 (_2!9711 lt!333329)))) (and (= (currentBit!9696 (_2!9711 lt!333329)) #b00000000000000000000000000000000) (= (currentByte!9701 (_2!9711 lt!333329)) (size!4615 (buf!5141 (_2!9711 lt!333329))))))))))

(assert (=> b!211641 d!71813))

(declare-fun d!71815 () Bool)

(declare-fun e!144480 () Bool)

(assert (=> d!71815 e!144480))

(declare-fun res!178011 () Bool)

(assert (=> d!71815 (=> (not res!178011) (not e!144480))))

(declare-fun lt!334072 () (_ BitVec 64))

(declare-fun lt!334071 () BitStream!8338)

(assert (=> d!71815 (= res!178011 (= (bvadd lt!334072 (bvsub lt!333344 lt!333333)) (bitIndex!0 (size!4615 (buf!5141 lt!334071)) (currentByte!9701 lt!334071) (currentBit!9696 lt!334071))))))

(assert (=> d!71815 (or (not (= (bvand lt!334072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333344 lt!333333) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334072 (bvsub lt!333344 lt!333333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71815 (= lt!334072 (bitIndex!0 (size!4615 (buf!5141 (_2!9710 lt!333351))) (currentByte!9701 (_2!9710 lt!333351)) (currentBit!9696 (_2!9710 lt!333351))))))

(assert (=> d!71815 (= lt!334071 (_2!9711 (moveBitIndex!0 (_2!9710 lt!333351) (bvsub lt!333344 lt!333333))))))

(assert (=> d!71815 (moveBitIndexPrecond!0 (_2!9710 lt!333351) (bvsub lt!333344 lt!333333))))

(assert (=> d!71815 (= (withMovedBitIndex!0 (_2!9710 lt!333351) (bvsub lt!333344 lt!333333)) lt!334071)))

(declare-fun b!211959 () Bool)

(assert (=> b!211959 (= e!144480 (= (size!4615 (buf!5141 (_2!9710 lt!333351))) (size!4615 (buf!5141 lt!334071))))))

(assert (= (and d!71815 res!178011) b!211959))

(declare-fun m!326747 () Bool)

(assert (=> d!71815 m!326747))

(declare-fun m!326749 () Bool)

(assert (=> d!71815 m!326749))

(declare-fun m!326751 () Bool)

(assert (=> d!71815 m!326751))

(declare-fun m!326753 () Bool)

(assert (=> d!71815 m!326753))

(assert (=> b!211626 d!71815))

(declare-fun d!71817 () Bool)

(declare-fun lt!334098 () tuple2!18116)

(declare-fun lt!334099 () tuple2!18116)

(assert (=> d!71817 (and (= (_2!9713 lt!334098) (_2!9713 lt!334099)) (= (_1!9713 lt!334098) (_1!9713 lt!334099)))))

(declare-fun lt!334102 () Unit!15097)

(declare-fun lt!334100 () Bool)

(declare-fun lt!334101 () (_ BitVec 64))

(declare-fun lt!334097 () BitStream!8338)

(declare-fun choose!56 (BitStream!8338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18116 tuple2!18116 BitStream!8338 (_ BitVec 64) Bool BitStream!8338 (_ BitVec 64) tuple2!18116 tuple2!18116 BitStream!8338 (_ BitVec 64)) Unit!15097)

(assert (=> d!71817 (= lt!334102 (choose!56 (_1!9710 lt!333351) nBits!348 i!590 lt!333332 lt!334098 (tuple2!18117 (_1!9713 lt!334098) (_2!9713 lt!334098)) (_1!9713 lt!334098) (_2!9713 lt!334098) lt!334100 lt!334097 lt!334101 lt!334099 (tuple2!18117 (_1!9713 lt!334099) (_2!9713 lt!334099)) (_1!9713 lt!334099) (_2!9713 lt!334099)))))

(assert (=> d!71817 (= lt!334099 (readNBitsLSBFirstsLoopPure!0 lt!334097 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!334101))))

(assert (=> d!71817 (= lt!334101 (bvor lt!333332 (ite lt!334100 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71817 (= lt!334097 (withMovedBitIndex!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71817 (= lt!334100 (_2!9712 (readBitPure!0 (_1!9710 lt!333351))))))

(assert (=> d!71817 (= lt!334098 (readNBitsLSBFirstsLoopPure!0 (_1!9710 lt!333351) nBits!348 i!590 lt!333332))))

(assert (=> d!71817 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9710 lt!333351) nBits!348 i!590 lt!333332) lt!334102)))

(declare-fun bs!17615 () Bool)

(assert (= bs!17615 d!71817))

(assert (=> bs!17615 m!326225))

(assert (=> bs!17615 m!326205))

(declare-fun m!326769 () Bool)

(assert (=> bs!17615 m!326769))

(declare-fun m!326771 () Bool)

(assert (=> bs!17615 m!326771))

(assert (=> bs!17615 m!326247))

(assert (=> b!211637 d!71817))

(declare-fun lt!334103 () tuple2!18134)

(declare-fun d!71821 () Bool)

(assert (=> d!71821 (= lt!334103 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333353))))

(assert (=> d!71821 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333353) (tuple2!18117 (_2!9722 lt!334103) (_1!9722 lt!334103)))))

(declare-fun bs!17616 () Bool)

(assert (= bs!17616 d!71821))

(assert (=> bs!17616 m!326247))

(declare-fun m!326773 () Bool)

(assert (=> bs!17616 m!326773))

(assert (=> b!211637 d!71821))

(declare-fun d!71823 () Bool)

(declare-fun e!144487 () Bool)

(assert (=> d!71823 e!144487))

(declare-fun res!178024 () Bool)

(assert (=> d!71823 (=> (not res!178024) (not e!144487))))

(declare-fun lt!334105 () (_ BitVec 64))

(declare-fun lt!334104 () BitStream!8338)

(assert (=> d!71823 (= res!178024 (= (bvadd lt!334105 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4615 (buf!5141 lt!334104)) (currentByte!9701 lt!334104) (currentBit!9696 lt!334104))))))

(assert (=> d!71823 (or (not (= (bvand lt!334105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334105 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71823 (= lt!334105 (bitIndex!0 (size!4615 (buf!5141 (_1!9710 lt!333351))) (currentByte!9701 (_1!9710 lt!333351)) (currentBit!9696 (_1!9710 lt!333351))))))

(assert (=> d!71823 (= lt!334104 (_2!9711 (moveBitIndex!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71823 (moveBitIndexPrecond!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71823 (= (withMovedBitIndex!0 (_1!9710 lt!333351) #b0000000000000000000000000000000000000000000000000000000000000001) lt!334104)))

(declare-fun b!211973 () Bool)

(assert (=> b!211973 (= e!144487 (= (size!4615 (buf!5141 (_1!9710 lt!333351))) (size!4615 (buf!5141 lt!334104))))))

(assert (= (and d!71823 res!178024) b!211973))

(declare-fun m!326775 () Bool)

(assert (=> d!71823 m!326775))

(declare-fun m!326777 () Bool)

(assert (=> d!71823 m!326777))

(declare-fun m!326779 () Bool)

(assert (=> d!71823 m!326779))

(declare-fun m!326781 () Bool)

(assert (=> d!71823 m!326781))

(assert (=> b!211637 d!71823))

(declare-fun d!71825 () Bool)

(declare-fun lt!334106 () tuple2!18136)

(assert (=> d!71825 (= lt!334106 (readBit!0 (readerFrom!0 (_2!9711 lt!333354) (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204))))))

(assert (=> d!71825 (= (readBitPure!0 (readerFrom!0 (_2!9711 lt!333354) (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204))) (tuple2!18115 (_2!9723 lt!334106) (_1!9723 lt!334106)))))

(declare-fun bs!17617 () Bool)

(assert (= bs!17617 d!71825))

(assert (=> bs!17617 m!326181))

(declare-fun m!326783 () Bool)

(assert (=> bs!17617 m!326783))

(assert (=> b!211638 d!71825))

(declare-fun d!71827 () Bool)

(declare-fun e!144490 () Bool)

(assert (=> d!71827 e!144490))

(declare-fun res!178028 () Bool)

(assert (=> d!71827 (=> (not res!178028) (not e!144490))))

(assert (=> d!71827 (= res!178028 (invariant!0 (currentBit!9696 (_2!9711 lt!333354)) (currentByte!9701 (_2!9711 lt!333354)) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(assert (=> d!71827 (= (readerFrom!0 (_2!9711 lt!333354) (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204)) (BitStream!8339 (buf!5141 (_2!9711 lt!333354)) (currentByte!9701 thiss!1204) (currentBit!9696 thiss!1204)))))

(declare-fun b!211976 () Bool)

(assert (=> b!211976 (= e!144490 (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 (_2!9711 lt!333354)))))))

(assert (= (and d!71827 res!178028) b!211976))

(assert (=> d!71827 m!326527))

(assert (=> b!211976 m!326229))

(assert (=> b!211638 d!71827))

(declare-fun d!71829 () Bool)

(assert (=> d!71829 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9696 thiss!1204) (currentByte!9701 thiss!1204) (size!4615 (buf!5141 thiss!1204))))))

(declare-fun bs!17618 () Bool)

(assert (= bs!17618 d!71829))

(assert (=> bs!17618 m!326251))

(assert (=> start!44430 d!71829))

(assert (=> b!211627 d!71757))

(assert (=> b!211627 d!71759))

(declare-fun d!71831 () Bool)

(assert (=> d!71831 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204)) lt!333356) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4615 (buf!5141 thiss!1204))) ((_ sign_extend 32) (currentByte!9701 thiss!1204)) ((_ sign_extend 32) (currentBit!9696 thiss!1204))) lt!333356))))

(declare-fun bs!17619 () Bool)

(assert (= bs!17619 d!71831))

(assert (=> bs!17619 m!326529))

(assert (=> b!211628 d!71831))

(push 1)

(assert (not d!71769))

(assert (not b!211933))

(assert (not b!211938))

(assert (not d!71729))

(assert (not b!211870))

(assert (not b!211936))

(assert (not b!211852))

(assert (not d!71763))

(assert (not d!71821))

(assert (not b!211842))

(assert (not b!211849))

(assert (not b!211869))

(assert (not b!211976))

(assert (not b!211937))

(assert (not b!211777))

(assert (not bm!3333))

(assert (not d!71827))

(assert (not b!211940))

(assert (not d!71795))

(assert (not b!211840))

(assert (not d!71725))

(assert (not d!71799))

(assert (not d!71779))

(assert (not b!211833))

(assert (not d!71775))

(assert (not b!211848))

(assert (not b!211941))

(assert (not d!71817))

(assert (not d!71783))

(assert (not d!71791))

(assert (not d!71801))

(assert (not b!211835))

(assert (not d!71759))

(assert (not b!211871))

(assert (not d!71761))

(assert (not d!71773))

(assert (not d!71731))

(assert (not d!71829))

(assert (not d!71803))

(assert (not d!71809))

(assert (not d!71825))

(assert (not b!211846))

(assert (not b!211838))

(assert (not d!71757))

(assert (not d!71823))

(assert (not b!211851))

(assert (not b!211837))

(assert (not d!71811))

(assert (not b!211854))

(assert (not b!211935))

(assert (not d!71805))

(assert (not d!71815))

(assert (not d!71831))

(assert (not d!71789))

(assert (not b!211868))

(assert (not b!211942))

(assert (not b!211779))

(assert (not b!211836))

(assert (not d!71797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

