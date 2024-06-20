; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52486 () Bool)

(assert start!52486)

(declare-fun b!242221 () Bool)

(declare-fun res!202261 () Bool)

(declare-fun e!167928 () Bool)

(assert (=> b!242221 (=> (not res!202261) (not e!167928))))

(declare-datatypes ((array!13297 0))(
  ( (array!13298 (arr!6815 (Array (_ BitVec 32) (_ BitVec 8))) (size!5828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10578 0))(
  ( (BitStream!10579 (buf!6294 array!13297) (currentByte!11657 (_ BitVec 32)) (currentBit!11652 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17739 0))(
  ( (Unit!17740) )
))
(declare-datatypes ((tuple2!20718 0))(
  ( (tuple2!20719 (_1!11281 Unit!17739) (_2!11281 BitStream!10578)) )
))
(declare-fun lt!377642 () tuple2!20718)

(declare-fun lt!377635 () tuple2!20718)

(declare-fun isPrefixOf!0 (BitStream!10578 BitStream!10578) Bool)

(assert (=> b!242221 (= res!202261 (isPrefixOf!0 (_2!11281 lt!377642) (_2!11281 lt!377635)))))

(declare-fun b!242222 () Bool)

(declare-fun res!202260 () Bool)

(declare-fun e!167923 () Bool)

(assert (=> b!242222 (=> (not res!202260) (not e!167923))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10578)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242222 (= res!202260 (validate_offset_bits!1 ((_ sign_extend 32) (size!5828 (buf!6294 thiss!1005))) ((_ sign_extend 32) (currentByte!11657 thiss!1005)) ((_ sign_extend 32) (currentBit!11652 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242223 () Bool)

(declare-fun e!167930 () Bool)

(assert (=> b!242223 (= e!167930 e!167928)))

(declare-fun res!202258 () Bool)

(assert (=> b!242223 (=> (not res!202258) (not e!167928))))

(declare-fun lt!377633 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242223 (= res!202258 (= (bitIndex!0 (size!5828 (buf!6294 (_2!11281 lt!377635))) (currentByte!11657 (_2!11281 lt!377635)) (currentBit!11652 (_2!11281 lt!377635))) (bvadd (bitIndex!0 (size!5828 (buf!6294 (_2!11281 lt!377642))) (currentByte!11657 (_2!11281 lt!377642)) (currentBit!11652 (_2!11281 lt!377642))) lt!377633)))))

(assert (=> b!242223 (= lt!377633 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242224 () Bool)

(declare-datatypes ((tuple2!20720 0))(
  ( (tuple2!20721 (_1!11282 BitStream!10578) (_2!11282 Bool)) )
))
(declare-fun lt!377640 () tuple2!20720)

(declare-datatypes ((tuple2!20722 0))(
  ( (tuple2!20723 (_1!11283 BitStream!10578) (_2!11283 BitStream!10578)) )
))
(declare-fun lt!377637 () tuple2!20722)

(assert (=> b!242224 (= e!167928 (not (or (not (_2!11282 lt!377640)) (not (= (_1!11282 lt!377640) (_2!11283 lt!377637))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10578 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20720)

(assert (=> b!242224 (= lt!377640 (checkBitsLoopPure!0 (_1!11283 lt!377637) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242224 (validate_offset_bits!1 ((_ sign_extend 32) (size!5828 (buf!6294 (_2!11281 lt!377635)))) ((_ sign_extend 32) (currentByte!11657 (_2!11281 lt!377642))) ((_ sign_extend 32) (currentBit!11652 (_2!11281 lt!377642))) lt!377633)))

(declare-fun lt!377631 () Unit!17739)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10578 array!13297 (_ BitVec 64)) Unit!17739)

(assert (=> b!242224 (= lt!377631 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11281 lt!377642) (buf!6294 (_2!11281 lt!377635)) lt!377633))))

(declare-fun reader!0 (BitStream!10578 BitStream!10578) tuple2!20722)

(assert (=> b!242224 (= lt!377637 (reader!0 (_2!11281 lt!377642) (_2!11281 lt!377635)))))

(declare-fun b!242225 () Bool)

(declare-fun res!202263 () Bool)

(declare-fun e!167925 () Bool)

(assert (=> b!242225 (=> res!202263 e!167925)))

(declare-fun arrayBitRangesEq!0 (array!13297 array!13297 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242225 (= res!202263 (not (arrayBitRangesEq!0 (buf!6294 (_2!11281 lt!377642)) (buf!6294 (_2!11281 lt!377635)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5828 (buf!6294 (_2!11281 lt!377642))) (currentByte!11657 thiss!1005) (currentBit!11652 thiss!1005))))))))

(declare-fun b!242226 () Bool)

(declare-fun e!167927 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242226 (= e!167927 (invariant!0 (currentBit!11652 thiss!1005) (currentByte!11657 thiss!1005) (size!5828 (buf!6294 (_2!11281 lt!377642)))))))

(declare-fun b!242227 () Bool)

(assert (=> b!242227 (= e!167925 true)))

(declare-fun lt!377638 () tuple2!20720)

(declare-fun readBitPure!0 (BitStream!10578) tuple2!20720)

(assert (=> b!242227 (= lt!377638 (readBitPure!0 (BitStream!10579 (buf!6294 (_2!11281 lt!377635)) (currentByte!11657 thiss!1005) (currentBit!11652 thiss!1005))))))

(declare-fun lt!377634 () tuple2!20720)

(assert (=> b!242227 (= lt!377634 (readBitPure!0 (BitStream!10579 (buf!6294 (_2!11281 lt!377642)) (currentByte!11657 thiss!1005) (currentBit!11652 thiss!1005))))))

(assert (=> b!242227 (invariant!0 (currentBit!11652 thiss!1005) (currentByte!11657 thiss!1005) (size!5828 (buf!6294 (_2!11281 lt!377635))))))

(declare-fun b!242228 () Bool)

(declare-fun e!167921 () Bool)

(declare-fun e!167924 () Bool)

(assert (=> b!242228 (= e!167921 e!167924)))

(declare-fun res!202264 () Bool)

(assert (=> b!242228 (=> (not res!202264) (not e!167924))))

(declare-fun lt!377643 () tuple2!20720)

(assert (=> b!242228 (= res!202264 (and (= (_2!11282 lt!377643) bit!26) (= (_1!11282 lt!377643) (_2!11281 lt!377642))))))

(declare-fun readerFrom!0 (BitStream!10578 (_ BitVec 32) (_ BitVec 32)) BitStream!10578)

(assert (=> b!242228 (= lt!377643 (readBitPure!0 (readerFrom!0 (_2!11281 lt!377642) (currentBit!11652 thiss!1005) (currentByte!11657 thiss!1005))))))

(declare-fun res!202262 () Bool)

(assert (=> start!52486 (=> (not res!202262) (not e!167923))))

(assert (=> start!52486 (= res!202262 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52486 e!167923))

(assert (=> start!52486 true))

(declare-fun e!167922 () Bool)

(declare-fun inv!12 (BitStream!10578) Bool)

(assert (=> start!52486 (and (inv!12 thiss!1005) e!167922)))

(declare-fun b!242229 () Bool)

(declare-fun res!202257 () Bool)

(assert (=> b!242229 (=> (not res!202257) (not e!167921))))

(assert (=> b!242229 (= res!202257 (isPrefixOf!0 thiss!1005 (_2!11281 lt!377642)))))

(declare-fun b!242230 () Bool)

(declare-fun array_inv!5569 (array!13297) Bool)

(assert (=> b!242230 (= e!167922 (array_inv!5569 (buf!6294 thiss!1005)))))

(declare-fun b!242231 () Bool)

(declare-fun lt!377641 () (_ BitVec 64))

(assert (=> b!242231 (= e!167924 (= (bitIndex!0 (size!5828 (buf!6294 (_1!11282 lt!377643))) (currentByte!11657 (_1!11282 lt!377643)) (currentBit!11652 (_1!11282 lt!377643))) lt!377641))))

(declare-fun b!242232 () Bool)

(assert (=> b!242232 (= e!167923 (not e!167925))))

(declare-fun res!202269 () Bool)

(assert (=> b!242232 (=> res!202269 e!167925)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242232 (= res!202269 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5828 (buf!6294 (_2!11281 lt!377642)))) ((_ sign_extend 32) (currentByte!11657 thiss!1005)) ((_ sign_extend 32) (currentBit!11652 thiss!1005)))))))

(assert (=> b!242232 e!167927))

(declare-fun res!202267 () Bool)

(assert (=> b!242232 (=> (not res!202267) (not e!167927))))

(assert (=> b!242232 (= res!202267 (isPrefixOf!0 thiss!1005 (_2!11281 lt!377635)))))

(declare-fun lt!377636 () Unit!17739)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10578 BitStream!10578 BitStream!10578) Unit!17739)

(assert (=> b!242232 (= lt!377636 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11281 lt!377642) (_2!11281 lt!377635)))))

(assert (=> b!242232 e!167930))

(declare-fun res!202259 () Bool)

(assert (=> b!242232 (=> (not res!202259) (not e!167930))))

(assert (=> b!242232 (= res!202259 (= (size!5828 (buf!6294 (_2!11281 lt!377642))) (size!5828 (buf!6294 (_2!11281 lt!377635)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10578 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20718)

(assert (=> b!242232 (= lt!377635 (appendNBitsLoop!0 (_2!11281 lt!377642) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242232 (validate_offset_bits!1 ((_ sign_extend 32) (size!5828 (buf!6294 (_2!11281 lt!377642)))) ((_ sign_extend 32) (currentByte!11657 (_2!11281 lt!377642))) ((_ sign_extend 32) (currentBit!11652 (_2!11281 lt!377642))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377639 () Unit!17739)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10578 BitStream!10578 (_ BitVec 64) (_ BitVec 64)) Unit!17739)

(assert (=> b!242232 (= lt!377639 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11281 lt!377642) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167929 () Bool)

(assert (=> b!242232 e!167929))

(declare-fun res!202265 () Bool)

(assert (=> b!242232 (=> (not res!202265) (not e!167929))))

(assert (=> b!242232 (= res!202265 (= (size!5828 (buf!6294 thiss!1005)) (size!5828 (buf!6294 (_2!11281 lt!377642)))))))

(declare-fun appendBit!0 (BitStream!10578 Bool) tuple2!20718)

(assert (=> b!242232 (= lt!377642 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242233 () Bool)

(declare-fun res!202268 () Bool)

(assert (=> b!242233 (=> (not res!202268) (not e!167923))))

(assert (=> b!242233 (= res!202268 (bvslt from!289 nBits!297))))

(declare-fun b!242234 () Bool)

(assert (=> b!242234 (= e!167929 e!167921)))

(declare-fun res!202266 () Bool)

(assert (=> b!242234 (=> (not res!202266) (not e!167921))))

(declare-fun lt!377632 () (_ BitVec 64))

(assert (=> b!242234 (= res!202266 (= lt!377641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377632)))))

(assert (=> b!242234 (= lt!377641 (bitIndex!0 (size!5828 (buf!6294 (_2!11281 lt!377642))) (currentByte!11657 (_2!11281 lt!377642)) (currentBit!11652 (_2!11281 lt!377642))))))

(assert (=> b!242234 (= lt!377632 (bitIndex!0 (size!5828 (buf!6294 thiss!1005)) (currentByte!11657 thiss!1005) (currentBit!11652 thiss!1005)))))

(assert (= (and start!52486 res!202262) b!242222))

(assert (= (and b!242222 res!202260) b!242233))

(assert (= (and b!242233 res!202268) b!242232))

(assert (= (and b!242232 res!202265) b!242234))

(assert (= (and b!242234 res!202266) b!242229))

(assert (= (and b!242229 res!202257) b!242228))

(assert (= (and b!242228 res!202264) b!242231))

(assert (= (and b!242232 res!202259) b!242223))

(assert (= (and b!242223 res!202258) b!242221))

(assert (= (and b!242221 res!202261) b!242224))

(assert (= (and b!242232 res!202267) b!242226))

(assert (= (and b!242232 (not res!202269)) b!242225))

(assert (= (and b!242225 (not res!202263)) b!242227))

(assert (= start!52486 b!242230))

(declare-fun m!364987 () Bool)

(assert (=> b!242227 m!364987))

(declare-fun m!364989 () Bool)

(assert (=> b!242227 m!364989))

(declare-fun m!364991 () Bool)

(assert (=> b!242227 m!364991))

(declare-fun m!364993 () Bool)

(assert (=> start!52486 m!364993))

(declare-fun m!364995 () Bool)

(assert (=> b!242232 m!364995))

(declare-fun m!364997 () Bool)

(assert (=> b!242232 m!364997))

(declare-fun m!364999 () Bool)

(assert (=> b!242232 m!364999))

(declare-fun m!365001 () Bool)

(assert (=> b!242232 m!365001))

(declare-fun m!365003 () Bool)

(assert (=> b!242232 m!365003))

(declare-fun m!365005 () Bool)

(assert (=> b!242232 m!365005))

(declare-fun m!365007 () Bool)

(assert (=> b!242232 m!365007))

(declare-fun m!365009 () Bool)

(assert (=> b!242222 m!365009))

(declare-fun m!365011 () Bool)

(assert (=> b!242228 m!365011))

(assert (=> b!242228 m!365011))

(declare-fun m!365013 () Bool)

(assert (=> b!242228 m!365013))

(declare-fun m!365015 () Bool)

(assert (=> b!242230 m!365015))

(declare-fun m!365017 () Bool)

(assert (=> b!242225 m!365017))

(declare-fun m!365019 () Bool)

(assert (=> b!242225 m!365019))

(declare-fun m!365021 () Bool)

(assert (=> b!242229 m!365021))

(declare-fun m!365023 () Bool)

(assert (=> b!242226 m!365023))

(declare-fun m!365025 () Bool)

(assert (=> b!242223 m!365025))

(declare-fun m!365027 () Bool)

(assert (=> b!242223 m!365027))

(declare-fun m!365029 () Bool)

(assert (=> b!242221 m!365029))

(assert (=> b!242234 m!365027))

(declare-fun m!365031 () Bool)

(assert (=> b!242234 m!365031))

(declare-fun m!365033 () Bool)

(assert (=> b!242231 m!365033))

(declare-fun m!365035 () Bool)

(assert (=> b!242224 m!365035))

(declare-fun m!365037 () Bool)

(assert (=> b!242224 m!365037))

(declare-fun m!365039 () Bool)

(assert (=> b!242224 m!365039))

(declare-fun m!365041 () Bool)

(assert (=> b!242224 m!365041))

(check-sat (not b!242223) (not b!242234) (not b!242221) (not start!52486) (not b!242226) (not b!242228) (not b!242230) (not b!242227) (not b!242232) (not b!242224) (not b!242222) (not b!242229) (not b!242231) (not b!242225))
