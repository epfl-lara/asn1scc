; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20900 () Bool)

(assert start!20900)

(declare-fun b!105640 () Bool)

(declare-fun e!69187 () Bool)

(declare-datatypes ((array!4886 0))(
  ( (array!4887 (arr!2821 (Array (_ BitVec 32) (_ BitVec 8))) (size!2228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3930 0))(
  ( (BitStream!3931 (buf!2602 array!4886) (currentByte!5101 (_ BitVec 32)) (currentBit!5096 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8694 0))(
  ( (tuple2!8695 (_1!4604 BitStream!3930) (_2!4604 Bool)) )
))
(declare-fun lt!155996 () tuple2!8694)

(declare-fun lt!155987 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105640 (= e!69187 (= (bitIndex!0 (size!2228 (buf!2602 (_1!4604 lt!155996))) (currentByte!5101 (_1!4604 lt!155996)) (currentBit!5096 (_1!4604 lt!155996))) lt!155987))))

(declare-fun b!105641 () Bool)

(declare-fun e!69184 () Bool)

(declare-fun lt!155997 () tuple2!8694)

(declare-fun lt!155988 () tuple2!8694)

(assert (=> b!105641 (= e!69184 (= (_2!4604 lt!155997) (_2!4604 lt!155988)))))

(declare-fun b!105642 () Bool)

(declare-fun e!69181 () Bool)

(assert (=> b!105642 (= e!69181 e!69187)))

(declare-fun res!87000 () Bool)

(assert (=> b!105642 (=> (not res!87000) (not e!69187))))

(declare-datatypes ((Unit!6478 0))(
  ( (Unit!6479) )
))
(declare-datatypes ((tuple2!8696 0))(
  ( (tuple2!8697 (_1!4605 Unit!6478) (_2!4605 BitStream!3930)) )
))
(declare-fun lt!156004 () tuple2!8696)

(declare-fun lt!156002 () Bool)

(assert (=> b!105642 (= res!87000 (and (= (_2!4604 lt!155996) lt!156002) (= (_1!4604 lt!155996) (_2!4605 lt!156004))))))

(declare-fun thiss!1305 () BitStream!3930)

(declare-fun readBitPure!0 (BitStream!3930) tuple2!8694)

(declare-fun readerFrom!0 (BitStream!3930 (_ BitVec 32) (_ BitVec 32)) BitStream!3930)

(assert (=> b!105642 (= lt!155996 (readBitPure!0 (readerFrom!0 (_2!4605 lt!156004) (currentBit!5096 thiss!1305) (currentByte!5101 thiss!1305))))))

(declare-fun lt!156006 () tuple2!8696)

(declare-datatypes ((tuple2!8698 0))(
  ( (tuple2!8699 (_1!4606 BitStream!3930) (_2!4606 BitStream!3930)) )
))
(declare-fun lt!155986 () tuple2!8698)

(declare-fun b!105643 () Bool)

(declare-fun e!69182 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!3930 (_ BitVec 64)) BitStream!3930)

(assert (=> b!105643 (= e!69182 (= (_1!4606 lt!155986) (withMovedBitIndex!0 (_2!4606 lt!155986) (bvsub (bitIndex!0 (size!2228 (buf!2602 thiss!1305)) (currentByte!5101 thiss!1305) (currentBit!5096 thiss!1305)) (bitIndex!0 (size!2228 (buf!2602 (_2!4605 lt!156006))) (currentByte!5101 (_2!4605 lt!156006)) (currentBit!5096 (_2!4605 lt!156006)))))))))

(declare-fun b!105645 () Bool)

(declare-fun e!69189 () Bool)

(declare-fun array_inv!2030 (array!4886) Bool)

(assert (=> b!105645 (= e!69189 (array_inv!2030 (buf!2602 thiss!1305)))))

(declare-fun b!105646 () Bool)

(declare-fun res!87006 () Bool)

(assert (=> b!105646 (=> (not res!87006) (not e!69181))))

(declare-fun isPrefixOf!0 (BitStream!3930 BitStream!3930) Bool)

(assert (=> b!105646 (= res!87006 (isPrefixOf!0 thiss!1305 (_2!4605 lt!156004)))))

(declare-fun b!105647 () Bool)

(declare-fun e!69183 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!105647 (= e!69183 (invariant!0 (currentBit!5096 (_2!4605 lt!156004)) (currentByte!5101 (_2!4605 lt!156004)) (size!2228 (buf!2602 (_2!4605 lt!156004)))))))

(assert (=> b!105647 e!69182))

(declare-fun res!87002 () Bool)

(assert (=> b!105647 (=> (not res!87002) (not e!69182))))

(declare-datatypes ((tuple2!8700 0))(
  ( (tuple2!8701 (_1!4607 BitStream!3930) (_2!4607 (_ BitVec 64))) )
))
(declare-fun lt!156001 () tuple2!8700)

(declare-fun lt!155990 () tuple2!8700)

(assert (=> b!105647 (= res!87002 (and (= (_2!4607 lt!156001) (_2!4607 lt!155990)) (= (_1!4607 lt!156001) (_1!4607 lt!155990))))))

(declare-fun lt!155989 () Unit!6478)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!155984 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6478)

(assert (=> b!105647 (= lt!155989 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4606 lt!155986) nBits!396 i!615 lt!155984))))

(declare-fun lt!155991 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8700)

(assert (=> b!105647 (= lt!155990 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4606 lt!155986) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155991))))

(declare-fun b!105648 () Bool)

(declare-fun e!69186 () Bool)

(assert (=> b!105648 (= e!69186 (invariant!0 (currentBit!5096 thiss!1305) (currentByte!5101 thiss!1305) (size!2228 (buf!2602 (_2!4605 lt!156006)))))))

(declare-fun b!105649 () Bool)

(declare-fun e!69180 () Bool)

(declare-fun e!69185 () Bool)

(assert (=> b!105649 (= e!69180 e!69185)))

(declare-fun res!87001 () Bool)

(assert (=> b!105649 (=> (not res!87001) (not e!69185))))

(declare-fun lt!156000 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105649 (= res!87001 (validate_offset_bits!1 ((_ sign_extend 32) (size!2228 (buf!2602 thiss!1305))) ((_ sign_extend 32) (currentByte!5101 thiss!1305)) ((_ sign_extend 32) (currentBit!5096 thiss!1305)) lt!156000))))

(assert (=> b!105649 (= lt!156000 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!105650 () Bool)

(assert (=> b!105650 (= e!69185 (not e!69183))))

(declare-fun res!87004 () Bool)

(assert (=> b!105650 (=> res!87004 e!69183)))

(declare-fun lt!155994 () tuple2!8698)

(assert (=> b!105650 (= res!87004 (not (= (_1!4607 (readNLeastSignificantBitsLoopPure!0 (_1!4606 lt!155994) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155991)) (_2!4606 lt!155994))))))

(declare-fun lt!155983 () (_ BitVec 64))

(assert (=> b!105650 (validate_offset_bits!1 ((_ sign_extend 32) (size!2228 (buf!2602 (_2!4605 lt!156006)))) ((_ sign_extend 32) (currentByte!5101 (_2!4605 lt!156004))) ((_ sign_extend 32) (currentBit!5096 (_2!4605 lt!156004))) lt!155983)))

(declare-fun lt!155993 () Unit!6478)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3930 array!4886 (_ BitVec 64)) Unit!6478)

(assert (=> b!105650 (= lt!155993 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4605 lt!156004) (buf!2602 (_2!4605 lt!156006)) lt!155983))))

(assert (=> b!105650 (= lt!155983 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!155995 () (_ BitVec 64))

(declare-fun lt!155998 () tuple2!8694)

(assert (=> b!105650 (= lt!155991 (bvor lt!155984 (ite (_2!4604 lt!155998) lt!155995 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105650 (= lt!156001 (readNLeastSignificantBitsLoopPure!0 (_1!4606 lt!155986) nBits!396 i!615 lt!155984))))

(assert (=> b!105650 (validate_offset_bits!1 ((_ sign_extend 32) (size!2228 (buf!2602 (_2!4605 lt!156006)))) ((_ sign_extend 32) (currentByte!5101 thiss!1305)) ((_ sign_extend 32) (currentBit!5096 thiss!1305)) lt!156000)))

(declare-fun lt!156005 () Unit!6478)

(assert (=> b!105650 (= lt!156005 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2602 (_2!4605 lt!156006)) lt!156000))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105650 (= lt!155984 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!105650 (= (_2!4604 lt!155998) lt!156002)))

(assert (=> b!105650 (= lt!155998 (readBitPure!0 (_1!4606 lt!155986)))))

(declare-fun reader!0 (BitStream!3930 BitStream!3930) tuple2!8698)

(assert (=> b!105650 (= lt!155994 (reader!0 (_2!4605 lt!156004) (_2!4605 lt!156006)))))

(assert (=> b!105650 (= lt!155986 (reader!0 thiss!1305 (_2!4605 lt!156006)))))

(assert (=> b!105650 e!69184))

(declare-fun res!87003 () Bool)

(assert (=> b!105650 (=> (not res!87003) (not e!69184))))

(assert (=> b!105650 (= res!87003 (= (bitIndex!0 (size!2228 (buf!2602 (_1!4604 lt!155997))) (currentByte!5101 (_1!4604 lt!155997)) (currentBit!5096 (_1!4604 lt!155997))) (bitIndex!0 (size!2228 (buf!2602 (_1!4604 lt!155988))) (currentByte!5101 (_1!4604 lt!155988)) (currentBit!5096 (_1!4604 lt!155988)))))))

(declare-fun lt!155999 () Unit!6478)

(declare-fun lt!155985 () BitStream!3930)

(declare-fun readBitPrefixLemma!0 (BitStream!3930 BitStream!3930) Unit!6478)

(assert (=> b!105650 (= lt!155999 (readBitPrefixLemma!0 lt!155985 (_2!4605 lt!156006)))))

(assert (=> b!105650 (= lt!155988 (readBitPure!0 (BitStream!3931 (buf!2602 (_2!4605 lt!156006)) (currentByte!5101 thiss!1305) (currentBit!5096 thiss!1305))))))

(assert (=> b!105650 (= lt!155997 (readBitPure!0 lt!155985))))

(assert (=> b!105650 (= lt!155985 (BitStream!3931 (buf!2602 (_2!4605 lt!156004)) (currentByte!5101 thiss!1305) (currentBit!5096 thiss!1305)))))

(assert (=> b!105650 e!69186))

(declare-fun res!86997 () Bool)

(assert (=> b!105650 (=> (not res!86997) (not e!69186))))

(assert (=> b!105650 (= res!86997 (isPrefixOf!0 thiss!1305 (_2!4605 lt!156006)))))

(declare-fun lt!156003 () Unit!6478)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3930 BitStream!3930 BitStream!3930) Unit!6478)

(assert (=> b!105650 (= lt!156003 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4605 lt!156004) (_2!4605 lt!156006)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3930 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8696)

(assert (=> b!105650 (= lt!156006 (appendNLeastSignificantBitsLoop!0 (_2!4605 lt!156004) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69190 () Bool)

(assert (=> b!105650 e!69190))

(declare-fun res!87009 () Bool)

(assert (=> b!105650 (=> (not res!87009) (not e!69190))))

(assert (=> b!105650 (= res!87009 (= (size!2228 (buf!2602 thiss!1305)) (size!2228 (buf!2602 (_2!4605 lt!156004)))))))

(declare-fun appendBit!0 (BitStream!3930 Bool) tuple2!8696)

(assert (=> b!105650 (= lt!156004 (appendBit!0 thiss!1305 lt!156002))))

(assert (=> b!105650 (= lt!156002 (not (= (bvand v!199 lt!155995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105650 (= lt!155995 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!105644 () Bool)

(assert (=> b!105644 (= e!69190 e!69181)))

(declare-fun res!86999 () Bool)

(assert (=> b!105644 (=> (not res!86999) (not e!69181))))

(declare-fun lt!155992 () (_ BitVec 64))

(assert (=> b!105644 (= res!86999 (= lt!155987 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!155992)))))

(assert (=> b!105644 (= lt!155987 (bitIndex!0 (size!2228 (buf!2602 (_2!4605 lt!156004))) (currentByte!5101 (_2!4605 lt!156004)) (currentBit!5096 (_2!4605 lt!156004))))))

(assert (=> b!105644 (= lt!155992 (bitIndex!0 (size!2228 (buf!2602 thiss!1305)) (currentByte!5101 thiss!1305) (currentBit!5096 thiss!1305)))))

(declare-fun res!87008 () Bool)

(assert (=> start!20900 (=> (not res!87008) (not e!69180))))

(assert (=> start!20900 (= res!87008 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20900 e!69180))

(assert (=> start!20900 true))

(declare-fun inv!12 (BitStream!3930) Bool)

(assert (=> start!20900 (and (inv!12 thiss!1305) e!69189)))

(declare-fun b!105651 () Bool)

(declare-fun res!87005 () Bool)

(assert (=> b!105651 (=> (not res!87005) (not e!69185))))

(assert (=> b!105651 (= res!87005 (bvslt i!615 nBits!396))))

(declare-fun b!105652 () Bool)

(declare-fun res!86998 () Bool)

(assert (=> b!105652 (=> (not res!86998) (not e!69186))))

(assert (=> b!105652 (= res!86998 (invariant!0 (currentBit!5096 thiss!1305) (currentByte!5101 thiss!1305) (size!2228 (buf!2602 (_2!4605 lt!156004)))))))

(declare-fun b!105653 () Bool)

(declare-fun res!87007 () Bool)

(assert (=> b!105653 (=> (not res!87007) (not e!69185))))

(assert (=> b!105653 (= res!87007 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!20900 res!87008) b!105649))

(assert (= (and b!105649 res!87001) b!105653))

(assert (= (and b!105653 res!87007) b!105651))

(assert (= (and b!105651 res!87005) b!105650))

(assert (= (and b!105650 res!87009) b!105644))

(assert (= (and b!105644 res!86999) b!105646))

(assert (= (and b!105646 res!87006) b!105642))

(assert (= (and b!105642 res!87000) b!105640))

(assert (= (and b!105650 res!86997) b!105652))

(assert (= (and b!105652 res!86998) b!105648))

(assert (= (and b!105650 res!87003) b!105641))

(assert (= (and b!105650 (not res!87004)) b!105647))

(assert (= (and b!105647 res!87002) b!105643))

(assert (= start!20900 b!105645))

(declare-fun m!155307 () Bool)

(assert (=> b!105648 m!155307))

(declare-fun m!155309 () Bool)

(assert (=> b!105653 m!155309))

(declare-fun m!155311 () Bool)

(assert (=> b!105644 m!155311))

(declare-fun m!155313 () Bool)

(assert (=> b!105644 m!155313))

(declare-fun m!155315 () Bool)

(assert (=> b!105640 m!155315))

(declare-fun m!155317 () Bool)

(assert (=> b!105646 m!155317))

(declare-fun m!155319 () Bool)

(assert (=> b!105645 m!155319))

(assert (=> b!105643 m!155313))

(declare-fun m!155321 () Bool)

(assert (=> b!105643 m!155321))

(declare-fun m!155323 () Bool)

(assert (=> b!105643 m!155323))

(declare-fun m!155325 () Bool)

(assert (=> b!105647 m!155325))

(declare-fun m!155327 () Bool)

(assert (=> b!105647 m!155327))

(declare-fun m!155329 () Bool)

(assert (=> b!105647 m!155329))

(assert (=> b!105647 m!155329))

(declare-fun m!155331 () Bool)

(assert (=> b!105647 m!155331))

(declare-fun m!155333 () Bool)

(assert (=> start!20900 m!155333))

(declare-fun m!155335 () Bool)

(assert (=> b!105642 m!155335))

(assert (=> b!105642 m!155335))

(declare-fun m!155337 () Bool)

(assert (=> b!105642 m!155337))

(declare-fun m!155339 () Bool)

(assert (=> b!105649 m!155339))

(declare-fun m!155341 () Bool)

(assert (=> b!105650 m!155341))

(declare-fun m!155343 () Bool)

(assert (=> b!105650 m!155343))

(declare-fun m!155345 () Bool)

(assert (=> b!105650 m!155345))

(declare-fun m!155347 () Bool)

(assert (=> b!105650 m!155347))

(declare-fun m!155349 () Bool)

(assert (=> b!105650 m!155349))

(declare-fun m!155351 () Bool)

(assert (=> b!105650 m!155351))

(declare-fun m!155353 () Bool)

(assert (=> b!105650 m!155353))

(declare-fun m!155355 () Bool)

(assert (=> b!105650 m!155355))

(declare-fun m!155357 () Bool)

(assert (=> b!105650 m!155357))

(declare-fun m!155359 () Bool)

(assert (=> b!105650 m!155359))

(declare-fun m!155361 () Bool)

(assert (=> b!105650 m!155361))

(declare-fun m!155363 () Bool)

(assert (=> b!105650 m!155363))

(declare-fun m!155365 () Bool)

(assert (=> b!105650 m!155365))

(declare-fun m!155367 () Bool)

(assert (=> b!105650 m!155367))

(declare-fun m!155369 () Bool)

(assert (=> b!105650 m!155369))

(declare-fun m!155371 () Bool)

(assert (=> b!105650 m!155371))

(declare-fun m!155373 () Bool)

(assert (=> b!105650 m!155373))

(declare-fun m!155375 () Bool)

(assert (=> b!105650 m!155375))

(declare-fun m!155377 () Bool)

(assert (=> b!105650 m!155377))

(declare-fun m!155379 () Bool)

(assert (=> b!105652 m!155379))

(check-sat (not b!105644) (not b!105646) (not start!20900) (not b!105648) (not b!105643) (not b!105652) (not b!105650) (not b!105640) (not b!105649) (not b!105647) (not b!105642) (not b!105645) (not b!105653))
(check-sat)
(get-model)

