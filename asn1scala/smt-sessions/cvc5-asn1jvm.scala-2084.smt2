; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52760 () Bool)

(assert start!52760)

(declare-fun b!244328 () Bool)

(declare-fun res!204208 () Bool)

(declare-fun e!169346 () Bool)

(assert (=> b!244328 (=> (not res!204208) (not e!169346))))

(declare-datatypes ((array!13379 0))(
  ( (array!13380 (arr!6853 (Array (_ BitVec 32) (_ BitVec 8))) (size!5866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10654 0))(
  ( (BitStream!10655 (buf!6338 array!13379) (currentByte!11716 (_ BitVec 32)) (currentBit!11711 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17827 0))(
  ( (Unit!17828) )
))
(declare-datatypes ((tuple2!20958 0))(
  ( (tuple2!20959 (_1!11401 Unit!17827) (_2!11401 BitStream!10654)) )
))
(declare-fun lt!380798 () tuple2!20958)

(declare-fun lt!380786 () tuple2!20958)

(declare-fun isPrefixOf!0 (BitStream!10654 BitStream!10654) Bool)

(assert (=> b!244328 (= res!204208 (isPrefixOf!0 (_2!11401 lt!380798) (_2!11401 lt!380786)))))

(declare-fun b!244329 () Bool)

(declare-datatypes ((tuple2!20960 0))(
  ( (tuple2!20961 (_1!11402 BitStream!10654) (_2!11402 Bool)) )
))
(declare-fun lt!380783 () tuple2!20960)

(declare-datatypes ((tuple2!20962 0))(
  ( (tuple2!20963 (_1!11403 BitStream!10654) (_2!11403 BitStream!10654)) )
))
(declare-fun lt!380792 () tuple2!20962)

(assert (=> b!244329 (= e!169346 (not (or (not (_2!11402 lt!380783)) (not (= (_1!11402 lt!380783) (_2!11403 lt!380792))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10654 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20960)

(assert (=> b!244329 (= lt!380783 (checkBitsLoopPure!0 (_1!11403 lt!380792) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380781 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244329 (validate_offset_bits!1 ((_ sign_extend 32) (size!5866 (buf!6338 (_2!11401 lt!380786)))) ((_ sign_extend 32) (currentByte!11716 (_2!11401 lt!380798))) ((_ sign_extend 32) (currentBit!11711 (_2!11401 lt!380798))) lt!380781)))

(declare-fun lt!380791 () Unit!17827)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10654 array!13379 (_ BitVec 64)) Unit!17827)

(assert (=> b!244329 (= lt!380791 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11401 lt!380798) (buf!6338 (_2!11401 lt!380786)) lt!380781))))

(declare-fun reader!0 (BitStream!10654 BitStream!10654) tuple2!20962)

(assert (=> b!244329 (= lt!380792 (reader!0 (_2!11401 lt!380798) (_2!11401 lt!380786)))))

(declare-fun b!244330 () Bool)

(declare-fun e!169348 () Bool)

(declare-fun e!169345 () Bool)

(assert (=> b!244330 (= e!169348 e!169345)))

(declare-fun res!204207 () Bool)

(assert (=> b!244330 (=> (not res!204207) (not e!169345))))

(declare-fun lt!380779 () tuple2!20960)

(assert (=> b!244330 (= res!204207 (and (= (_2!11402 lt!380779) bit!26) (= (_1!11402 lt!380779) (_2!11401 lt!380798))))))

(declare-fun thiss!1005 () BitStream!10654)

(declare-fun readBitPure!0 (BitStream!10654) tuple2!20960)

(declare-fun readerFrom!0 (BitStream!10654 (_ BitVec 32) (_ BitVec 32)) BitStream!10654)

(assert (=> b!244330 (= lt!380779 (readBitPure!0 (readerFrom!0 (_2!11401 lt!380798) (currentBit!11711 thiss!1005) (currentByte!11716 thiss!1005))))))

(declare-fun b!244331 () Bool)

(declare-fun e!169352 () Bool)

(assert (=> b!244331 (= e!169352 e!169348)))

(declare-fun res!204203 () Bool)

(assert (=> b!244331 (=> (not res!204203) (not e!169348))))

(declare-fun lt!380796 () (_ BitVec 64))

(declare-fun lt!380782 () (_ BitVec 64))

(assert (=> b!244331 (= res!204203 (= lt!380796 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380782)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244331 (= lt!380796 (bitIndex!0 (size!5866 (buf!6338 (_2!11401 lt!380798))) (currentByte!11716 (_2!11401 lt!380798)) (currentBit!11711 (_2!11401 lt!380798))))))

(assert (=> b!244331 (= lt!380782 (bitIndex!0 (size!5866 (buf!6338 thiss!1005)) (currentByte!11716 thiss!1005) (currentBit!11711 thiss!1005)))))

(declare-fun b!244332 () Bool)

(declare-fun e!169349 () Bool)

(assert (=> b!244332 (= e!169349 e!169346)))

(declare-fun res!204202 () Bool)

(assert (=> b!244332 (=> (not res!204202) (not e!169346))))

(assert (=> b!244332 (= res!204202 (= (bitIndex!0 (size!5866 (buf!6338 (_2!11401 lt!380786))) (currentByte!11716 (_2!11401 lt!380786)) (currentBit!11711 (_2!11401 lt!380786))) (bvadd (bitIndex!0 (size!5866 (buf!6338 (_2!11401 lt!380798))) (currentByte!11716 (_2!11401 lt!380798)) (currentBit!11711 (_2!11401 lt!380798))) lt!380781)))))

(assert (=> b!244332 (= lt!380781 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244333 () Bool)

(declare-fun e!169344 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244333 (= e!169344 (invariant!0 (currentBit!11711 thiss!1005) (currentByte!11716 thiss!1005) (size!5866 (buf!6338 (_2!11401 lt!380786)))))))

(declare-fun b!244334 () Bool)

(declare-fun res!204209 () Bool)

(declare-fun e!169347 () Bool)

(assert (=> b!244334 (=> (not res!204209) (not e!169347))))

(assert (=> b!244334 (= res!204209 (validate_offset_bits!1 ((_ sign_extend 32) (size!5866 (buf!6338 thiss!1005))) ((_ sign_extend 32) (currentByte!11716 thiss!1005)) ((_ sign_extend 32) (currentBit!11711 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244335 () Bool)

(assert (=> b!244335 (= e!169345 (= (bitIndex!0 (size!5866 (buf!6338 (_1!11402 lt!380779))) (currentByte!11716 (_1!11402 lt!380779)) (currentBit!11711 (_1!11402 lt!380779))) lt!380796))))

(declare-fun b!244336 () Bool)

(declare-fun e!169343 () Bool)

(declare-fun lt!380794 () tuple2!20960)

(declare-fun lt!380787 () tuple2!20960)

(assert (=> b!244336 (= e!169343 (= (_2!11402 lt!380794) (_2!11402 lt!380787)))))

(declare-fun b!244337 () Bool)

(declare-fun res!204204 () Bool)

(assert (=> b!244337 (=> (not res!204204) (not e!169348))))

(assert (=> b!244337 (= res!204204 (isPrefixOf!0 thiss!1005 (_2!11401 lt!380798)))))

(declare-fun b!244338 () Bool)

(declare-fun res!204201 () Bool)

(assert (=> b!244338 (=> (not res!204201) (not e!169347))))

(assert (=> b!244338 (= res!204201 (bvslt from!289 nBits!297))))

(declare-fun b!244339 () Bool)

(declare-fun e!169351 () Bool)

(declare-fun array_inv!5607 (array!13379) Bool)

(assert (=> b!244339 (= e!169351 (array_inv!5607 (buf!6338 thiss!1005)))))

(declare-fun b!244340 () Bool)

(assert (=> b!244340 (= e!169347 (not true))))

(declare-fun lt!380797 () (_ BitVec 64))

(assert (=> b!244340 (validate_offset_bits!1 ((_ sign_extend 32) (size!5866 (buf!6338 (_2!11401 lt!380786)))) ((_ sign_extend 32) (currentByte!11716 (_2!11401 lt!380798))) ((_ sign_extend 32) (currentBit!11711 (_2!11401 lt!380798))) lt!380797)))

(declare-fun lt!380788 () Unit!17827)

(assert (=> b!244340 (= lt!380788 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11401 lt!380798) (buf!6338 (_2!11401 lt!380786)) lt!380797))))

(declare-fun lt!380789 () tuple2!20962)

(declare-fun lt!380790 () tuple2!20960)

(assert (=> b!244340 (= lt!380790 (checkBitsLoopPure!0 (_1!11403 lt!380789) nBits!297 bit!26 from!289))))

(assert (=> b!244340 (validate_offset_bits!1 ((_ sign_extend 32) (size!5866 (buf!6338 (_2!11401 lt!380786)))) ((_ sign_extend 32) (currentByte!11716 thiss!1005)) ((_ sign_extend 32) (currentBit!11711 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380784 () Unit!17827)

(assert (=> b!244340 (= lt!380784 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6338 (_2!11401 lt!380786)) (bvsub nBits!297 from!289)))))

(assert (=> b!244340 (= (_2!11402 (readBitPure!0 (_1!11403 lt!380789))) bit!26)))

(declare-fun lt!380793 () tuple2!20962)

(assert (=> b!244340 (= lt!380793 (reader!0 (_2!11401 lt!380798) (_2!11401 lt!380786)))))

(assert (=> b!244340 (= lt!380789 (reader!0 thiss!1005 (_2!11401 lt!380786)))))

(assert (=> b!244340 e!169343))

(declare-fun res!204210 () Bool)

(assert (=> b!244340 (=> (not res!204210) (not e!169343))))

(assert (=> b!244340 (= res!204210 (= (bitIndex!0 (size!5866 (buf!6338 (_1!11402 lt!380794))) (currentByte!11716 (_1!11402 lt!380794)) (currentBit!11711 (_1!11402 lt!380794))) (bitIndex!0 (size!5866 (buf!6338 (_1!11402 lt!380787))) (currentByte!11716 (_1!11402 lt!380787)) (currentBit!11711 (_1!11402 lt!380787)))))))

(declare-fun lt!380799 () Unit!17827)

(declare-fun lt!380780 () BitStream!10654)

(declare-fun readBitPrefixLemma!0 (BitStream!10654 BitStream!10654) Unit!17827)

(assert (=> b!244340 (= lt!380799 (readBitPrefixLemma!0 lt!380780 (_2!11401 lt!380786)))))

(assert (=> b!244340 (= lt!380787 (readBitPure!0 (BitStream!10655 (buf!6338 (_2!11401 lt!380786)) (currentByte!11716 thiss!1005) (currentBit!11711 thiss!1005))))))

(assert (=> b!244340 (= lt!380794 (readBitPure!0 lt!380780))))

(assert (=> b!244340 (= lt!380780 (BitStream!10655 (buf!6338 (_2!11401 lt!380798)) (currentByte!11716 thiss!1005) (currentBit!11711 thiss!1005)))))

(assert (=> b!244340 e!169344))

(declare-fun res!204211 () Bool)

(assert (=> b!244340 (=> (not res!204211) (not e!169344))))

(assert (=> b!244340 (= res!204211 (isPrefixOf!0 thiss!1005 (_2!11401 lt!380786)))))

(declare-fun lt!380785 () Unit!17827)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10654 BitStream!10654 BitStream!10654) Unit!17827)

(assert (=> b!244340 (= lt!380785 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11401 lt!380798) (_2!11401 lt!380786)))))

(assert (=> b!244340 e!169349))

(declare-fun res!204205 () Bool)

(assert (=> b!244340 (=> (not res!204205) (not e!169349))))

(assert (=> b!244340 (= res!204205 (= (size!5866 (buf!6338 (_2!11401 lt!380798))) (size!5866 (buf!6338 (_2!11401 lt!380786)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10654 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20958)

(assert (=> b!244340 (= lt!380786 (appendNBitsLoop!0 (_2!11401 lt!380798) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244340 (validate_offset_bits!1 ((_ sign_extend 32) (size!5866 (buf!6338 (_2!11401 lt!380798)))) ((_ sign_extend 32) (currentByte!11716 (_2!11401 lt!380798))) ((_ sign_extend 32) (currentBit!11711 (_2!11401 lt!380798))) lt!380797)))

(assert (=> b!244340 (= lt!380797 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380795 () Unit!17827)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10654 BitStream!10654 (_ BitVec 64) (_ BitVec 64)) Unit!17827)

(assert (=> b!244340 (= lt!380795 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11401 lt!380798) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244340 e!169352))

(declare-fun res!204206 () Bool)

(assert (=> b!244340 (=> (not res!204206) (not e!169352))))

(assert (=> b!244340 (= res!204206 (= (size!5866 (buf!6338 thiss!1005)) (size!5866 (buf!6338 (_2!11401 lt!380798)))))))

(declare-fun appendBit!0 (BitStream!10654 Bool) tuple2!20958)

(assert (=> b!244340 (= lt!380798 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!204213 () Bool)

(assert (=> start!52760 (=> (not res!204213) (not e!169347))))

(assert (=> start!52760 (= res!204213 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52760 e!169347))

(assert (=> start!52760 true))

(declare-fun inv!12 (BitStream!10654) Bool)

(assert (=> start!52760 (and (inv!12 thiss!1005) e!169351)))

(declare-fun b!244327 () Bool)

(declare-fun res!204212 () Bool)

(assert (=> b!244327 (=> (not res!204212) (not e!169344))))

(assert (=> b!244327 (= res!204212 (invariant!0 (currentBit!11711 thiss!1005) (currentByte!11716 thiss!1005) (size!5866 (buf!6338 (_2!11401 lt!380798)))))))

(assert (= (and start!52760 res!204213) b!244334))

(assert (= (and b!244334 res!204209) b!244338))

(assert (= (and b!244338 res!204201) b!244340))

(assert (= (and b!244340 res!204206) b!244331))

(assert (= (and b!244331 res!204203) b!244337))

(assert (= (and b!244337 res!204204) b!244330))

(assert (= (and b!244330 res!204207) b!244335))

(assert (= (and b!244340 res!204205) b!244332))

(assert (= (and b!244332 res!204202) b!244328))

(assert (= (and b!244328 res!204208) b!244329))

(assert (= (and b!244340 res!204211) b!244327))

(assert (= (and b!244327 res!204212) b!244333))

(assert (= (and b!244340 res!204210) b!244336))

(assert (= start!52760 b!244339))

(declare-fun m!368219 () Bool)

(assert (=> b!244327 m!368219))

(declare-fun m!368221 () Bool)

(assert (=> b!244334 m!368221))

(declare-fun m!368223 () Bool)

(assert (=> b!244329 m!368223))

(declare-fun m!368225 () Bool)

(assert (=> b!244329 m!368225))

(declare-fun m!368227 () Bool)

(assert (=> b!244329 m!368227))

(declare-fun m!368229 () Bool)

(assert (=> b!244329 m!368229))

(declare-fun m!368231 () Bool)

(assert (=> b!244333 m!368231))

(declare-fun m!368233 () Bool)

(assert (=> b!244337 m!368233))

(declare-fun m!368235 () Bool)

(assert (=> b!244328 m!368235))

(declare-fun m!368237 () Bool)

(assert (=> b!244340 m!368237))

(declare-fun m!368239 () Bool)

(assert (=> b!244340 m!368239))

(declare-fun m!368241 () Bool)

(assert (=> b!244340 m!368241))

(declare-fun m!368243 () Bool)

(assert (=> b!244340 m!368243))

(declare-fun m!368245 () Bool)

(assert (=> b!244340 m!368245))

(declare-fun m!368247 () Bool)

(assert (=> b!244340 m!368247))

(declare-fun m!368249 () Bool)

(assert (=> b!244340 m!368249))

(declare-fun m!368251 () Bool)

(assert (=> b!244340 m!368251))

(declare-fun m!368253 () Bool)

(assert (=> b!244340 m!368253))

(assert (=> b!244340 m!368229))

(declare-fun m!368255 () Bool)

(assert (=> b!244340 m!368255))

(declare-fun m!368257 () Bool)

(assert (=> b!244340 m!368257))

(declare-fun m!368259 () Bool)

(assert (=> b!244340 m!368259))

(declare-fun m!368261 () Bool)

(assert (=> b!244340 m!368261))

(declare-fun m!368263 () Bool)

(assert (=> b!244340 m!368263))

(declare-fun m!368265 () Bool)

(assert (=> b!244340 m!368265))

(declare-fun m!368267 () Bool)

(assert (=> b!244340 m!368267))

(declare-fun m!368269 () Bool)

(assert (=> b!244340 m!368269))

(declare-fun m!368271 () Bool)

(assert (=> b!244340 m!368271))

(declare-fun m!368273 () Bool)

(assert (=> b!244330 m!368273))

(assert (=> b!244330 m!368273))

(declare-fun m!368275 () Bool)

(assert (=> b!244330 m!368275))

(declare-fun m!368277 () Bool)

(assert (=> b!244331 m!368277))

(declare-fun m!368279 () Bool)

(assert (=> b!244331 m!368279))

(declare-fun m!368281 () Bool)

(assert (=> b!244332 m!368281))

(assert (=> b!244332 m!368277))

(declare-fun m!368283 () Bool)

(assert (=> b!244339 m!368283))

(declare-fun m!368285 () Bool)

(assert (=> start!52760 m!368285))

(declare-fun m!368287 () Bool)

(assert (=> b!244335 m!368287))

(push 1)

(assert (not b!244328))

(assert (not b!244329))

(assert (not b!244332))

(assert (not start!52760))

(assert (not b!244340))

(assert (not b!244337))

(assert (not b!244339))

(assert (not b!244335))

(assert (not b!244334))

(assert (not b!244333))

(assert (not b!244330))

(assert (not b!244331))

(assert (not b!244327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

