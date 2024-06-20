; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6930 () Bool)

(assert start!6930)

(declare-fun b!33562 () Bool)

(declare-fun res!28759 () Bool)

(declare-fun e!22277 () Bool)

(assert (=> b!33562 (=> res!28759 e!22277)))

(declare-datatypes ((array!1866 0))(
  ( (array!1867 (arr!1300 (Array (_ BitVec 32) (_ BitVec 8))) (size!825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1442 0))(
  ( (BitStream!1443 (buf!1153 array!1866) (currentByte!2520 (_ BitVec 32)) (currentBit!2515 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1442)

(declare-datatypes ((Unit!2505 0))(
  ( (Unit!2506) )
))
(declare-datatypes ((tuple2!3414 0))(
  ( (tuple2!3415 (_1!1794 Unit!2505) (_2!1794 BitStream!1442)) )
))
(declare-fun lt!49281 () tuple2!3414)

(assert (=> b!33562 (= res!28759 (not (= (size!825 (buf!1153 thiss!1379)) (size!825 (buf!1153 (_2!1794 lt!49281))))))))

(declare-fun b!33563 () Bool)

(declare-fun e!22278 () Bool)

(assert (=> b!33563 (= e!22278 e!22277)))

(declare-fun res!28773 () Bool)

(assert (=> b!33563 (=> res!28773 e!22277)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!49291 () (_ BitVec 64))

(declare-fun lt!49285 () (_ BitVec 64))

(assert (=> b!33563 (= res!28773 (not (= lt!49285 (bvsub (bvadd lt!49291 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33563 (= lt!49285 (bitIndex!0 (size!825 (buf!1153 (_2!1794 lt!49281))) (currentByte!2520 (_2!1794 lt!49281)) (currentBit!2515 (_2!1794 lt!49281))))))

(declare-fun b!33564 () Bool)

(declare-fun res!28762 () Bool)

(assert (=> b!33564 (=> res!28762 e!22277)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33564 (= res!28762 (not (invariant!0 (currentBit!2515 (_2!1794 lt!49281)) (currentByte!2520 (_2!1794 lt!49281)) (size!825 (buf!1153 (_2!1794 lt!49281))))))))

(declare-fun b!33565 () Bool)

(declare-fun res!28772 () Bool)

(declare-fun e!22280 () Bool)

(assert (=> b!33565 (=> (not res!28772) (not e!22280))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33565 (= res!28772 (validate_offset_bits!1 ((_ sign_extend 32) (size!825 (buf!1153 thiss!1379))) ((_ sign_extend 32) (currentByte!2520 thiss!1379)) ((_ sign_extend 32) (currentBit!2515 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!28761 () Bool)

(assert (=> start!6930 (=> (not res!28761) (not e!22280))))

(declare-fun srcBuffer!2 () array!1866)

(assert (=> start!6930 (= res!28761 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!825 srcBuffer!2))))))))

(assert (=> start!6930 e!22280))

(assert (=> start!6930 true))

(declare-fun array_inv!774 (array!1866) Bool)

(assert (=> start!6930 (array_inv!774 srcBuffer!2)))

(declare-fun e!22285 () Bool)

(declare-fun inv!12 (BitStream!1442) Bool)

(assert (=> start!6930 (and (inv!12 thiss!1379) e!22285)))

(declare-fun b!33566 () Bool)

(declare-fun res!28768 () Bool)

(declare-fun e!22276 () Bool)

(assert (=> b!33566 (=> res!28768 e!22276)))

(declare-fun lt!49293 () tuple2!3414)

(assert (=> b!33566 (= res!28768 (not (invariant!0 (currentBit!2515 (_2!1794 lt!49293)) (currentByte!2520 (_2!1794 lt!49293)) (size!825 (buf!1153 (_2!1794 lt!49293))))))))

(declare-fun b!33567 () Bool)

(declare-fun res!28770 () Bool)

(assert (=> b!33567 (=> res!28770 e!22276)))

(assert (=> b!33567 (= res!28770 (not (invariant!0 (currentBit!2515 (_2!1794 lt!49293)) (currentByte!2520 (_2!1794 lt!49293)) (size!825 (buf!1153 (_2!1794 lt!49281))))))))

(declare-fun b!33568 () Bool)

(declare-fun e!22281 () Bool)

(assert (=> b!33568 (= e!22281 e!22278)))

(declare-fun res!28763 () Bool)

(assert (=> b!33568 (=> res!28763 e!22278)))

(declare-fun isPrefixOf!0 (BitStream!1442 BitStream!1442) Bool)

(assert (=> b!33568 (= res!28763 (not (isPrefixOf!0 (_2!1794 lt!49293) (_2!1794 lt!49281))))))

(assert (=> b!33568 (isPrefixOf!0 thiss!1379 (_2!1794 lt!49281))))

(declare-fun lt!49286 () Unit!2505)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1442 BitStream!1442 BitStream!1442) Unit!2505)

(assert (=> b!33568 (= lt!49286 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1794 lt!49293) (_2!1794 lt!49281)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1442 array!1866 (_ BitVec 64) (_ BitVec 64)) tuple2!3414)

(assert (=> b!33568 (= lt!49281 (appendBitsMSBFirstLoop!0 (_2!1794 lt!49293) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22282 () Bool)

(assert (=> b!33568 e!22282))

(declare-fun res!28771 () Bool)

(assert (=> b!33568 (=> (not res!28771) (not e!22282))))

(assert (=> b!33568 (= res!28771 (validate_offset_bits!1 ((_ sign_extend 32) (size!825 (buf!1153 (_2!1794 lt!49293)))) ((_ sign_extend 32) (currentByte!2520 thiss!1379)) ((_ sign_extend 32) (currentBit!2515 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49294 () Unit!2505)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1442 array!1866 (_ BitVec 64)) Unit!2505)

(assert (=> b!33568 (= lt!49294 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1153 (_2!1794 lt!49293)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3416 0))(
  ( (tuple2!3417 (_1!1795 BitStream!1442) (_2!1795 BitStream!1442)) )
))
(declare-fun lt!49292 () tuple2!3416)

(declare-fun reader!0 (BitStream!1442 BitStream!1442) tuple2!3416)

(assert (=> b!33568 (= lt!49292 (reader!0 thiss!1379 (_2!1794 lt!49293)))))

(declare-fun b!33569 () Bool)

(declare-fun e!22275 () Bool)

(assert (=> b!33569 (= e!22275 (= lt!49285 (bvsub (bvsub (bvadd (bitIndex!0 (size!825 (buf!1153 (_2!1794 lt!49293))) (currentByte!2520 (_2!1794 lt!49293)) (currentBit!2515 (_2!1794 lt!49293))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33570 () Bool)

(declare-fun res!28769 () Bool)

(declare-fun e!22274 () Bool)

(assert (=> b!33570 (=> res!28769 e!22274)))

(declare-datatypes ((List!422 0))(
  ( (Nil!419) (Cons!418 (h!537 Bool) (t!1172 List!422)) )
))
(declare-fun lt!49282 () List!422)

(declare-fun length!148 (List!422) Int)

(assert (=> b!33570 (= res!28769 (<= (length!148 lt!49282) 0))))

(declare-fun b!33571 () Bool)

(declare-fun e!22283 () Bool)

(assert (=> b!33571 (= e!22283 e!22281)))

(declare-fun res!28764 () Bool)

(assert (=> b!33571 (=> res!28764 e!22281)))

(assert (=> b!33571 (= res!28764 (not (isPrefixOf!0 thiss!1379 (_2!1794 lt!49293))))))

(declare-fun lt!49283 () (_ BitVec 64))

(assert (=> b!33571 (validate_offset_bits!1 ((_ sign_extend 32) (size!825 (buf!1153 (_2!1794 lt!49293)))) ((_ sign_extend 32) (currentByte!2520 (_2!1794 lt!49293))) ((_ sign_extend 32) (currentBit!2515 (_2!1794 lt!49293))) lt!49283)))

(assert (=> b!33571 (= lt!49283 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49284 () Unit!2505)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1442 BitStream!1442 (_ BitVec 64) (_ BitVec 64)) Unit!2505)

(assert (=> b!33571 (= lt!49284 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1794 lt!49293) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1442 (_ BitVec 8) (_ BitVec 32)) tuple2!3414)

(assert (=> b!33571 (= lt!49293 (appendBitFromByte!0 thiss!1379 (select (arr!1300 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33572 () Bool)

(assert (=> b!33572 (= e!22277 e!22276)))

(declare-fun res!28760 () Bool)

(assert (=> b!33572 (=> res!28760 e!22276)))

(assert (=> b!33572 (= res!28760 (not (= (size!825 (buf!1153 (_2!1794 lt!49293))) (size!825 (buf!1153 (_2!1794 lt!49281))))))))

(assert (=> b!33572 e!22275))

(declare-fun res!28767 () Bool)

(assert (=> b!33572 (=> (not res!28767) (not e!22275))))

(assert (=> b!33572 (= res!28767 (= (size!825 (buf!1153 (_2!1794 lt!49281))) (size!825 (buf!1153 thiss!1379))))))

(declare-fun b!33573 () Bool)

(assert (=> b!33573 (= e!22285 (array_inv!774 (buf!1153 thiss!1379)))))

(declare-fun b!33574 () Bool)

(assert (=> b!33574 (= e!22274 true)))

(declare-fun lt!49287 () List!422)

(declare-fun tail!139 (List!422) List!422)

(assert (=> b!33574 (= lt!49287 (tail!139 lt!49282))))

(declare-fun lt!49296 () Unit!2505)

(declare-fun lt!49288 () tuple2!3416)

(declare-fun lt!49290 () tuple2!3416)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1442 BitStream!1442 BitStream!1442 BitStream!1442 (_ BitVec 64) List!422) Unit!2505)

(assert (=> b!33574 (= lt!49296 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1794 lt!49281) (_2!1794 lt!49281) (_1!1795 lt!49288) (_1!1795 lt!49290) (bvsub to!314 i!635) lt!49282))))

(declare-fun b!33575 () Bool)

(assert (=> b!33575 (= e!22276 e!22274)))

(declare-fun res!28766 () Bool)

(assert (=> b!33575 (=> res!28766 e!22274)))

(assert (=> b!33575 (= res!28766 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1442 BitStream!1442 (_ BitVec 64)) List!422)

(assert (=> b!33575 (= lt!49287 (bitStreamReadBitsIntoList!0 (_2!1794 lt!49281) (_1!1795 lt!49290) lt!49283))))

(assert (=> b!33575 (= lt!49282 (bitStreamReadBitsIntoList!0 (_2!1794 lt!49281) (_1!1795 lt!49288) (bvsub to!314 i!635)))))

(assert (=> b!33575 (validate_offset_bits!1 ((_ sign_extend 32) (size!825 (buf!1153 (_2!1794 lt!49281)))) ((_ sign_extend 32) (currentByte!2520 (_2!1794 lt!49293))) ((_ sign_extend 32) (currentBit!2515 (_2!1794 lt!49293))) lt!49283)))

(declare-fun lt!49289 () Unit!2505)

(assert (=> b!33575 (= lt!49289 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1794 lt!49293) (buf!1153 (_2!1794 lt!49281)) lt!49283))))

(assert (=> b!33575 (= lt!49290 (reader!0 (_2!1794 lt!49293) (_2!1794 lt!49281)))))

(assert (=> b!33575 (validate_offset_bits!1 ((_ sign_extend 32) (size!825 (buf!1153 (_2!1794 lt!49281)))) ((_ sign_extend 32) (currentByte!2520 thiss!1379)) ((_ sign_extend 32) (currentBit!2515 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49297 () Unit!2505)

(assert (=> b!33575 (= lt!49297 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1153 (_2!1794 lt!49281)) (bvsub to!314 i!635)))))

(assert (=> b!33575 (= lt!49288 (reader!0 thiss!1379 (_2!1794 lt!49281)))))

(declare-fun b!33576 () Bool)

(assert (=> b!33576 (= e!22280 (not e!22283))))

(declare-fun res!28765 () Bool)

(assert (=> b!33576 (=> res!28765 e!22283)))

(assert (=> b!33576 (= res!28765 (bvsge i!635 to!314))))

(assert (=> b!33576 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49295 () Unit!2505)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1442) Unit!2505)

(assert (=> b!33576 (= lt!49295 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33576 (= lt!49291 (bitIndex!0 (size!825 (buf!1153 thiss!1379)) (currentByte!2520 thiss!1379) (currentBit!2515 thiss!1379)))))

(declare-fun b!33577 () Bool)

(declare-fun head!259 (List!422) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1442 array!1866 (_ BitVec 64) (_ BitVec 64)) List!422)

(assert (=> b!33577 (= e!22282 (= (head!259 (byteArrayBitContentToList!0 (_2!1794 lt!49293) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!259 (bitStreamReadBitsIntoList!0 (_2!1794 lt!49293) (_1!1795 lt!49292) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!6930 res!28761) b!33565))

(assert (= (and b!33565 res!28772) b!33576))

(assert (= (and b!33576 (not res!28765)) b!33571))

(assert (= (and b!33571 (not res!28764)) b!33568))

(assert (= (and b!33568 res!28771) b!33577))

(assert (= (and b!33568 (not res!28763)) b!33563))

(assert (= (and b!33563 (not res!28773)) b!33564))

(assert (= (and b!33564 (not res!28762)) b!33562))

(assert (= (and b!33562 (not res!28759)) b!33572))

(assert (= (and b!33572 res!28767) b!33569))

(assert (= (and b!33572 (not res!28760)) b!33566))

(assert (= (and b!33566 (not res!28768)) b!33567))

(assert (= (and b!33567 (not res!28770)) b!33575))

(assert (= (and b!33575 (not res!28766)) b!33570))

(assert (= (and b!33570 (not res!28769)) b!33574))

(assert (= start!6930 b!33573))

(declare-fun m!49797 () Bool)

(assert (=> b!33577 m!49797))

(assert (=> b!33577 m!49797))

(declare-fun m!49799 () Bool)

(assert (=> b!33577 m!49799))

(declare-fun m!49801 () Bool)

(assert (=> b!33577 m!49801))

(assert (=> b!33577 m!49801))

(declare-fun m!49803 () Bool)

(assert (=> b!33577 m!49803))

(declare-fun m!49805 () Bool)

(assert (=> b!33568 m!49805))

(declare-fun m!49807 () Bool)

(assert (=> b!33568 m!49807))

(declare-fun m!49809 () Bool)

(assert (=> b!33568 m!49809))

(declare-fun m!49811 () Bool)

(assert (=> b!33568 m!49811))

(declare-fun m!49813 () Bool)

(assert (=> b!33568 m!49813))

(declare-fun m!49815 () Bool)

(assert (=> b!33568 m!49815))

(declare-fun m!49817 () Bool)

(assert (=> b!33568 m!49817))

(declare-fun m!49819 () Bool)

(assert (=> b!33569 m!49819))

(declare-fun m!49821 () Bool)

(assert (=> b!33564 m!49821))

(declare-fun m!49823 () Bool)

(assert (=> b!33573 m!49823))

(declare-fun m!49825 () Bool)

(assert (=> b!33570 m!49825))

(declare-fun m!49827 () Bool)

(assert (=> b!33563 m!49827))

(declare-fun m!49829 () Bool)

(assert (=> b!33576 m!49829))

(declare-fun m!49831 () Bool)

(assert (=> b!33576 m!49831))

(declare-fun m!49833 () Bool)

(assert (=> b!33576 m!49833))

(declare-fun m!49835 () Bool)

(assert (=> b!33571 m!49835))

(declare-fun m!49837 () Bool)

(assert (=> b!33571 m!49837))

(declare-fun m!49839 () Bool)

(assert (=> b!33571 m!49839))

(declare-fun m!49841 () Bool)

(assert (=> b!33571 m!49841))

(assert (=> b!33571 m!49839))

(declare-fun m!49843 () Bool)

(assert (=> b!33571 m!49843))

(declare-fun m!49845 () Bool)

(assert (=> b!33574 m!49845))

(declare-fun m!49847 () Bool)

(assert (=> b!33574 m!49847))

(declare-fun m!49849 () Bool)

(assert (=> b!33566 m!49849))

(declare-fun m!49851 () Bool)

(assert (=> start!6930 m!49851))

(declare-fun m!49853 () Bool)

(assert (=> start!6930 m!49853))

(declare-fun m!49855 () Bool)

(assert (=> b!33575 m!49855))

(declare-fun m!49857 () Bool)

(assert (=> b!33575 m!49857))

(declare-fun m!49859 () Bool)

(assert (=> b!33575 m!49859))

(declare-fun m!49861 () Bool)

(assert (=> b!33575 m!49861))

(declare-fun m!49863 () Bool)

(assert (=> b!33575 m!49863))

(declare-fun m!49865 () Bool)

(assert (=> b!33575 m!49865))

(declare-fun m!49867 () Bool)

(assert (=> b!33575 m!49867))

(declare-fun m!49869 () Bool)

(assert (=> b!33575 m!49869))

(declare-fun m!49871 () Bool)

(assert (=> b!33565 m!49871))

(declare-fun m!49873 () Bool)

(assert (=> b!33567 m!49873))

(push 1)

