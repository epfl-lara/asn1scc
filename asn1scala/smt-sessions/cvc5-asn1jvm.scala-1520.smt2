; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42494 () Bool)

(assert start!42494)

(declare-fun b!200604 () Bool)

(declare-fun res!167945 () Bool)

(declare-fun e!137596 () Bool)

(assert (=> b!200604 (=> (not res!167945) (not e!137596))))

(declare-datatypes ((array!10154 0))(
  ( (array!10155 (arr!5401 (Array (_ BitVec 32) (_ BitVec 8))) (size!4471 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8050 0))(
  ( (BitStream!8051 (buf!4972 array!10154) (currentByte!9352 (_ BitVec 32)) (currentBit!9347 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8050)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200604 (= res!167945 (invariant!0 (currentBit!9347 thiss!1204) (currentByte!9352 thiss!1204) (size!4471 (buf!4972 thiss!1204))))))

(declare-fun lt!313606 () (_ BitVec 64))

(declare-fun b!200605 () Bool)

(declare-fun e!137594 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!313607 () (_ BitVec 64))

(assert (=> b!200605 (= e!137594 (not (or (not (= lt!313606 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!313606 (bvand lt!313607 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!313609 () (_ BitVec 64))

(assert (=> b!200605 (= lt!313606 (bvand lt!313609 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isPrefixOf!0 (BitStream!8050 BitStream!8050) Bool)

(assert (=> b!200605 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14244 0))(
  ( (Unit!14245) )
))
(declare-fun lt!313608 () Unit!14244)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8050) Unit!14244)

(assert (=> b!200605 (= lt!313608 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200606 () Bool)

(declare-fun res!167947 () Bool)

(assert (=> b!200606 (=> (not res!167947) (not e!137596))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200606 (= res!167947 (validate_offset_bits!1 ((_ sign_extend 32) (size!4471 (buf!4972 thiss!1204))) ((_ sign_extend 32) (currentByte!9352 thiss!1204)) ((_ sign_extend 32) (currentBit!9347 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200607 () Bool)

(declare-fun e!137597 () Bool)

(declare-fun array_inv!4212 (array!10154) Bool)

(assert (=> b!200607 (= e!137597 (array_inv!4212 (buf!4972 thiss!1204)))))

(declare-fun res!167946 () Bool)

(assert (=> start!42494 (=> (not res!167946) (not e!137596))))

(assert (=> start!42494 (= res!167946 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42494 e!137596))

(assert (=> start!42494 true))

(declare-fun inv!12 (BitStream!8050) Bool)

(assert (=> start!42494 (and (inv!12 thiss!1204) e!137597)))

(declare-fun b!200608 () Bool)

(declare-fun res!167949 () Bool)

(assert (=> b!200608 (=> (not res!167949) (not e!137596))))

(assert (=> b!200608 (= res!167949 (= i!590 nBits!348))))

(declare-fun b!200609 () Bool)

(assert (=> b!200609 (= e!137596 e!137594)))

(declare-fun res!167948 () Bool)

(assert (=> b!200609 (=> (not res!167948) (not e!137594))))

(assert (=> b!200609 (= res!167948 (= lt!313609 (bvsub lt!313607 ((_ sign_extend 32) i!590))))))

(assert (=> b!200609 (= lt!313607 (bvadd lt!313609 ((_ sign_extend 32) nBits!348)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200609 (= lt!313609 (bitIndex!0 (size!4471 (buf!4972 thiss!1204)) (currentByte!9352 thiss!1204) (currentBit!9347 thiss!1204)))))

(assert (= (and start!42494 res!167946) b!200606))

(assert (= (and b!200606 res!167947) b!200604))

(assert (= (and b!200604 res!167945) b!200608))

(assert (= (and b!200608 res!167949) b!200609))

(assert (= (and b!200609 res!167948) b!200605))

(assert (= start!42494 b!200607))

(declare-fun m!311359 () Bool)

(assert (=> b!200606 m!311359))

(declare-fun m!311361 () Bool)

(assert (=> b!200604 m!311361))

(declare-fun m!311363 () Bool)

(assert (=> start!42494 m!311363))

(declare-fun m!311365 () Bool)

(assert (=> b!200609 m!311365))

(declare-fun m!311367 () Bool)

(assert (=> b!200605 m!311367))

(declare-fun m!311369 () Bool)

(assert (=> b!200605 m!311369))

(declare-fun m!311371 () Bool)

(assert (=> b!200607 m!311371))

(push 1)

(assert (not b!200607))

(assert (not b!200604))

(assert (not start!42494))

(assert (not b!200609))

(assert (not b!200605))

(assert (not b!200606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68827 () Bool)

(declare-fun e!137630 () Bool)

(assert (=> d!68827 e!137630))

(declare-fun res!167994 () Bool)

(assert (=> d!68827 (=> (not res!167994) (not e!137630))))

(declare-fun lt!313652 () (_ BitVec 64))

(declare-fun lt!313650 () (_ BitVec 64))

(declare-fun lt!313653 () (_ BitVec 64))

(assert (=> d!68827 (= res!167994 (= lt!313653 (bvsub lt!313650 lt!313652)))))

(assert (=> d!68827 (or (= (bvand lt!313650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313650 lt!313652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68827 (= lt!313652 (remainingBits!0 ((_ sign_extend 32) (size!4471 (buf!4972 thiss!1204))) ((_ sign_extend 32) (currentByte!9352 thiss!1204)) ((_ sign_extend 32) (currentBit!9347 thiss!1204))))))

(declare-fun lt!313649 () (_ BitVec 64))

(declare-fun lt!313654 () (_ BitVec 64))

(assert (=> d!68827 (= lt!313650 (bvmul lt!313649 lt!313654))))

(assert (=> d!68827 (or (= lt!313649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313654 (bvsdiv (bvmul lt!313649 lt!313654) lt!313649)))))

(assert (=> d!68827 (= lt!313654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68827 (= lt!313649 ((_ sign_extend 32) (size!4471 (buf!4972 thiss!1204))))))

(assert (=> d!68827 (= lt!313653 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9352 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9347 thiss!1204))))))

(assert (=> d!68827 (invariant!0 (currentBit!9347 thiss!1204) (currentByte!9352 thiss!1204) (size!4471 (buf!4972 thiss!1204)))))

(assert (=> d!68827 (= (bitIndex!0 (size!4471 (buf!4972 thiss!1204)) (currentByte!9352 thiss!1204) (currentBit!9347 thiss!1204)) lt!313653)))

(declare-fun b!200659 () Bool)

(declare-fun res!167993 () Bool)

(assert (=> b!200659 (=> (not res!167993) (not e!137630))))

(assert (=> b!200659 (= res!167993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313653))))

(declare-fun b!200660 () Bool)

(declare-fun lt!313651 () (_ BitVec 64))

(assert (=> b!200660 (= e!137630 (bvsle lt!313653 (bvmul lt!313651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200660 (or (= lt!313651 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313651 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313651)))))

(assert (=> b!200660 (= lt!313651 ((_ sign_extend 32) (size!4471 (buf!4972 thiss!1204))))))

(assert (= (and d!68827 res!167994) b!200659))

(assert (= (and b!200659 res!167993) b!200660))

(declare-fun m!311407 () Bool)

(assert (=> d!68827 m!311407))

(assert (=> d!68827 m!311361))

(assert (=> b!200609 d!68827))

(declare-fun d!68839 () Bool)

(assert (=> d!68839 (= (array_inv!4212 (buf!4972 thiss!1204)) (bvsge (size!4471 (buf!4972 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200607 d!68839))

(declare-fun d!68841 () Bool)

(assert (=> d!68841 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9347 thiss!1204) (currentByte!9352 thiss!1204) (size!4471 (buf!4972 thiss!1204))))))

(declare-fun bs!16956 () Bool)

(assert (= bs!16956 d!68841))

(assert (=> bs!16956 m!311361))

(assert (=> start!42494 d!68841))

(declare-fun d!68843 () Bool)

(assert (=> d!68843 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4471 (buf!4972 thiss!1204))) ((_ sign_extend 32) (currentByte!9352 thiss!1204)) ((_ sign_extend 32) (currentBit!9347 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4471 (buf!4972 thiss!1204))) ((_ sign_extend 32) (currentByte!9352 thiss!1204)) ((_ sign_extend 32) (currentBit!9347 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16957 () Bool)

(assert (= bs!16957 d!68843))

(assert (=> bs!16957 m!311407))

(assert (=> b!200606 d!68843))

(declare-fun d!68845 () Bool)

(assert (=> d!68845 (= (invariant!0 (currentBit!9347 thiss!1204) (currentByte!9352 thiss!1204) (size!4471 (buf!4972 thiss!1204))) (and (bvsge (currentBit!9347 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9347 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9352 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9352 thiss!1204) (size!4471 (buf!4972 thiss!1204))) (and (= (currentBit!9347 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9352 thiss!1204) (size!4471 (buf!4972 thiss!1204)))))))))

(assert (=> b!200604 d!68845))

(declare-fun d!68847 () Bool)

(declare-fun res!168021 () Bool)

(declare-fun e!137645 () Bool)

(assert (=> d!68847 (=> (not res!168021) (not e!137645))))

(assert (=> d!68847 (= res!168021 (= (size!4471 (buf!4972 thiss!1204)) (size!4471 (buf!4972 thiss!1204))))))

(assert (=> d!68847 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137645)))

(declare-fun b!200685 () Bool)

(declare-fun res!168020 () Bool)

(assert (=> b!200685 (=> (not res!168020) (not e!137645))))

(assert (=> b!200685 (= res!168020 (bvsle (bitIndex!0 (size!4471 (buf!4972 thiss!1204)) (currentByte!9352 thiss!1204) (currentBit!9347 thiss!1204)) (bitIndex!0 (size!4471 (buf!4972 thiss!1204)) (currentByte!9352 thiss!1204) (currentBit!9347 thiss!1204))))))

(declare-fun b!200686 () Bool)

(declare-fun e!137646 () Bool)

(assert (=> b!200686 (= e!137645 e!137646)))

(declare-fun res!168019 () Bool)

(assert (=> b!200686 (=> res!168019 e!137646)))

(assert (=> b!200686 (= res!168019 (= (size!4471 (buf!4972 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200687 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10154 array!10154 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200687 (= e!137646 (arrayBitRangesEq!0 (buf!4972 thiss!1204) (buf!4972 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4471 (buf!4972 thiss!1204)) (currentByte!9352 thiss!1204) (currentBit!9347 thiss!1204))))))

(assert (= (and d!68847 res!168021) b!200685))

(assert (= (and b!200685 res!168020) b!200686))

(assert (= (and b!200686 (not res!168019)) b!200687))

(assert (=> b!200685 m!311365))

(assert (=> b!200685 m!311365))

(assert (=> b!200687 m!311365))

(assert (=> b!200687 m!311365))

(declare-fun m!311411 () Bool)

(assert (=> b!200687 m!311411))

(assert (=> b!200605 d!68847))

(declare-fun d!68859 () Bool)

(assert (=> d!68859 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!313693 () Unit!14244)

(declare-fun choose!11 (BitStream!8050) Unit!14244)

(assert (=> d!68859 (= lt!313693 (choose!11 thiss!1204))))

(assert (=> d!68859 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!313693)))

(declare-fun bs!16961 () Bool)

(assert (= bs!16961 d!68859))

(assert (=> bs!16961 m!311367))

(declare-fun m!311415 () Bool)

(assert (=> bs!16961 m!311415))

(assert (=> b!200605 d!68859))

(push 1)

(assert (not d!68859))

(assert (not b!200685))

(assert (not d!68827))

(assert (not d!68841))

(assert (not b!200687))

(assert (not d!68843))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

