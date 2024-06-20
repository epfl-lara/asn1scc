; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43644 () Bool)

(assert start!43644)

(declare-fun b!207412 () Bool)

(declare-fun e!141777 () Bool)

(declare-datatypes ((array!10427 0))(
  ( (array!10428 (arr!5515 (Array (_ BitVec 32) (_ BitVec 8))) (size!4585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8278 0))(
  ( (BitStream!8279 (buf!5090 array!10427) (currentByte!9608 (_ BitVec 32)) (currentBit!9603 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17786 0))(
  ( (tuple2!17787 (_1!9548 BitStream!8278) (_2!9548 Bool)) )
))
(declare-fun lt!323713 () tuple2!17786)

(declare-fun lt!323698 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207412 (= e!141777 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323713))) (currentByte!9608 (_1!9548 lt!323713)) (currentBit!9603 (_1!9548 lt!323713))) lt!323698))))

(declare-fun b!207413 () Bool)

(declare-fun e!141778 () Bool)

(declare-fun e!141783 () Bool)

(assert (=> b!207413 (= e!141778 e!141783)))

(declare-fun res!174024 () Bool)

(assert (=> b!207413 (=> res!174024 e!141783)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!323706 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!323711 () (_ BitVec 64))

(assert (=> b!207413 (= res!174024 (not (= lt!323711 (bvsub (bvsub (bvadd lt!323706 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!14764 0))(
  ( (Unit!14765) )
))
(declare-datatypes ((tuple2!17788 0))(
  ( (tuple2!17789 (_1!9549 Unit!14764) (_2!9549 BitStream!8278)) )
))
(declare-fun lt!323709 () tuple2!17788)

(assert (=> b!207413 (= lt!323711 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323709))) (currentByte!9608 (_2!9549 lt!323709)) (currentBit!9603 (_2!9549 lt!323709))))))

(declare-fun thiss!1204 () BitStream!8278)

(declare-fun isPrefixOf!0 (BitStream!8278 BitStream!8278) Bool)

(assert (=> b!207413 (isPrefixOf!0 thiss!1204 (_2!9549 lt!323709))))

(declare-fun lt!323704 () Unit!14764)

(declare-fun lt!323703 () tuple2!17788)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8278 BitStream!8278 BitStream!8278) Unit!14764)

(assert (=> b!207413 (= lt!323704 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9549 lt!323703) (_2!9549 lt!323709)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8278 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17788)

(assert (=> b!207413 (= lt!323709 (appendBitsLSBFirstLoopTR!0 (_2!9549 lt!323703) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207414 () Bool)

(declare-fun e!141785 () Bool)

(declare-fun lt!323710 () tuple2!17786)

(declare-fun lt!323714 () tuple2!17786)

(assert (=> b!207414 (= e!141785 (= (_2!9548 lt!323710) (_2!9548 lt!323714)))))

(declare-fun res!174013 () Bool)

(declare-fun e!141780 () Bool)

(assert (=> start!43644 (=> (not res!174013) (not e!141780))))

(assert (=> start!43644 (= res!174013 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43644 e!141780))

(assert (=> start!43644 true))

(declare-fun e!141779 () Bool)

(declare-fun inv!12 (BitStream!8278) Bool)

(assert (=> start!43644 (and (inv!12 thiss!1204) e!141779)))

(declare-fun b!207415 () Bool)

(declare-fun res!174028 () Bool)

(declare-fun e!141775 () Bool)

(assert (=> b!207415 (=> (not res!174028) (not e!141775))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207415 (= res!174028 (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 thiss!1204))))))

(declare-fun b!207416 () Bool)

(declare-fun res!174018 () Bool)

(assert (=> b!207416 (=> res!174018 e!141783)))

(assert (=> b!207416 (= res!174018 (not (invariant!0 (currentBit!9603 (_2!9549 lt!323709)) (currentByte!9608 (_2!9549 lt!323709)) (size!4585 (buf!5090 (_2!9549 lt!323709))))))))

(declare-fun b!207417 () Bool)

(assert (=> b!207417 (= e!141775 (not e!141778))))

(declare-fun res!174019 () Bool)

(assert (=> b!207417 (=> res!174019 e!141778)))

(declare-fun lt!323700 () (_ BitVec 64))

(assert (=> b!207417 (= res!174019 (not (= lt!323706 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323700))))))

(assert (=> b!207417 (= lt!323706 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(assert (=> b!207417 (= lt!323700 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(declare-fun e!141784 () Bool)

(assert (=> b!207417 e!141784))

(declare-fun res!174017 () Bool)

(assert (=> b!207417 (=> (not res!174017) (not e!141784))))

(assert (=> b!207417 (= res!174017 (= (size!4585 (buf!5090 thiss!1204)) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(declare-fun lt!323708 () Bool)

(declare-fun appendBit!0 (BitStream!8278 Bool) tuple2!17788)

(assert (=> b!207417 (= lt!323703 (appendBit!0 thiss!1204 lt!323708))))

(assert (=> b!207417 (= lt!323708 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207418 () Bool)

(declare-fun array_inv!4326 (array!10427) Bool)

(assert (=> b!207418 (= e!141779 (array_inv!4326 (buf!5090 thiss!1204)))))

(declare-fun b!207419 () Bool)

(declare-fun res!174027 () Bool)

(declare-fun e!141786 () Bool)

(assert (=> b!207419 (=> (not res!174027) (not e!141786))))

(assert (=> b!207419 (= res!174027 (isPrefixOf!0 thiss!1204 (_2!9549 lt!323703)))))

(declare-fun b!207420 () Bool)

(declare-fun e!141782 () Bool)

(assert (=> b!207420 (= e!141782 (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323709)))))))

(declare-fun b!207421 () Bool)

(assert (=> b!207421 (= e!141786 e!141777)))

(declare-fun res!174022 () Bool)

(assert (=> b!207421 (=> (not res!174022) (not e!141777))))

(assert (=> b!207421 (= res!174022 (and (= (_2!9548 lt!323713) lt!323708) (= (_1!9548 lt!323713) (_2!9549 lt!323703))))))

(declare-fun readBitPure!0 (BitStream!8278) tuple2!17786)

(declare-fun readerFrom!0 (BitStream!8278 (_ BitVec 32) (_ BitVec 32)) BitStream!8278)

(assert (=> b!207421 (= lt!323713 (readBitPure!0 (readerFrom!0 (_2!9549 lt!323703) (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204))))))

(declare-fun b!207422 () Bool)

(declare-fun res!174023 () Bool)

(assert (=> b!207422 (=> res!174023 e!141783)))

(assert (=> b!207422 (= res!174023 (or (not (= (size!4585 (buf!5090 (_2!9549 lt!323709))) (size!4585 (buf!5090 thiss!1204)))) (not (= lt!323711 (bvsub (bvadd lt!323700 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207423 () Bool)

(assert (=> b!207423 (= e!141784 e!141786)))

(declare-fun res!174020 () Bool)

(assert (=> b!207423 (=> (not res!174020) (not e!141786))))

(declare-fun lt!323705 () (_ BitVec 64))

(assert (=> b!207423 (= res!174020 (= lt!323698 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323705)))))

(assert (=> b!207423 (= lt!323698 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(assert (=> b!207423 (= lt!323705 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(declare-fun b!207424 () Bool)

(declare-fun res!174029 () Bool)

(assert (=> b!207424 (=> res!174029 e!141783)))

(assert (=> b!207424 (= res!174029 (not (isPrefixOf!0 thiss!1204 (_2!9549 lt!323703))))))

(declare-fun b!207425 () Bool)

(assert (=> b!207425 (= e!141780 e!141775)))

(declare-fun res!174026 () Bool)

(assert (=> b!207425 (=> (not res!174026) (not e!141775))))

(declare-fun lt!323712 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207425 (= res!174026 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204)) lt!323712))))

(assert (=> b!207425 (= lt!323712 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207426 () Bool)

(declare-fun e!141781 () Bool)

(declare-fun lt!323699 () (_ BitVec 64))

(assert (=> b!207426 (= e!141781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703))) lt!323699))))

(declare-fun b!207427 () Bool)

(declare-fun res!174015 () Bool)

(assert (=> b!207427 (=> (not res!174015) (not e!141775))))

(assert (=> b!207427 (= res!174015 (not (= i!590 nBits!348)))))

(declare-fun b!207428 () Bool)

(assert (=> b!207428 (= e!141783 e!141781)))

(declare-fun res!174025 () Bool)

(assert (=> b!207428 (=> res!174025 e!141781)))

(assert (=> b!207428 (= res!174025 (or (not (= (size!4585 (buf!5090 (_2!9549 lt!323703))) (size!4585 (buf!5090 (_2!9549 lt!323709))))) (bvslt lt!323699 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207428 (= lt!323699 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17790 0))(
  ( (tuple2!17791 (_1!9550 BitStream!8278) (_2!9550 (_ BitVec 64))) )
))
(declare-fun lt!323701 () tuple2!17790)

(declare-datatypes ((tuple2!17792 0))(
  ( (tuple2!17793 (_1!9551 BitStream!8278) (_2!9551 BitStream!8278)) )
))
(declare-fun lt!323697 () tuple2!17792)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17790)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207428 (= lt!323701 (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!323697) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207428 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204)) lt!323712)))

(declare-fun lt!323696 () Unit!14764)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8278 array!10427 (_ BitVec 64)) Unit!14764)

(assert (=> b!207428 (= lt!323696 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5090 (_2!9549 lt!323709)) lt!323712))))

(assert (=> b!207428 (= (_2!9548 (readBitPure!0 (_1!9551 lt!323697))) lt!323708)))

(declare-fun lt!323707 () tuple2!17792)

(declare-fun reader!0 (BitStream!8278 BitStream!8278) tuple2!17792)

(assert (=> b!207428 (= lt!323707 (reader!0 (_2!9549 lt!323703) (_2!9549 lt!323709)))))

(assert (=> b!207428 (= lt!323697 (reader!0 thiss!1204 (_2!9549 lt!323709)))))

(assert (=> b!207428 e!141785))

(declare-fun res!174014 () Bool)

(assert (=> b!207428 (=> (not res!174014) (not e!141785))))

(assert (=> b!207428 (= res!174014 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323710))) (currentByte!9608 (_1!9548 lt!323710)) (currentBit!9603 (_1!9548 lt!323710))) (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323714))) (currentByte!9608 (_1!9548 lt!323714)) (currentBit!9603 (_1!9548 lt!323714)))))))

(declare-fun lt!323702 () Unit!14764)

(declare-fun lt!323695 () BitStream!8278)

(declare-fun readBitPrefixLemma!0 (BitStream!8278 BitStream!8278) Unit!14764)

(assert (=> b!207428 (= lt!323702 (readBitPrefixLemma!0 lt!323695 (_2!9549 lt!323709)))))

(assert (=> b!207428 (= lt!323714 (readBitPure!0 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204))))))

(assert (=> b!207428 (= lt!323710 (readBitPure!0 lt!323695))))

(assert (=> b!207428 e!141782))

(declare-fun res!174016 () Bool)

(assert (=> b!207428 (=> (not res!174016) (not e!141782))))

(assert (=> b!207428 (= res!174016 (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(assert (=> b!207428 (= lt!323695 (BitStream!8279 (buf!5090 (_2!9549 lt!323703)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(declare-fun b!207429 () Bool)

(declare-fun res!174021 () Bool)

(assert (=> b!207429 (=> res!174021 e!141783)))

(assert (=> b!207429 (= res!174021 (not (isPrefixOf!0 (_2!9549 lt!323703) (_2!9549 lt!323709))))))

(assert (= (and start!43644 res!174013) b!207425))

(assert (= (and b!207425 res!174026) b!207415))

(assert (= (and b!207415 res!174028) b!207427))

(assert (= (and b!207427 res!174015) b!207417))

(assert (= (and b!207417 res!174017) b!207423))

(assert (= (and b!207423 res!174020) b!207419))

(assert (= (and b!207419 res!174027) b!207421))

(assert (= (and b!207421 res!174022) b!207412))

(assert (= (and b!207417 (not res!174019)) b!207413))

(assert (= (and b!207413 (not res!174024)) b!207416))

(assert (= (and b!207416 (not res!174018)) b!207422))

(assert (= (and b!207422 (not res!174023)) b!207429))

(assert (= (and b!207429 (not res!174021)) b!207424))

(assert (= (and b!207424 (not res!174029)) b!207428))

(assert (= (and b!207428 res!174016) b!207420))

(assert (= (and b!207428 res!174014) b!207414))

(assert (= (and b!207428 (not res!174025)) b!207426))

(assert (= start!43644 b!207418))

(declare-fun m!319149 () Bool)

(assert (=> b!207428 m!319149))

(declare-fun m!319151 () Bool)

(assert (=> b!207428 m!319151))

(declare-fun m!319153 () Bool)

(assert (=> b!207428 m!319153))

(declare-fun m!319155 () Bool)

(assert (=> b!207428 m!319155))

(declare-fun m!319157 () Bool)

(assert (=> b!207428 m!319157))

(declare-fun m!319159 () Bool)

(assert (=> b!207428 m!319159))

(declare-fun m!319161 () Bool)

(assert (=> b!207428 m!319161))

(declare-fun m!319163 () Bool)

(assert (=> b!207428 m!319163))

(declare-fun m!319165 () Bool)

(assert (=> b!207428 m!319165))

(declare-fun m!319167 () Bool)

(assert (=> b!207428 m!319167))

(declare-fun m!319169 () Bool)

(assert (=> b!207428 m!319169))

(declare-fun m!319171 () Bool)

(assert (=> b!207428 m!319171))

(declare-fun m!319173 () Bool)

(assert (=> b!207428 m!319173))

(declare-fun m!319175 () Bool)

(assert (=> b!207423 m!319175))

(declare-fun m!319177 () Bool)

(assert (=> b!207423 m!319177))

(declare-fun m!319179 () Bool)

(assert (=> b!207426 m!319179))

(declare-fun m!319181 () Bool)

(assert (=> b!207412 m!319181))

(declare-fun m!319183 () Bool)

(assert (=> b!207418 m!319183))

(declare-fun m!319185 () Bool)

(assert (=> b!207421 m!319185))

(assert (=> b!207421 m!319185))

(declare-fun m!319187 () Bool)

(assert (=> b!207421 m!319187))

(declare-fun m!319189 () Bool)

(assert (=> start!43644 m!319189))

(declare-fun m!319191 () Bool)

(assert (=> b!207415 m!319191))

(declare-fun m!319193 () Bool)

(assert (=> b!207425 m!319193))

(declare-fun m!319195 () Bool)

(assert (=> b!207420 m!319195))

(declare-fun m!319197 () Bool)

(assert (=> b!207419 m!319197))

(declare-fun m!319199 () Bool)

(assert (=> b!207413 m!319199))

(declare-fun m!319201 () Bool)

(assert (=> b!207413 m!319201))

(declare-fun m!319203 () Bool)

(assert (=> b!207413 m!319203))

(declare-fun m!319205 () Bool)

(assert (=> b!207413 m!319205))

(declare-fun m!319207 () Bool)

(assert (=> b!207429 m!319207))

(declare-fun m!319209 () Bool)

(assert (=> b!207416 m!319209))

(assert (=> b!207424 m!319197))

(assert (=> b!207417 m!319175))

(assert (=> b!207417 m!319177))

(declare-fun m!319211 () Bool)

(assert (=> b!207417 m!319211))

(push 1)

(assert (not b!207413))

(assert (not b!207412))

(assert (not b!207421))

(assert (not b!207417))

(assert (not b!207416))

(assert (not b!207423))

(assert (not b!207418))

(assert (not b!207424))

(assert (not b!207428))

(assert (not b!207415))

(assert (not b!207429))

(assert (not b!207420))

(assert (not start!43644))

(assert (not b!207426))

(assert (not b!207419))

(assert (not b!207425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70183 () Bool)

(declare-datatypes ((tuple2!17816 0))(
  ( (tuple2!17817 (_1!9563 Bool) (_2!9563 BitStream!8278)) )
))
(declare-fun lt!323858 () tuple2!17816)

(declare-fun readBit!0 (BitStream!8278) tuple2!17816)

(assert (=> d!70183 (= lt!323858 (readBit!0 (readerFrom!0 (_2!9549 lt!323703) (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204))))))

(assert (=> d!70183 (= (readBitPure!0 (readerFrom!0 (_2!9549 lt!323703) (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204))) (tuple2!17787 (_2!9563 lt!323858) (_1!9563 lt!323858)))))

(declare-fun bs!17263 () Bool)

(assert (= bs!17263 d!70183))

(assert (=> bs!17263 m!319185))

(declare-fun m!319347 () Bool)

(assert (=> bs!17263 m!319347))

(assert (=> b!207421 d!70183))

(declare-fun d!70185 () Bool)

(declare-fun e!141870 () Bool)

(assert (=> d!70185 e!141870))

(declare-fun res!174150 () Bool)

(assert (=> d!70185 (=> (not res!174150) (not e!141870))))

(assert (=> d!70185 (= res!174150 (invariant!0 (currentBit!9603 (_2!9549 lt!323703)) (currentByte!9608 (_2!9549 lt!323703)) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(assert (=> d!70185 (= (readerFrom!0 (_2!9549 lt!323703) (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204)) (BitStream!8279 (buf!5090 (_2!9549 lt!323703)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(declare-fun b!207555 () Bool)

(assert (=> b!207555 (= e!141870 (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(assert (= (and d!70185 res!174150) b!207555))

(declare-fun m!319349 () Bool)

(assert (=> d!70185 m!319349))

(assert (=> b!207555 m!319153))

(assert (=> b!207421 d!70185))

(declare-fun d!70187 () Bool)

(declare-fun e!141873 () Bool)

(assert (=> d!70187 e!141873))

(declare-fun res!174156 () Bool)

(assert (=> d!70187 (=> (not res!174156) (not e!141873))))

(declare-fun lt!323871 () (_ BitVec 64))

(declare-fun lt!323875 () (_ BitVec 64))

(declare-fun lt!323876 () (_ BitVec 64))

(assert (=> d!70187 (= res!174156 (= lt!323876 (bvsub lt!323871 lt!323875)))))

(assert (=> d!70187 (or (= (bvand lt!323871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323875 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323871 lt!323875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70187 (= lt!323875 (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323713)))) ((_ sign_extend 32) (currentByte!9608 (_1!9548 lt!323713))) ((_ sign_extend 32) (currentBit!9603 (_1!9548 lt!323713)))))))

(declare-fun lt!323874 () (_ BitVec 64))

(declare-fun lt!323872 () (_ BitVec 64))

(assert (=> d!70187 (= lt!323871 (bvmul lt!323874 lt!323872))))

(assert (=> d!70187 (or (= lt!323874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!323872 (bvsdiv (bvmul lt!323874 lt!323872) lt!323874)))))

(assert (=> d!70187 (= lt!323872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70187 (= lt!323874 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323713)))))))

(assert (=> d!70187 (= lt!323876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9608 (_1!9548 lt!323713))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9603 (_1!9548 lt!323713)))))))

(assert (=> d!70187 (invariant!0 (currentBit!9603 (_1!9548 lt!323713)) (currentByte!9608 (_1!9548 lt!323713)) (size!4585 (buf!5090 (_1!9548 lt!323713))))))

(assert (=> d!70187 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323713))) (currentByte!9608 (_1!9548 lt!323713)) (currentBit!9603 (_1!9548 lt!323713))) lt!323876)))

(declare-fun b!207560 () Bool)

(declare-fun res!174155 () Bool)

(assert (=> b!207560 (=> (not res!174155) (not e!141873))))

(assert (=> b!207560 (= res!174155 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!323876))))

(declare-fun b!207561 () Bool)

(declare-fun lt!323873 () (_ BitVec 64))

(assert (=> b!207561 (= e!141873 (bvsle lt!323876 (bvmul lt!323873 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207561 (or (= lt!323873 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!323873 #b0000000000000000000000000000000000000000000000000000000000001000) lt!323873)))))

(assert (=> b!207561 (= lt!323873 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323713)))))))

(assert (= (and d!70187 res!174156) b!207560))

(assert (= (and b!207560 res!174155) b!207561))

(declare-fun m!319351 () Bool)

(assert (=> d!70187 m!319351))

(declare-fun m!319353 () Bool)

(assert (=> d!70187 m!319353))

(assert (=> b!207412 d!70187))

(declare-fun d!70189 () Bool)

(declare-fun e!141874 () Bool)

(assert (=> d!70189 e!141874))

(declare-fun res!174158 () Bool)

(assert (=> d!70189 (=> (not res!174158) (not e!141874))))

(declare-fun lt!323882 () (_ BitVec 64))

(declare-fun lt!323881 () (_ BitVec 64))

(declare-fun lt!323877 () (_ BitVec 64))

(assert (=> d!70189 (= res!174158 (= lt!323882 (bvsub lt!323877 lt!323881)))))

(assert (=> d!70189 (or (= (bvand lt!323877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323881 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323877 lt!323881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70189 (= lt!323881 (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703)))))))

(declare-fun lt!323880 () (_ BitVec 64))

(declare-fun lt!323878 () (_ BitVec 64))

(assert (=> d!70189 (= lt!323877 (bvmul lt!323880 lt!323878))))

(assert (=> d!70189 (or (= lt!323880 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!323878 (bvsdiv (bvmul lt!323880 lt!323878) lt!323880)))))

(assert (=> d!70189 (= lt!323878 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70189 (= lt!323880 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(assert (=> d!70189 (= lt!323882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703)))))))

(assert (=> d!70189 (invariant!0 (currentBit!9603 (_2!9549 lt!323703)) (currentByte!9608 (_2!9549 lt!323703)) (size!4585 (buf!5090 (_2!9549 lt!323703))))))

(assert (=> d!70189 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))) lt!323882)))

(declare-fun b!207562 () Bool)

(declare-fun res!174157 () Bool)

(assert (=> b!207562 (=> (not res!174157) (not e!141874))))

(assert (=> b!207562 (= res!174157 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!323882))))

(declare-fun b!207563 () Bool)

(declare-fun lt!323879 () (_ BitVec 64))

(assert (=> b!207563 (= e!141874 (bvsle lt!323882 (bvmul lt!323879 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207563 (or (= lt!323879 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!323879 #b0000000000000000000000000000000000000000000000000000000000001000) lt!323879)))))

(assert (=> b!207563 (= lt!323879 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(assert (= (and d!70189 res!174158) b!207562))

(assert (= (and b!207562 res!174157) b!207563))

(declare-fun m!319355 () Bool)

(assert (=> d!70189 m!319355))

(assert (=> d!70189 m!319349))

(assert (=> b!207423 d!70189))

(declare-fun d!70191 () Bool)

(declare-fun e!141875 () Bool)

(assert (=> d!70191 e!141875))

(declare-fun res!174160 () Bool)

(assert (=> d!70191 (=> (not res!174160) (not e!141875))))

(declare-fun lt!323883 () (_ BitVec 64))

(declare-fun lt!323888 () (_ BitVec 64))

(declare-fun lt!323887 () (_ BitVec 64))

(assert (=> d!70191 (= res!174160 (= lt!323888 (bvsub lt!323883 lt!323887)))))

(assert (=> d!70191 (or (= (bvand lt!323883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323887 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323883 lt!323887) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70191 (= lt!323887 (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204))))))

(declare-fun lt!323886 () (_ BitVec 64))

(declare-fun lt!323884 () (_ BitVec 64))

(assert (=> d!70191 (= lt!323883 (bvmul lt!323886 lt!323884))))

(assert (=> d!70191 (or (= lt!323886 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!323884 (bvsdiv (bvmul lt!323886 lt!323884) lt!323886)))))

(assert (=> d!70191 (= lt!323884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70191 (= lt!323886 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))))))

(assert (=> d!70191 (= lt!323888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9608 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9603 thiss!1204))))))

(assert (=> d!70191 (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 thiss!1204)))))

(assert (=> d!70191 (= (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)) lt!323888)))

(declare-fun b!207564 () Bool)

(declare-fun res!174159 () Bool)

(assert (=> b!207564 (=> (not res!174159) (not e!141875))))

(assert (=> b!207564 (= res!174159 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!323888))))

(declare-fun b!207565 () Bool)

(declare-fun lt!323885 () (_ BitVec 64))

(assert (=> b!207565 (= e!141875 (bvsle lt!323888 (bvmul lt!323885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207565 (or (= lt!323885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!323885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!323885)))))

(assert (=> b!207565 (= lt!323885 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))))))

(assert (= (and d!70191 res!174160) b!207564))

(assert (= (and b!207564 res!174159) b!207565))

(declare-fun m!319357 () Bool)

(assert (=> d!70191 m!319357))

(assert (=> d!70191 m!319191))

(assert (=> b!207423 d!70191))

(declare-fun d!70193 () Bool)

(declare-fun res!174167 () Bool)

(declare-fun e!141881 () Bool)

(assert (=> d!70193 (=> (not res!174167) (not e!141881))))

(assert (=> d!70193 (= res!174167 (= (size!4585 (buf!5090 (_2!9549 lt!323703))) (size!4585 (buf!5090 (_2!9549 lt!323709)))))))

(assert (=> d!70193 (= (isPrefixOf!0 (_2!9549 lt!323703) (_2!9549 lt!323709)) e!141881)))

(declare-fun b!207572 () Bool)

(declare-fun res!174168 () Bool)

(assert (=> b!207572 (=> (not res!174168) (not e!141881))))

(assert (=> b!207572 (= res!174168 (bvsle (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323709))) (currentByte!9608 (_2!9549 lt!323709)) (currentBit!9603 (_2!9549 lt!323709)))))))

(declare-fun b!207573 () Bool)

(declare-fun e!141880 () Bool)

(assert (=> b!207573 (= e!141881 e!141880)))

(declare-fun res!174169 () Bool)

(assert (=> b!207573 (=> res!174169 e!141880)))

(assert (=> b!207573 (= res!174169 (= (size!4585 (buf!5090 (_2!9549 lt!323703))) #b00000000000000000000000000000000))))

(declare-fun b!207574 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10427 array!10427 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207574 (= e!141880 (arrayBitRangesEq!0 (buf!5090 (_2!9549 lt!323703)) (buf!5090 (_2!9549 lt!323709)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703)))))))

(assert (= (and d!70193 res!174167) b!207572))

(assert (= (and b!207572 res!174168) b!207573))

(assert (= (and b!207573 (not res!174169)) b!207574))

(assert (=> b!207572 m!319175))

(assert (=> b!207572 m!319199))

(assert (=> b!207574 m!319175))

(assert (=> b!207574 m!319175))

(declare-fun m!319359 () Bool)

(assert (=> b!207574 m!319359))

(assert (=> b!207429 d!70193))

(declare-fun d!70197 () Bool)

(declare-fun res!174170 () Bool)

(declare-fun e!141883 () Bool)

(assert (=> d!70197 (=> (not res!174170) (not e!141883))))

(assert (=> d!70197 (= res!174170 (= (size!4585 (buf!5090 thiss!1204)) (size!4585 (buf!5090 (_2!9549 lt!323703)))))))

(assert (=> d!70197 (= (isPrefixOf!0 thiss!1204 (_2!9549 lt!323703)) e!141883)))

(declare-fun b!207575 () Bool)

(declare-fun res!174171 () Bool)

(assert (=> b!207575 (=> (not res!174171) (not e!141883))))

(assert (=> b!207575 (= res!174171 (bvsle (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703)))))))

(declare-fun b!207576 () Bool)

(declare-fun e!141882 () Bool)

(assert (=> b!207576 (= e!141883 e!141882)))

(declare-fun res!174172 () Bool)

(assert (=> b!207576 (=> res!174172 e!141882)))

(assert (=> b!207576 (= res!174172 (= (size!4585 (buf!5090 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!207577 () Bool)

(assert (=> b!207577 (= e!141882 (arrayBitRangesEq!0 (buf!5090 thiss!1204) (buf!5090 (_2!9549 lt!323703)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204))))))

(assert (= (and d!70197 res!174170) b!207575))

(assert (= (and b!207575 res!174171) b!207576))

(assert (= (and b!207576 (not res!174172)) b!207577))

(assert (=> b!207575 m!319177))

(assert (=> b!207575 m!319175))

(assert (=> b!207577 m!319177))

(assert (=> b!207577 m!319177))

(declare-fun m!319361 () Bool)

(assert (=> b!207577 m!319361))

(assert (=> b!207419 d!70197))

(declare-fun d!70199 () Bool)

(assert (=> d!70199 (= (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323709)))) (and (bvsge (currentBit!9603 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9603 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9608 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323709)))) (and (= (currentBit!9603 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323709))))))))))

(assert (=> b!207420 d!70199))

(declare-fun d!70201 () Bool)

(assert (=> d!70201 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 thiss!1204))))))

(declare-fun bs!17264 () Bool)

(assert (= bs!17264 d!70201))

(assert (=> bs!17264 m!319191))

(assert (=> start!43644 d!70201))

(declare-fun d!70203 () Bool)

(assert (=> d!70203 (= (invariant!0 (currentBit!9603 (_2!9549 lt!323709)) (currentByte!9608 (_2!9549 lt!323709)) (size!4585 (buf!5090 (_2!9549 lt!323709)))) (and (bvsge (currentBit!9603 (_2!9549 lt!323709)) #b00000000000000000000000000000000) (bvslt (currentBit!9603 (_2!9549 lt!323709)) #b00000000000000000000000000001000) (bvsge (currentByte!9608 (_2!9549 lt!323709)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9608 (_2!9549 lt!323709)) (size!4585 (buf!5090 (_2!9549 lt!323709)))) (and (= (currentBit!9603 (_2!9549 lt!323709)) #b00000000000000000000000000000000) (= (currentByte!9608 (_2!9549 lt!323709)) (size!4585 (buf!5090 (_2!9549 lt!323709))))))))))

(assert (=> b!207416 d!70203))

(declare-fun d!70205 () Bool)

(assert (=> d!70205 (= (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323703)))) (and (bvsge (currentBit!9603 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9603 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9608 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323703)))) (and (= (currentBit!9603 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9608 thiss!1204) (size!4585 (buf!5090 (_2!9549 lt!323703))))))))))

(assert (=> b!207428 d!70205))

(declare-fun b!207603 () Bool)

(declare-fun e!141897 () Unit!14764)

(declare-fun lt!323957 () Unit!14764)

(assert (=> b!207603 (= e!141897 lt!323957)))

(declare-fun lt!323967 () (_ BitVec 64))

(assert (=> b!207603 (= lt!323967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!323953 () (_ BitVec 64))

(assert (=> b!207603 (= lt!323953 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10427 array!10427 (_ BitVec 64) (_ BitVec 64)) Unit!14764)

(assert (=> b!207603 (= lt!323957 (arrayBitRangesEqSymmetric!0 (buf!5090 (_2!9549 lt!323703)) (buf!5090 (_2!9549 lt!323709)) lt!323967 lt!323953))))

(assert (=> b!207603 (arrayBitRangesEq!0 (buf!5090 (_2!9549 lt!323709)) (buf!5090 (_2!9549 lt!323703)) lt!323967 lt!323953)))

(declare-fun b!207604 () Bool)

(declare-fun res!174196 () Bool)

(declare-fun e!141898 () Bool)

(assert (=> b!207604 (=> (not res!174196) (not e!141898))))

(declare-fun lt!323958 () tuple2!17792)

(assert (=> b!207604 (= res!174196 (isPrefixOf!0 (_1!9551 lt!323958) (_2!9549 lt!323703)))))

(declare-fun b!207605 () Bool)

(declare-fun res!174195 () Bool)

(assert (=> b!207605 (=> (not res!174195) (not e!141898))))

(assert (=> b!207605 (= res!174195 (isPrefixOf!0 (_2!9551 lt!323958) (_2!9549 lt!323709)))))

(declare-fun b!207606 () Bool)

(declare-fun Unit!14794 () Unit!14764)

(assert (=> b!207606 (= e!141897 Unit!14794)))

(declare-fun b!207607 () Bool)

(declare-fun lt!323961 () (_ BitVec 64))

(declare-fun lt!323950 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8278 (_ BitVec 64)) BitStream!8278)

(assert (=> b!207607 (= e!141898 (= (_1!9551 lt!323958) (withMovedBitIndex!0 (_2!9551 lt!323958) (bvsub lt!323961 lt!323950))))))

(assert (=> b!207607 (or (= (bvand lt!323961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323961 lt!323950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207607 (= lt!323950 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323709))) (currentByte!9608 (_2!9549 lt!323709)) (currentBit!9603 (_2!9549 lt!323709))))))

(assert (=> b!207607 (= lt!323961 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(declare-fun d!70207 () Bool)

(assert (=> d!70207 e!141898))

(declare-fun res!174194 () Bool)

(assert (=> d!70207 (=> (not res!174194) (not e!141898))))

(assert (=> d!70207 (= res!174194 (isPrefixOf!0 (_1!9551 lt!323958) (_2!9551 lt!323958)))))

(declare-fun lt!323964 () BitStream!8278)

(assert (=> d!70207 (= lt!323958 (tuple2!17793 lt!323964 (_2!9549 lt!323709)))))

(declare-fun lt!323955 () Unit!14764)

(declare-fun lt!323966 () Unit!14764)

(assert (=> d!70207 (= lt!323955 lt!323966)))

(assert (=> d!70207 (isPrefixOf!0 lt!323964 (_2!9549 lt!323709))))

(assert (=> d!70207 (= lt!323966 (lemmaIsPrefixTransitive!0 lt!323964 (_2!9549 lt!323709) (_2!9549 lt!323709)))))

(declare-fun lt!323956 () Unit!14764)

(declare-fun lt!323951 () Unit!14764)

(assert (=> d!70207 (= lt!323956 lt!323951)))

(assert (=> d!70207 (isPrefixOf!0 lt!323964 (_2!9549 lt!323709))))

(assert (=> d!70207 (= lt!323951 (lemmaIsPrefixTransitive!0 lt!323964 (_2!9549 lt!323703) (_2!9549 lt!323709)))))

(declare-fun lt!323968 () Unit!14764)

(assert (=> d!70207 (= lt!323968 e!141897)))

(declare-fun c!10211 () Bool)

(assert (=> d!70207 (= c!10211 (not (= (size!4585 (buf!5090 (_2!9549 lt!323703))) #b00000000000000000000000000000000)))))

(declare-fun lt!323965 () Unit!14764)

(declare-fun lt!323952 () Unit!14764)

(assert (=> d!70207 (= lt!323965 lt!323952)))

(assert (=> d!70207 (isPrefixOf!0 (_2!9549 lt!323709) (_2!9549 lt!323709))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8278) Unit!14764)

(assert (=> d!70207 (= lt!323952 (lemmaIsPrefixRefl!0 (_2!9549 lt!323709)))))

(declare-fun lt!323963 () Unit!14764)

(declare-fun lt!323962 () Unit!14764)

(assert (=> d!70207 (= lt!323963 lt!323962)))

(assert (=> d!70207 (= lt!323962 (lemmaIsPrefixRefl!0 (_2!9549 lt!323709)))))

(declare-fun lt!323960 () Unit!14764)

(declare-fun lt!323954 () Unit!14764)

(assert (=> d!70207 (= lt!323960 lt!323954)))

(assert (=> d!70207 (isPrefixOf!0 lt!323964 lt!323964)))

(assert (=> d!70207 (= lt!323954 (lemmaIsPrefixRefl!0 lt!323964))))

(declare-fun lt!323959 () Unit!14764)

(declare-fun lt!323969 () Unit!14764)

(assert (=> d!70207 (= lt!323959 lt!323969)))

(assert (=> d!70207 (isPrefixOf!0 (_2!9549 lt!323703) (_2!9549 lt!323703))))

(assert (=> d!70207 (= lt!323969 (lemmaIsPrefixRefl!0 (_2!9549 lt!323703)))))

(assert (=> d!70207 (= lt!323964 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(assert (=> d!70207 (isPrefixOf!0 (_2!9549 lt!323703) (_2!9549 lt!323709))))

(assert (=> d!70207 (= (reader!0 (_2!9549 lt!323703) (_2!9549 lt!323709)) lt!323958)))

(assert (= (and d!70207 c!10211) b!207603))

(assert (= (and d!70207 (not c!10211)) b!207606))

(assert (= (and d!70207 res!174194) b!207604))

(assert (= (and b!207604 res!174196) b!207605))

(assert (= (and b!207605 res!174195) b!207607))

(declare-fun m!319369 () Bool)

(assert (=> b!207604 m!319369))

(declare-fun m!319371 () Bool)

(assert (=> b!207607 m!319371))

(assert (=> b!207607 m!319199))

(assert (=> b!207607 m!319175))

(assert (=> b!207603 m!319175))

(declare-fun m!319373 () Bool)

(assert (=> b!207603 m!319373))

(declare-fun m!319375 () Bool)

(assert (=> b!207603 m!319375))

(assert (=> d!70207 m!319207))

(declare-fun m!319377 () Bool)

(assert (=> d!70207 m!319377))

(declare-fun m!319379 () Bool)

(assert (=> d!70207 m!319379))

(declare-fun m!319381 () Bool)

(assert (=> d!70207 m!319381))

(declare-fun m!319383 () Bool)

(assert (=> d!70207 m!319383))

(declare-fun m!319385 () Bool)

(assert (=> d!70207 m!319385))

(declare-fun m!319387 () Bool)

(assert (=> d!70207 m!319387))

(declare-fun m!319389 () Bool)

(assert (=> d!70207 m!319389))

(declare-fun m!319391 () Bool)

(assert (=> d!70207 m!319391))

(declare-fun m!319393 () Bool)

(assert (=> d!70207 m!319393))

(declare-fun m!319395 () Bool)

(assert (=> d!70207 m!319395))

(declare-fun m!319397 () Bool)

(assert (=> b!207605 m!319397))

(assert (=> b!207428 d!70207))

(declare-fun b!207608 () Bool)

(declare-fun e!141899 () Unit!14764)

(declare-fun lt!323977 () Unit!14764)

(assert (=> b!207608 (= e!141899 lt!323977)))

(declare-fun lt!323987 () (_ BitVec 64))

(assert (=> b!207608 (= lt!323987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!323973 () (_ BitVec 64))

(assert (=> b!207608 (= lt!323973 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(assert (=> b!207608 (= lt!323977 (arrayBitRangesEqSymmetric!0 (buf!5090 thiss!1204) (buf!5090 (_2!9549 lt!323709)) lt!323987 lt!323973))))

(assert (=> b!207608 (arrayBitRangesEq!0 (buf!5090 (_2!9549 lt!323709)) (buf!5090 thiss!1204) lt!323987 lt!323973)))

(declare-fun b!207609 () Bool)

(declare-fun res!174199 () Bool)

(declare-fun e!141900 () Bool)

(assert (=> b!207609 (=> (not res!174199) (not e!141900))))

(declare-fun lt!323978 () tuple2!17792)

(assert (=> b!207609 (= res!174199 (isPrefixOf!0 (_1!9551 lt!323978) thiss!1204))))

(declare-fun b!207610 () Bool)

(declare-fun res!174198 () Bool)

(assert (=> b!207610 (=> (not res!174198) (not e!141900))))

(assert (=> b!207610 (= res!174198 (isPrefixOf!0 (_2!9551 lt!323978) (_2!9549 lt!323709)))))

(declare-fun b!207611 () Bool)

(declare-fun Unit!14796 () Unit!14764)

(assert (=> b!207611 (= e!141899 Unit!14796)))

(declare-fun lt!323981 () (_ BitVec 64))

(declare-fun lt!323970 () (_ BitVec 64))

(declare-fun b!207612 () Bool)

(assert (=> b!207612 (= e!141900 (= (_1!9551 lt!323978) (withMovedBitIndex!0 (_2!9551 lt!323978) (bvsub lt!323981 lt!323970))))))

(assert (=> b!207612 (or (= (bvand lt!323981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323981 lt!323970) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207612 (= lt!323970 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323709))) (currentByte!9608 (_2!9549 lt!323709)) (currentBit!9603 (_2!9549 lt!323709))))))

(assert (=> b!207612 (= lt!323981 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(declare-fun d!70215 () Bool)

(assert (=> d!70215 e!141900))

(declare-fun res!174197 () Bool)

(assert (=> d!70215 (=> (not res!174197) (not e!141900))))

(assert (=> d!70215 (= res!174197 (isPrefixOf!0 (_1!9551 lt!323978) (_2!9551 lt!323978)))))

(declare-fun lt!323984 () BitStream!8278)

(assert (=> d!70215 (= lt!323978 (tuple2!17793 lt!323984 (_2!9549 lt!323709)))))

(declare-fun lt!323975 () Unit!14764)

(declare-fun lt!323986 () Unit!14764)

(assert (=> d!70215 (= lt!323975 lt!323986)))

(assert (=> d!70215 (isPrefixOf!0 lt!323984 (_2!9549 lt!323709))))

(assert (=> d!70215 (= lt!323986 (lemmaIsPrefixTransitive!0 lt!323984 (_2!9549 lt!323709) (_2!9549 lt!323709)))))

(declare-fun lt!323976 () Unit!14764)

(declare-fun lt!323971 () Unit!14764)

(assert (=> d!70215 (= lt!323976 lt!323971)))

(assert (=> d!70215 (isPrefixOf!0 lt!323984 (_2!9549 lt!323709))))

(assert (=> d!70215 (= lt!323971 (lemmaIsPrefixTransitive!0 lt!323984 thiss!1204 (_2!9549 lt!323709)))))

(declare-fun lt!323988 () Unit!14764)

(assert (=> d!70215 (= lt!323988 e!141899)))

(declare-fun c!10212 () Bool)

(assert (=> d!70215 (= c!10212 (not (= (size!4585 (buf!5090 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!323985 () Unit!14764)

(declare-fun lt!323972 () Unit!14764)

(assert (=> d!70215 (= lt!323985 lt!323972)))

(assert (=> d!70215 (isPrefixOf!0 (_2!9549 lt!323709) (_2!9549 lt!323709))))

(assert (=> d!70215 (= lt!323972 (lemmaIsPrefixRefl!0 (_2!9549 lt!323709)))))

(declare-fun lt!323983 () Unit!14764)

(declare-fun lt!323982 () Unit!14764)

(assert (=> d!70215 (= lt!323983 lt!323982)))

(assert (=> d!70215 (= lt!323982 (lemmaIsPrefixRefl!0 (_2!9549 lt!323709)))))

(declare-fun lt!323980 () Unit!14764)

(declare-fun lt!323974 () Unit!14764)

(assert (=> d!70215 (= lt!323980 lt!323974)))

(assert (=> d!70215 (isPrefixOf!0 lt!323984 lt!323984)))

(assert (=> d!70215 (= lt!323974 (lemmaIsPrefixRefl!0 lt!323984))))

(declare-fun lt!323979 () Unit!14764)

(declare-fun lt!323989 () Unit!14764)

(assert (=> d!70215 (= lt!323979 lt!323989)))

(assert (=> d!70215 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70215 (= lt!323989 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70215 (= lt!323984 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(assert (=> d!70215 (isPrefixOf!0 thiss!1204 (_2!9549 lt!323709))))

(assert (=> d!70215 (= (reader!0 thiss!1204 (_2!9549 lt!323709)) lt!323978)))

(assert (= (and d!70215 c!10212) b!207608))

(assert (= (and d!70215 (not c!10212)) b!207611))

(assert (= (and d!70215 res!174197) b!207609))

(assert (= (and b!207609 res!174199) b!207610))

(assert (= (and b!207610 res!174198) b!207612))

(declare-fun m!319399 () Bool)

(assert (=> b!207609 m!319399))

(declare-fun m!319401 () Bool)

(assert (=> b!207612 m!319401))

(assert (=> b!207612 m!319199))

(assert (=> b!207612 m!319177))

(assert (=> b!207608 m!319177))

(declare-fun m!319403 () Bool)

(assert (=> b!207608 m!319403))

(declare-fun m!319405 () Bool)

(assert (=> b!207608 m!319405))

(assert (=> d!70215 m!319201))

(assert (=> d!70215 m!319377))

(declare-fun m!319407 () Bool)

(assert (=> d!70215 m!319407))

(declare-fun m!319409 () Bool)

(assert (=> d!70215 m!319409))

(declare-fun m!319411 () Bool)

(assert (=> d!70215 m!319411))

(declare-fun m!319413 () Bool)

(assert (=> d!70215 m!319413))

(declare-fun m!319415 () Bool)

(assert (=> d!70215 m!319415))

(declare-fun m!319417 () Bool)

(assert (=> d!70215 m!319417))

(assert (=> d!70215 m!319391))

(declare-fun m!319419 () Bool)

(assert (=> d!70215 m!319419))

(declare-fun m!319421 () Bool)

(assert (=> d!70215 m!319421))

(declare-fun m!319423 () Bool)

(assert (=> b!207610 m!319423))

(assert (=> b!207428 d!70215))

(declare-fun d!70217 () Bool)

(declare-fun e!141903 () Bool)

(assert (=> d!70217 e!141903))

(declare-fun res!174202 () Bool)

(assert (=> d!70217 (=> (not res!174202) (not e!141903))))

(declare-fun lt!324001 () tuple2!17786)

(declare-fun lt!323998 () tuple2!17786)

(assert (=> d!70217 (= res!174202 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!324001))) (currentByte!9608 (_1!9548 lt!324001)) (currentBit!9603 (_1!9548 lt!324001))) (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323998))) (currentByte!9608 (_1!9548 lt!323998)) (currentBit!9603 (_1!9548 lt!323998)))))))

(declare-fun lt!323999 () Unit!14764)

(declare-fun lt!324000 () BitStream!8278)

(declare-fun choose!50 (BitStream!8278 BitStream!8278 BitStream!8278 tuple2!17786 tuple2!17786 BitStream!8278 Bool tuple2!17786 tuple2!17786 BitStream!8278 Bool) Unit!14764)

(assert (=> d!70217 (= lt!323999 (choose!50 lt!323695 (_2!9549 lt!323709) lt!324000 lt!324001 (tuple2!17787 (_1!9548 lt!324001) (_2!9548 lt!324001)) (_1!9548 lt!324001) (_2!9548 lt!324001) lt!323998 (tuple2!17787 (_1!9548 lt!323998) (_2!9548 lt!323998)) (_1!9548 lt!323998) (_2!9548 lt!323998)))))

(assert (=> d!70217 (= lt!323998 (readBitPure!0 lt!324000))))

(assert (=> d!70217 (= lt!324001 (readBitPure!0 lt!323695))))

(assert (=> d!70217 (= lt!324000 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 lt!323695) (currentBit!9603 lt!323695)))))

(assert (=> d!70217 (invariant!0 (currentBit!9603 lt!323695) (currentByte!9608 lt!323695) (size!4585 (buf!5090 (_2!9549 lt!323709))))))

(assert (=> d!70217 (= (readBitPrefixLemma!0 lt!323695 (_2!9549 lt!323709)) lt!323999)))

(declare-fun b!207615 () Bool)

(assert (=> b!207615 (= e!141903 (= (_2!9548 lt!324001) (_2!9548 lt!323998)))))

(assert (= (and d!70217 res!174202) b!207615))

(assert (=> d!70217 m!319167))

(declare-fun m!319425 () Bool)

(assert (=> d!70217 m!319425))

(declare-fun m!319427 () Bool)

(assert (=> d!70217 m!319427))

(declare-fun m!319429 () Bool)

(assert (=> d!70217 m!319429))

(declare-fun m!319431 () Bool)

(assert (=> d!70217 m!319431))

(declare-fun m!319433 () Bool)

(assert (=> d!70217 m!319433))

(assert (=> b!207428 d!70217))

(declare-fun d!70219 () Bool)

(declare-fun e!141904 () Bool)

(assert (=> d!70219 e!141904))

(declare-fun res!174204 () Bool)

(assert (=> d!70219 (=> (not res!174204) (not e!141904))))

(declare-fun lt!324002 () (_ BitVec 64))

(declare-fun lt!324007 () (_ BitVec 64))

(declare-fun lt!324006 () (_ BitVec 64))

(assert (=> d!70219 (= res!174204 (= lt!324007 (bvsub lt!324002 lt!324006)))))

(assert (=> d!70219 (or (= (bvand lt!324002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324002 lt!324006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70219 (= lt!324006 (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323710)))) ((_ sign_extend 32) (currentByte!9608 (_1!9548 lt!323710))) ((_ sign_extend 32) (currentBit!9603 (_1!9548 lt!323710)))))))

(declare-fun lt!324005 () (_ BitVec 64))

(declare-fun lt!324003 () (_ BitVec 64))

(assert (=> d!70219 (= lt!324002 (bvmul lt!324005 lt!324003))))

(assert (=> d!70219 (or (= lt!324005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324003 (bvsdiv (bvmul lt!324005 lt!324003) lt!324005)))))

(assert (=> d!70219 (= lt!324003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70219 (= lt!324005 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323710)))))))

(assert (=> d!70219 (= lt!324007 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9608 (_1!9548 lt!323710))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9603 (_1!9548 lt!323710)))))))

(assert (=> d!70219 (invariant!0 (currentBit!9603 (_1!9548 lt!323710)) (currentByte!9608 (_1!9548 lt!323710)) (size!4585 (buf!5090 (_1!9548 lt!323710))))))

(assert (=> d!70219 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323710))) (currentByte!9608 (_1!9548 lt!323710)) (currentBit!9603 (_1!9548 lt!323710))) lt!324007)))

(declare-fun b!207616 () Bool)

(declare-fun res!174203 () Bool)

(assert (=> b!207616 (=> (not res!174203) (not e!141904))))

(assert (=> b!207616 (= res!174203 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324007))))

(declare-fun b!207617 () Bool)

(declare-fun lt!324004 () (_ BitVec 64))

(assert (=> b!207617 (= e!141904 (bvsle lt!324007 (bvmul lt!324004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207617 (or (= lt!324004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324004)))))

(assert (=> b!207617 (= lt!324004 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323710)))))))

(assert (= (and d!70219 res!174204) b!207616))

(assert (= (and b!207616 res!174203) b!207617))

(declare-fun m!319435 () Bool)

(assert (=> d!70219 m!319435))

(declare-fun m!319437 () Bool)

(assert (=> d!70219 m!319437))

(assert (=> b!207428 d!70219))

(declare-fun d!70221 () Bool)

(declare-datatypes ((tuple2!17820 0))(
  ( (tuple2!17821 (_1!9565 (_ BitVec 64)) (_2!9565 BitStream!8278)) )
))
(declare-fun lt!324010 () tuple2!17820)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17820)

(assert (=> d!70221 (= lt!324010 (readNBitsLSBFirstsLoop!0 (_1!9551 lt!323697) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!70221 (= (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!323697) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!17791 (_2!9565 lt!324010) (_1!9565 lt!324010)))))

(declare-fun bs!17266 () Bool)

(assert (= bs!17266 d!70221))

(declare-fun m!319439 () Bool)

(assert (=> bs!17266 m!319439))

(assert (=> b!207428 d!70221))

(declare-fun d!70223 () Bool)

(assert (=> d!70223 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204)) lt!323712) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204))) lt!323712))))

(declare-fun bs!17267 () Bool)

(assert (= bs!17267 d!70223))

(declare-fun m!319441 () Bool)

(assert (=> bs!17267 m!319441))

(assert (=> b!207428 d!70223))

(declare-fun d!70225 () Bool)

(declare-fun lt!324011 () tuple2!17816)

(assert (=> d!70225 (= lt!324011 (readBit!0 (_1!9551 lt!323697)))))

(assert (=> d!70225 (= (readBitPure!0 (_1!9551 lt!323697)) (tuple2!17787 (_2!9563 lt!324011) (_1!9563 lt!324011)))))

(declare-fun bs!17268 () Bool)

(assert (= bs!17268 d!70225))

(declare-fun m!319443 () Bool)

(assert (=> bs!17268 m!319443))

(assert (=> b!207428 d!70225))

(declare-fun d!70227 () Bool)

(assert (=> d!70227 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!207428 d!70227))

(declare-fun d!70229 () Bool)

(assert (=> d!70229 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204)) lt!323712)))

(declare-fun lt!324014 () Unit!14764)

(declare-fun choose!9 (BitStream!8278 array!10427 (_ BitVec 64) BitStream!8278) Unit!14764)

(assert (=> d!70229 (= lt!324014 (choose!9 thiss!1204 (buf!5090 (_2!9549 lt!323709)) lt!323712 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204))))))

(assert (=> d!70229 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5090 (_2!9549 lt!323709)) lt!323712) lt!324014)))

(declare-fun bs!17269 () Bool)

(assert (= bs!17269 d!70229))

(assert (=> bs!17269 m!319161))

(declare-fun m!319445 () Bool)

(assert (=> bs!17269 m!319445))

(assert (=> b!207428 d!70229))

(declare-fun d!70231 () Bool)

(declare-fun lt!324015 () tuple2!17816)

(assert (=> d!70231 (= lt!324015 (readBit!0 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204))))))

(assert (=> d!70231 (= (readBitPure!0 (BitStream!8279 (buf!5090 (_2!9549 lt!323709)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204))) (tuple2!17787 (_2!9563 lt!324015) (_1!9563 lt!324015)))))

(declare-fun bs!17270 () Bool)

(assert (= bs!17270 d!70231))

(declare-fun m!319447 () Bool)

(assert (=> bs!17270 m!319447))

(assert (=> b!207428 d!70231))

(declare-fun d!70233 () Bool)

(declare-fun e!141905 () Bool)

(assert (=> d!70233 e!141905))

(declare-fun res!174206 () Bool)

(assert (=> d!70233 (=> (not res!174206) (not e!141905))))

(declare-fun lt!324016 () (_ BitVec 64))

(declare-fun lt!324021 () (_ BitVec 64))

(declare-fun lt!324020 () (_ BitVec 64))

(assert (=> d!70233 (= res!174206 (= lt!324021 (bvsub lt!324016 lt!324020)))))

(assert (=> d!70233 (or (= (bvand lt!324016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324016 lt!324020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70233 (= lt!324020 (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323714)))) ((_ sign_extend 32) (currentByte!9608 (_1!9548 lt!323714))) ((_ sign_extend 32) (currentBit!9603 (_1!9548 lt!323714)))))))

(declare-fun lt!324019 () (_ BitVec 64))

(declare-fun lt!324017 () (_ BitVec 64))

(assert (=> d!70233 (= lt!324016 (bvmul lt!324019 lt!324017))))

(assert (=> d!70233 (or (= lt!324019 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324017 (bvsdiv (bvmul lt!324019 lt!324017) lt!324019)))))

(assert (=> d!70233 (= lt!324017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70233 (= lt!324019 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323714)))))))

(assert (=> d!70233 (= lt!324021 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9608 (_1!9548 lt!323714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9603 (_1!9548 lt!323714)))))))

(assert (=> d!70233 (invariant!0 (currentBit!9603 (_1!9548 lt!323714)) (currentByte!9608 (_1!9548 lt!323714)) (size!4585 (buf!5090 (_1!9548 lt!323714))))))

(assert (=> d!70233 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!323714))) (currentByte!9608 (_1!9548 lt!323714)) (currentBit!9603 (_1!9548 lt!323714))) lt!324021)))

(declare-fun b!207618 () Bool)

(declare-fun res!174205 () Bool)

(assert (=> b!207618 (=> (not res!174205) (not e!141905))))

(assert (=> b!207618 (= res!174205 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324021))))

(declare-fun b!207619 () Bool)

(declare-fun lt!324018 () (_ BitVec 64))

(assert (=> b!207619 (= e!141905 (bvsle lt!324021 (bvmul lt!324018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207619 (or (= lt!324018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324018)))))

(assert (=> b!207619 (= lt!324018 ((_ sign_extend 32) (size!4585 (buf!5090 (_1!9548 lt!323714)))))))

(assert (= (and d!70233 res!174206) b!207618))

(assert (= (and b!207618 res!174205) b!207619))

(declare-fun m!319449 () Bool)

(assert (=> d!70233 m!319449))

(declare-fun m!319451 () Bool)

(assert (=> d!70233 m!319451))

(assert (=> b!207428 d!70233))

(declare-fun d!70235 () Bool)

(declare-fun lt!324022 () tuple2!17816)

(assert (=> d!70235 (= lt!324022 (readBit!0 lt!323695))))

(assert (=> d!70235 (= (readBitPure!0 lt!323695) (tuple2!17787 (_2!9563 lt!324022) (_1!9563 lt!324022)))))

(declare-fun bs!17271 () Bool)

(assert (= bs!17271 d!70235))

(declare-fun m!319453 () Bool)

(assert (=> bs!17271 m!319453))

(assert (=> b!207428 d!70235))

(assert (=> b!207417 d!70189))

(assert (=> b!207417 d!70191))

(declare-fun b!207629 () Bool)

(declare-fun res!174217 () Bool)

(declare-fun e!141910 () Bool)

(assert (=> b!207629 (=> (not res!174217) (not e!141910))))

(declare-fun lt!324034 () (_ BitVec 64))

(declare-fun lt!324033 () tuple2!17788)

(declare-fun lt!324032 () (_ BitVec 64))

(assert (=> b!207629 (= res!174217 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324033))) (currentByte!9608 (_2!9549 lt!324033)) (currentBit!9603 (_2!9549 lt!324033))) (bvadd lt!324032 lt!324034)))))

(assert (=> b!207629 (or (not (= (bvand lt!324032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!324032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!324032 lt!324034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207629 (= lt!324034 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!207629 (= lt!324032 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)))))

(declare-fun d!70237 () Bool)

(assert (=> d!70237 e!141910))

(declare-fun res!174216 () Bool)

(assert (=> d!70237 (=> (not res!174216) (not e!141910))))

(assert (=> d!70237 (= res!174216 (= (size!4585 (buf!5090 thiss!1204)) (size!4585 (buf!5090 (_2!9549 lt!324033)))))))

(declare-fun choose!16 (BitStream!8278 Bool) tuple2!17788)

(assert (=> d!70237 (= lt!324033 (choose!16 thiss!1204 lt!323708))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70237 (validate_offset_bit!0 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204)))))

(assert (=> d!70237 (= (appendBit!0 thiss!1204 lt!323708) lt!324033)))

(declare-fun b!207632 () Bool)

(declare-fun e!141911 () Bool)

(declare-fun lt!324031 () tuple2!17786)

(assert (=> b!207632 (= e!141911 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!324031))) (currentByte!9608 (_1!9548 lt!324031)) (currentBit!9603 (_1!9548 lt!324031))) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324033))) (currentByte!9608 (_2!9549 lt!324033)) (currentBit!9603 (_2!9549 lt!324033)))))))

(declare-fun b!207630 () Bool)

(declare-fun res!174218 () Bool)

(assert (=> b!207630 (=> (not res!174218) (not e!141910))))

(assert (=> b!207630 (= res!174218 (isPrefixOf!0 thiss!1204 (_2!9549 lt!324033)))))

(declare-fun b!207631 () Bool)

(assert (=> b!207631 (= e!141910 e!141911)))

(declare-fun res!174215 () Bool)

(assert (=> b!207631 (=> (not res!174215) (not e!141911))))

(assert (=> b!207631 (= res!174215 (and (= (_2!9548 lt!324031) lt!323708) (= (_1!9548 lt!324031) (_2!9549 lt!324033))))))

(assert (=> b!207631 (= lt!324031 (readBitPure!0 (readerFrom!0 (_2!9549 lt!324033) (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204))))))

(assert (= (and d!70237 res!174216) b!207629))

(assert (= (and b!207629 res!174217) b!207630))

(assert (= (and b!207630 res!174218) b!207631))

(assert (= (and b!207631 res!174215) b!207632))

(declare-fun m!319455 () Bool)

(assert (=> b!207632 m!319455))

(declare-fun m!319457 () Bool)

(assert (=> b!207632 m!319457))

(assert (=> b!207629 m!319457))

(assert (=> b!207629 m!319177))

(declare-fun m!319459 () Bool)

(assert (=> b!207631 m!319459))

(assert (=> b!207631 m!319459))

(declare-fun m!319461 () Bool)

(assert (=> b!207631 m!319461))

(declare-fun m!319463 () Bool)

(assert (=> b!207630 m!319463))

(declare-fun m!319465 () Bool)

(assert (=> d!70237 m!319465))

(declare-fun m!319467 () Bool)

(assert (=> d!70237 m!319467))

(assert (=> b!207417 d!70237))

(declare-fun d!70239 () Bool)

(assert (=> d!70239 (= (array_inv!4326 (buf!5090 thiss!1204)) (bvsge (size!4585 (buf!5090 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!207418 d!70239))

(assert (=> b!207424 d!70197))

(declare-fun d!70241 () Bool)

(declare-fun e!141912 () Bool)

(assert (=> d!70241 e!141912))

(declare-fun res!174220 () Bool)

(assert (=> d!70241 (=> (not res!174220) (not e!141912))))

(declare-fun lt!324039 () (_ BitVec 64))

(declare-fun lt!324035 () (_ BitVec 64))

(declare-fun lt!324040 () (_ BitVec 64))

(assert (=> d!70241 (= res!174220 (= lt!324040 (bvsub lt!324035 lt!324039)))))

(assert (=> d!70241 (or (= (bvand lt!324035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324035 lt!324039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70241 (= lt!324039 (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323709))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323709)))))))

(declare-fun lt!324038 () (_ BitVec 64))

(declare-fun lt!324036 () (_ BitVec 64))

(assert (=> d!70241 (= lt!324035 (bvmul lt!324038 lt!324036))))

(assert (=> d!70241 (or (= lt!324038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324036 (bvsdiv (bvmul lt!324038 lt!324036) lt!324038)))))

(assert (=> d!70241 (= lt!324036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70241 (= lt!324038 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))))))

(assert (=> d!70241 (= lt!324040 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323709))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323709)))))))

(assert (=> d!70241 (invariant!0 (currentBit!9603 (_2!9549 lt!323709)) (currentByte!9608 (_2!9549 lt!323709)) (size!4585 (buf!5090 (_2!9549 lt!323709))))))

(assert (=> d!70241 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323709))) (currentByte!9608 (_2!9549 lt!323709)) (currentBit!9603 (_2!9549 lt!323709))) lt!324040)))

(declare-fun b!207633 () Bool)

(declare-fun res!174219 () Bool)

(assert (=> b!207633 (=> (not res!174219) (not e!141912))))

(assert (=> b!207633 (= res!174219 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324040))))

(declare-fun b!207634 () Bool)

(declare-fun lt!324037 () (_ BitVec 64))

(assert (=> b!207634 (= e!141912 (bvsle lt!324040 (bvmul lt!324037 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207634 (or (= lt!324037 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324037 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324037)))))

(assert (=> b!207634 (= lt!324037 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323709)))))))

(assert (= (and d!70241 res!174220) b!207633))

(assert (= (and b!207633 res!174219) b!207634))

(declare-fun m!319469 () Bool)

(assert (=> d!70241 m!319469))

(assert (=> d!70241 m!319209))

(assert (=> b!207413 d!70241))

(declare-fun d!70243 () Bool)

(declare-fun res!174221 () Bool)

(declare-fun e!141914 () Bool)

(assert (=> d!70243 (=> (not res!174221) (not e!141914))))

(assert (=> d!70243 (= res!174221 (= (size!4585 (buf!5090 thiss!1204)) (size!4585 (buf!5090 (_2!9549 lt!323709)))))))

(assert (=> d!70243 (= (isPrefixOf!0 thiss!1204 (_2!9549 lt!323709)) e!141914)))

(declare-fun b!207635 () Bool)

(declare-fun res!174222 () Bool)

(assert (=> b!207635 (=> (not res!174222) (not e!141914))))

(assert (=> b!207635 (= res!174222 (bvsle (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204)) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323709))) (currentByte!9608 (_2!9549 lt!323709)) (currentBit!9603 (_2!9549 lt!323709)))))))

(declare-fun b!207636 () Bool)

(declare-fun e!141913 () Bool)

(assert (=> b!207636 (= e!141914 e!141913)))

(declare-fun res!174223 () Bool)

(assert (=> b!207636 (=> res!174223 e!141913)))

(assert (=> b!207636 (= res!174223 (= (size!4585 (buf!5090 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!207637 () Bool)

(assert (=> b!207637 (= e!141913 (arrayBitRangesEq!0 (buf!5090 thiss!1204) (buf!5090 (_2!9549 lt!323709)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4585 (buf!5090 thiss!1204)) (currentByte!9608 thiss!1204) (currentBit!9603 thiss!1204))))))

(assert (= (and d!70243 res!174221) b!207635))

(assert (= (and b!207635 res!174222) b!207636))

(assert (= (and b!207636 (not res!174223)) b!207637))

(assert (=> b!207635 m!319177))

(assert (=> b!207635 m!319199))

(assert (=> b!207637 m!319177))

(assert (=> b!207637 m!319177))

(declare-fun m!319471 () Bool)

(assert (=> b!207637 m!319471))

(assert (=> b!207413 d!70243))

(declare-fun d!70245 () Bool)

(assert (=> d!70245 (isPrefixOf!0 thiss!1204 (_2!9549 lt!323709))))

(declare-fun lt!324043 () Unit!14764)

(declare-fun choose!30 (BitStream!8278 BitStream!8278 BitStream!8278) Unit!14764)

(assert (=> d!70245 (= lt!324043 (choose!30 thiss!1204 (_2!9549 lt!323703) (_2!9549 lt!323709)))))

(assert (=> d!70245 (isPrefixOf!0 thiss!1204 (_2!9549 lt!323703))))

(assert (=> d!70245 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9549 lt!323703) (_2!9549 lt!323709)) lt!324043)))

(declare-fun bs!17272 () Bool)

(assert (= bs!17272 d!70245))

(assert (=> bs!17272 m!319201))

(declare-fun m!319473 () Bool)

(assert (=> bs!17272 m!319473))

(assert (=> bs!17272 m!319197))

(assert (=> b!207413 d!70245))

(declare-fun d!70247 () Bool)

(declare-fun e!142049 () Bool)

(assert (=> d!70247 e!142049))

(declare-fun res!174423 () Bool)

(assert (=> d!70247 (=> (not res!174423) (not e!142049))))

(declare-fun lt!324790 () tuple2!17788)

(assert (=> d!70247 (= res!174423 (invariant!0 (currentBit!9603 (_2!9549 lt!324790)) (currentByte!9608 (_2!9549 lt!324790)) (size!4585 (buf!5090 (_2!9549 lt!324790)))))))

(declare-fun e!142050 () tuple2!17788)

(assert (=> d!70247 (= lt!324790 e!142050)))

(declare-fun c!10238 () Bool)

(assert (=> d!70247 (= c!10238 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70247 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70247 (= (appendBitsLSBFirstLoopTR!0 (_2!9549 lt!323703) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!324790)))

(declare-fun b!207876 () Bool)

(declare-fun e!142053 () (_ BitVec 64))

(assert (=> b!207876 (= e!142053 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!207877 () Bool)

(declare-fun e!142052 () Bool)

(declare-fun lt!324834 () tuple2!17790)

(declare-fun lt!324818 () tuple2!17792)

(assert (=> b!207877 (= e!142052 (= (_1!9550 lt!324834) (_2!9551 lt!324818)))))

(declare-fun b!207878 () Bool)

(declare-fun Unit!14798 () Unit!14764)

(assert (=> b!207878 (= e!142050 (tuple2!17789 Unit!14798 (_2!9549 lt!323703)))))

(declare-fun lt!324811 () Unit!14764)

(assert (=> b!207878 (= lt!324811 (lemmaIsPrefixRefl!0 (_2!9549 lt!323703)))))

(declare-fun call!3279 () Bool)

(assert (=> b!207878 call!3279))

(declare-fun lt!324785 () Unit!14764)

(assert (=> b!207878 (= lt!324785 lt!324811)))

(declare-fun b!207879 () Bool)

(declare-fun e!142046 () Bool)

(declare-fun lt!324830 () tuple2!17786)

(declare-fun lt!324825 () tuple2!17786)

(assert (=> b!207879 (= e!142046 (= (_2!9548 lt!324830) (_2!9548 lt!324825)))))

(declare-fun b!207880 () Bool)

(assert (=> b!207880 (= e!142053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!207881 () Bool)

(declare-fun res!174416 () Bool)

(assert (=> b!207881 (=> (not res!174416) (not e!142049))))

(assert (=> b!207881 (= res!174416 (= (size!4585 (buf!5090 (_2!9549 lt!323703))) (size!4585 (buf!5090 (_2!9549 lt!324790)))))))

(declare-fun b!207882 () Bool)

(declare-fun e!142047 () Bool)

(declare-fun lt!324791 () (_ BitVec 64))

(assert (=> b!207882 (= e!142047 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703))) lt!324791))))

(declare-fun b!207883 () Bool)

(assert (=> b!207883 (= e!142049 e!142052)))

(declare-fun res!174419 () Bool)

(assert (=> b!207883 (=> (not res!174419) (not e!142052))))

(assert (=> b!207883 (= res!174419 (= (_2!9550 lt!324834) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!207883 (= lt!324834 (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!324818) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!324800 () Unit!14764)

(declare-fun lt!324821 () Unit!14764)

(assert (=> b!207883 (= lt!324800 lt!324821)))

(assert (=> b!207883 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!324790)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703))) lt!324791)))

(assert (=> b!207883 (= lt!324821 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9549 lt!323703) (buf!5090 (_2!9549 lt!324790)) lt!324791))))

(assert (=> b!207883 e!142047))

(declare-fun res!174421 () Bool)

(assert (=> b!207883 (=> (not res!174421) (not e!142047))))

(assert (=> b!207883 (= res!174421 (and (= (size!4585 (buf!5090 (_2!9549 lt!323703))) (size!4585 (buf!5090 (_2!9549 lt!324790)))) (bvsge lt!324791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207883 (= lt!324791 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!207883 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!207883 (= lt!324818 (reader!0 (_2!9549 lt!323703) (_2!9549 lt!324790)))))

(declare-fun b!207884 () Bool)

(declare-fun res!174418 () Bool)

(assert (=> b!207884 (=> (not res!174418) (not e!142049))))

(assert (=> b!207884 (= res!174418 (isPrefixOf!0 (_2!9549 lt!323703) (_2!9549 lt!324790)))))

(declare-fun lt!324835 () tuple2!17788)

(declare-fun bm!3276 () Bool)

(assert (=> bm!3276 (= call!3279 (isPrefixOf!0 (_2!9549 lt!323703) (ite c!10238 (_2!9549 lt!323703) (_2!9549 lt!324835))))))

(declare-fun b!207885 () Bool)

(declare-fun e!142048 () Bool)

(declare-fun lt!324794 () tuple2!17790)

(declare-fun lt!324793 () tuple2!17792)

(assert (=> b!207885 (= e!142048 (= (_1!9550 lt!324794) (_2!9551 lt!324793)))))

(declare-fun b!207886 () Bool)

(assert (=> b!207886 (= e!142050 (tuple2!17789 (_1!9549 lt!324835) (_2!9549 lt!324835)))))

(declare-fun lt!324809 () Bool)

(assert (=> b!207886 (= lt!324809 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!324815 () tuple2!17788)

(assert (=> b!207886 (= lt!324815 (appendBit!0 (_2!9549 lt!323703) lt!324809))))

(declare-fun res!174422 () Bool)

(assert (=> b!207886 (= res!174422 (= (size!4585 (buf!5090 (_2!9549 lt!323703))) (size!4585 (buf!5090 (_2!9549 lt!324815)))))))

(declare-fun e!142045 () Bool)

(assert (=> b!207886 (=> (not res!174422) (not e!142045))))

(assert (=> b!207886 e!142045))

(declare-fun lt!324828 () tuple2!17788)

(assert (=> b!207886 (= lt!324828 lt!324815)))

(assert (=> b!207886 (= lt!324835 (appendBitsLSBFirstLoopTR!0 (_2!9549 lt!324828) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!324813 () Unit!14764)

(assert (=> b!207886 (= lt!324813 (lemmaIsPrefixTransitive!0 (_2!9549 lt!323703) (_2!9549 lt!324828) (_2!9549 lt!324835)))))

(assert (=> b!207886 call!3279))

(declare-fun lt!324829 () Unit!14764)

(assert (=> b!207886 (= lt!324829 lt!324813)))

(assert (=> b!207886 (invariant!0 (currentBit!9603 (_2!9549 lt!323703)) (currentByte!9608 (_2!9549 lt!323703)) (size!4585 (buf!5090 (_2!9549 lt!324828))))))

(declare-fun lt!324820 () BitStream!8278)

(assert (=> b!207886 (= lt!324820 (BitStream!8279 (buf!5090 (_2!9549 lt!324828)) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(assert (=> b!207886 (invariant!0 (currentBit!9603 lt!324820) (currentByte!9608 lt!324820) (size!4585 (buf!5090 (_2!9549 lt!324835))))))

(declare-fun lt!324832 () BitStream!8278)

(assert (=> b!207886 (= lt!324832 (BitStream!8279 (buf!5090 (_2!9549 lt!324835)) (currentByte!9608 lt!324820) (currentBit!9603 lt!324820)))))

(assert (=> b!207886 (= lt!324830 (readBitPure!0 lt!324820))))

(assert (=> b!207886 (= lt!324825 (readBitPure!0 lt!324832))))

(declare-fun lt!324831 () Unit!14764)

(assert (=> b!207886 (= lt!324831 (readBitPrefixLemma!0 lt!324820 (_2!9549 lt!324835)))))

(declare-fun res!174425 () Bool)

(assert (=> b!207886 (= res!174425 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!324830))) (currentByte!9608 (_1!9548 lt!324830)) (currentBit!9603 (_1!9548 lt!324830))) (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!324825))) (currentByte!9608 (_1!9548 lt!324825)) (currentBit!9603 (_1!9548 lt!324825)))))))

(assert (=> b!207886 (=> (not res!174425) (not e!142046))))

(assert (=> b!207886 e!142046))

(declare-fun lt!324803 () Unit!14764)

(assert (=> b!207886 (= lt!324803 lt!324831)))

(declare-fun lt!324795 () tuple2!17792)

(assert (=> b!207886 (= lt!324795 (reader!0 (_2!9549 lt!323703) (_2!9549 lt!324835)))))

(declare-fun lt!324798 () tuple2!17792)

(assert (=> b!207886 (= lt!324798 (reader!0 (_2!9549 lt!324828) (_2!9549 lt!324835)))))

(declare-fun lt!324807 () tuple2!17786)

(assert (=> b!207886 (= lt!324807 (readBitPure!0 (_1!9551 lt!324795)))))

(assert (=> b!207886 (= (_2!9548 lt!324807) lt!324809)))

(declare-fun lt!324796 () Unit!14764)

(declare-fun Unit!14799 () Unit!14764)

(assert (=> b!207886 (= lt!324796 Unit!14799)))

(declare-fun lt!324799 () (_ BitVec 64))

(assert (=> b!207886 (= lt!324799 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324816 () (_ BitVec 64))

(assert (=> b!207886 (= lt!324816 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324808 () Unit!14764)

(assert (=> b!207886 (= lt!324808 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9549 lt!323703) (buf!5090 (_2!9549 lt!324835)) lt!324816))))

(assert (=> b!207886 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!324835)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703))) lt!324816)))

(declare-fun lt!324787 () Unit!14764)

(assert (=> b!207886 (= lt!324787 lt!324808)))

(declare-fun lt!324824 () tuple2!17790)

(assert (=> b!207886 (= lt!324824 (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!324795) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324799))))

(declare-fun lt!324827 () (_ BitVec 64))

(assert (=> b!207886 (= lt!324827 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!324810 () Unit!14764)

(assert (=> b!207886 (= lt!324810 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9549 lt!324828) (buf!5090 (_2!9549 lt!324835)) lt!324827))))

(assert (=> b!207886 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!324835)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!324828))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!324828))) lt!324827)))

(declare-fun lt!324833 () Unit!14764)

(assert (=> b!207886 (= lt!324833 lt!324810)))

(declare-fun lt!324814 () tuple2!17790)

(assert (=> b!207886 (= lt!324814 (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!324798) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!324799 (ite (_2!9548 lt!324807) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!324826 () tuple2!17790)

(assert (=> b!207886 (= lt!324826 (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!324795) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324799))))

(declare-fun c!10237 () Bool)

(assert (=> b!207886 (= c!10237 (_2!9548 (readBitPure!0 (_1!9551 lt!324795))))))

(declare-fun lt!324837 () tuple2!17790)

(assert (=> b!207886 (= lt!324837 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9551 lt!324795) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!324799 e!142053)))))

(declare-fun lt!324784 () Unit!14764)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14764)

(assert (=> b!207886 (= lt!324784 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9551 lt!324795) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324799))))

(assert (=> b!207886 (and (= (_2!9550 lt!324826) (_2!9550 lt!324837)) (= (_1!9550 lt!324826) (_1!9550 lt!324837)))))

(declare-fun lt!324789 () Unit!14764)

(assert (=> b!207886 (= lt!324789 lt!324784)))

(assert (=> b!207886 (= (_1!9551 lt!324795) (withMovedBitIndex!0 (_2!9551 lt!324795) (bvsub (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324835))) (currentByte!9608 (_2!9549 lt!324835)) (currentBit!9603 (_2!9549 lt!324835))))))))

(declare-fun lt!324797 () Unit!14764)

(declare-fun Unit!14800 () Unit!14764)

(assert (=> b!207886 (= lt!324797 Unit!14800)))

(assert (=> b!207886 (= (_1!9551 lt!324798) (withMovedBitIndex!0 (_2!9551 lt!324798) (bvsub (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324828))) (currentByte!9608 (_2!9549 lt!324828)) (currentBit!9603 (_2!9549 lt!324828))) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324835))) (currentByte!9608 (_2!9549 lt!324835)) (currentBit!9603 (_2!9549 lt!324835))))))))

(declare-fun lt!324817 () Unit!14764)

(declare-fun Unit!14801 () Unit!14764)

(assert (=> b!207886 (= lt!324817 Unit!14801)))

(assert (=> b!207886 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))) (bvsub (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324828))) (currentByte!9608 (_2!9549 lt!324828)) (currentBit!9603 (_2!9549 lt!324828))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!324838 () Unit!14764)

(declare-fun Unit!14802 () Unit!14764)

(assert (=> b!207886 (= lt!324838 Unit!14802)))

(assert (=> b!207886 (= (_2!9550 lt!324824) (_2!9550 lt!324814))))

(declare-fun lt!324801 () Unit!14764)

(declare-fun Unit!14803 () Unit!14764)

(assert (=> b!207886 (= lt!324801 Unit!14803)))

(assert (=> b!207886 (invariant!0 (currentBit!9603 (_2!9549 lt!324835)) (currentByte!9608 (_2!9549 lt!324835)) (size!4585 (buf!5090 (_2!9549 lt!324835))))))

(declare-fun lt!324822 () Unit!14764)

(declare-fun Unit!14804 () Unit!14764)

(assert (=> b!207886 (= lt!324822 Unit!14804)))

(assert (=> b!207886 (= (size!4585 (buf!5090 (_2!9549 lt!323703))) (size!4585 (buf!5090 (_2!9549 lt!324835))))))

(declare-fun lt!324836 () Unit!14764)

(declare-fun Unit!14805 () Unit!14764)

(assert (=> b!207886 (= lt!324836 Unit!14805)))

(assert (=> b!207886 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324835))) (currentByte!9608 (_2!9549 lt!324835)) (currentBit!9603 (_2!9549 lt!324835))) (bvsub (bvadd (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324786 () Unit!14764)

(declare-fun Unit!14806 () Unit!14764)

(assert (=> b!207886 (= lt!324786 Unit!14806)))

(declare-fun lt!324806 () Unit!14764)

(declare-fun Unit!14807 () Unit!14764)

(assert (=> b!207886 (= lt!324806 Unit!14807)))

(assert (=> b!207886 (= lt!324793 (reader!0 (_2!9549 lt!323703) (_2!9549 lt!324835)))))

(declare-fun lt!324839 () (_ BitVec 64))

(assert (=> b!207886 (= lt!324839 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324819 () Unit!14764)

(assert (=> b!207886 (= lt!324819 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9549 lt!323703) (buf!5090 (_2!9549 lt!324835)) lt!324839))))

(assert (=> b!207886 (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!324835)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703))) lt!324839)))

(declare-fun lt!324804 () Unit!14764)

(assert (=> b!207886 (= lt!324804 lt!324819)))

(assert (=> b!207886 (= lt!324794 (readNBitsLSBFirstsLoopPure!0 (_1!9551 lt!324793) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!174415 () Bool)

(assert (=> b!207886 (= res!174415 (= (_2!9550 lt!324794) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!207886 (=> (not res!174415) (not e!142048))))

(assert (=> b!207886 e!142048))

(declare-fun lt!324823 () Unit!14764)

(declare-fun Unit!14808 () Unit!14764)

(assert (=> b!207886 (= lt!324823 Unit!14808)))

(declare-fun b!207887 () Bool)

(declare-fun lt!324805 () tuple2!17786)

(assert (=> b!207887 (= lt!324805 (readBitPure!0 (readerFrom!0 (_2!9549 lt!324815) (currentBit!9603 (_2!9549 lt!323703)) (currentByte!9608 (_2!9549 lt!323703)))))))

(declare-fun res!174424 () Bool)

(assert (=> b!207887 (= res!174424 (and (= (_2!9548 lt!324805) lt!324809) (= (_1!9548 lt!324805) (_2!9549 lt!324815))))))

(declare-fun e!142051 () Bool)

(assert (=> b!207887 (=> (not res!174424) (not e!142051))))

(assert (=> b!207887 (= e!142045 e!142051)))

(declare-fun b!207888 () Bool)

(declare-fun res!174420 () Bool)

(assert (=> b!207888 (= res!174420 (isPrefixOf!0 (_2!9549 lt!323703) (_2!9549 lt!324815)))))

(assert (=> b!207888 (=> (not res!174420) (not e!142045))))

(declare-fun b!207889 () Bool)

(assert (=> b!207889 (= e!142051 (= (bitIndex!0 (size!4585 (buf!5090 (_1!9548 lt!324805))) (currentByte!9608 (_1!9548 lt!324805)) (currentBit!9603 (_1!9548 lt!324805))) (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324815))) (currentByte!9608 (_2!9549 lt!324815)) (currentBit!9603 (_2!9549 lt!324815)))))))

(declare-fun b!207890 () Bool)

(declare-fun res!174417 () Bool)

(assert (=> b!207890 (= res!174417 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324815))) (currentByte!9608 (_2!9549 lt!324815)) (currentBit!9603 (_2!9549 lt!324815))) (bvadd (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!207890 (=> (not res!174417) (not e!142045))))

(declare-fun b!207891 () Bool)

(declare-fun res!174414 () Bool)

(assert (=> b!207891 (=> (not res!174414) (not e!142049))))

(declare-fun lt!324788 () (_ BitVec 64))

(declare-fun lt!324812 () (_ BitVec 64))

(assert (=> b!207891 (= res!174414 (= (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!324790))) (currentByte!9608 (_2!9549 lt!324790)) (currentBit!9603 (_2!9549 lt!324790))) (bvsub lt!324812 lt!324788)))))

(assert (=> b!207891 (or (= (bvand lt!324812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324788 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324812 lt!324788) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207891 (= lt!324788 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!324792 () (_ BitVec 64))

(declare-fun lt!324802 () (_ BitVec 64))

(assert (=> b!207891 (= lt!324812 (bvadd lt!324792 lt!324802))))

(assert (=> b!207891 (or (not (= (bvand lt!324792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324802 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!324792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!324792 lt!324802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207891 (= lt!324802 ((_ sign_extend 32) nBits!348))))

(assert (=> b!207891 (= lt!324792 (bitIndex!0 (size!4585 (buf!5090 (_2!9549 lt!323703))) (currentByte!9608 (_2!9549 lt!323703)) (currentBit!9603 (_2!9549 lt!323703))))))

(assert (= (and d!70247 c!10238) b!207878))

(assert (= (and d!70247 (not c!10238)) b!207886))

(assert (= (and b!207886 res!174422) b!207890))

(assert (= (and b!207890 res!174417) b!207888))

(assert (= (and b!207888 res!174420) b!207887))

(assert (= (and b!207887 res!174424) b!207889))

(assert (= (and b!207886 res!174425) b!207879))

(assert (= (and b!207886 c!10237) b!207876))

(assert (= (and b!207886 (not c!10237)) b!207880))

(assert (= (and b!207886 res!174415) b!207885))

(assert (= (or b!207878 b!207886) bm!3276))

(assert (= (and d!70247 res!174423) b!207881))

(assert (= (and b!207881 res!174416) b!207891))

(assert (= (and b!207891 res!174414) b!207884))

(assert (= (and b!207884 res!174418) b!207883))

(assert (= (and b!207883 res!174421) b!207882))

(assert (= (and b!207883 res!174419) b!207877))

(declare-fun m!319891 () Bool)

(assert (=> b!207890 m!319891))

(assert (=> b!207890 m!319175))

(declare-fun m!319893 () Bool)

(assert (=> b!207884 m!319893))

(declare-fun m!319895 () Bool)

(assert (=> b!207888 m!319895))

(declare-fun m!319897 () Bool)

(assert (=> d!70247 m!319897))

(declare-fun m!319899 () Bool)

(assert (=> b!207889 m!319899))

(assert (=> b!207889 m!319891))

(declare-fun m!319901 () Bool)

(assert (=> b!207883 m!319901))

(declare-fun m!319903 () Bool)

(assert (=> b!207883 m!319903))

(declare-fun m!319905 () Bool)

(assert (=> b!207883 m!319905))

(declare-fun m!319907 () Bool)

(assert (=> b!207883 m!319907))

(declare-fun m!319909 () Bool)

(assert (=> b!207883 m!319909))

(declare-fun m!319911 () Bool)

(assert (=> b!207883 m!319911))

(assert (=> b!207878 m!319393))

(declare-fun m!319913 () Bool)

(assert (=> b!207886 m!319913))

(declare-fun m!319915 () Bool)

(assert (=> b!207886 m!319915))

(declare-fun m!319917 () Bool)

(assert (=> b!207886 m!319917))

(declare-fun m!319919 () Bool)

(assert (=> b!207886 m!319919))

(declare-fun m!319921 () Bool)

(assert (=> b!207886 m!319921))

(declare-fun m!319923 () Bool)

(assert (=> b!207886 m!319923))

(declare-fun m!319925 () Bool)

(assert (=> b!207886 m!319925))

(declare-fun m!319927 () Bool)

(assert (=> b!207886 m!319927))

(assert (=> b!207886 m!319907))

(declare-fun m!319929 () Bool)

(assert (=> b!207886 m!319929))

(declare-fun m!319931 () Bool)

(assert (=> b!207886 m!319931))

(declare-fun m!319933 () Bool)

(assert (=> b!207886 m!319933))

(declare-fun m!319935 () Bool)

(assert (=> b!207886 m!319935))

(declare-fun m!319937 () Bool)

(assert (=> b!207886 m!319937))

(declare-fun m!319939 () Bool)

(assert (=> b!207886 m!319939))

(declare-fun m!319941 () Bool)

(assert (=> b!207886 m!319941))

(declare-fun m!319943 () Bool)

(assert (=> b!207886 m!319943))

(assert (=> b!207886 m!319913))

(declare-fun m!319945 () Bool)

(assert (=> b!207886 m!319945))

(declare-fun m!319947 () Bool)

(assert (=> b!207886 m!319947))

(declare-fun m!319949 () Bool)

(assert (=> b!207886 m!319949))

(declare-fun m!319951 () Bool)

(assert (=> b!207886 m!319951))

(declare-fun m!319953 () Bool)

(assert (=> b!207886 m!319953))

(assert (=> b!207886 m!319175))

(declare-fun m!319955 () Bool)

(assert (=> b!207886 m!319955))

(declare-fun m!319957 () Bool)

(assert (=> b!207886 m!319957))

(declare-fun m!319959 () Bool)

(assert (=> b!207886 m!319959))

(declare-fun m!319961 () Bool)

(assert (=> b!207886 m!319961))

(assert (=> b!207886 m!319909))

(declare-fun m!319963 () Bool)

(assert (=> b!207886 m!319963))

(declare-fun m!319965 () Bool)

(assert (=> b!207886 m!319965))

(declare-fun m!319967 () Bool)

(assert (=> b!207886 m!319967))

(declare-fun m!319969 () Bool)

(assert (=> b!207886 m!319969))

(declare-fun m!319971 () Bool)

(assert (=> b!207886 m!319971))

(declare-fun m!319973 () Bool)

(assert (=> b!207887 m!319973))

(assert (=> b!207887 m!319973))

(declare-fun m!319975 () Bool)

(assert (=> b!207887 m!319975))

(declare-fun m!319977 () Bool)

(assert (=> bm!3276 m!319977))

(declare-fun m!319979 () Bool)

(assert (=> b!207882 m!319979))

(declare-fun m!319981 () Bool)

(assert (=> b!207891 m!319981))

(assert (=> b!207891 m!319175))

(assert (=> b!207413 d!70247))

(declare-fun d!70359 () Bool)

(assert (=> d!70359 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204)) lt!323712) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 thiss!1204))) ((_ sign_extend 32) (currentByte!9608 thiss!1204)) ((_ sign_extend 32) (currentBit!9603 thiss!1204))) lt!323712))))

(declare-fun bs!17293 () Bool)

(assert (= bs!17293 d!70359))

(assert (=> bs!17293 m!319357))

(assert (=> b!207425 d!70359))

(declare-fun d!70361 () Bool)

(assert (=> d!70361 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703))) lt!323699) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4585 (buf!5090 (_2!9549 lt!323703)))) ((_ sign_extend 32) (currentByte!9608 (_2!9549 lt!323703))) ((_ sign_extend 32) (currentBit!9603 (_2!9549 lt!323703)))) lt!323699))))

(declare-fun bs!17294 () Bool)

(assert (= bs!17294 d!70361))

(assert (=> bs!17294 m!319355))

(assert (=> b!207426 d!70361))

(declare-fun d!70363 () Bool)

(assert (=> d!70363 (= (invariant!0 (currentBit!9603 thiss!1204) (currentByte!9608 thiss!1204) (size!4585 (buf!5090 thiss!1204))) (and (bvsge (currentBit!9603 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9603 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9608 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9608 thiss!1204) (size!4585 (buf!5090 thiss!1204))) (and (= (currentBit!9603 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9608 thiss!1204) (size!4585 (buf!5090 thiss!1204)))))))))

(assert (=> b!207415 d!70363))

(push 1)

(assert (not b!207886))

(assert (not d!70219))

(assert (not b!207572))

(assert (not b!207575))

(assert (not d!70231))

(assert (not d!70215))

(assert (not d!70185))

(assert (not d!70233))

(assert (not b!207891))

(assert (not b!207635))

(assert (not b!207574))

(assert (not b!207605))

(assert (not b!207889))

(assert (not b!207608))

(assert (not b!207884))

(assert (not b!207878))

(assert (not d!70225))

(assert (not b!207632))

(assert (not d!70187))

(assert (not b!207888))

(assert (not d!70241))

(assert (not d!70223))

(assert (not d!70229))

(assert (not b!207604))

(assert (not b!207612))

(assert (not b!207577))

(assert (not d!70247))

(assert (not b!207603))

(assert (not d!70191))

(assert (not d!70237))

(assert (not d!70183))

(assert (not b!207890))

(assert (not b!207637))

(assert (not b!207631))

(assert (not d!70245))

(assert (not b!207630))

(assert (not d!70189))

(assert (not d!70201))

(assert (not b!207882))

(assert (not d!70207))

(assert (not b!207629))

(assert (not b!207609))

(assert (not bm!3276))

(assert (not d!70359))

(assert (not b!207555))

(assert (not d!70361))

(assert (not b!207610))

(assert (not b!207887))

(assert (not d!70221))

(assert (not d!70217))

(assert (not b!207607))

(assert (not b!207883))

(assert (not d!70235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

