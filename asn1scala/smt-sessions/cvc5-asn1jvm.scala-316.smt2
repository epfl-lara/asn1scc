; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6890 () Bool)

(assert start!6890)

(declare-fun b!32602 () Bool)

(declare-fun e!21559 () Bool)

(assert (=> b!32602 (= e!21559 true)))

(declare-datatypes ((List!402 0))(
  ( (Nil!399) (Cons!398 (h!517 Bool) (t!1152 List!402)) )
))
(declare-fun lt!48266 () List!402)

(declare-fun lt!48271 () List!402)

(declare-fun tail!119 (List!402) List!402)

(assert (=> b!32602 (= lt!48266 (tail!119 lt!48271))))

(declare-datatypes ((array!1826 0))(
  ( (array!1827 (arr!1280 (Array (_ BitVec 32) (_ BitVec 8))) (size!805 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1402 0))(
  ( (BitStream!1403 (buf!1133 array!1826) (currentByte!2500 (_ BitVec 32)) (currentBit!2495 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3334 0))(
  ( (tuple2!3335 (_1!1754 BitStream!1402) (_2!1754 BitStream!1402)) )
))
(declare-fun lt!48261 () tuple2!3334)

(declare-datatypes ((Unit!2465 0))(
  ( (Unit!2466) )
))
(declare-datatypes ((tuple2!3336 0))(
  ( (tuple2!3337 (_1!1755 Unit!2465) (_2!1755 BitStream!1402)) )
))
(declare-fun lt!48276 () tuple2!3336)

(declare-fun lt!48272 () tuple2!3334)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!48268 () Unit!2465)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1402 BitStream!1402 BitStream!1402 BitStream!1402 (_ BitVec 64) List!402) Unit!2465)

(assert (=> b!32602 (= lt!48268 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1755 lt!48276) (_2!1755 lt!48276) (_1!1754 lt!48261) (_1!1754 lt!48272) (bvsub to!314 i!635) lt!48271))))

(declare-fun lt!48270 () tuple2!3336)

(declare-fun e!21564 () Bool)

(declare-fun b!32603 () Bool)

(declare-fun lt!48275 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32603 (= e!21564 (= lt!48275 (bvsub (bvsub (bvadd (bitIndex!0 (size!805 (buf!1133 (_2!1755 lt!48270))) (currentByte!2500 (_2!1755 lt!48270)) (currentBit!2495 (_2!1755 lt!48270))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32604 () Bool)

(declare-fun e!21557 () Bool)

(declare-fun e!21555 () Bool)

(assert (=> b!32604 (= e!21557 e!21555)))

(declare-fun res!27864 () Bool)

(assert (=> b!32604 (=> res!27864 e!21555)))

(declare-fun lt!48264 () (_ BitVec 64))

(assert (=> b!32604 (= res!27864 (not (= lt!48275 (bvsub (bvadd lt!48264 to!314) i!635))))))

(assert (=> b!32604 (= lt!48275 (bitIndex!0 (size!805 (buf!1133 (_2!1755 lt!48276))) (currentByte!2500 (_2!1755 lt!48276)) (currentBit!2495 (_2!1755 lt!48276))))))

(declare-fun b!32605 () Bool)

(declare-fun res!27868 () Bool)

(assert (=> b!32605 (=> res!27868 e!21555)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32605 (= res!27868 (not (invariant!0 (currentBit!2495 (_2!1755 lt!48276)) (currentByte!2500 (_2!1755 lt!48276)) (size!805 (buf!1133 (_2!1755 lt!48276))))))))

(declare-fun b!32606 () Bool)

(declare-fun e!21565 () Bool)

(declare-fun thiss!1379 () BitStream!1402)

(declare-fun array_inv!754 (array!1826) Bool)

(assert (=> b!32606 (= e!21565 (array_inv!754 (buf!1133 thiss!1379)))))

(declare-fun b!32607 () Bool)

(declare-fun res!27859 () Bool)

(declare-fun e!21554 () Bool)

(assert (=> b!32607 (=> (not res!27859) (not e!21554))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32607 (= res!27859 (validate_offset_bits!1 ((_ sign_extend 32) (size!805 (buf!1133 thiss!1379))) ((_ sign_extend 32) (currentByte!2500 thiss!1379)) ((_ sign_extend 32) (currentBit!2495 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32608 () Bool)

(declare-fun e!21562 () Bool)

(assert (=> b!32608 (= e!21555 e!21562)))

(declare-fun res!27865 () Bool)

(assert (=> b!32608 (=> res!27865 e!21562)))

(assert (=> b!32608 (= res!27865 (not (= (size!805 (buf!1133 (_2!1755 lt!48270))) (size!805 (buf!1133 (_2!1755 lt!48276))))))))

(assert (=> b!32608 e!21564))

(declare-fun res!27873 () Bool)

(assert (=> b!32608 (=> (not res!27873) (not e!21564))))

(assert (=> b!32608 (= res!27873 (= (size!805 (buf!1133 (_2!1755 lt!48276))) (size!805 (buf!1133 thiss!1379))))))

(declare-fun e!21563 () Bool)

(declare-fun lt!48267 () tuple2!3334)

(declare-fun b!32609 () Bool)

(declare-fun srcBuffer!2 () array!1826)

(declare-fun head!239 (List!402) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1402 array!1826 (_ BitVec 64) (_ BitVec 64)) List!402)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1402 BitStream!1402 (_ BitVec 64)) List!402)

(assert (=> b!32609 (= e!21563 (= (head!239 (byteArrayBitContentToList!0 (_2!1755 lt!48270) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!239 (bitStreamReadBitsIntoList!0 (_2!1755 lt!48270) (_1!1754 lt!48267) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32610 () Bool)

(declare-fun e!21561 () Bool)

(assert (=> b!32610 (= e!21554 (not e!21561))))

(declare-fun res!27871 () Bool)

(assert (=> b!32610 (=> res!27871 e!21561)))

(assert (=> b!32610 (= res!27871 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1402 BitStream!1402) Bool)

(assert (=> b!32610 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48265 () Unit!2465)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1402) Unit!2465)

(assert (=> b!32610 (= lt!48265 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!32610 (= lt!48264 (bitIndex!0 (size!805 (buf!1133 thiss!1379)) (currentByte!2500 thiss!1379) (currentBit!2495 thiss!1379)))))

(declare-fun b!32611 () Bool)

(declare-fun e!21558 () Bool)

(assert (=> b!32611 (= e!21561 e!21558)))

(declare-fun res!27870 () Bool)

(assert (=> b!32611 (=> res!27870 e!21558)))

(assert (=> b!32611 (= res!27870 (not (isPrefixOf!0 thiss!1379 (_2!1755 lt!48270))))))

(declare-fun lt!48263 () (_ BitVec 64))

(assert (=> b!32611 (validate_offset_bits!1 ((_ sign_extend 32) (size!805 (buf!1133 (_2!1755 lt!48270)))) ((_ sign_extend 32) (currentByte!2500 (_2!1755 lt!48270))) ((_ sign_extend 32) (currentBit!2495 (_2!1755 lt!48270))) lt!48263)))

(assert (=> b!32611 (= lt!48263 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48269 () Unit!2465)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1402 BitStream!1402 (_ BitVec 64) (_ BitVec 64)) Unit!2465)

(assert (=> b!32611 (= lt!48269 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1755 lt!48270) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1402 (_ BitVec 8) (_ BitVec 32)) tuple2!3336)

(assert (=> b!32611 (= lt!48270 (appendBitFromByte!0 thiss!1379 (select (arr!1280 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32612 () Bool)

(assert (=> b!32612 (= e!21562 e!21559)))

(declare-fun res!27867 () Bool)

(assert (=> b!32612 (=> res!27867 e!21559)))

(assert (=> b!32612 (= res!27867 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!32612 (= lt!48266 (bitStreamReadBitsIntoList!0 (_2!1755 lt!48276) (_1!1754 lt!48272) lt!48263))))

(assert (=> b!32612 (= lt!48271 (bitStreamReadBitsIntoList!0 (_2!1755 lt!48276) (_1!1754 lt!48261) (bvsub to!314 i!635)))))

(assert (=> b!32612 (validate_offset_bits!1 ((_ sign_extend 32) (size!805 (buf!1133 (_2!1755 lt!48276)))) ((_ sign_extend 32) (currentByte!2500 (_2!1755 lt!48270))) ((_ sign_extend 32) (currentBit!2495 (_2!1755 lt!48270))) lt!48263)))

(declare-fun lt!48277 () Unit!2465)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1402 array!1826 (_ BitVec 64)) Unit!2465)

(assert (=> b!32612 (= lt!48277 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1755 lt!48270) (buf!1133 (_2!1755 lt!48276)) lt!48263))))

(declare-fun reader!0 (BitStream!1402 BitStream!1402) tuple2!3334)

(assert (=> b!32612 (= lt!48272 (reader!0 (_2!1755 lt!48270) (_2!1755 lt!48276)))))

(assert (=> b!32612 (validate_offset_bits!1 ((_ sign_extend 32) (size!805 (buf!1133 (_2!1755 lt!48276)))) ((_ sign_extend 32) (currentByte!2500 thiss!1379)) ((_ sign_extend 32) (currentBit!2495 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48273 () Unit!2465)

(assert (=> b!32612 (= lt!48273 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1133 (_2!1755 lt!48276)) (bvsub to!314 i!635)))))

(assert (=> b!32612 (= lt!48261 (reader!0 thiss!1379 (_2!1755 lt!48276)))))

(declare-fun b!32613 () Bool)

(assert (=> b!32613 (= e!21558 e!21557)))

(declare-fun res!27869 () Bool)

(assert (=> b!32613 (=> res!27869 e!21557)))

(assert (=> b!32613 (= res!27869 (not (isPrefixOf!0 (_2!1755 lt!48270) (_2!1755 lt!48276))))))

(assert (=> b!32613 (isPrefixOf!0 thiss!1379 (_2!1755 lt!48276))))

(declare-fun lt!48262 () Unit!2465)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1402 BitStream!1402 BitStream!1402) Unit!2465)

(assert (=> b!32613 (= lt!48262 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1755 lt!48270) (_2!1755 lt!48276)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1402 array!1826 (_ BitVec 64) (_ BitVec 64)) tuple2!3336)

(assert (=> b!32613 (= lt!48276 (appendBitsMSBFirstLoop!0 (_2!1755 lt!48270) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!32613 e!21563))

(declare-fun res!27866 () Bool)

(assert (=> b!32613 (=> (not res!27866) (not e!21563))))

(assert (=> b!32613 (= res!27866 (validate_offset_bits!1 ((_ sign_extend 32) (size!805 (buf!1133 (_2!1755 lt!48270)))) ((_ sign_extend 32) (currentByte!2500 thiss!1379)) ((_ sign_extend 32) (currentBit!2495 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48274 () Unit!2465)

(assert (=> b!32613 (= lt!48274 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1133 (_2!1755 lt!48270)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!32613 (= lt!48267 (reader!0 thiss!1379 (_2!1755 lt!48270)))))

(declare-fun b!32614 () Bool)

(declare-fun res!27863 () Bool)

(assert (=> b!32614 (=> res!27863 e!21559)))

(declare-fun length!128 (List!402) Int)

(assert (=> b!32614 (= res!27863 (<= (length!128 lt!48271) 0))))

(declare-fun b!32615 () Bool)

(declare-fun res!27860 () Bool)

(assert (=> b!32615 (=> res!27860 e!21555)))

(assert (=> b!32615 (= res!27860 (not (= (size!805 (buf!1133 thiss!1379)) (size!805 (buf!1133 (_2!1755 lt!48276))))))))

(declare-fun res!27862 () Bool)

(assert (=> start!6890 (=> (not res!27862) (not e!21554))))

(assert (=> start!6890 (= res!27862 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!805 srcBuffer!2))))))))

(assert (=> start!6890 e!21554))

(assert (=> start!6890 true))

(assert (=> start!6890 (array_inv!754 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1402) Bool)

(assert (=> start!6890 (and (inv!12 thiss!1379) e!21565)))

(declare-fun b!32616 () Bool)

(declare-fun res!27861 () Bool)

(assert (=> b!32616 (=> res!27861 e!21562)))

(assert (=> b!32616 (= res!27861 (not (invariant!0 (currentBit!2495 (_2!1755 lt!48270)) (currentByte!2500 (_2!1755 lt!48270)) (size!805 (buf!1133 (_2!1755 lt!48270))))))))

(declare-fun b!32617 () Bool)

(declare-fun res!27872 () Bool)

(assert (=> b!32617 (=> res!27872 e!21562)))

(assert (=> b!32617 (= res!27872 (not (invariant!0 (currentBit!2495 (_2!1755 lt!48270)) (currentByte!2500 (_2!1755 lt!48270)) (size!805 (buf!1133 (_2!1755 lt!48276))))))))

(assert (= (and start!6890 res!27862) b!32607))

(assert (= (and b!32607 res!27859) b!32610))

(assert (= (and b!32610 (not res!27871)) b!32611))

(assert (= (and b!32611 (not res!27870)) b!32613))

(assert (= (and b!32613 res!27866) b!32609))

(assert (= (and b!32613 (not res!27869)) b!32604))

(assert (= (and b!32604 (not res!27864)) b!32605))

(assert (= (and b!32605 (not res!27868)) b!32615))

(assert (= (and b!32615 (not res!27860)) b!32608))

(assert (= (and b!32608 res!27873) b!32603))

(assert (= (and b!32608 (not res!27865)) b!32616))

(assert (= (and b!32616 (not res!27861)) b!32617))

(assert (= (and b!32617 (not res!27872)) b!32612))

(assert (= (and b!32612 (not res!27867)) b!32614))

(assert (= (and b!32614 (not res!27863)) b!32602))

(assert (= start!6890 b!32606))

(declare-fun m!48237 () Bool)

(assert (=> b!32607 m!48237))

(declare-fun m!48239 () Bool)

(assert (=> b!32606 m!48239))

(declare-fun m!48241 () Bool)

(assert (=> b!32613 m!48241))

(declare-fun m!48243 () Bool)

(assert (=> b!32613 m!48243))

(declare-fun m!48245 () Bool)

(assert (=> b!32613 m!48245))

(declare-fun m!48247 () Bool)

(assert (=> b!32613 m!48247))

(declare-fun m!48249 () Bool)

(assert (=> b!32613 m!48249))

(declare-fun m!48251 () Bool)

(assert (=> b!32613 m!48251))

(declare-fun m!48253 () Bool)

(assert (=> b!32613 m!48253))

(declare-fun m!48255 () Bool)

(assert (=> b!32612 m!48255))

(declare-fun m!48257 () Bool)

(assert (=> b!32612 m!48257))

(declare-fun m!48259 () Bool)

(assert (=> b!32612 m!48259))

(declare-fun m!48261 () Bool)

(assert (=> b!32612 m!48261))

(declare-fun m!48263 () Bool)

(assert (=> b!32612 m!48263))

(declare-fun m!48265 () Bool)

(assert (=> b!32612 m!48265))

(declare-fun m!48267 () Bool)

(assert (=> b!32612 m!48267))

(declare-fun m!48269 () Bool)

(assert (=> b!32612 m!48269))

(declare-fun m!48271 () Bool)

(assert (=> b!32603 m!48271))

(declare-fun m!48273 () Bool)

(assert (=> b!32602 m!48273))

(declare-fun m!48275 () Bool)

(assert (=> b!32602 m!48275))

(declare-fun m!48277 () Bool)

(assert (=> b!32609 m!48277))

(assert (=> b!32609 m!48277))

(declare-fun m!48279 () Bool)

(assert (=> b!32609 m!48279))

(declare-fun m!48281 () Bool)

(assert (=> b!32609 m!48281))

(assert (=> b!32609 m!48281))

(declare-fun m!48283 () Bool)

(assert (=> b!32609 m!48283))

(declare-fun m!48285 () Bool)

(assert (=> b!32617 m!48285))

(declare-fun m!48287 () Bool)

(assert (=> b!32604 m!48287))

(declare-fun m!48289 () Bool)

(assert (=> start!6890 m!48289))

(declare-fun m!48291 () Bool)

(assert (=> start!6890 m!48291))

(declare-fun m!48293 () Bool)

(assert (=> b!32605 m!48293))

(declare-fun m!48295 () Bool)

(assert (=> b!32614 m!48295))

(declare-fun m!48297 () Bool)

(assert (=> b!32611 m!48297))

(declare-fun m!48299 () Bool)

(assert (=> b!32611 m!48299))

(assert (=> b!32611 m!48299))

(declare-fun m!48301 () Bool)

(assert (=> b!32611 m!48301))

(declare-fun m!48303 () Bool)

(assert (=> b!32611 m!48303))

(declare-fun m!48305 () Bool)

(assert (=> b!32611 m!48305))

(declare-fun m!48307 () Bool)

(assert (=> b!32610 m!48307))

(declare-fun m!48309 () Bool)

(assert (=> b!32610 m!48309))

(declare-fun m!48311 () Bool)

(assert (=> b!32610 m!48311))

(declare-fun m!48313 () Bool)

(assert (=> b!32616 m!48313))

(push 1)

