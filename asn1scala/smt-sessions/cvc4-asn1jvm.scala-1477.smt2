; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40974 () Bool)

(assert start!40974)

(declare-fun b!188698 () Bool)

(declare-fun res!157220 () Bool)

(declare-fun e!130354 () Bool)

(assert (=> b!188698 (=> (not res!157220) (not e!130354))))

(declare-datatypes ((array!9864 0))(
  ( (array!9865 (arr!5277 (Array (_ BitVec 32) (_ BitVec 8))) (size!4347 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7802 0))(
  ( (BitStream!7803 (buf!4821 array!9864) (currentByte!9093 (_ BitVec 32)) (currentBit!9088 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7802)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188698 (= res!157220 (invariant!0 (currentBit!9088 thiss!1204) (currentByte!9093 thiss!1204) (size!4347 (buf!4821 thiss!1204))))))

(declare-fun b!188699 () Bool)

(declare-fun res!157227 () Bool)

(declare-fun e!130342 () Bool)

(assert (=> b!188699 (=> (not res!157227) (not e!130342))))

(declare-fun lt!293239 () (_ BitVec 64))

(declare-datatypes ((tuple2!16284 0))(
  ( (tuple2!16285 (_1!8787 BitStream!7802) (_2!8787 BitStream!7802)) )
))
(declare-fun lt!293223 () tuple2!16284)

(declare-fun lt!293229 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7802 (_ BitVec 64)) BitStream!7802)

(assert (=> b!188699 (= res!157227 (= (_1!8787 lt!293223) (withMovedBitIndex!0 (_2!8787 lt!293223) (bvsub lt!293229 lt!293239))))))

(declare-datatypes ((tuple2!16286 0))(
  ( (tuple2!16287 (_1!8788 BitStream!7802) (_2!8788 (_ BitVec 64))) )
))
(declare-fun lt!293244 () tuple2!16286)

(declare-fun lt!293246 () tuple2!16286)

(declare-fun b!188700 () Bool)

(declare-fun lt!293238 () BitStream!7802)

(declare-fun lt!293245 () (_ BitVec 64))

(assert (=> b!188700 (= e!130342 (and (= lt!293245 (bvsub lt!293229 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8787 lt!293223) lt!293238)) (= (_2!8788 lt!293246) (_2!8788 lt!293244)))))))

(declare-fun b!188701 () Bool)

(declare-fun res!157237 () Bool)

(assert (=> b!188701 (=> (not res!157237) (not e!130354))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!188701 (= res!157237 (not (= i!590 nBits!348)))))

(declare-fun b!188702 () Bool)

(declare-fun e!130348 () Bool)

(declare-fun array_inv!4088 (array!9864) Bool)

(assert (=> b!188702 (= e!130348 (array_inv!4088 (buf!4821 thiss!1204)))))

(declare-fun b!188703 () Bool)

(declare-fun res!157233 () Bool)

(declare-fun e!130344 () Bool)

(assert (=> b!188703 (=> res!157233 e!130344)))

(declare-fun lt!293243 () tuple2!16284)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188703 (= res!157233 (not (= (bitIndex!0 (size!4347 (buf!4821 (_1!8788 lt!293246))) (currentByte!9093 (_1!8788 lt!293246)) (currentBit!9088 (_1!8788 lt!293246))) (bitIndex!0 (size!4347 (buf!4821 (_2!8787 lt!293243))) (currentByte!9093 (_2!8787 lt!293243)) (currentBit!9088 (_2!8787 lt!293243))))))))

(declare-fun b!188704 () Bool)

(declare-fun res!157228 () Bool)

(declare-fun e!130353 () Bool)

(assert (=> b!188704 (=> res!157228 e!130353)))

(declare-datatypes ((Unit!13493 0))(
  ( (Unit!13494) )
))
(declare-datatypes ((tuple2!16288 0))(
  ( (tuple2!16289 (_1!8789 Unit!13493) (_2!8789 BitStream!7802)) )
))
(declare-fun lt!293228 () tuple2!16288)

(declare-fun isPrefixOf!0 (BitStream!7802 BitStream!7802) Bool)

(assert (=> b!188704 (= res!157228 (not (isPrefixOf!0 thiss!1204 (_2!8789 lt!293228))))))

(declare-fun b!188705 () Bool)

(declare-fun e!130346 () Bool)

(assert (=> b!188705 (= e!130353 e!130346)))

(declare-fun res!157229 () Bool)

(assert (=> b!188705 (=> res!157229 e!130346)))

(assert (=> b!188705 (= res!157229 (not (= (_1!8788 lt!293244) (_2!8787 lt!293223))))))

(declare-fun lt!293248 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16286)

(assert (=> b!188705 (= lt!293244 (readNBitsLSBFirstsLoopPure!0 (_1!8787 lt!293223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293248))))

(declare-fun lt!293236 () tuple2!16288)

(declare-fun lt!293249 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188705 (validate_offset_bits!1 ((_ sign_extend 32) (size!4347 (buf!4821 (_2!8789 lt!293236)))) ((_ sign_extend 32) (currentByte!9093 (_2!8789 lt!293228))) ((_ sign_extend 32) (currentBit!9088 (_2!8789 lt!293228))) lt!293249)))

(declare-fun lt!293227 () Unit!13493)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7802 array!9864 (_ BitVec 64)) Unit!13493)

(assert (=> b!188705 (= lt!293227 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8789 lt!293228) (buf!4821 (_2!8789 lt!293236)) lt!293249))))

(assert (=> b!188705 (= lt!293249 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!293234 () (_ BitVec 64))

(declare-datatypes ((tuple2!16290 0))(
  ( (tuple2!16291 (_1!8790 BitStream!7802) (_2!8790 Bool)) )
))
(declare-fun lt!293242 () tuple2!16290)

(declare-fun lt!293237 () (_ BitVec 64))

(assert (=> b!188705 (= lt!293248 (bvor lt!293237 (ite (_2!8790 lt!293242) lt!293234 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188705 (= lt!293246 (readNBitsLSBFirstsLoopPure!0 (_1!8787 lt!293243) nBits!348 i!590 lt!293237))))

(declare-fun lt!293230 () (_ BitVec 64))

(assert (=> b!188705 (validate_offset_bits!1 ((_ sign_extend 32) (size!4347 (buf!4821 (_2!8789 lt!293236)))) ((_ sign_extend 32) (currentByte!9093 thiss!1204)) ((_ sign_extend 32) (currentBit!9088 thiss!1204)) lt!293230)))

(declare-fun lt!293231 () Unit!13493)

(assert (=> b!188705 (= lt!293231 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4821 (_2!8789 lt!293236)) lt!293230))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188705 (= lt!293237 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!293235 () Bool)

(assert (=> b!188705 (= (_2!8790 lt!293242) lt!293235)))

(declare-fun readBitPure!0 (BitStream!7802) tuple2!16290)

(assert (=> b!188705 (= lt!293242 (readBitPure!0 (_1!8787 lt!293243)))))

(declare-fun reader!0 (BitStream!7802 BitStream!7802) tuple2!16284)

(assert (=> b!188705 (= lt!293223 (reader!0 (_2!8789 lt!293228) (_2!8789 lt!293236)))))

(assert (=> b!188705 (= lt!293243 (reader!0 thiss!1204 (_2!8789 lt!293236)))))

(declare-fun e!130345 () Bool)

(assert (=> b!188705 e!130345))

(declare-fun res!157223 () Bool)

(assert (=> b!188705 (=> (not res!157223) (not e!130345))))

(declare-fun lt!293241 () tuple2!16290)

(declare-fun lt!293224 () tuple2!16290)

(assert (=> b!188705 (= res!157223 (= (bitIndex!0 (size!4347 (buf!4821 (_1!8790 lt!293241))) (currentByte!9093 (_1!8790 lt!293241)) (currentBit!9088 (_1!8790 lt!293241))) (bitIndex!0 (size!4347 (buf!4821 (_1!8790 lt!293224))) (currentByte!9093 (_1!8790 lt!293224)) (currentBit!9088 (_1!8790 lt!293224)))))))

(declare-fun lt!293233 () Unit!13493)

(declare-fun lt!293226 () BitStream!7802)

(declare-fun readBitPrefixLemma!0 (BitStream!7802 BitStream!7802) Unit!13493)

(assert (=> b!188705 (= lt!293233 (readBitPrefixLemma!0 lt!293226 (_2!8789 lt!293236)))))

(assert (=> b!188705 (= lt!293224 (readBitPure!0 (BitStream!7803 (buf!4821 (_2!8789 lt!293236)) (currentByte!9093 thiss!1204) (currentBit!9088 thiss!1204))))))

(assert (=> b!188705 (= lt!293241 (readBitPure!0 lt!293226))))

(declare-fun e!130350 () Bool)

(assert (=> b!188705 e!130350))

(declare-fun res!157222 () Bool)

(assert (=> b!188705 (=> (not res!157222) (not e!130350))))

(assert (=> b!188705 (= res!157222 (invariant!0 (currentBit!9088 thiss!1204) (currentByte!9093 thiss!1204) (size!4347 (buf!4821 (_2!8789 lt!293228)))))))

(assert (=> b!188705 (= lt!293226 (BitStream!7803 (buf!4821 (_2!8789 lt!293228)) (currentByte!9093 thiss!1204) (currentBit!9088 thiss!1204)))))

(declare-fun b!188706 () Bool)

(declare-fun e!130352 () Bool)

(declare-fun e!130343 () Bool)

(assert (=> b!188706 (= e!130352 e!130343)))

(declare-fun res!157221 () Bool)

(assert (=> b!188706 (=> (not res!157221) (not e!130343))))

(declare-fun lt!293251 () (_ BitVec 64))

(declare-fun lt!293232 () (_ BitVec 64))

(assert (=> b!188706 (= res!157221 (= lt!293251 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293232)))))

(assert (=> b!188706 (= lt!293251 (bitIndex!0 (size!4347 (buf!4821 (_2!8789 lt!293228))) (currentByte!9093 (_2!8789 lt!293228)) (currentBit!9088 (_2!8789 lt!293228))))))

(assert (=> b!188706 (= lt!293232 (bitIndex!0 (size!4347 (buf!4821 thiss!1204)) (currentByte!9093 thiss!1204) (currentBit!9088 thiss!1204)))))

(declare-fun b!188707 () Bool)

(assert (=> b!188707 (= e!130350 (invariant!0 (currentBit!9088 thiss!1204) (currentByte!9093 thiss!1204) (size!4347 (buf!4821 (_2!8789 lt!293236)))))))

(declare-fun b!188708 () Bool)

(assert (=> b!188708 (= e!130345 (= (_2!8790 lt!293241) (_2!8790 lt!293224)))))

(declare-fun res!157236 () Bool)

(declare-fun e!130349 () Bool)

(assert (=> start!40974 (=> (not res!157236) (not e!130349))))

(assert (=> start!40974 (= res!157236 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40974 e!130349))

(assert (=> start!40974 true))

(declare-fun inv!12 (BitStream!7802) Bool)

(assert (=> start!40974 (and (inv!12 thiss!1204) e!130348)))

(declare-fun b!188709 () Bool)

(assert (=> b!188709 (= e!130349 e!130354)))

(declare-fun res!157224 () Bool)

(assert (=> b!188709 (=> (not res!157224) (not e!130354))))

(assert (=> b!188709 (= res!157224 (validate_offset_bits!1 ((_ sign_extend 32) (size!4347 (buf!4821 thiss!1204))) ((_ sign_extend 32) (currentByte!9093 thiss!1204)) ((_ sign_extend 32) (currentBit!9088 thiss!1204)) lt!293230))))

(assert (=> b!188709 (= lt!293230 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!188710 () Bool)

(assert (=> b!188710 (= e!130346 e!130344)))

(declare-fun res!157225 () Bool)

(assert (=> b!188710 (=> res!157225 e!130344)))

(assert (=> b!188710 (= res!157225 (not (= (_1!8787 lt!293223) lt!293238)))))

(assert (=> b!188710 e!130342))

(declare-fun res!157219 () Bool)

(assert (=> b!188710 (=> (not res!157219) (not e!130342))))

(declare-fun lt!293240 () tuple2!16286)

(assert (=> b!188710 (= res!157219 (and (= (_2!8788 lt!293246) (_2!8788 lt!293240)) (= (_1!8788 lt!293246) (_1!8788 lt!293240))))))

(declare-fun lt!293250 () Unit!13493)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13493)

(assert (=> b!188710 (= lt!293250 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8787 lt!293243) nBits!348 i!590 lt!293237))))

(assert (=> b!188710 (= lt!293240 (readNBitsLSBFirstsLoopPure!0 lt!293238 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293248))))

(assert (=> b!188710 (= lt!293238 (withMovedBitIndex!0 (_1!8787 lt!293243) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!188711 () Bool)

(declare-fun res!157238 () Bool)

(assert (=> b!188711 (=> res!157238 e!130353)))

(assert (=> b!188711 (= res!157238 (not (invariant!0 (currentBit!9088 (_2!8789 lt!293236)) (currentByte!9093 (_2!8789 lt!293236)) (size!4347 (buf!4821 (_2!8789 lt!293236))))))))

(declare-fun b!188712 () Bool)

(declare-fun e!130347 () Bool)

(assert (=> b!188712 (= e!130347 e!130353)))

(declare-fun res!157230 () Bool)

(assert (=> b!188712 (=> res!157230 e!130353)))

(assert (=> b!188712 (= res!157230 (not (= lt!293239 (bvsub (bvsub (bvadd lt!293229 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!188712 (= lt!293239 (bitIndex!0 (size!4347 (buf!4821 (_2!8789 lt!293236))) (currentByte!9093 (_2!8789 lt!293236)) (currentBit!9088 (_2!8789 lt!293236))))))

(assert (=> b!188712 (isPrefixOf!0 thiss!1204 (_2!8789 lt!293236))))

(declare-fun lt!293225 () Unit!13493)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7802 BitStream!7802 BitStream!7802) Unit!13493)

(assert (=> b!188712 (= lt!293225 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8789 lt!293228) (_2!8789 lt!293236)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7802 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16288)

(assert (=> b!188712 (= lt!293236 (appendBitsLSBFirstLoopTR!0 (_2!8789 lt!293228) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!188713 () Bool)

(assert (=> b!188713 (= e!130344 true)))

(assert (=> b!188713 (= (size!4347 (buf!4821 thiss!1204)) (size!4347 (buf!4821 (_2!8789 lt!293236))))))

(declare-fun b!188714 () Bool)

(declare-fun res!157218 () Bool)

(assert (=> b!188714 (=> (not res!157218) (not e!130343))))

(assert (=> b!188714 (= res!157218 (isPrefixOf!0 thiss!1204 (_2!8789 lt!293228)))))

(declare-fun b!188715 () Bool)

(declare-fun res!157232 () Bool)

(assert (=> b!188715 (=> res!157232 e!130353)))

(assert (=> b!188715 (= res!157232 (not (isPrefixOf!0 (_2!8789 lt!293228) (_2!8789 lt!293236))))))

(declare-fun b!188716 () Bool)

(declare-fun res!157235 () Bool)

(assert (=> b!188716 (=> (not res!157235) (not e!130342))))

(assert (=> b!188716 (= res!157235 (= (_1!8787 lt!293243) (withMovedBitIndex!0 (_2!8787 lt!293243) (bvsub lt!293245 lt!293239))))))

(declare-fun b!188717 () Bool)

(declare-fun res!157226 () Bool)

(assert (=> b!188717 (=> res!157226 e!130353)))

(assert (=> b!188717 (= res!157226 (or (not (= (size!4347 (buf!4821 (_2!8789 lt!293236))) (size!4347 (buf!4821 thiss!1204)))) (not (= lt!293239 (bvsub (bvadd lt!293245 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!188718 () Bool)

(declare-fun e!130351 () Bool)

(declare-fun lt!293247 () tuple2!16290)

(assert (=> b!188718 (= e!130351 (= (bitIndex!0 (size!4347 (buf!4821 (_1!8790 lt!293247))) (currentByte!9093 (_1!8790 lt!293247)) (currentBit!9088 (_1!8790 lt!293247))) lt!293251))))

(declare-fun b!188719 () Bool)

(assert (=> b!188719 (= e!130343 e!130351)))

(declare-fun res!157239 () Bool)

(assert (=> b!188719 (=> (not res!157239) (not e!130351))))

(assert (=> b!188719 (= res!157239 (and (= (_2!8790 lt!293247) lt!293235) (= (_1!8790 lt!293247) (_2!8789 lt!293228))))))

(declare-fun readerFrom!0 (BitStream!7802 (_ BitVec 32) (_ BitVec 32)) BitStream!7802)

(assert (=> b!188719 (= lt!293247 (readBitPure!0 (readerFrom!0 (_2!8789 lt!293228) (currentBit!9088 thiss!1204) (currentByte!9093 thiss!1204))))))

(declare-fun b!188720 () Bool)

(assert (=> b!188720 (= e!130354 (not e!130347))))

(declare-fun res!157231 () Bool)

(assert (=> b!188720 (=> res!157231 e!130347)))

(assert (=> b!188720 (= res!157231 (not (= lt!293229 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293245))))))

(assert (=> b!188720 (= lt!293229 (bitIndex!0 (size!4347 (buf!4821 (_2!8789 lt!293228))) (currentByte!9093 (_2!8789 lt!293228)) (currentBit!9088 (_2!8789 lt!293228))))))

(assert (=> b!188720 (= lt!293245 (bitIndex!0 (size!4347 (buf!4821 thiss!1204)) (currentByte!9093 thiss!1204) (currentBit!9088 thiss!1204)))))

(assert (=> b!188720 e!130352))

(declare-fun res!157234 () Bool)

(assert (=> b!188720 (=> (not res!157234) (not e!130352))))

(assert (=> b!188720 (= res!157234 (= (size!4347 (buf!4821 thiss!1204)) (size!4347 (buf!4821 (_2!8789 lt!293228)))))))

(declare-fun appendBit!0 (BitStream!7802 Bool) tuple2!16288)

(assert (=> b!188720 (= lt!293228 (appendBit!0 thiss!1204 lt!293235))))

(assert (=> b!188720 (= lt!293235 (not (= (bvand v!189 lt!293234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188720 (= lt!293234 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!40974 res!157236) b!188709))

(assert (= (and b!188709 res!157224) b!188698))

(assert (= (and b!188698 res!157220) b!188701))

(assert (= (and b!188701 res!157237) b!188720))

(assert (= (and b!188720 res!157234) b!188706))

(assert (= (and b!188706 res!157221) b!188714))

(assert (= (and b!188714 res!157218) b!188719))

(assert (= (and b!188719 res!157239) b!188718))

(assert (= (and b!188720 (not res!157231)) b!188712))

(assert (= (and b!188712 (not res!157230)) b!188711))

(assert (= (and b!188711 (not res!157238)) b!188717))

(assert (= (and b!188717 (not res!157226)) b!188715))

(assert (= (and b!188715 (not res!157232)) b!188704))

(assert (= (and b!188704 (not res!157228)) b!188705))

(assert (= (and b!188705 res!157222) b!188707))

(assert (= (and b!188705 res!157223) b!188708))

(assert (= (and b!188705 (not res!157229)) b!188710))

(assert (= (and b!188710 res!157219) b!188716))

(assert (= (and b!188716 res!157235) b!188699))

(assert (= (and b!188699 res!157227) b!188700))

(assert (= (and b!188710 (not res!157225)) b!188703))

(assert (= (and b!188703 (not res!157233)) b!188713))

(assert (= start!40974 b!188702))

(declare-fun m!293569 () Bool)

(assert (=> b!188716 m!293569))

(declare-fun m!293571 () Bool)

(assert (=> b!188710 m!293571))

(declare-fun m!293573 () Bool)

(assert (=> b!188710 m!293573))

(declare-fun m!293575 () Bool)

(assert (=> b!188710 m!293575))

(declare-fun m!293577 () Bool)

(assert (=> b!188709 m!293577))

(declare-fun m!293579 () Bool)

(assert (=> b!188720 m!293579))

(declare-fun m!293581 () Bool)

(assert (=> b!188720 m!293581))

(declare-fun m!293583 () Bool)

(assert (=> b!188720 m!293583))

(declare-fun m!293585 () Bool)

(assert (=> b!188719 m!293585))

(assert (=> b!188719 m!293585))

(declare-fun m!293587 () Bool)

(assert (=> b!188719 m!293587))

(assert (=> b!188706 m!293579))

(assert (=> b!188706 m!293581))

(declare-fun m!293589 () Bool)

(assert (=> b!188715 m!293589))

(declare-fun m!293591 () Bool)

(assert (=> b!188699 m!293591))

(declare-fun m!293593 () Bool)

(assert (=> b!188705 m!293593))

(declare-fun m!293595 () Bool)

(assert (=> b!188705 m!293595))

(declare-fun m!293597 () Bool)

(assert (=> b!188705 m!293597))

(declare-fun m!293599 () Bool)

(assert (=> b!188705 m!293599))

(declare-fun m!293601 () Bool)

(assert (=> b!188705 m!293601))

(declare-fun m!293603 () Bool)

(assert (=> b!188705 m!293603))

(declare-fun m!293605 () Bool)

(assert (=> b!188705 m!293605))

(declare-fun m!293607 () Bool)

(assert (=> b!188705 m!293607))

(declare-fun m!293609 () Bool)

(assert (=> b!188705 m!293609))

(declare-fun m!293611 () Bool)

(assert (=> b!188705 m!293611))

(declare-fun m!293613 () Bool)

(assert (=> b!188705 m!293613))

(declare-fun m!293615 () Bool)

(assert (=> b!188705 m!293615))

(declare-fun m!293617 () Bool)

(assert (=> b!188705 m!293617))

(declare-fun m!293619 () Bool)

(assert (=> b!188705 m!293619))

(declare-fun m!293621 () Bool)

(assert (=> b!188705 m!293621))

(declare-fun m!293623 () Bool)

(assert (=> b!188705 m!293623))

(declare-fun m!293625 () Bool)

(assert (=> b!188714 m!293625))

(declare-fun m!293627 () Bool)

(assert (=> b!188718 m!293627))

(declare-fun m!293629 () Bool)

(assert (=> b!188702 m!293629))

(declare-fun m!293631 () Bool)

(assert (=> b!188707 m!293631))

(declare-fun m!293633 () Bool)

(assert (=> start!40974 m!293633))

(declare-fun m!293635 () Bool)

(assert (=> b!188711 m!293635))

(declare-fun m!293637 () Bool)

(assert (=> b!188712 m!293637))

(declare-fun m!293639 () Bool)

(assert (=> b!188712 m!293639))

(declare-fun m!293641 () Bool)

(assert (=> b!188712 m!293641))

(declare-fun m!293643 () Bool)

(assert (=> b!188712 m!293643))

(declare-fun m!293645 () Bool)

(assert (=> b!188698 m!293645))

(assert (=> b!188704 m!293625))

(declare-fun m!293647 () Bool)

(assert (=> b!188703 m!293647))

(declare-fun m!293649 () Bool)

(assert (=> b!188703 m!293649))

(push 1)

(assert (not b!188702))

(assert (not start!40974))

(assert (not b!188718))

(assert (not b!188714))

(assert (not b!188711))

(assert (not b!188704))

(assert (not b!188712))

(assert (not b!188710))

(assert (not b!188719))

(assert (not b!188698))

(assert (not b!188716))

(assert (not b!188703))

(assert (not b!188706))

(assert (not b!188709))

(assert (not b!188720))

(assert (not b!188705))

(assert (not b!188707))

(assert (not b!188715))

(assert (not b!188699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

