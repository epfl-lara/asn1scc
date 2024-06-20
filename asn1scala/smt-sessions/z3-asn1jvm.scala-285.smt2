; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5692 () Bool)

(assert start!5692)

(declare-fun b!24168 () Bool)

(declare-fun res!20848 () Bool)

(declare-fun e!16441 () Bool)

(assert (=> b!24168 (=> (not res!20848) (not e!16441))))

(declare-datatypes ((array!1615 0))(
  ( (array!1616 (arr!1149 (Array (_ BitVec 32) (_ BitVec 8))) (size!693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1218 0))(
  ( (BitStream!1219 (buf!1014 array!1615) (currentByte!2327 (_ BitVec 32)) (currentBit!2322 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1218)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24168 (= res!20848 (validate_offset_bits!1 ((_ sign_extend 32) (size!693 (buf!1014 thiss!1379))) ((_ sign_extend 32) (currentByte!2327 thiss!1379)) ((_ sign_extend 32) (currentBit!2322 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24169 () Bool)

(declare-fun e!16447 () Bool)

(declare-fun e!16449 () Bool)

(assert (=> b!24169 (= e!16447 e!16449)))

(declare-fun res!20847 () Bool)

(assert (=> b!24169 (=> res!20847 e!16449)))

(declare-fun lt!34655 () (_ BitVec 64))

(declare-fun lt!34651 () (_ BitVec 64))

(assert (=> b!24169 (= res!20847 (not (= lt!34655 (bvsub (bvadd lt!34651 to!314) i!635))))))

(declare-datatypes ((Unit!2029 0))(
  ( (Unit!2030) )
))
(declare-datatypes ((tuple2!2754 0))(
  ( (tuple2!2755 (_1!1464 Unit!2029) (_2!1464 BitStream!1218)) )
))
(declare-fun lt!34647 () tuple2!2754)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24169 (= lt!34655 (bitIndex!0 (size!693 (buf!1014 (_2!1464 lt!34647))) (currentByte!2327 (_2!1464 lt!34647)) (currentBit!2322 (_2!1464 lt!34647))))))

(declare-fun b!24170 () Bool)

(declare-fun e!16443 () Bool)

(assert (=> b!24170 (= e!16443 true)))

(declare-fun lt!34652 () tuple2!2754)

(declare-fun lt!34653 () (_ BitVec 64))

(assert (=> b!24170 (validate_offset_bits!1 ((_ sign_extend 32) (size!693 (buf!1014 (_2!1464 lt!34647)))) ((_ sign_extend 32) (currentByte!2327 (_2!1464 lt!34652))) ((_ sign_extend 32) (currentBit!2322 (_2!1464 lt!34652))) lt!34653)))

(declare-fun lt!34648 () Unit!2029)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1218 array!1615 (_ BitVec 64)) Unit!2029)

(assert (=> b!24170 (= lt!34648 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1464 lt!34652) (buf!1014 (_2!1464 lt!34647)) lt!34653))))

(declare-datatypes ((tuple2!2756 0))(
  ( (tuple2!2757 (_1!1465 BitStream!1218) (_2!1465 BitStream!1218)) )
))
(declare-fun lt!34654 () tuple2!2756)

(declare-fun reader!0 (BitStream!1218 BitStream!1218) tuple2!2756)

(assert (=> b!24170 (= lt!34654 (reader!0 (_2!1464 lt!34652) (_2!1464 lt!34647)))))

(assert (=> b!24170 (validate_offset_bits!1 ((_ sign_extend 32) (size!693 (buf!1014 (_2!1464 lt!34647)))) ((_ sign_extend 32) (currentByte!2327 thiss!1379)) ((_ sign_extend 32) (currentBit!2322 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34644 () Unit!2029)

(assert (=> b!24170 (= lt!34644 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1014 (_2!1464 lt!34647)) (bvsub to!314 i!635)))))

(declare-fun lt!34657 () tuple2!2756)

(assert (=> b!24170 (= lt!34657 (reader!0 thiss!1379 (_2!1464 lt!34647)))))

(declare-fun b!24171 () Bool)

(declare-fun res!20838 () Bool)

(assert (=> b!24171 (=> res!20838 e!16443)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24171 (= res!20838 (not (invariant!0 (currentBit!2322 (_2!1464 lt!34652)) (currentByte!2327 (_2!1464 lt!34652)) (size!693 (buf!1014 (_2!1464 lt!34647))))))))

(declare-fun srcBuffer!2 () array!1615)

(declare-fun b!24172 () Bool)

(declare-fun lt!34656 () tuple2!2756)

(declare-fun e!16450 () Bool)

(declare-datatypes ((List!310 0))(
  ( (Nil!307) (Cons!306 (h!425 Bool) (t!1060 List!310)) )
))
(declare-fun head!147 (List!310) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1218 array!1615 (_ BitVec 64) (_ BitVec 64)) List!310)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1218 BitStream!1218 (_ BitVec 64)) List!310)

(assert (=> b!24172 (= e!16450 (= (head!147 (byteArrayBitContentToList!0 (_2!1464 lt!34652) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!147 (bitStreamReadBitsIntoList!0 (_2!1464 lt!34652) (_1!1465 lt!34656) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24173 () Bool)

(declare-fun e!16446 () Bool)

(declare-fun array_inv!662 (array!1615) Bool)

(assert (=> b!24173 (= e!16446 (array_inv!662 (buf!1014 thiss!1379)))))

(declare-fun res!20845 () Bool)

(assert (=> start!5692 (=> (not res!20845) (not e!16441))))

(assert (=> start!5692 (= res!20845 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!693 srcBuffer!2))))))))

(assert (=> start!5692 e!16441))

(assert (=> start!5692 true))

(assert (=> start!5692 (array_inv!662 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1218) Bool)

(assert (=> start!5692 (and (inv!12 thiss!1379) e!16446)))

(declare-fun b!24174 () Bool)

(declare-fun res!20849 () Bool)

(assert (=> b!24174 (=> res!20849 e!16443)))

(assert (=> b!24174 (= res!20849 (not (invariant!0 (currentBit!2322 (_2!1464 lt!34652)) (currentByte!2327 (_2!1464 lt!34652)) (size!693 (buf!1014 (_2!1464 lt!34652))))))))

(declare-fun e!16442 () Bool)

(declare-fun b!24175 () Bool)

(assert (=> b!24175 (= e!16442 (= lt!34655 (bvsub (bvsub (bvadd (bitIndex!0 (size!693 (buf!1014 (_2!1464 lt!34652))) (currentByte!2327 (_2!1464 lt!34652)) (currentBit!2322 (_2!1464 lt!34652))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24176 () Bool)

(declare-fun res!20843 () Bool)

(assert (=> b!24176 (=> res!20843 e!16449)))

(assert (=> b!24176 (= res!20843 (not (= (size!693 (buf!1014 thiss!1379)) (size!693 (buf!1014 (_2!1464 lt!34647))))))))

(declare-fun b!24177 () Bool)

(declare-fun e!16448 () Bool)

(declare-fun e!16444 () Bool)

(assert (=> b!24177 (= e!16448 e!16444)))

(declare-fun res!20846 () Bool)

(assert (=> b!24177 (=> res!20846 e!16444)))

(declare-fun isPrefixOf!0 (BitStream!1218 BitStream!1218) Bool)

(assert (=> b!24177 (= res!20846 (not (isPrefixOf!0 thiss!1379 (_2!1464 lt!34652))))))

(assert (=> b!24177 (validate_offset_bits!1 ((_ sign_extend 32) (size!693 (buf!1014 (_2!1464 lt!34652)))) ((_ sign_extend 32) (currentByte!2327 (_2!1464 lt!34652))) ((_ sign_extend 32) (currentBit!2322 (_2!1464 lt!34652))) lt!34653)))

(assert (=> b!24177 (= lt!34653 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34649 () Unit!2029)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1218 BitStream!1218 (_ BitVec 64) (_ BitVec 64)) Unit!2029)

(assert (=> b!24177 (= lt!34649 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1464 lt!34652) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1218 (_ BitVec 8) (_ BitVec 32)) tuple2!2754)

(assert (=> b!24177 (= lt!34652 (appendBitFromByte!0 thiss!1379 (select (arr!1149 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24178 () Bool)

(assert (=> b!24178 (= e!16444 e!16447)))

(declare-fun res!20844 () Bool)

(assert (=> b!24178 (=> res!20844 e!16447)))

(assert (=> b!24178 (= res!20844 (not (isPrefixOf!0 (_2!1464 lt!34652) (_2!1464 lt!34647))))))

(assert (=> b!24178 (isPrefixOf!0 thiss!1379 (_2!1464 lt!34647))))

(declare-fun lt!34645 () Unit!2029)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1218 BitStream!1218 BitStream!1218) Unit!2029)

(assert (=> b!24178 (= lt!34645 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1464 lt!34652) (_2!1464 lt!34647)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1218 array!1615 (_ BitVec 64) (_ BitVec 64)) tuple2!2754)

(assert (=> b!24178 (= lt!34647 (appendBitsMSBFirstLoop!0 (_2!1464 lt!34652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24178 e!16450))

(declare-fun res!20842 () Bool)

(assert (=> b!24178 (=> (not res!20842) (not e!16450))))

(assert (=> b!24178 (= res!20842 (validate_offset_bits!1 ((_ sign_extend 32) (size!693 (buf!1014 (_2!1464 lt!34652)))) ((_ sign_extend 32) (currentByte!2327 thiss!1379)) ((_ sign_extend 32) (currentBit!2322 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34650 () Unit!2029)

(assert (=> b!24178 (= lt!34650 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1014 (_2!1464 lt!34652)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24178 (= lt!34656 (reader!0 thiss!1379 (_2!1464 lt!34652)))))

(declare-fun b!24179 () Bool)

(declare-fun res!20841 () Bool)

(assert (=> b!24179 (=> res!20841 e!16449)))

(assert (=> b!24179 (= res!20841 (not (invariant!0 (currentBit!2322 (_2!1464 lt!34647)) (currentByte!2327 (_2!1464 lt!34647)) (size!693 (buf!1014 (_2!1464 lt!34647))))))))

(declare-fun b!24180 () Bool)

(assert (=> b!24180 (= e!16441 (not e!16448))))

(declare-fun res!20850 () Bool)

(assert (=> b!24180 (=> res!20850 e!16448)))

(assert (=> b!24180 (= res!20850 (bvsge i!635 to!314))))

(assert (=> b!24180 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34646 () Unit!2029)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1218) Unit!2029)

(assert (=> b!24180 (= lt!34646 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24180 (= lt!34651 (bitIndex!0 (size!693 (buf!1014 thiss!1379)) (currentByte!2327 thiss!1379) (currentBit!2322 thiss!1379)))))

(declare-fun b!24181 () Bool)

(assert (=> b!24181 (= e!16449 e!16443)))

(declare-fun res!20839 () Bool)

(assert (=> b!24181 (=> res!20839 e!16443)))

(assert (=> b!24181 (= res!20839 (not (= (size!693 (buf!1014 (_2!1464 lt!34652))) (size!693 (buf!1014 (_2!1464 lt!34647))))))))

(assert (=> b!24181 e!16442))

(declare-fun res!20840 () Bool)

(assert (=> b!24181 (=> (not res!20840) (not e!16442))))

(assert (=> b!24181 (= res!20840 (= (size!693 (buf!1014 (_2!1464 lt!34647))) (size!693 (buf!1014 thiss!1379))))))

(assert (= (and start!5692 res!20845) b!24168))

(assert (= (and b!24168 res!20848) b!24180))

(assert (= (and b!24180 (not res!20850)) b!24177))

(assert (= (and b!24177 (not res!20846)) b!24178))

(assert (= (and b!24178 res!20842) b!24172))

(assert (= (and b!24178 (not res!20844)) b!24169))

(assert (= (and b!24169 (not res!20847)) b!24179))

(assert (= (and b!24179 (not res!20841)) b!24176))

(assert (= (and b!24176 (not res!20843)) b!24181))

(assert (= (and b!24181 res!20840) b!24175))

(assert (= (and b!24181 (not res!20839)) b!24174))

(assert (= (and b!24174 (not res!20849)) b!24171))

(assert (= (and b!24171 (not res!20838)) b!24170))

(assert (= start!5692 b!24173))

(declare-fun m!34073 () Bool)

(assert (=> b!24177 m!34073))

(declare-fun m!34075 () Bool)

(assert (=> b!24177 m!34075))

(declare-fun m!34077 () Bool)

(assert (=> b!24177 m!34077))

(declare-fun m!34079 () Bool)

(assert (=> b!24177 m!34079))

(assert (=> b!24177 m!34075))

(declare-fun m!34081 () Bool)

(assert (=> b!24177 m!34081))

(declare-fun m!34083 () Bool)

(assert (=> start!5692 m!34083))

(declare-fun m!34085 () Bool)

(assert (=> start!5692 m!34085))

(declare-fun m!34087 () Bool)

(assert (=> b!24180 m!34087))

(declare-fun m!34089 () Bool)

(assert (=> b!24180 m!34089))

(declare-fun m!34091 () Bool)

(assert (=> b!24180 m!34091))

(declare-fun m!34093 () Bool)

(assert (=> b!24175 m!34093))

(declare-fun m!34095 () Bool)

(assert (=> b!24173 m!34095))

(declare-fun m!34097 () Bool)

(assert (=> b!24179 m!34097))

(declare-fun m!34099 () Bool)

(assert (=> b!24178 m!34099))

(declare-fun m!34101 () Bool)

(assert (=> b!24178 m!34101))

(declare-fun m!34103 () Bool)

(assert (=> b!24178 m!34103))

(declare-fun m!34105 () Bool)

(assert (=> b!24178 m!34105))

(declare-fun m!34107 () Bool)

(assert (=> b!24178 m!34107))

(declare-fun m!34109 () Bool)

(assert (=> b!24178 m!34109))

(declare-fun m!34111 () Bool)

(assert (=> b!24178 m!34111))

(declare-fun m!34113 () Bool)

(assert (=> b!24168 m!34113))

(declare-fun m!34115 () Bool)

(assert (=> b!24171 m!34115))

(declare-fun m!34117 () Bool)

(assert (=> b!24170 m!34117))

(declare-fun m!34119 () Bool)

(assert (=> b!24170 m!34119))

(declare-fun m!34121 () Bool)

(assert (=> b!24170 m!34121))

(declare-fun m!34123 () Bool)

(assert (=> b!24170 m!34123))

(declare-fun m!34125 () Bool)

(assert (=> b!24170 m!34125))

(declare-fun m!34127 () Bool)

(assert (=> b!24170 m!34127))

(declare-fun m!34129 () Bool)

(assert (=> b!24174 m!34129))

(declare-fun m!34131 () Bool)

(assert (=> b!24172 m!34131))

(assert (=> b!24172 m!34131))

(declare-fun m!34133 () Bool)

(assert (=> b!24172 m!34133))

(declare-fun m!34135 () Bool)

(assert (=> b!24172 m!34135))

(assert (=> b!24172 m!34135))

(declare-fun m!34137 () Bool)

(assert (=> b!24172 m!34137))

(declare-fun m!34139 () Bool)

(assert (=> b!24169 m!34139))

(check-sat (not b!24172) (not b!24174) (not b!24180) (not b!24179) (not b!24169) (not start!5692) (not b!24177) (not b!24173) (not b!24178) (not b!24171) (not b!24175) (not b!24170) (not b!24168))
