; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41834 () Bool)

(assert start!41834)

(declare-fun b!196758 () Bool)

(declare-fun e!135190 () Bool)

(declare-fun e!135189 () Bool)

(assert (=> b!196758 (= e!135190 e!135189)))

(declare-fun res!164645 () Bool)

(assert (=> b!196758 (=> res!164645 e!135189)))

(declare-fun lt!306250 () (_ BitVec 64))

(declare-fun lt!306255 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!196758 (= res!164645 (not (= lt!306250 (bvsub (bvsub (bvadd lt!306255 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!10082 0))(
  ( (array!10083 (arr!5374 (Array (_ BitVec 32) (_ BitVec 8))) (size!4444 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7996 0))(
  ( (BitStream!7997 (buf!4930 array!10082) (currentByte!9259 (_ BitVec 32)) (currentBit!9254 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13920 0))(
  ( (Unit!13921) )
))
(declare-datatypes ((tuple2!17018 0))(
  ( (tuple2!17019 (_1!9154 Unit!13920) (_2!9154 BitStream!7996)) )
))
(declare-fun lt!306254 () tuple2!17018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196758 (= lt!306250 (bitIndex!0 (size!4444 (buf!4930 (_2!9154 lt!306254))) (currentByte!9259 (_2!9154 lt!306254)) (currentBit!9254 (_2!9154 lt!306254))))))

(declare-fun thiss!1204 () BitStream!7996)

(declare-fun isPrefixOf!0 (BitStream!7996 BitStream!7996) Bool)

(assert (=> b!196758 (isPrefixOf!0 thiss!1204 (_2!9154 lt!306254))))

(declare-fun lt!306257 () tuple2!17018)

(declare-fun lt!306251 () Unit!13920)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7996 BitStream!7996 BitStream!7996) Unit!13920)

(assert (=> b!196758 (= lt!306251 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9154 lt!306257) (_2!9154 lt!306254)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7996 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17018)

(assert (=> b!196758 (= lt!306254 (appendBitsLSBFirstLoopTR!0 (_2!9154 lt!306257) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196759 () Bool)

(declare-fun e!135187 () Bool)

(declare-fun e!135194 () Bool)

(assert (=> b!196759 (= e!135187 e!135194)))

(declare-fun res!164648 () Bool)

(assert (=> b!196759 (=> (not res!164648) (not e!135194))))

(declare-fun lt!306258 () (_ BitVec 64))

(declare-fun lt!306256 () (_ BitVec 64))

(assert (=> b!196759 (= res!164648 (= lt!306258 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306256)))))

(assert (=> b!196759 (= lt!306258 (bitIndex!0 (size!4444 (buf!4930 (_2!9154 lt!306257))) (currentByte!9259 (_2!9154 lt!306257)) (currentBit!9254 (_2!9154 lt!306257))))))

(assert (=> b!196759 (= lt!306256 (bitIndex!0 (size!4444 (buf!4930 thiss!1204)) (currentByte!9259 thiss!1204) (currentBit!9254 thiss!1204)))))

(declare-fun b!196760 () Bool)

(declare-fun lt!306253 () (_ BitVec 64))

(assert (=> b!196760 (= e!135189 (or (not (= (size!4444 (buf!4930 (_2!9154 lt!306254))) (size!4444 (buf!4930 thiss!1204)))) (= lt!306250 (bvsub (bvadd lt!306253 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))))

(declare-fun b!196761 () Bool)

(declare-fun res!164643 () Bool)

(assert (=> b!196761 (=> (not res!164643) (not e!135194))))

(assert (=> b!196761 (= res!164643 (isPrefixOf!0 thiss!1204 (_2!9154 lt!306257)))))

(declare-fun b!196762 () Bool)

(declare-fun e!135193 () Bool)

(assert (=> b!196762 (= e!135193 (not e!135190))))

(declare-fun res!164641 () Bool)

(assert (=> b!196762 (=> res!164641 e!135190)))

(assert (=> b!196762 (= res!164641 (not (= lt!306255 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306253))))))

(assert (=> b!196762 (= lt!306255 (bitIndex!0 (size!4444 (buf!4930 (_2!9154 lt!306257))) (currentByte!9259 (_2!9154 lt!306257)) (currentBit!9254 (_2!9154 lt!306257))))))

(assert (=> b!196762 (= lt!306253 (bitIndex!0 (size!4444 (buf!4930 thiss!1204)) (currentByte!9259 thiss!1204) (currentBit!9254 thiss!1204)))))

(assert (=> b!196762 e!135187))

(declare-fun res!164646 () Bool)

(assert (=> b!196762 (=> (not res!164646) (not e!135187))))

(assert (=> b!196762 (= res!164646 (= (size!4444 (buf!4930 thiss!1204)) (size!4444 (buf!4930 (_2!9154 lt!306257)))))))

(declare-fun lt!306259 () Bool)

(declare-fun appendBit!0 (BitStream!7996 Bool) tuple2!17018)

(assert (=> b!196762 (= lt!306257 (appendBit!0 thiss!1204 lt!306259))))

(assert (=> b!196762 (= lt!306259 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!164639 () Bool)

(assert (=> start!41834 (=> (not res!164639) (not e!135193))))

(assert (=> start!41834 (= res!164639 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41834 e!135193))

(assert (=> start!41834 true))

(declare-fun e!135188 () Bool)

(declare-fun inv!12 (BitStream!7996) Bool)

(assert (=> start!41834 (and (inv!12 thiss!1204) e!135188)))

(declare-fun b!196763 () Bool)

(declare-fun res!164642 () Bool)

(assert (=> b!196763 (=> (not res!164642) (not e!135193))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196763 (= res!164642 (validate_offset_bits!1 ((_ sign_extend 32) (size!4444 (buf!4930 thiss!1204))) ((_ sign_extend 32) (currentByte!9259 thiss!1204)) ((_ sign_extend 32) (currentBit!9254 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196764 () Bool)

(declare-fun array_inv!4185 (array!10082) Bool)

(assert (=> b!196764 (= e!135188 (array_inv!4185 (buf!4930 thiss!1204)))))

(declare-fun b!196765 () Bool)

(declare-fun res!164644 () Bool)

(assert (=> b!196765 (=> res!164644 e!135189)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196765 (= res!164644 (not (invariant!0 (currentBit!9254 (_2!9154 lt!306254)) (currentByte!9259 (_2!9154 lt!306254)) (size!4444 (buf!4930 (_2!9154 lt!306254))))))))

(declare-fun b!196766 () Bool)

(declare-fun e!135191 () Bool)

(declare-datatypes ((tuple2!17020 0))(
  ( (tuple2!17021 (_1!9155 BitStream!7996) (_2!9155 Bool)) )
))
(declare-fun lt!306252 () tuple2!17020)

(assert (=> b!196766 (= e!135191 (= (bitIndex!0 (size!4444 (buf!4930 (_1!9155 lt!306252))) (currentByte!9259 (_1!9155 lt!306252)) (currentBit!9254 (_1!9155 lt!306252))) lt!306258))))

(declare-fun b!196767 () Bool)

(declare-fun res!164649 () Bool)

(assert (=> b!196767 (=> (not res!164649) (not e!135193))))

(assert (=> b!196767 (= res!164649 (not (= i!590 nBits!348)))))

(declare-fun b!196768 () Bool)

(assert (=> b!196768 (= e!135194 e!135191)))

(declare-fun res!164640 () Bool)

(assert (=> b!196768 (=> (not res!164640) (not e!135191))))

(assert (=> b!196768 (= res!164640 (and (= (_2!9155 lt!306252) lt!306259) (= (_1!9155 lt!306252) (_2!9154 lt!306257))))))

(declare-fun readBitPure!0 (BitStream!7996) tuple2!17020)

(declare-fun readerFrom!0 (BitStream!7996 (_ BitVec 32) (_ BitVec 32)) BitStream!7996)

(assert (=> b!196768 (= lt!306252 (readBitPure!0 (readerFrom!0 (_2!9154 lt!306257) (currentBit!9254 thiss!1204) (currentByte!9259 thiss!1204))))))

(declare-fun b!196769 () Bool)

(declare-fun res!164647 () Bool)

(assert (=> b!196769 (=> (not res!164647) (not e!135193))))

(assert (=> b!196769 (= res!164647 (invariant!0 (currentBit!9254 thiss!1204) (currentByte!9259 thiss!1204) (size!4444 (buf!4930 thiss!1204))))))

(assert (= (and start!41834 res!164639) b!196763))

(assert (= (and b!196763 res!164642) b!196769))

(assert (= (and b!196769 res!164647) b!196767))

(assert (= (and b!196767 res!164649) b!196762))

(assert (= (and b!196762 res!164646) b!196759))

(assert (= (and b!196759 res!164648) b!196761))

(assert (= (and b!196761 res!164643) b!196768))

(assert (= (and b!196768 res!164640) b!196766))

(assert (= (and b!196762 (not res!164641)) b!196758))

(assert (= (and b!196758 (not res!164645)) b!196765))

(assert (= (and b!196765 (not res!164644)) b!196760))

(assert (= start!41834 b!196764))

(declare-fun m!304283 () Bool)

(assert (=> b!196766 m!304283))

(declare-fun m!304285 () Bool)

(assert (=> b!196769 m!304285))

(declare-fun m!304287 () Bool)

(assert (=> b!196761 m!304287))

(declare-fun m!304289 () Bool)

(assert (=> b!196758 m!304289))

(declare-fun m!304291 () Bool)

(assert (=> b!196758 m!304291))

(declare-fun m!304293 () Bool)

(assert (=> b!196758 m!304293))

(declare-fun m!304295 () Bool)

(assert (=> b!196758 m!304295))

(declare-fun m!304297 () Bool)

(assert (=> start!41834 m!304297))

(declare-fun m!304299 () Bool)

(assert (=> b!196765 m!304299))

(declare-fun m!304301 () Bool)

(assert (=> b!196763 m!304301))

(declare-fun m!304303 () Bool)

(assert (=> b!196759 m!304303))

(declare-fun m!304305 () Bool)

(assert (=> b!196759 m!304305))

(declare-fun m!304307 () Bool)

(assert (=> b!196768 m!304307))

(assert (=> b!196768 m!304307))

(declare-fun m!304309 () Bool)

(assert (=> b!196768 m!304309))

(declare-fun m!304311 () Bool)

(assert (=> b!196764 m!304311))

(assert (=> b!196762 m!304303))

(assert (=> b!196762 m!304305))

(declare-fun m!304313 () Bool)

(assert (=> b!196762 m!304313))

(push 1)

(assert (not b!196759))

(assert (not b!196758))

(assert (not b!196763))

(assert (not start!41834))

(assert (not b!196765))

(assert (not b!196769))

(assert (not b!196764))

(assert (not b!196761))

(assert (not b!196762))

(assert (not b!196766))

(assert (not b!196768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

