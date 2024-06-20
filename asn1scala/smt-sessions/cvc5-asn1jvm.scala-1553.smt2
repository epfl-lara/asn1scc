; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43614 () Bool)

(assert start!43614)

(declare-fun res!173295 () Bool)

(declare-fun e!141281 () Bool)

(assert (=> start!43614 (=> (not res!173295) (not e!141281))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43614 (= res!173295 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43614 e!141281))

(assert (=> start!43614 true))

(declare-datatypes ((array!10397 0))(
  ( (array!10398 (arr!5500 (Array (_ BitVec 32) (_ BitVec 8))) (size!4570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8248 0))(
  ( (BitStream!8249 (buf!5075 array!10397) (currentByte!9593 (_ BitVec 32)) (currentBit!9588 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8248)

(declare-fun e!141279 () Bool)

(declare-fun inv!12 (BitStream!8248) Bool)

(assert (=> start!43614 (and (inv!12 thiss!1204) e!141279)))

(declare-fun b!206645 () Bool)

(declare-fun e!141288 () Bool)

(declare-fun e!141285 () Bool)

(assert (=> b!206645 (= e!141288 (not e!141285))))

(declare-fun res!173299 () Bool)

(assert (=> b!206645 (=> res!173299 e!141285)))

(declare-fun lt!322838 () (_ BitVec 64))

(declare-fun lt!322832 () (_ BitVec 64))

(assert (=> b!206645 (= res!173299 (not (= lt!322838 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322832))))))

(declare-datatypes ((Unit!14734 0))(
  ( (Unit!14735) )
))
(declare-datatypes ((tuple2!17666 0))(
  ( (tuple2!17667 (_1!9488 Unit!14734) (_2!9488 BitStream!8248)) )
))
(declare-fun lt!322831 () tuple2!17666)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206645 (= lt!322838 (bitIndex!0 (size!4570 (buf!5075 (_2!9488 lt!322831))) (currentByte!9593 (_2!9488 lt!322831)) (currentBit!9588 (_2!9488 lt!322831))))))

(assert (=> b!206645 (= lt!322832 (bitIndex!0 (size!4570 (buf!5075 thiss!1204)) (currentByte!9593 thiss!1204) (currentBit!9588 thiss!1204)))))

(declare-fun e!141282 () Bool)

(assert (=> b!206645 e!141282))

(declare-fun res!173298 () Bool)

(assert (=> b!206645 (=> (not res!173298) (not e!141282))))

(assert (=> b!206645 (= res!173298 (= (size!4570 (buf!5075 thiss!1204)) (size!4570 (buf!5075 (_2!9488 lt!322831)))))))

(declare-fun lt!322837 () Bool)

(declare-fun appendBit!0 (BitStream!8248 Bool) tuple2!17666)

(assert (=> b!206645 (= lt!322831 (appendBit!0 thiss!1204 lt!322837))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206645 (= lt!322837 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206646 () Bool)

(declare-fun array_inv!4311 (array!10397) Bool)

(assert (=> b!206646 (= e!141279 (array_inv!4311 (buf!5075 thiss!1204)))))

(declare-fun b!206647 () Bool)

(declare-fun res!173291 () Bool)

(declare-fun e!141287 () Bool)

(assert (=> b!206647 (=> res!173291 e!141287)))

(declare-fun isPrefixOf!0 (BitStream!8248 BitStream!8248) Bool)

(assert (=> b!206647 (= res!173291 (not (isPrefixOf!0 thiss!1204 (_2!9488 lt!322831))))))

(declare-fun b!206648 () Bool)

(declare-fun e!141278 () Bool)

(declare-fun lt!322827 () tuple2!17666)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206648 (= e!141278 (invariant!0 (currentBit!9588 thiss!1204) (currentByte!9593 thiss!1204) (size!4570 (buf!5075 (_2!9488 lt!322827)))))))

(declare-fun b!206649 () Bool)

(declare-fun res!173305 () Bool)

(assert (=> b!206649 (=> (not res!173305) (not e!141288))))

(assert (=> b!206649 (= res!173305 (not (= i!590 nBits!348)))))

(declare-fun b!206650 () Bool)

(assert (=> b!206650 (= e!141281 e!141288)))

(declare-fun res!173300 () Bool)

(assert (=> b!206650 (=> (not res!173300) (not e!141288))))

(declare-fun lt!322833 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206650 (= res!173300 (validate_offset_bits!1 ((_ sign_extend 32) (size!4570 (buf!5075 thiss!1204))) ((_ sign_extend 32) (currentByte!9593 thiss!1204)) ((_ sign_extend 32) (currentBit!9588 thiss!1204)) lt!322833))))

(assert (=> b!206650 (= lt!322833 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206651 () Bool)

(declare-fun res!173303 () Bool)

(assert (=> b!206651 (=> (not res!173303) (not e!141288))))

(assert (=> b!206651 (= res!173303 (invariant!0 (currentBit!9588 thiss!1204) (currentByte!9593 thiss!1204) (size!4570 (buf!5075 thiss!1204))))))

(declare-fun b!206652 () Bool)

(declare-fun res!173304 () Bool)

(assert (=> b!206652 (=> res!173304 e!141287)))

(assert (=> b!206652 (= res!173304 (not (isPrefixOf!0 (_2!9488 lt!322831) (_2!9488 lt!322827))))))

(declare-fun b!206653 () Bool)

(declare-datatypes ((tuple2!17668 0))(
  ( (tuple2!17669 (_1!9489 BitStream!8248) (_2!9489 Bool)) )
))
(declare-fun lt!322830 () tuple2!17668)

(assert (=> b!206653 (= e!141287 (or (not (_2!9489 lt!322830)) (and (bvsge ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-datatypes ((tuple2!17670 0))(
  ( (tuple2!17671 (_1!9490 BitStream!8248) (_2!9490 (_ BitVec 64))) )
))
(declare-fun lt!322839 () tuple2!17670)

(declare-datatypes ((tuple2!17672 0))(
  ( (tuple2!17673 (_1!9491 BitStream!8248) (_2!9491 BitStream!8248)) )
))
(declare-fun lt!322829 () tuple2!17672)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17670)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206653 (= lt!322839 (readNBitsLSBFirstsLoopPure!0 (_1!9491 lt!322829) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!206653 (validate_offset_bits!1 ((_ sign_extend 32) (size!4570 (buf!5075 (_2!9488 lt!322827)))) ((_ sign_extend 32) (currentByte!9593 thiss!1204)) ((_ sign_extend 32) (currentBit!9588 thiss!1204)) lt!322833)))

(declare-fun lt!322822 () Unit!14734)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8248 array!10397 (_ BitVec 64)) Unit!14734)

(assert (=> b!206653 (= lt!322822 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5075 (_2!9488 lt!322827)) lt!322833))))

(assert (=> b!206653 (= (_2!9489 lt!322830) lt!322837)))

(declare-fun readBitPure!0 (BitStream!8248) tuple2!17668)

(assert (=> b!206653 (= lt!322830 (readBitPure!0 (_1!9491 lt!322829)))))

(declare-fun lt!322823 () tuple2!17672)

(declare-fun reader!0 (BitStream!8248 BitStream!8248) tuple2!17672)

(assert (=> b!206653 (= lt!322823 (reader!0 (_2!9488 lt!322831) (_2!9488 lt!322827)))))

(assert (=> b!206653 (= lt!322829 (reader!0 thiss!1204 (_2!9488 lt!322827)))))

(declare-fun e!141284 () Bool)

(assert (=> b!206653 e!141284))

(declare-fun res!173292 () Bool)

(assert (=> b!206653 (=> (not res!173292) (not e!141284))))

(declare-fun lt!322840 () tuple2!17668)

(declare-fun lt!322834 () tuple2!17668)

(assert (=> b!206653 (= res!173292 (= (bitIndex!0 (size!4570 (buf!5075 (_1!9489 lt!322840))) (currentByte!9593 (_1!9489 lt!322840)) (currentBit!9588 (_1!9489 lt!322840))) (bitIndex!0 (size!4570 (buf!5075 (_1!9489 lt!322834))) (currentByte!9593 (_1!9489 lt!322834)) (currentBit!9588 (_1!9489 lt!322834)))))))

(declare-fun lt!322828 () Unit!14734)

(declare-fun lt!322836 () BitStream!8248)

(declare-fun readBitPrefixLemma!0 (BitStream!8248 BitStream!8248) Unit!14734)

(assert (=> b!206653 (= lt!322828 (readBitPrefixLemma!0 lt!322836 (_2!9488 lt!322827)))))

(assert (=> b!206653 (= lt!322834 (readBitPure!0 (BitStream!8249 (buf!5075 (_2!9488 lt!322827)) (currentByte!9593 thiss!1204) (currentBit!9588 thiss!1204))))))

(assert (=> b!206653 (= lt!322840 (readBitPure!0 lt!322836))))

(assert (=> b!206653 e!141278))

(declare-fun res!173302 () Bool)

(assert (=> b!206653 (=> (not res!173302) (not e!141278))))

(assert (=> b!206653 (= res!173302 (invariant!0 (currentBit!9588 thiss!1204) (currentByte!9593 thiss!1204) (size!4570 (buf!5075 (_2!9488 lt!322831)))))))

(assert (=> b!206653 (= lt!322836 (BitStream!8249 (buf!5075 (_2!9488 lt!322831)) (currentByte!9593 thiss!1204) (currentBit!9588 thiss!1204)))))

(declare-fun b!206654 () Bool)

(declare-fun res!173293 () Bool)

(assert (=> b!206654 (=> res!173293 e!141287)))

(assert (=> b!206654 (= res!173293 (not (invariant!0 (currentBit!9588 (_2!9488 lt!322827)) (currentByte!9593 (_2!9488 lt!322827)) (size!4570 (buf!5075 (_2!9488 lt!322827))))))))

(declare-fun b!206655 () Bool)

(declare-fun e!141283 () Bool)

(declare-fun lt!322841 () tuple2!17668)

(declare-fun lt!322825 () (_ BitVec 64))

(assert (=> b!206655 (= e!141283 (= (bitIndex!0 (size!4570 (buf!5075 (_1!9489 lt!322841))) (currentByte!9593 (_1!9489 lt!322841)) (currentBit!9588 (_1!9489 lt!322841))) lt!322825))))

(declare-fun b!206656 () Bool)

(declare-fun res!173297 () Bool)

(assert (=> b!206656 (=> res!173297 e!141287)))

(declare-fun lt!322826 () (_ BitVec 64))

(assert (=> b!206656 (= res!173297 (or (not (= (size!4570 (buf!5075 (_2!9488 lt!322827))) (size!4570 (buf!5075 thiss!1204)))) (not (= lt!322826 (bvsub (bvadd lt!322832 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206657 () Bool)

(declare-fun res!173306 () Bool)

(declare-fun e!141280 () Bool)

(assert (=> b!206657 (=> (not res!173306) (not e!141280))))

(assert (=> b!206657 (= res!173306 (isPrefixOf!0 thiss!1204 (_2!9488 lt!322831)))))

(declare-fun b!206658 () Bool)

(assert (=> b!206658 (= e!141282 e!141280)))

(declare-fun res!173294 () Bool)

(assert (=> b!206658 (=> (not res!173294) (not e!141280))))

(declare-fun lt!322824 () (_ BitVec 64))

(assert (=> b!206658 (= res!173294 (= lt!322825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322824)))))

(assert (=> b!206658 (= lt!322825 (bitIndex!0 (size!4570 (buf!5075 (_2!9488 lt!322831))) (currentByte!9593 (_2!9488 lt!322831)) (currentBit!9588 (_2!9488 lt!322831))))))

(assert (=> b!206658 (= lt!322824 (bitIndex!0 (size!4570 (buf!5075 thiss!1204)) (currentByte!9593 thiss!1204) (currentBit!9588 thiss!1204)))))

(declare-fun b!206659 () Bool)

(assert (=> b!206659 (= e!141284 (= (_2!9489 lt!322840) (_2!9489 lt!322834)))))

(declare-fun b!206660 () Bool)

(assert (=> b!206660 (= e!141280 e!141283)))

(declare-fun res!173301 () Bool)

(assert (=> b!206660 (=> (not res!173301) (not e!141283))))

(assert (=> b!206660 (= res!173301 (and (= (_2!9489 lt!322841) lt!322837) (= (_1!9489 lt!322841) (_2!9488 lt!322831))))))

(declare-fun readerFrom!0 (BitStream!8248 (_ BitVec 32) (_ BitVec 32)) BitStream!8248)

(assert (=> b!206660 (= lt!322841 (readBitPure!0 (readerFrom!0 (_2!9488 lt!322831) (currentBit!9588 thiss!1204) (currentByte!9593 thiss!1204))))))

(declare-fun b!206661 () Bool)

(assert (=> b!206661 (= e!141285 e!141287)))

(declare-fun res!173296 () Bool)

(assert (=> b!206661 (=> res!173296 e!141287)))

(assert (=> b!206661 (= res!173296 (not (= lt!322826 (bvsub (bvsub (bvadd lt!322838 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206661 (= lt!322826 (bitIndex!0 (size!4570 (buf!5075 (_2!9488 lt!322827))) (currentByte!9593 (_2!9488 lt!322827)) (currentBit!9588 (_2!9488 lt!322827))))))

(assert (=> b!206661 (isPrefixOf!0 thiss!1204 (_2!9488 lt!322827))))

(declare-fun lt!322835 () Unit!14734)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8248 BitStream!8248 BitStream!8248) Unit!14734)

(assert (=> b!206661 (= lt!322835 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9488 lt!322831) (_2!9488 lt!322827)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17666)

(assert (=> b!206661 (= lt!322827 (appendBitsLSBFirstLoopTR!0 (_2!9488 lt!322831) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!43614 res!173295) b!206650))

(assert (= (and b!206650 res!173300) b!206651))

(assert (= (and b!206651 res!173303) b!206649))

(assert (= (and b!206649 res!173305) b!206645))

(assert (= (and b!206645 res!173298) b!206658))

(assert (= (and b!206658 res!173294) b!206657))

(assert (= (and b!206657 res!173306) b!206660))

(assert (= (and b!206660 res!173301) b!206655))

(assert (= (and b!206645 (not res!173299)) b!206661))

(assert (= (and b!206661 (not res!173296)) b!206654))

(assert (= (and b!206654 (not res!173293)) b!206656))

(assert (= (and b!206656 (not res!173297)) b!206652))

(assert (= (and b!206652 (not res!173304)) b!206647))

(assert (= (and b!206647 (not res!173291)) b!206653))

(assert (= (and b!206653 res!173302) b!206648))

(assert (= (and b!206653 res!173292) b!206659))

(assert (= start!43614 b!206646))

(declare-fun m!318219 () Bool)

(assert (=> b!206651 m!318219))

(declare-fun m!318221 () Bool)

(assert (=> b!206646 m!318221))

(declare-fun m!318223 () Bool)

(assert (=> b!206653 m!318223))

(declare-fun m!318225 () Bool)

(assert (=> b!206653 m!318225))

(declare-fun m!318227 () Bool)

(assert (=> b!206653 m!318227))

(declare-fun m!318229 () Bool)

(assert (=> b!206653 m!318229))

(declare-fun m!318231 () Bool)

(assert (=> b!206653 m!318231))

(declare-fun m!318233 () Bool)

(assert (=> b!206653 m!318233))

(declare-fun m!318235 () Bool)

(assert (=> b!206653 m!318235))

(declare-fun m!318237 () Bool)

(assert (=> b!206653 m!318237))

(declare-fun m!318239 () Bool)

(assert (=> b!206653 m!318239))

(declare-fun m!318241 () Bool)

(assert (=> b!206653 m!318241))

(declare-fun m!318243 () Bool)

(assert (=> b!206653 m!318243))

(declare-fun m!318245 () Bool)

(assert (=> b!206653 m!318245))

(declare-fun m!318247 () Bool)

(assert (=> b!206653 m!318247))

(declare-fun m!318249 () Bool)

(assert (=> b!206661 m!318249))

(declare-fun m!318251 () Bool)

(assert (=> b!206661 m!318251))

(declare-fun m!318253 () Bool)

(assert (=> b!206661 m!318253))

(declare-fun m!318255 () Bool)

(assert (=> b!206661 m!318255))

(declare-fun m!318257 () Bool)

(assert (=> start!43614 m!318257))

(declare-fun m!318259 () Bool)

(assert (=> b!206647 m!318259))

(declare-fun m!318261 () Bool)

(assert (=> b!206645 m!318261))

(declare-fun m!318263 () Bool)

(assert (=> b!206645 m!318263))

(declare-fun m!318265 () Bool)

(assert (=> b!206645 m!318265))

(declare-fun m!318267 () Bool)

(assert (=> b!206654 m!318267))

(declare-fun m!318269 () Bool)

(assert (=> b!206655 m!318269))

(declare-fun m!318271 () Bool)

(assert (=> b!206660 m!318271))

(assert (=> b!206660 m!318271))

(declare-fun m!318273 () Bool)

(assert (=> b!206660 m!318273))

(assert (=> b!206657 m!318259))

(assert (=> b!206658 m!318261))

(assert (=> b!206658 m!318263))

(declare-fun m!318275 () Bool)

(assert (=> b!206648 m!318275))

(declare-fun m!318277 () Bool)

(assert (=> b!206650 m!318277))

(declare-fun m!318279 () Bool)

(assert (=> b!206652 m!318279))

(push 1)

(assert (not b!206652))

(assert (not b!206657))

(assert (not b!206658))

(assert (not b!206650))

(assert (not b!206651))

(assert (not start!43614))

(assert (not b!206661))

(assert (not b!206653))

(assert (not b!206645))

(assert (not b!206660))

(assert (not b!206655))

(assert (not b!206647))

(assert (not b!206646))

(assert (not b!206654))

(assert (not b!206648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

