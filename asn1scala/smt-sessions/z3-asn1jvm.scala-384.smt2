; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9640 () Bool)

(assert start!9640)

(declare-fun b!48199 () Bool)

(declare-fun res!40528 () Bool)

(declare-fun e!31942 () Bool)

(assert (=> b!48199 (=> res!40528 e!31942)))

(declare-datatypes ((List!547 0))(
  ( (Nil!544) (Cons!543 (h!662 Bool) (t!1297 List!547)) )
))
(declare-fun lt!74578 () List!547)

(declare-fun length!242 (List!547) Int)

(assert (=> b!48199 (= res!40528 (<= (length!242 lt!74578) 0))))

(declare-fun b!48200 () Bool)

(declare-fun res!40534 () Bool)

(declare-fun e!31934 () Bool)

(assert (=> b!48200 (=> res!40534 e!31934)))

(declare-datatypes ((array!2304 0))(
  ( (array!2305 (arr!1566 (Array (_ BitVec 32) (_ BitVec 8))) (size!1043 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1812 0))(
  ( (BitStream!1813 (buf!1395 array!2304) (currentByte!2906 (_ BitVec 32)) (currentBit!2901 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3380 0))(
  ( (Unit!3381) )
))
(declare-datatypes ((tuple2!4564 0))(
  ( (tuple2!4565 (_1!2381 Unit!3380) (_2!2381 BitStream!1812)) )
))
(declare-fun lt!74570 () tuple2!4564)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!48200 (= res!40534 (not (invariant!0 (currentBit!2901 (_2!2381 lt!74570)) (currentByte!2906 (_2!2381 lt!74570)) (size!1043 (buf!1395 (_2!2381 lt!74570))))))))

(declare-fun b!48201 () Bool)

(declare-fun res!40530 () Bool)

(declare-fun e!31939 () Bool)

(assert (=> b!48201 (=> res!40530 e!31939)))

(declare-fun lt!74573 () tuple2!4564)

(assert (=> b!48201 (= res!40530 (not (invariant!0 (currentBit!2901 (_2!2381 lt!74573)) (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74570))))))))

(declare-fun b!48202 () Bool)

(assert (=> b!48202 (= e!31939 e!31942)))

(declare-fun res!40526 () Bool)

(assert (=> b!48202 (=> res!40526 e!31942)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!48202 (= res!40526 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!74584 () List!547)

(declare-fun lt!74577 () (_ BitVec 64))

(declare-datatypes ((tuple2!4566 0))(
  ( (tuple2!4567 (_1!2382 BitStream!1812) (_2!2382 BitStream!1812)) )
))
(declare-fun lt!74571 () tuple2!4566)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1812 BitStream!1812 (_ BitVec 64)) List!547)

(assert (=> b!48202 (= lt!74584 (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_1!2382 lt!74571) lt!74577))))

(declare-fun lt!74579 () tuple2!4566)

(assert (=> b!48202 (= lt!74578 (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_1!2382 lt!74579) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48202 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!74577)))

(declare-fun lt!74586 () Unit!3380)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1812 array!2304 (_ BitVec 64)) Unit!3380)

(assert (=> b!48202 (= lt!74586 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2381 lt!74573) (buf!1395 (_2!2381 lt!74570)) lt!74577))))

(declare-fun reader!0 (BitStream!1812 BitStream!1812) tuple2!4566)

(assert (=> b!48202 (= lt!74571 (reader!0 (_2!2381 lt!74573) (_2!2381 lt!74570)))))

(declare-fun thiss!1379 () BitStream!1812)

(assert (=> b!48202 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!74585 () Unit!3380)

(assert (=> b!48202 (= lt!74585 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1395 (_2!2381 lt!74570)) (bvsub to!314 i!635)))))

(assert (=> b!48202 (= lt!74579 (reader!0 thiss!1379 (_2!2381 lt!74570)))))

(declare-fun b!48203 () Bool)

(declare-fun res!40520 () Bool)

(declare-fun e!31935 () Bool)

(assert (=> b!48203 (=> res!40520 e!31935)))

(declare-fun lt!74583 () Bool)

(declare-fun head!366 (List!547) Bool)

(assert (=> b!48203 (= res!40520 (not (= (head!366 lt!74578) lt!74583)))))

(declare-fun b!48204 () Bool)

(declare-fun res!40522 () Bool)

(assert (=> b!48204 (=> res!40522 e!31939)))

(assert (=> b!48204 (= res!40522 (not (invariant!0 (currentBit!2901 (_2!2381 lt!74573)) (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74573))))))))

(declare-fun srcBuffer!2 () array!2304)

(declare-fun b!48205 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1812 array!2304 (_ BitVec 64) (_ BitVec 64)) List!547)

(declare-fun bitAt!0 (array!2304 (_ BitVec 64)) Bool)

(assert (=> b!48205 (= e!31935 (= (head!366 (byteArrayBitContentToList!0 (_2!2381 lt!74570) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635)))))

(declare-fun b!48206 () Bool)

(declare-fun e!31936 () Bool)

(declare-fun e!31933 () Bool)

(assert (=> b!48206 (= e!31936 (not e!31933))))

(declare-fun res!40527 () Bool)

(assert (=> b!48206 (=> res!40527 e!31933)))

(assert (=> b!48206 (= res!40527 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1812 BitStream!1812) Bool)

(assert (=> b!48206 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!74572 () Unit!3380)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1812) Unit!3380)

(assert (=> b!48206 (= lt!74572 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!74582 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!48206 (= lt!74582 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(declare-fun b!48207 () Bool)

(assert (=> b!48207 (= e!31934 e!31939)))

(declare-fun res!40536 () Bool)

(assert (=> b!48207 (=> res!40536 e!31939)))

(assert (=> b!48207 (= res!40536 (not (= (size!1043 (buf!1395 (_2!2381 lt!74573))) (size!1043 (buf!1395 (_2!2381 lt!74570))))))))

(declare-fun e!31930 () Bool)

(assert (=> b!48207 e!31930))

(declare-fun res!40535 () Bool)

(assert (=> b!48207 (=> (not res!40535) (not e!31930))))

(assert (=> b!48207 (= res!40535 (= (size!1043 (buf!1395 (_2!2381 lt!74570))) (size!1043 (buf!1395 thiss!1379))))))

(declare-fun b!48208 () Bool)

(declare-fun e!31938 () Bool)

(declare-fun array_inv!959 (array!2304) Bool)

(assert (=> b!48208 (= e!31938 (array_inv!959 (buf!1395 thiss!1379)))))

(declare-fun b!48209 () Bool)

(declare-fun e!31937 () Bool)

(assert (=> b!48209 (= e!31933 e!31937)))

(declare-fun res!40519 () Bool)

(assert (=> b!48209 (=> res!40519 e!31937)))

(assert (=> b!48209 (= res!40519 (not (isPrefixOf!0 thiss!1379 (_2!2381 lt!74573))))))

(assert (=> b!48209 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!74577)))

(assert (=> b!48209 (= lt!74577 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74580 () Unit!3380)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1812 BitStream!1812 (_ BitVec 64) (_ BitVec 64)) Unit!3380)

(assert (=> b!48209 (= lt!74580 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2381 lt!74573) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1812 (_ BitVec 8) (_ BitVec 32)) tuple2!4564)

(assert (=> b!48209 (= lt!74573 (appendBitFromByte!0 thiss!1379 (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!48210 () Bool)

(declare-fun e!31932 () Bool)

(assert (=> b!48210 (= e!31932 e!31935)))

(declare-fun res!40524 () Bool)

(assert (=> b!48210 (=> res!40524 e!31935)))

(assert (=> b!48210 (= res!40524 (not (= lt!74583 (bitAt!0 (buf!1395 (_1!2382 lt!74571)) lt!74582))))))

(assert (=> b!48210 (= lt!74583 (bitAt!0 (buf!1395 (_1!2382 lt!74579)) lt!74582))))

(declare-fun b!48211 () Bool)

(declare-fun res!40531 () Bool)

(assert (=> b!48211 (=> (not res!40531) (not e!31936))))

(assert (=> b!48211 (= res!40531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 thiss!1379))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!40529 () Bool)

(assert (=> start!9640 (=> (not res!40529) (not e!31936))))

(assert (=> start!9640 (= res!40529 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1043 srcBuffer!2))))))))

(assert (=> start!9640 e!31936))

(assert (=> start!9640 true))

(assert (=> start!9640 (array_inv!959 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1812) Bool)

(assert (=> start!9640 (and (inv!12 thiss!1379) e!31938)))

(declare-fun e!31931 () Bool)

(declare-fun lt!74581 () tuple2!4566)

(declare-fun b!48212 () Bool)

(assert (=> b!48212 (= e!31931 (= (head!366 (byteArrayBitContentToList!0 (_2!2381 lt!74573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!366 (bitStreamReadBitsIntoList!0 (_2!2381 lt!74573) (_1!2382 lt!74581) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!48213 () Bool)

(declare-fun e!31941 () Bool)

(assert (=> b!48213 (= e!31937 e!31941)))

(declare-fun res!40532 () Bool)

(assert (=> b!48213 (=> res!40532 e!31941)))

(assert (=> b!48213 (= res!40532 (not (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!74570))))))

(assert (=> b!48213 (isPrefixOf!0 thiss!1379 (_2!2381 lt!74570))))

(declare-fun lt!74576 () Unit!3380)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1812 BitStream!1812 BitStream!1812) Unit!3380)

(assert (=> b!48213 (= lt!74576 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2381 lt!74573) (_2!2381 lt!74570)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1812 array!2304 (_ BitVec 64) (_ BitVec 64)) tuple2!4564)

(assert (=> b!48213 (= lt!74570 (appendBitsMSBFirstLoop!0 (_2!2381 lt!74573) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!48213 e!31931))

(declare-fun res!40533 () Bool)

(assert (=> b!48213 (=> (not res!40533) (not e!31931))))

(assert (=> b!48213 (= res!40533 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74574 () Unit!3380)

(assert (=> b!48213 (= lt!74574 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1395 (_2!2381 lt!74573)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!48213 (= lt!74581 (reader!0 thiss!1379 (_2!2381 lt!74573)))))

(declare-fun lt!74575 () (_ BitVec 64))

(declare-fun b!48214 () Bool)

(assert (=> b!48214 (= e!31930 (= lt!74575 (bvsub (bvsub (bvadd (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48215 () Bool)

(declare-fun res!40523 () Bool)

(assert (=> b!48215 (=> res!40523 e!31934)))

(assert (=> b!48215 (= res!40523 (not (= (size!1043 (buf!1395 thiss!1379)) (size!1043 (buf!1395 (_2!2381 lt!74570))))))))

(declare-fun b!48216 () Bool)

(assert (=> b!48216 (= e!31941 e!31934)))

(declare-fun res!40525 () Bool)

(assert (=> b!48216 (=> res!40525 e!31934)))

(assert (=> b!48216 (= res!40525 (not (= lt!74575 (bvsub (bvadd lt!74582 to!314) i!635))))))

(assert (=> b!48216 (= lt!74575 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74570))) (currentByte!2906 (_2!2381 lt!74570)) (currentBit!2901 (_2!2381 lt!74570))))))

(declare-fun b!48217 () Bool)

(assert (=> b!48217 (= e!31942 e!31932)))

(declare-fun res!40521 () Bool)

(assert (=> b!48217 (=> res!40521 e!31932)))

(declare-fun lt!74569 () List!547)

(assert (=> b!48217 (= res!40521 (not (= lt!74569 lt!74584)))))

(assert (=> b!48217 (= lt!74584 lt!74569)))

(declare-fun tail!233 (List!547) List!547)

(assert (=> b!48217 (= lt!74569 (tail!233 lt!74578))))

(declare-fun lt!74587 () Unit!3380)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1812 BitStream!1812 BitStream!1812 BitStream!1812 (_ BitVec 64) List!547) Unit!3380)

(assert (=> b!48217 (= lt!74587 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2381 lt!74570) (_2!2381 lt!74570) (_1!2382 lt!74579) (_1!2382 lt!74571) (bvsub to!314 i!635) lt!74578))))

(assert (= (and start!9640 res!40529) b!48211))

(assert (= (and b!48211 res!40531) b!48206))

(assert (= (and b!48206 (not res!40527)) b!48209))

(assert (= (and b!48209 (not res!40519)) b!48213))

(assert (= (and b!48213 res!40533) b!48212))

(assert (= (and b!48213 (not res!40532)) b!48216))

(assert (= (and b!48216 (not res!40525)) b!48200))

(assert (= (and b!48200 (not res!40534)) b!48215))

(assert (= (and b!48215 (not res!40523)) b!48207))

(assert (= (and b!48207 res!40535) b!48214))

(assert (= (and b!48207 (not res!40536)) b!48204))

(assert (= (and b!48204 (not res!40522)) b!48201))

(assert (= (and b!48201 (not res!40530)) b!48202))

(assert (= (and b!48202 (not res!40526)) b!48199))

(assert (= (and b!48199 (not res!40528)) b!48217))

(assert (= (and b!48217 (not res!40521)) b!48210))

(assert (= (and b!48210 (not res!40524)) b!48203))

(assert (= (and b!48203 (not res!40520)) b!48205))

(assert (= start!9640 b!48208))

(declare-fun m!74819 () Bool)

(assert (=> b!48204 m!74819))

(declare-fun m!74821 () Bool)

(assert (=> b!48201 m!74821))

(declare-fun m!74823 () Bool)

(assert (=> b!48211 m!74823))

(declare-fun m!74825 () Bool)

(assert (=> start!9640 m!74825))

(declare-fun m!74827 () Bool)

(assert (=> start!9640 m!74827))

(declare-fun m!74829 () Bool)

(assert (=> b!48205 m!74829))

(assert (=> b!48205 m!74829))

(declare-fun m!74831 () Bool)

(assert (=> b!48205 m!74831))

(declare-fun m!74833 () Bool)

(assert (=> b!48205 m!74833))

(declare-fun m!74835 () Bool)

(assert (=> b!48200 m!74835))

(declare-fun m!74837 () Bool)

(assert (=> b!48213 m!74837))

(declare-fun m!74839 () Bool)

(assert (=> b!48213 m!74839))

(declare-fun m!74841 () Bool)

(assert (=> b!48213 m!74841))

(declare-fun m!74843 () Bool)

(assert (=> b!48213 m!74843))

(declare-fun m!74845 () Bool)

(assert (=> b!48213 m!74845))

(declare-fun m!74847 () Bool)

(assert (=> b!48213 m!74847))

(declare-fun m!74849 () Bool)

(assert (=> b!48213 m!74849))

(declare-fun m!74851 () Bool)

(assert (=> b!48214 m!74851))

(declare-fun m!74853 () Bool)

(assert (=> b!48209 m!74853))

(declare-fun m!74855 () Bool)

(assert (=> b!48209 m!74855))

(declare-fun m!74857 () Bool)

(assert (=> b!48209 m!74857))

(assert (=> b!48209 m!74853))

(declare-fun m!74859 () Bool)

(assert (=> b!48209 m!74859))

(declare-fun m!74861 () Bool)

(assert (=> b!48209 m!74861))

(declare-fun m!74863 () Bool)

(assert (=> b!48210 m!74863))

(declare-fun m!74865 () Bool)

(assert (=> b!48210 m!74865))

(declare-fun m!74867 () Bool)

(assert (=> b!48217 m!74867))

(declare-fun m!74869 () Bool)

(assert (=> b!48217 m!74869))

(declare-fun m!74871 () Bool)

(assert (=> b!48203 m!74871))

(declare-fun m!74873 () Bool)

(assert (=> b!48212 m!74873))

(assert (=> b!48212 m!74873))

(declare-fun m!74875 () Bool)

(assert (=> b!48212 m!74875))

(declare-fun m!74877 () Bool)

(assert (=> b!48212 m!74877))

(assert (=> b!48212 m!74877))

(declare-fun m!74879 () Bool)

(assert (=> b!48212 m!74879))

(declare-fun m!74881 () Bool)

(assert (=> b!48202 m!74881))

(declare-fun m!74883 () Bool)

(assert (=> b!48202 m!74883))

(declare-fun m!74885 () Bool)

(assert (=> b!48202 m!74885))

(declare-fun m!74887 () Bool)

(assert (=> b!48202 m!74887))

(declare-fun m!74889 () Bool)

(assert (=> b!48202 m!74889))

(declare-fun m!74891 () Bool)

(assert (=> b!48202 m!74891))

(declare-fun m!74893 () Bool)

(assert (=> b!48202 m!74893))

(declare-fun m!74895 () Bool)

(assert (=> b!48202 m!74895))

(declare-fun m!74897 () Bool)

(assert (=> b!48208 m!74897))

(declare-fun m!74899 () Bool)

(assert (=> b!48206 m!74899))

(declare-fun m!74901 () Bool)

(assert (=> b!48206 m!74901))

(declare-fun m!74903 () Bool)

(assert (=> b!48206 m!74903))

(declare-fun m!74905 () Bool)

(assert (=> b!48216 m!74905))

(declare-fun m!74907 () Bool)

(assert (=> b!48199 m!74907))

(check-sat (not b!48214) (not b!48208) (not b!48202) (not b!48206) (not start!9640) (not b!48217) (not b!48216) (not b!48213) (not b!48200) (not b!48199) (not b!48209) (not b!48205) (not b!48203) (not b!48201) (not b!48210) (not b!48212) (not b!48204) (not b!48211))
(check-sat)
(get-model)

(declare-fun d!14672 () Bool)

(assert (=> d!14672 (= (invariant!0 (currentBit!2901 (_2!2381 lt!74573)) (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74570)))) (and (bvsge (currentBit!2901 (_2!2381 lt!74573)) #b00000000000000000000000000000000) (bvslt (currentBit!2901 (_2!2381 lt!74573)) #b00000000000000000000000000001000) (bvsge (currentByte!2906 (_2!2381 lt!74573)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74570)))) (and (= (currentBit!2901 (_2!2381 lt!74573)) #b00000000000000000000000000000000) (= (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74570))))))))))

(assert (=> b!48201 d!14672))

(declare-fun d!14674 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!14674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 thiss!1379))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 thiss!1379))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3772 () Bool)

(assert (= bs!3772 d!14674))

(declare-fun m!74999 () Bool)

(assert (=> bs!3772 m!74999))

(assert (=> b!48211 d!14674))

(declare-fun d!14676 () Bool)

(assert (=> d!14676 (= (invariant!0 (currentBit!2901 (_2!2381 lt!74570)) (currentByte!2906 (_2!2381 lt!74570)) (size!1043 (buf!1395 (_2!2381 lt!74570)))) (and (bvsge (currentBit!2901 (_2!2381 lt!74570)) #b00000000000000000000000000000000) (bvslt (currentBit!2901 (_2!2381 lt!74570)) #b00000000000000000000000000001000) (bvsge (currentByte!2906 (_2!2381 lt!74570)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2906 (_2!2381 lt!74570)) (size!1043 (buf!1395 (_2!2381 lt!74570)))) (and (= (currentBit!2901 (_2!2381 lt!74570)) #b00000000000000000000000000000000) (= (currentByte!2906 (_2!2381 lt!74570)) (size!1043 (buf!1395 (_2!2381 lt!74570))))))))))

(assert (=> b!48200 d!14676))

(declare-fun lt!74700 () tuple2!4566)

(declare-fun lt!74686 () (_ BitVec 64))

(declare-fun b!48285 () Bool)

(declare-fun lt!74685 () (_ BitVec 64))

(declare-fun e!31990 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1812 (_ BitVec 64)) BitStream!1812)

(assert (=> b!48285 (= e!31990 (= (_1!2382 lt!74700) (withMovedBitIndex!0 (_2!2382 lt!74700) (bvsub lt!74686 lt!74685))))))

(assert (=> b!48285 (or (= (bvand lt!74686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74685 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74686 lt!74685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48285 (= lt!74685 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))))))

(assert (=> b!48285 (= lt!74686 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(declare-fun b!48286 () Bool)

(declare-fun e!31991 () Unit!3380)

(declare-fun Unit!3384 () Unit!3380)

(assert (=> b!48286 (= e!31991 Unit!3384)))

(declare-fun b!48287 () Bool)

(declare-fun res!40599 () Bool)

(assert (=> b!48287 (=> (not res!40599) (not e!31990))))

(assert (=> b!48287 (= res!40599 (isPrefixOf!0 (_1!2382 lt!74700) thiss!1379))))

(declare-fun b!48288 () Bool)

(declare-fun lt!74690 () Unit!3380)

(assert (=> b!48288 (= e!31991 lt!74690)))

(declare-fun lt!74702 () (_ BitVec 64))

(assert (=> b!48288 (= lt!74702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74691 () (_ BitVec 64))

(assert (=> b!48288 (= lt!74691 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2304 array!2304 (_ BitVec 64) (_ BitVec 64)) Unit!3380)

(assert (=> b!48288 (= lt!74690 (arrayBitRangesEqSymmetric!0 (buf!1395 thiss!1379) (buf!1395 (_2!2381 lt!74573)) lt!74702 lt!74691))))

(declare-fun arrayBitRangesEq!0 (array!2304 array!2304 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48288 (arrayBitRangesEq!0 (buf!1395 (_2!2381 lt!74573)) (buf!1395 thiss!1379) lt!74702 lt!74691)))

(declare-fun d!14678 () Bool)

(assert (=> d!14678 e!31990))

(declare-fun res!40597 () Bool)

(assert (=> d!14678 (=> (not res!40597) (not e!31990))))

(assert (=> d!14678 (= res!40597 (isPrefixOf!0 (_1!2382 lt!74700) (_2!2382 lt!74700)))))

(declare-fun lt!74704 () BitStream!1812)

(assert (=> d!14678 (= lt!74700 (tuple2!4567 lt!74704 (_2!2381 lt!74573)))))

(declare-fun lt!74695 () Unit!3380)

(declare-fun lt!74687 () Unit!3380)

(assert (=> d!14678 (= lt!74695 lt!74687)))

(assert (=> d!14678 (isPrefixOf!0 lt!74704 (_2!2381 lt!74573))))

(assert (=> d!14678 (= lt!74687 (lemmaIsPrefixTransitive!0 lt!74704 (_2!2381 lt!74573) (_2!2381 lt!74573)))))

(declare-fun lt!74699 () Unit!3380)

(declare-fun lt!74692 () Unit!3380)

(assert (=> d!14678 (= lt!74699 lt!74692)))

(assert (=> d!14678 (isPrefixOf!0 lt!74704 (_2!2381 lt!74573))))

(assert (=> d!14678 (= lt!74692 (lemmaIsPrefixTransitive!0 lt!74704 thiss!1379 (_2!2381 lt!74573)))))

(declare-fun lt!74698 () Unit!3380)

(assert (=> d!14678 (= lt!74698 e!31991)))

(declare-fun c!3360 () Bool)

(assert (=> d!14678 (= c!3360 (not (= (size!1043 (buf!1395 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!74696 () Unit!3380)

(declare-fun lt!74701 () Unit!3380)

(assert (=> d!14678 (= lt!74696 lt!74701)))

(assert (=> d!14678 (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!74573))))

(assert (=> d!14678 (= lt!74701 (lemmaIsPrefixRefl!0 (_2!2381 lt!74573)))))

(declare-fun lt!74694 () Unit!3380)

(declare-fun lt!74703 () Unit!3380)

(assert (=> d!14678 (= lt!74694 lt!74703)))

(assert (=> d!14678 (= lt!74703 (lemmaIsPrefixRefl!0 (_2!2381 lt!74573)))))

(declare-fun lt!74689 () Unit!3380)

(declare-fun lt!74688 () Unit!3380)

(assert (=> d!14678 (= lt!74689 lt!74688)))

(assert (=> d!14678 (isPrefixOf!0 lt!74704 lt!74704)))

(assert (=> d!14678 (= lt!74688 (lemmaIsPrefixRefl!0 lt!74704))))

(declare-fun lt!74697 () Unit!3380)

(declare-fun lt!74693 () Unit!3380)

(assert (=> d!14678 (= lt!74697 lt!74693)))

(assert (=> d!14678 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14678 (= lt!74693 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14678 (= lt!74704 (BitStream!1813 (buf!1395 (_2!2381 lt!74573)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(assert (=> d!14678 (isPrefixOf!0 thiss!1379 (_2!2381 lt!74573))))

(assert (=> d!14678 (= (reader!0 thiss!1379 (_2!2381 lt!74573)) lt!74700)))

(declare-fun b!48289 () Bool)

(declare-fun res!40598 () Bool)

(assert (=> b!48289 (=> (not res!40598) (not e!31990))))

(assert (=> b!48289 (= res!40598 (isPrefixOf!0 (_2!2382 lt!74700) (_2!2381 lt!74573)))))

(assert (= (and d!14678 c!3360) b!48288))

(assert (= (and d!14678 (not c!3360)) b!48286))

(assert (= (and d!14678 res!40597) b!48287))

(assert (= (and b!48287 res!40599) b!48289))

(assert (= (and b!48289 res!40598) b!48285))

(assert (=> b!48288 m!74903))

(declare-fun m!75001 () Bool)

(assert (=> b!48288 m!75001))

(declare-fun m!75003 () Bool)

(assert (=> b!48288 m!75003))

(declare-fun m!75005 () Bool)

(assert (=> b!48289 m!75005))

(declare-fun m!75007 () Bool)

(assert (=> b!48285 m!75007))

(assert (=> b!48285 m!74851))

(assert (=> b!48285 m!74903))

(declare-fun m!75009 () Bool)

(assert (=> b!48287 m!75009))

(declare-fun m!75011 () Bool)

(assert (=> d!14678 m!75011))

(assert (=> d!14678 m!74899))

(declare-fun m!75013 () Bool)

(assert (=> d!14678 m!75013))

(assert (=> d!14678 m!74855))

(declare-fun m!75015 () Bool)

(assert (=> d!14678 m!75015))

(declare-fun m!75017 () Bool)

(assert (=> d!14678 m!75017))

(declare-fun m!75019 () Bool)

(assert (=> d!14678 m!75019))

(declare-fun m!75021 () Bool)

(assert (=> d!14678 m!75021))

(declare-fun m!75023 () Bool)

(assert (=> d!14678 m!75023))

(declare-fun m!75025 () Bool)

(assert (=> d!14678 m!75025))

(assert (=> d!14678 m!74901))

(assert (=> b!48213 d!14678))

(declare-fun d!14680 () Bool)

(declare-fun res!40606 () Bool)

(declare-fun e!31997 () Bool)

(assert (=> d!14680 (=> (not res!40606) (not e!31997))))

(assert (=> d!14680 (= res!40606 (= (size!1043 (buf!1395 thiss!1379)) (size!1043 (buf!1395 (_2!2381 lt!74570)))))))

(assert (=> d!14680 (= (isPrefixOf!0 thiss!1379 (_2!2381 lt!74570)) e!31997)))

(declare-fun b!48296 () Bool)

(declare-fun res!40607 () Bool)

(assert (=> b!48296 (=> (not res!40607) (not e!31997))))

(assert (=> b!48296 (= res!40607 (bvsle (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)) (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74570))) (currentByte!2906 (_2!2381 lt!74570)) (currentBit!2901 (_2!2381 lt!74570)))))))

(declare-fun b!48297 () Bool)

(declare-fun e!31996 () Bool)

(assert (=> b!48297 (= e!31997 e!31996)))

(declare-fun res!40608 () Bool)

(assert (=> b!48297 (=> res!40608 e!31996)))

(assert (=> b!48297 (= res!40608 (= (size!1043 (buf!1395 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48298 () Bool)

(assert (=> b!48298 (= e!31996 (arrayBitRangesEq!0 (buf!1395 thiss!1379) (buf!1395 (_2!2381 lt!74570)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379))))))

(assert (= (and d!14680 res!40606) b!48296))

(assert (= (and b!48296 res!40607) b!48297))

(assert (= (and b!48297 (not res!40608)) b!48298))

(assert (=> b!48296 m!74903))

(assert (=> b!48296 m!74905))

(assert (=> b!48298 m!74903))

(assert (=> b!48298 m!74903))

(declare-fun m!75027 () Bool)

(assert (=> b!48298 m!75027))

(assert (=> b!48213 d!14680))

(declare-fun d!14682 () Bool)

(declare-fun res!40609 () Bool)

(declare-fun e!31999 () Bool)

(assert (=> d!14682 (=> (not res!40609) (not e!31999))))

(assert (=> d!14682 (= res!40609 (= (size!1043 (buf!1395 (_2!2381 lt!74573))) (size!1043 (buf!1395 (_2!2381 lt!74570)))))))

(assert (=> d!14682 (= (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!74570)) e!31999)))

(declare-fun b!48299 () Bool)

(declare-fun res!40610 () Bool)

(assert (=> b!48299 (=> (not res!40610) (not e!31999))))

(assert (=> b!48299 (= res!40610 (bvsle (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))) (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74570))) (currentByte!2906 (_2!2381 lt!74570)) (currentBit!2901 (_2!2381 lt!74570)))))))

(declare-fun b!48300 () Bool)

(declare-fun e!31998 () Bool)

(assert (=> b!48300 (= e!31999 e!31998)))

(declare-fun res!40611 () Bool)

(assert (=> b!48300 (=> res!40611 e!31998)))

(assert (=> b!48300 (= res!40611 (= (size!1043 (buf!1395 (_2!2381 lt!74573))) #b00000000000000000000000000000000))))

(declare-fun b!48301 () Bool)

(assert (=> b!48301 (= e!31998 (arrayBitRangesEq!0 (buf!1395 (_2!2381 lt!74573)) (buf!1395 (_2!2381 lt!74570)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573)))))))

(assert (= (and d!14682 res!40609) b!48299))

(assert (= (and b!48299 res!40610) b!48300))

(assert (= (and b!48300 (not res!40611)) b!48301))

(assert (=> b!48299 m!74851))

(assert (=> b!48299 m!74905))

(assert (=> b!48301 m!74851))

(assert (=> b!48301 m!74851))

(declare-fun m!75029 () Bool)

(assert (=> b!48301 m!75029))

(assert (=> b!48213 d!14682))

(declare-fun d!14684 () Bool)

(assert (=> d!14684 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3773 () Bool)

(assert (= bs!3773 d!14684))

(declare-fun m!75031 () Bool)

(assert (=> bs!3773 m!75031))

(assert (=> b!48213 d!14684))

(declare-fun d!14686 () Bool)

(assert (=> d!14686 (isPrefixOf!0 thiss!1379 (_2!2381 lt!74570))))

(declare-fun lt!74707 () Unit!3380)

(declare-fun choose!30 (BitStream!1812 BitStream!1812 BitStream!1812) Unit!3380)

(assert (=> d!14686 (= lt!74707 (choose!30 thiss!1379 (_2!2381 lt!74573) (_2!2381 lt!74570)))))

(assert (=> d!14686 (isPrefixOf!0 thiss!1379 (_2!2381 lt!74573))))

(assert (=> d!14686 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2381 lt!74573) (_2!2381 lt!74570)) lt!74707)))

(declare-fun bs!3774 () Bool)

(assert (= bs!3774 d!14686))

(assert (=> bs!3774 m!74847))

(declare-fun m!75033 () Bool)

(assert (=> bs!3774 m!75033))

(assert (=> bs!3774 m!74855))

(assert (=> b!48213 d!14686))

(declare-fun d!14688 () Bool)

(assert (=> d!14688 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74710 () Unit!3380)

(declare-fun choose!9 (BitStream!1812 array!2304 (_ BitVec 64) BitStream!1812) Unit!3380)

(assert (=> d!14688 (= lt!74710 (choose!9 thiss!1379 (buf!1395 (_2!2381 lt!74573)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1813 (buf!1395 (_2!2381 lt!74573)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379))))))

(assert (=> d!14688 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1395 (_2!2381 lt!74573)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74710)))

(declare-fun bs!3775 () Bool)

(assert (= bs!3775 d!14688))

(assert (=> bs!3775 m!74841))

(declare-fun m!75035 () Bool)

(assert (=> bs!3775 m!75035))

(assert (=> b!48213 d!14688))

(declare-fun b!48430 () Bool)

(declare-fun res!40698 () Bool)

(declare-fun e!32066 () Bool)

(assert (=> b!48430 (=> (not res!40698) (not e!32066))))

(declare-fun lt!75009 () tuple2!4564)

(assert (=> b!48430 (= res!40698 (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!75009)))))

(declare-fun b!48431 () Bool)

(declare-fun res!40702 () Bool)

(assert (=> b!48431 (=> (not res!40702) (not e!32066))))

(assert (=> b!48431 (= res!40702 (= (size!1043 (buf!1395 (_2!2381 lt!75009))) (size!1043 (buf!1395 (_2!2381 lt!74573)))))))

(declare-fun b!48432 () Bool)

(declare-fun e!32067 () tuple2!4564)

(declare-fun Unit!3385 () Unit!3380)

(assert (=> b!48432 (= e!32067 (tuple2!4565 Unit!3385 (_2!2381 lt!74573)))))

(assert (=> b!48432 (= (size!1043 (buf!1395 (_2!2381 lt!74573))) (size!1043 (buf!1395 (_2!2381 lt!74573))))))

(declare-fun lt!75038 () Unit!3380)

(declare-fun Unit!3386 () Unit!3380)

(assert (=> b!48432 (= lt!75038 Unit!3386)))

(declare-fun call!604 () tuple2!4566)

(declare-fun checkByteArrayBitContent!0 (BitStream!1812 array!2304 array!2304 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4572 0))(
  ( (tuple2!4573 (_1!2385 array!2304) (_2!2385 BitStream!1812)) )
))
(declare-fun readBits!0 (BitStream!1812 (_ BitVec 64)) tuple2!4572)

(assert (=> b!48432 (checkByteArrayBitContent!0 (_2!2381 lt!74573) srcBuffer!2 (_1!2385 (readBits!0 (_1!2382 call!604) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!48433 () Bool)

(declare-fun res!40701 () Bool)

(assert (=> b!48433 (=> (not res!40701) (not e!32066))))

(assert (=> b!48433 (= res!40701 (= (size!1043 (buf!1395 (_2!2381 lt!74573))) (size!1043 (buf!1395 (_2!2381 lt!75009)))))))

(declare-fun d!14690 () Bool)

(assert (=> d!14690 e!32066))

(declare-fun res!40697 () Bool)

(assert (=> d!14690 (=> (not res!40697) (not e!32066))))

(declare-fun lt!75015 () (_ BitVec 64))

(assert (=> d!14690 (= res!40697 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75009))) (currentByte!2906 (_2!2381 lt!75009)) (currentBit!2901 (_2!2381 lt!75009))) (bvsub lt!75015 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14690 (or (= (bvand lt!75015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75015 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75013 () (_ BitVec 64))

(assert (=> d!14690 (= lt!75015 (bvadd lt!75013 to!314))))

(assert (=> d!14690 (or (not (= (bvand lt!75013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!75013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!75013 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14690 (= lt!75013 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))))))

(assert (=> d!14690 (= lt!75009 e!32067)))

(declare-fun c!3382 () Bool)

(assert (=> d!14690 (= c!3382 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!75023 () Unit!3380)

(declare-fun lt!75014 () Unit!3380)

(assert (=> d!14690 (= lt!75023 lt!75014)))

(assert (=> d!14690 (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!74573))))

(assert (=> d!14690 (= lt!75014 (lemmaIsPrefixRefl!0 (_2!2381 lt!74573)))))

(declare-fun lt!75039 () (_ BitVec 64))

(assert (=> d!14690 (= lt!75039 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))))))

(assert (=> d!14690 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14690 (= (appendBitsMSBFirstLoop!0 (_2!2381 lt!74573) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!75009)))

(declare-fun bm!601 () Bool)

(declare-fun lt!75041 () tuple2!4564)

(assert (=> bm!601 (= call!604 (reader!0 (_2!2381 lt!74573) (ite c!3382 (_2!2381 lt!75041) (_2!2381 lt!74573))))))

(declare-fun b!48434 () Bool)

(declare-fun e!32065 () Bool)

(declare-fun lt!75030 () (_ BitVec 64))

(assert (=> b!48434 (= e!32065 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!75030))))

(declare-fun b!48435 () Bool)

(declare-fun lt!75034 () tuple2!4564)

(declare-fun Unit!3387 () Unit!3380)

(assert (=> b!48435 (= e!32067 (tuple2!4565 Unit!3387 (_2!2381 lt!75034)))))

(assert (=> b!48435 (= lt!75041 (appendBitFromByte!0 (_2!2381 lt!74573) (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!75019 () (_ BitVec 64))

(assert (=> b!48435 (= lt!75019 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75011 () (_ BitVec 64))

(assert (=> b!48435 (= lt!75011 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75010 () Unit!3380)

(assert (=> b!48435 (= lt!75010 (validateOffsetBitsIneqLemma!0 (_2!2381 lt!74573) (_2!2381 lt!75041) lt!75019 lt!75011))))

(assert (=> b!48435 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!75041)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!75041))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!75041))) (bvsub lt!75019 lt!75011))))

(declare-fun lt!75007 () Unit!3380)

(assert (=> b!48435 (= lt!75007 lt!75010)))

(declare-fun lt!75032 () tuple2!4566)

(assert (=> b!48435 (= lt!75032 call!604)))

(declare-fun lt!75040 () (_ BitVec 64))

(assert (=> b!48435 (= lt!75040 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75005 () Unit!3380)

(assert (=> b!48435 (= lt!75005 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2381 lt!74573) (buf!1395 (_2!2381 lt!75041)) lt!75040))))

(assert (=> b!48435 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!75041)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!75040)))

(declare-fun lt!75033 () Unit!3380)

(assert (=> b!48435 (= lt!75033 lt!75005)))

(assert (=> b!48435 (= (head!366 (byteArrayBitContentToList!0 (_2!2381 lt!75041) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!366 (bitStreamReadBitsIntoList!0 (_2!2381 lt!75041) (_1!2382 lt!75032) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75026 () Unit!3380)

(declare-fun Unit!3388 () Unit!3380)

(assert (=> b!48435 (= lt!75026 Unit!3388)))

(assert (=> b!48435 (= lt!75034 (appendBitsMSBFirstLoop!0 (_2!2381 lt!75041) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!75042 () Unit!3380)

(assert (=> b!48435 (= lt!75042 (lemmaIsPrefixTransitive!0 (_2!2381 lt!74573) (_2!2381 lt!75041) (_2!2381 lt!75034)))))

(assert (=> b!48435 (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!75034))))

(declare-fun lt!75017 () Unit!3380)

(assert (=> b!48435 (= lt!75017 lt!75042)))

(assert (=> b!48435 (= (size!1043 (buf!1395 (_2!2381 lt!75034))) (size!1043 (buf!1395 (_2!2381 lt!74573))))))

(declare-fun lt!75003 () Unit!3380)

(declare-fun Unit!3389 () Unit!3380)

(assert (=> b!48435 (= lt!75003 Unit!3389)))

(assert (=> b!48435 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75034))) (currentByte!2906 (_2!2381 lt!75034)) (currentBit!2901 (_2!2381 lt!75034))) (bvsub (bvadd (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75000 () Unit!3380)

(declare-fun Unit!3390 () Unit!3380)

(assert (=> b!48435 (= lt!75000 Unit!3390)))

(assert (=> b!48435 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75034))) (currentByte!2906 (_2!2381 lt!75034)) (currentBit!2901 (_2!2381 lt!75034))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75041))) (currentByte!2906 (_2!2381 lt!75041)) (currentBit!2901 (_2!2381 lt!75041))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75022 () Unit!3380)

(declare-fun Unit!3391 () Unit!3380)

(assert (=> b!48435 (= lt!75022 Unit!3391)))

(declare-fun lt!75036 () tuple2!4566)

(assert (=> b!48435 (= lt!75036 (reader!0 (_2!2381 lt!74573) (_2!2381 lt!75034)))))

(declare-fun lt!75018 () (_ BitVec 64))

(assert (=> b!48435 (= lt!75018 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75029 () Unit!3380)

(assert (=> b!48435 (= lt!75029 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2381 lt!74573) (buf!1395 (_2!2381 lt!75034)) lt!75018))))

(assert (=> b!48435 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!75034)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!75018)))

(declare-fun lt!75037 () Unit!3380)

(assert (=> b!48435 (= lt!75037 lt!75029)))

(declare-fun lt!75035 () tuple2!4566)

(assert (=> b!48435 (= lt!75035 (reader!0 (_2!2381 lt!75041) (_2!2381 lt!75034)))))

(declare-fun lt!75025 () (_ BitVec 64))

(assert (=> b!48435 (= lt!75025 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75001 () Unit!3380)

(assert (=> b!48435 (= lt!75001 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2381 lt!75041) (buf!1395 (_2!2381 lt!75034)) lt!75025))))

(assert (=> b!48435 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!75034)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!75041))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!75041))) lt!75025)))

(declare-fun lt!75020 () Unit!3380)

(assert (=> b!48435 (= lt!75020 lt!75001)))

(declare-fun lt!75008 () List!547)

(assert (=> b!48435 (= lt!75008 (byteArrayBitContentToList!0 (_2!2381 lt!75034) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75031 () List!547)

(assert (=> b!48435 (= lt!75031 (byteArrayBitContentToList!0 (_2!2381 lt!75034) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75002 () List!547)

(assert (=> b!48435 (= lt!75002 (bitStreamReadBitsIntoList!0 (_2!2381 lt!75034) (_1!2382 lt!75036) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75043 () List!547)

(assert (=> b!48435 (= lt!75043 (bitStreamReadBitsIntoList!0 (_2!2381 lt!75034) (_1!2382 lt!75035) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75006 () (_ BitVec 64))

(assert (=> b!48435 (= lt!75006 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75012 () Unit!3380)

(assert (=> b!48435 (= lt!75012 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2381 lt!75034) (_2!2381 lt!75034) (_1!2382 lt!75036) (_1!2382 lt!75035) lt!75006 lt!75002))))

(assert (=> b!48435 (= (bitStreamReadBitsIntoList!0 (_2!2381 lt!75034) (_1!2382 lt!75035) (bvsub lt!75006 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!233 lt!75002))))

(declare-fun lt!75028 () Unit!3380)

(assert (=> b!48435 (= lt!75028 lt!75012)))

(declare-fun lt!75024 () Unit!3380)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2304 array!2304 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3380)

(assert (=> b!48435 (= lt!75024 (arrayBitRangesEqImpliesEq!0 (buf!1395 (_2!2381 lt!75041)) (buf!1395 (_2!2381 lt!75034)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!75039 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75041))) (currentByte!2906 (_2!2381 lt!75041)) (currentBit!2901 (_2!2381 lt!75041)))))))

(assert (=> b!48435 (= (bitAt!0 (buf!1395 (_2!2381 lt!75041)) lt!75039) (bitAt!0 (buf!1395 (_2!2381 lt!75034)) lt!75039))))

(declare-fun lt!75004 () Unit!3380)

(assert (=> b!48435 (= lt!75004 lt!75024)))

(declare-fun b!48436 () Bool)

(declare-fun res!40699 () Bool)

(assert (=> b!48436 (=> (not res!40699) (not e!32066))))

(assert (=> b!48436 (= res!40699 (invariant!0 (currentBit!2901 (_2!2381 lt!75009)) (currentByte!2906 (_2!2381 lt!75009)) (size!1043 (buf!1395 (_2!2381 lt!75009)))))))

(declare-fun lt!75016 () tuple2!4566)

(declare-fun b!48437 () Bool)

(assert (=> b!48437 (= e!32066 (= (bitStreamReadBitsIntoList!0 (_2!2381 lt!75009) (_1!2382 lt!75016) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2381 lt!75009) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!48437 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48437 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75021 () Unit!3380)

(declare-fun lt!75027 () Unit!3380)

(assert (=> b!48437 (= lt!75021 lt!75027)))

(assert (=> b!48437 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!75009)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!75030)))

(assert (=> b!48437 (= lt!75027 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2381 lt!74573) (buf!1395 (_2!2381 lt!75009)) lt!75030))))

(assert (=> b!48437 e!32065))

(declare-fun res!40700 () Bool)

(assert (=> b!48437 (=> (not res!40700) (not e!32065))))

(assert (=> b!48437 (= res!40700 (and (= (size!1043 (buf!1395 (_2!2381 lt!74573))) (size!1043 (buf!1395 (_2!2381 lt!75009)))) (bvsge lt!75030 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48437 (= lt!75030 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!48437 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48437 (= lt!75016 (reader!0 (_2!2381 lt!74573) (_2!2381 lt!75009)))))

(assert (= (and d!14690 c!3382) b!48435))

(assert (= (and d!14690 (not c!3382)) b!48432))

(assert (= (or b!48435 b!48432) bm!601))

(assert (= (and d!14690 res!40697) b!48436))

(assert (= (and b!48436 res!40699) b!48433))

(assert (= (and b!48433 res!40701) b!48430))

(assert (= (and b!48430 res!40698) b!48431))

(assert (= (and b!48431 res!40702) b!48437))

(assert (= (and b!48437 res!40700) b!48434))

(declare-fun m!75215 () Bool)

(assert (=> d!14690 m!75215))

(assert (=> d!14690 m!74851))

(assert (=> d!14690 m!75017))

(assert (=> d!14690 m!75019))

(declare-fun m!75217 () Bool)

(assert (=> b!48430 m!75217))

(declare-fun m!75219 () Bool)

(assert (=> b!48437 m!75219))

(declare-fun m!75221 () Bool)

(assert (=> b!48437 m!75221))

(declare-fun m!75223 () Bool)

(assert (=> b!48437 m!75223))

(declare-fun m!75225 () Bool)

(assert (=> b!48437 m!75225))

(declare-fun m!75227 () Bool)

(assert (=> b!48437 m!75227))

(declare-fun m!75229 () Bool)

(assert (=> b!48436 m!75229))

(declare-fun m!75231 () Bool)

(assert (=> bm!601 m!75231))

(declare-fun m!75233 () Bool)

(assert (=> b!48435 m!75233))

(declare-fun m!75235 () Bool)

(assert (=> b!48435 m!75235))

(declare-fun m!75237 () Bool)

(assert (=> b!48435 m!75237))

(declare-fun m!75239 () Bool)

(assert (=> b!48435 m!75239))

(declare-fun m!75241 () Bool)

(assert (=> b!48435 m!75241))

(declare-fun m!75243 () Bool)

(assert (=> b!48435 m!75243))

(declare-fun m!75245 () Bool)

(assert (=> b!48435 m!75245))

(declare-fun m!75247 () Bool)

(assert (=> b!48435 m!75247))

(declare-fun m!75249 () Bool)

(assert (=> b!48435 m!75249))

(declare-fun m!75251 () Bool)

(assert (=> b!48435 m!75251))

(declare-fun m!75253 () Bool)

(assert (=> b!48435 m!75253))

(declare-fun m!75255 () Bool)

(assert (=> b!48435 m!75255))

(declare-fun m!75257 () Bool)

(assert (=> b!48435 m!75257))

(declare-fun m!75259 () Bool)

(assert (=> b!48435 m!75259))

(declare-fun m!75261 () Bool)

(assert (=> b!48435 m!75261))

(assert (=> b!48435 m!75257))

(declare-fun m!75263 () Bool)

(assert (=> b!48435 m!75263))

(declare-fun m!75265 () Bool)

(assert (=> b!48435 m!75265))

(declare-fun m!75267 () Bool)

(assert (=> b!48435 m!75267))

(declare-fun m!75269 () Bool)

(assert (=> b!48435 m!75269))

(declare-fun m!75271 () Bool)

(assert (=> b!48435 m!75271))

(assert (=> b!48435 m!75245))

(declare-fun m!75273 () Bool)

(assert (=> b!48435 m!75273))

(declare-fun m!75275 () Bool)

(assert (=> b!48435 m!75275))

(declare-fun m!75277 () Bool)

(assert (=> b!48435 m!75277))

(declare-fun m!75279 () Bool)

(assert (=> b!48435 m!75279))

(declare-fun m!75281 () Bool)

(assert (=> b!48435 m!75281))

(declare-fun m!75283 () Bool)

(assert (=> b!48435 m!75283))

(declare-fun m!75285 () Bool)

(assert (=> b!48435 m!75285))

(declare-fun m!75287 () Bool)

(assert (=> b!48435 m!75287))

(assert (=> b!48435 m!74851))

(declare-fun m!75289 () Bool)

(assert (=> b!48435 m!75289))

(assert (=> b!48435 m!75241))

(declare-fun m!75291 () Bool)

(assert (=> b!48435 m!75291))

(declare-fun m!75293 () Bool)

(assert (=> b!48435 m!75293))

(assert (=> b!48435 m!75279))

(declare-fun m!75295 () Bool)

(assert (=> b!48434 m!75295))

(declare-fun m!75297 () Bool)

(assert (=> b!48432 m!75297))

(declare-fun m!75299 () Bool)

(assert (=> b!48432 m!75299))

(assert (=> b!48213 d!14690))

(declare-fun d!14778 () Bool)

(declare-fun e!32072 () Bool)

(assert (=> d!14778 e!32072))

(declare-fun c!3387 () Bool)

(assert (=> d!14778 (= c!3387 (= lt!74577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!75052 () List!547)

(declare-datatypes ((tuple2!4574 0))(
  ( (tuple2!4575 (_1!2386 List!547) (_2!2386 BitStream!1812)) )
))
(declare-fun e!32073 () tuple2!4574)

(assert (=> d!14778 (= lt!75052 (_1!2386 e!32073))))

(declare-fun c!3388 () Bool)

(assert (=> d!14778 (= c!3388 (= lt!74577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14778 (bvsge lt!74577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14778 (= (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_1!2382 lt!74571) lt!74577) lt!75052)))

(declare-fun b!48447 () Bool)

(declare-fun lt!75051 () (_ BitVec 64))

(declare-datatypes ((tuple2!4576 0))(
  ( (tuple2!4577 (_1!2387 Bool) (_2!2387 BitStream!1812)) )
))
(declare-fun lt!75050 () tuple2!4576)

(assert (=> b!48447 (= e!32073 (tuple2!4575 (Cons!543 (_1!2387 lt!75050) (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_2!2387 lt!75050) (bvsub lt!74577 lt!75051))) (_2!2387 lt!75050)))))

(declare-fun readBit!0 (BitStream!1812) tuple2!4576)

(assert (=> b!48447 (= lt!75050 (readBit!0 (_1!2382 lt!74571)))))

(assert (=> b!48447 (= lt!75051 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48448 () Bool)

(declare-fun isEmpty!140 (List!547) Bool)

(assert (=> b!48448 (= e!32072 (isEmpty!140 lt!75052))))

(declare-fun b!48449 () Bool)

(assert (=> b!48449 (= e!32072 (> (length!242 lt!75052) 0))))

(declare-fun b!48446 () Bool)

(assert (=> b!48446 (= e!32073 (tuple2!4575 Nil!544 (_1!2382 lt!74571)))))

(assert (= (and d!14778 c!3388) b!48446))

(assert (= (and d!14778 (not c!3388)) b!48447))

(assert (= (and d!14778 c!3387) b!48448))

(assert (= (and d!14778 (not c!3387)) b!48449))

(declare-fun m!75301 () Bool)

(assert (=> b!48447 m!75301))

(declare-fun m!75303 () Bool)

(assert (=> b!48447 m!75303))

(declare-fun m!75305 () Bool)

(assert (=> b!48448 m!75305))

(declare-fun m!75307 () Bool)

(assert (=> b!48449 m!75307))

(assert (=> b!48202 d!14778))

(declare-fun lt!75054 () (_ BitVec 64))

(declare-fun lt!75053 () (_ BitVec 64))

(declare-fun lt!75068 () tuple2!4566)

(declare-fun e!32074 () Bool)

(declare-fun b!48450 () Bool)

(assert (=> b!48450 (= e!32074 (= (_1!2382 lt!75068) (withMovedBitIndex!0 (_2!2382 lt!75068) (bvsub lt!75054 lt!75053))))))

(assert (=> b!48450 (or (= (bvand lt!75054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75054 lt!75053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48450 (= lt!75053 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74570))) (currentByte!2906 (_2!2381 lt!74570)) (currentBit!2901 (_2!2381 lt!74570))))))

(assert (=> b!48450 (= lt!75054 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))))))

(declare-fun b!48451 () Bool)

(declare-fun e!32075 () Unit!3380)

(declare-fun Unit!3392 () Unit!3380)

(assert (=> b!48451 (= e!32075 Unit!3392)))

(declare-fun b!48452 () Bool)

(declare-fun res!40705 () Bool)

(assert (=> b!48452 (=> (not res!40705) (not e!32074))))

(assert (=> b!48452 (= res!40705 (isPrefixOf!0 (_1!2382 lt!75068) (_2!2381 lt!74573)))))

(declare-fun b!48453 () Bool)

(declare-fun lt!75058 () Unit!3380)

(assert (=> b!48453 (= e!32075 lt!75058)))

(declare-fun lt!75070 () (_ BitVec 64))

(assert (=> b!48453 (= lt!75070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75059 () (_ BitVec 64))

(assert (=> b!48453 (= lt!75059 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))))))

(assert (=> b!48453 (= lt!75058 (arrayBitRangesEqSymmetric!0 (buf!1395 (_2!2381 lt!74573)) (buf!1395 (_2!2381 lt!74570)) lt!75070 lt!75059))))

(assert (=> b!48453 (arrayBitRangesEq!0 (buf!1395 (_2!2381 lt!74570)) (buf!1395 (_2!2381 lt!74573)) lt!75070 lt!75059)))

(declare-fun d!14780 () Bool)

(assert (=> d!14780 e!32074))

(declare-fun res!40703 () Bool)

(assert (=> d!14780 (=> (not res!40703) (not e!32074))))

(assert (=> d!14780 (= res!40703 (isPrefixOf!0 (_1!2382 lt!75068) (_2!2382 lt!75068)))))

(declare-fun lt!75072 () BitStream!1812)

(assert (=> d!14780 (= lt!75068 (tuple2!4567 lt!75072 (_2!2381 lt!74570)))))

(declare-fun lt!75063 () Unit!3380)

(declare-fun lt!75055 () Unit!3380)

(assert (=> d!14780 (= lt!75063 lt!75055)))

(assert (=> d!14780 (isPrefixOf!0 lt!75072 (_2!2381 lt!74570))))

(assert (=> d!14780 (= lt!75055 (lemmaIsPrefixTransitive!0 lt!75072 (_2!2381 lt!74570) (_2!2381 lt!74570)))))

(declare-fun lt!75067 () Unit!3380)

(declare-fun lt!75060 () Unit!3380)

(assert (=> d!14780 (= lt!75067 lt!75060)))

(assert (=> d!14780 (isPrefixOf!0 lt!75072 (_2!2381 lt!74570))))

(assert (=> d!14780 (= lt!75060 (lemmaIsPrefixTransitive!0 lt!75072 (_2!2381 lt!74573) (_2!2381 lt!74570)))))

(declare-fun lt!75066 () Unit!3380)

(assert (=> d!14780 (= lt!75066 e!32075)))

(declare-fun c!3389 () Bool)

(assert (=> d!14780 (= c!3389 (not (= (size!1043 (buf!1395 (_2!2381 lt!74573))) #b00000000000000000000000000000000)))))

(declare-fun lt!75064 () Unit!3380)

(declare-fun lt!75069 () Unit!3380)

(assert (=> d!14780 (= lt!75064 lt!75069)))

(assert (=> d!14780 (isPrefixOf!0 (_2!2381 lt!74570) (_2!2381 lt!74570))))

(assert (=> d!14780 (= lt!75069 (lemmaIsPrefixRefl!0 (_2!2381 lt!74570)))))

(declare-fun lt!75062 () Unit!3380)

(declare-fun lt!75071 () Unit!3380)

(assert (=> d!14780 (= lt!75062 lt!75071)))

(assert (=> d!14780 (= lt!75071 (lemmaIsPrefixRefl!0 (_2!2381 lt!74570)))))

(declare-fun lt!75057 () Unit!3380)

(declare-fun lt!75056 () Unit!3380)

(assert (=> d!14780 (= lt!75057 lt!75056)))

(assert (=> d!14780 (isPrefixOf!0 lt!75072 lt!75072)))

(assert (=> d!14780 (= lt!75056 (lemmaIsPrefixRefl!0 lt!75072))))

(declare-fun lt!75065 () Unit!3380)

(declare-fun lt!75061 () Unit!3380)

(assert (=> d!14780 (= lt!75065 lt!75061)))

(assert (=> d!14780 (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!74573))))

(assert (=> d!14780 (= lt!75061 (lemmaIsPrefixRefl!0 (_2!2381 lt!74573)))))

(assert (=> d!14780 (= lt!75072 (BitStream!1813 (buf!1395 (_2!2381 lt!74570)) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))))))

(assert (=> d!14780 (isPrefixOf!0 (_2!2381 lt!74573) (_2!2381 lt!74570))))

(assert (=> d!14780 (= (reader!0 (_2!2381 lt!74573) (_2!2381 lt!74570)) lt!75068)))

(declare-fun b!48454 () Bool)

(declare-fun res!40704 () Bool)

(assert (=> b!48454 (=> (not res!40704) (not e!32074))))

(assert (=> b!48454 (= res!40704 (isPrefixOf!0 (_2!2382 lt!75068) (_2!2381 lt!74570)))))

(assert (= (and d!14780 c!3389) b!48453))

(assert (= (and d!14780 (not c!3389)) b!48451))

(assert (= (and d!14780 res!40703) b!48452))

(assert (= (and b!48452 res!40705) b!48454))

(assert (= (and b!48454 res!40704) b!48450))

(assert (=> b!48453 m!74851))

(declare-fun m!75309 () Bool)

(assert (=> b!48453 m!75309))

(declare-fun m!75311 () Bool)

(assert (=> b!48453 m!75311))

(declare-fun m!75313 () Bool)

(assert (=> b!48454 m!75313))

(declare-fun m!75315 () Bool)

(assert (=> b!48450 m!75315))

(assert (=> b!48450 m!74905))

(assert (=> b!48450 m!74851))

(declare-fun m!75317 () Bool)

(assert (=> b!48452 m!75317))

(declare-fun m!75319 () Bool)

(assert (=> d!14780 m!75319))

(assert (=> d!14780 m!75017))

(declare-fun m!75321 () Bool)

(assert (=> d!14780 m!75321))

(assert (=> d!14780 m!74837))

(declare-fun m!75323 () Bool)

(assert (=> d!14780 m!75323))

(declare-fun m!75325 () Bool)

(assert (=> d!14780 m!75325))

(declare-fun m!75327 () Bool)

(assert (=> d!14780 m!75327))

(declare-fun m!75329 () Bool)

(assert (=> d!14780 m!75329))

(declare-fun m!75331 () Bool)

(assert (=> d!14780 m!75331))

(declare-fun m!75333 () Bool)

(assert (=> d!14780 m!75333))

(assert (=> d!14780 m!75019))

(assert (=> b!48202 d!14780))

(declare-fun d!14782 () Bool)

(assert (=> d!14782 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!74577)))

(declare-fun lt!75073 () Unit!3380)

(assert (=> d!14782 (= lt!75073 (choose!9 (_2!2381 lt!74573) (buf!1395 (_2!2381 lt!74570)) lt!74577 (BitStream!1813 (buf!1395 (_2!2381 lt!74570)) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573)))))))

(assert (=> d!14782 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2381 lt!74573) (buf!1395 (_2!2381 lt!74570)) lt!74577) lt!75073)))

(declare-fun bs!3792 () Bool)

(assert (= bs!3792 d!14782))

(assert (=> bs!3792 m!74889))

(declare-fun m!75335 () Bool)

(assert (=> bs!3792 m!75335))

(assert (=> b!48202 d!14782))

(declare-fun d!14784 () Bool)

(declare-fun e!32076 () Bool)

(assert (=> d!14784 e!32076))

(declare-fun c!3390 () Bool)

(assert (=> d!14784 (= c!3390 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!75076 () List!547)

(declare-fun e!32077 () tuple2!4574)

(assert (=> d!14784 (= lt!75076 (_1!2386 e!32077))))

(declare-fun c!3391 () Bool)

(assert (=> d!14784 (= c!3391 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14784 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14784 (= (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_1!2382 lt!74579) (bvsub to!314 i!635)) lt!75076)))

(declare-fun lt!75074 () tuple2!4576)

(declare-fun lt!75075 () (_ BitVec 64))

(declare-fun b!48456 () Bool)

(assert (=> b!48456 (= e!32077 (tuple2!4575 (Cons!543 (_1!2387 lt!75074) (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_2!2387 lt!75074) (bvsub (bvsub to!314 i!635) lt!75075))) (_2!2387 lt!75074)))))

(assert (=> b!48456 (= lt!75074 (readBit!0 (_1!2382 lt!74579)))))

(assert (=> b!48456 (= lt!75075 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48457 () Bool)

(assert (=> b!48457 (= e!32076 (isEmpty!140 lt!75076))))

(declare-fun b!48458 () Bool)

(assert (=> b!48458 (= e!32076 (> (length!242 lt!75076) 0))))

(declare-fun b!48455 () Bool)

(assert (=> b!48455 (= e!32077 (tuple2!4575 Nil!544 (_1!2382 lt!74579)))))

(assert (= (and d!14784 c!3391) b!48455))

(assert (= (and d!14784 (not c!3391)) b!48456))

(assert (= (and d!14784 c!3390) b!48457))

(assert (= (and d!14784 (not c!3390)) b!48458))

(declare-fun m!75337 () Bool)

(assert (=> b!48456 m!75337))

(declare-fun m!75339 () Bool)

(assert (=> b!48456 m!75339))

(declare-fun m!75341 () Bool)

(assert (=> b!48457 m!75341))

(declare-fun m!75343 () Bool)

(assert (=> b!48458 m!75343))

(assert (=> b!48202 d!14784))

(declare-fun d!14786 () Bool)

(assert (=> d!14786 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3793 () Bool)

(assert (= bs!3793 d!14786))

(declare-fun m!75345 () Bool)

(assert (=> bs!3793 m!75345))

(assert (=> b!48202 d!14786))

(declare-fun lt!75078 () (_ BitVec 64))

(declare-fun e!32078 () Bool)

(declare-fun b!48459 () Bool)

(declare-fun lt!75077 () (_ BitVec 64))

(declare-fun lt!75092 () tuple2!4566)

(assert (=> b!48459 (= e!32078 (= (_1!2382 lt!75092) (withMovedBitIndex!0 (_2!2382 lt!75092) (bvsub lt!75078 lt!75077))))))

(assert (=> b!48459 (or (= (bvand lt!75078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75077 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75078 lt!75077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48459 (= lt!75077 (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74570))) (currentByte!2906 (_2!2381 lt!74570)) (currentBit!2901 (_2!2381 lt!74570))))))

(assert (=> b!48459 (= lt!75078 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(declare-fun b!48460 () Bool)

(declare-fun e!32079 () Unit!3380)

(declare-fun Unit!3393 () Unit!3380)

(assert (=> b!48460 (= e!32079 Unit!3393)))

(declare-fun b!48461 () Bool)

(declare-fun res!40708 () Bool)

(assert (=> b!48461 (=> (not res!40708) (not e!32078))))

(assert (=> b!48461 (= res!40708 (isPrefixOf!0 (_1!2382 lt!75092) thiss!1379))))

(declare-fun b!48462 () Bool)

(declare-fun lt!75082 () Unit!3380)

(assert (=> b!48462 (= e!32079 lt!75082)))

(declare-fun lt!75094 () (_ BitVec 64))

(assert (=> b!48462 (= lt!75094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75083 () (_ BitVec 64))

(assert (=> b!48462 (= lt!75083 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(assert (=> b!48462 (= lt!75082 (arrayBitRangesEqSymmetric!0 (buf!1395 thiss!1379) (buf!1395 (_2!2381 lt!74570)) lt!75094 lt!75083))))

(assert (=> b!48462 (arrayBitRangesEq!0 (buf!1395 (_2!2381 lt!74570)) (buf!1395 thiss!1379) lt!75094 lt!75083)))

(declare-fun d!14788 () Bool)

(assert (=> d!14788 e!32078))

(declare-fun res!40706 () Bool)

(assert (=> d!14788 (=> (not res!40706) (not e!32078))))

(assert (=> d!14788 (= res!40706 (isPrefixOf!0 (_1!2382 lt!75092) (_2!2382 lt!75092)))))

(declare-fun lt!75096 () BitStream!1812)

(assert (=> d!14788 (= lt!75092 (tuple2!4567 lt!75096 (_2!2381 lt!74570)))))

(declare-fun lt!75087 () Unit!3380)

(declare-fun lt!75079 () Unit!3380)

(assert (=> d!14788 (= lt!75087 lt!75079)))

(assert (=> d!14788 (isPrefixOf!0 lt!75096 (_2!2381 lt!74570))))

(assert (=> d!14788 (= lt!75079 (lemmaIsPrefixTransitive!0 lt!75096 (_2!2381 lt!74570) (_2!2381 lt!74570)))))

(declare-fun lt!75091 () Unit!3380)

(declare-fun lt!75084 () Unit!3380)

(assert (=> d!14788 (= lt!75091 lt!75084)))

(assert (=> d!14788 (isPrefixOf!0 lt!75096 (_2!2381 lt!74570))))

(assert (=> d!14788 (= lt!75084 (lemmaIsPrefixTransitive!0 lt!75096 thiss!1379 (_2!2381 lt!74570)))))

(declare-fun lt!75090 () Unit!3380)

(assert (=> d!14788 (= lt!75090 e!32079)))

(declare-fun c!3392 () Bool)

(assert (=> d!14788 (= c!3392 (not (= (size!1043 (buf!1395 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!75088 () Unit!3380)

(declare-fun lt!75093 () Unit!3380)

(assert (=> d!14788 (= lt!75088 lt!75093)))

(assert (=> d!14788 (isPrefixOf!0 (_2!2381 lt!74570) (_2!2381 lt!74570))))

(assert (=> d!14788 (= lt!75093 (lemmaIsPrefixRefl!0 (_2!2381 lt!74570)))))

(declare-fun lt!75086 () Unit!3380)

(declare-fun lt!75095 () Unit!3380)

(assert (=> d!14788 (= lt!75086 lt!75095)))

(assert (=> d!14788 (= lt!75095 (lemmaIsPrefixRefl!0 (_2!2381 lt!74570)))))

(declare-fun lt!75081 () Unit!3380)

(declare-fun lt!75080 () Unit!3380)

(assert (=> d!14788 (= lt!75081 lt!75080)))

(assert (=> d!14788 (isPrefixOf!0 lt!75096 lt!75096)))

(assert (=> d!14788 (= lt!75080 (lemmaIsPrefixRefl!0 lt!75096))))

(declare-fun lt!75089 () Unit!3380)

(declare-fun lt!75085 () Unit!3380)

(assert (=> d!14788 (= lt!75089 lt!75085)))

(assert (=> d!14788 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14788 (= lt!75085 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14788 (= lt!75096 (BitStream!1813 (buf!1395 (_2!2381 lt!74570)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(assert (=> d!14788 (isPrefixOf!0 thiss!1379 (_2!2381 lt!74570))))

(assert (=> d!14788 (= (reader!0 thiss!1379 (_2!2381 lt!74570)) lt!75092)))

(declare-fun b!48463 () Bool)

(declare-fun res!40707 () Bool)

(assert (=> b!48463 (=> (not res!40707) (not e!32078))))

(assert (=> b!48463 (= res!40707 (isPrefixOf!0 (_2!2382 lt!75092) (_2!2381 lt!74570)))))

(assert (= (and d!14788 c!3392) b!48462))

(assert (= (and d!14788 (not c!3392)) b!48460))

(assert (= (and d!14788 res!40706) b!48461))

(assert (= (and b!48461 res!40708) b!48463))

(assert (= (and b!48463 res!40707) b!48459))

(assert (=> b!48462 m!74903))

(declare-fun m!75347 () Bool)

(assert (=> b!48462 m!75347))

(declare-fun m!75349 () Bool)

(assert (=> b!48462 m!75349))

(declare-fun m!75351 () Bool)

(assert (=> b!48463 m!75351))

(declare-fun m!75353 () Bool)

(assert (=> b!48459 m!75353))

(assert (=> b!48459 m!74905))

(assert (=> b!48459 m!74903))

(declare-fun m!75355 () Bool)

(assert (=> b!48461 m!75355))

(declare-fun m!75357 () Bool)

(assert (=> d!14788 m!75357))

(assert (=> d!14788 m!74899))

(declare-fun m!75359 () Bool)

(assert (=> d!14788 m!75359))

(assert (=> d!14788 m!74847))

(declare-fun m!75361 () Bool)

(assert (=> d!14788 m!75361))

(assert (=> d!14788 m!75325))

(assert (=> d!14788 m!75327))

(declare-fun m!75363 () Bool)

(assert (=> d!14788 m!75363))

(declare-fun m!75365 () Bool)

(assert (=> d!14788 m!75365))

(declare-fun m!75367 () Bool)

(assert (=> d!14788 m!75367))

(assert (=> d!14788 m!74901))

(assert (=> b!48202 d!14788))

(declare-fun d!14790 () Bool)

(assert (=> d!14790 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!75097 () Unit!3380)

(assert (=> d!14790 (= lt!75097 (choose!9 thiss!1379 (buf!1395 (_2!2381 lt!74570)) (bvsub to!314 i!635) (BitStream!1813 (buf!1395 (_2!2381 lt!74570)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379))))))

(assert (=> d!14790 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1395 (_2!2381 lt!74570)) (bvsub to!314 i!635)) lt!75097)))

(declare-fun bs!3794 () Bool)

(assert (= bs!3794 d!14790))

(assert (=> bs!3794 m!74893))

(declare-fun m!75369 () Bool)

(assert (=> bs!3794 m!75369))

(assert (=> b!48202 d!14790))

(declare-fun d!14792 () Bool)

(assert (=> d!14792 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!74577) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573)))) lt!74577))))

(declare-fun bs!3795 () Bool)

(assert (= bs!3795 d!14792))

(declare-fun m!75371 () Bool)

(assert (=> bs!3795 m!75371))

(assert (=> b!48202 d!14792))

(declare-fun d!14794 () Bool)

(assert (=> d!14794 (= (head!366 (byteArrayBitContentToList!0 (_2!2381 lt!74573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!662 (byteArrayBitContentToList!0 (_2!2381 lt!74573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48212 d!14794))

(declare-fun d!14796 () Bool)

(declare-fun c!3395 () Bool)

(assert (=> d!14796 (= c!3395 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32082 () List!547)

(assert (=> d!14796 (= (byteArrayBitContentToList!0 (_2!2381 lt!74573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!32082)))

(declare-fun b!48468 () Bool)

(assert (=> b!48468 (= e!32082 Nil!544)))

(declare-fun b!48469 () Bool)

(assert (=> b!48469 (= e!32082 (Cons!543 (not (= (bvand ((_ sign_extend 24) (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2381 lt!74573) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14796 c!3395) b!48468))

(assert (= (and d!14796 (not c!3395)) b!48469))

(assert (=> b!48469 m!74853))

(declare-fun m!75373 () Bool)

(assert (=> b!48469 m!75373))

(declare-fun m!75375 () Bool)

(assert (=> b!48469 m!75375))

(assert (=> b!48212 d!14796))

(declare-fun d!14798 () Bool)

(assert (=> d!14798 (= (head!366 (bitStreamReadBitsIntoList!0 (_2!2381 lt!74573) (_1!2382 lt!74581) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!662 (bitStreamReadBitsIntoList!0 (_2!2381 lt!74573) (_1!2382 lt!74581) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48212 d!14798))

(declare-fun d!14800 () Bool)

(declare-fun e!32083 () Bool)

(assert (=> d!14800 e!32083))

(declare-fun c!3396 () Bool)

(assert (=> d!14800 (= c!3396 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!75100 () List!547)

(declare-fun e!32084 () tuple2!4574)

(assert (=> d!14800 (= lt!75100 (_1!2386 e!32084))))

(declare-fun c!3397 () Bool)

(assert (=> d!14800 (= c!3397 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14800 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14800 (= (bitStreamReadBitsIntoList!0 (_2!2381 lt!74573) (_1!2382 lt!74581) #b0000000000000000000000000000000000000000000000000000000000000001) lt!75100)))

(declare-fun b!48471 () Bool)

(declare-fun lt!75098 () tuple2!4576)

(declare-fun lt!75099 () (_ BitVec 64))

(assert (=> b!48471 (= e!32084 (tuple2!4575 (Cons!543 (_1!2387 lt!75098) (bitStreamReadBitsIntoList!0 (_2!2381 lt!74573) (_2!2387 lt!75098) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!75099))) (_2!2387 lt!75098)))))

(assert (=> b!48471 (= lt!75098 (readBit!0 (_1!2382 lt!74581)))))

(assert (=> b!48471 (= lt!75099 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48472 () Bool)

(assert (=> b!48472 (= e!32083 (isEmpty!140 lt!75100))))

(declare-fun b!48473 () Bool)

(assert (=> b!48473 (= e!32083 (> (length!242 lt!75100) 0))))

(declare-fun b!48470 () Bool)

(assert (=> b!48470 (= e!32084 (tuple2!4575 Nil!544 (_1!2382 lt!74581)))))

(assert (= (and d!14800 c!3397) b!48470))

(assert (= (and d!14800 (not c!3397)) b!48471))

(assert (= (and d!14800 c!3396) b!48472))

(assert (= (and d!14800 (not c!3396)) b!48473))

(declare-fun m!75377 () Bool)

(assert (=> b!48471 m!75377))

(declare-fun m!75379 () Bool)

(assert (=> b!48471 m!75379))

(declare-fun m!75381 () Bool)

(assert (=> b!48472 m!75381))

(declare-fun m!75383 () Bool)

(assert (=> b!48473 m!75383))

(assert (=> b!48212 d!14800))

(declare-fun d!14802 () Bool)

(declare-fun e!32087 () Bool)

(assert (=> d!14802 e!32087))

(declare-fun res!40713 () Bool)

(assert (=> d!14802 (=> (not res!40713) (not e!32087))))

(declare-fun lt!75116 () (_ BitVec 64))

(declare-fun lt!75114 () (_ BitVec 64))

(declare-fun lt!75113 () (_ BitVec 64))

(assert (=> d!14802 (= res!40713 (= lt!75113 (bvsub lt!75116 lt!75114)))))

(assert (=> d!14802 (or (= (bvand lt!75116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75116 lt!75114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14802 (= lt!75114 (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573)))))))

(declare-fun lt!75117 () (_ BitVec 64))

(declare-fun lt!75115 () (_ BitVec 64))

(assert (=> d!14802 (= lt!75116 (bvmul lt!75117 lt!75115))))

(assert (=> d!14802 (or (= lt!75117 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75115 (bvsdiv (bvmul lt!75117 lt!75115) lt!75117)))))

(assert (=> d!14802 (= lt!75115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14802 (= lt!75117 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))))))

(assert (=> d!14802 (= lt!75113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573)))))))

(assert (=> d!14802 (invariant!0 (currentBit!2901 (_2!2381 lt!74573)) (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74573))))))

(assert (=> d!14802 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573))) lt!75113)))

(declare-fun b!48478 () Bool)

(declare-fun res!40714 () Bool)

(assert (=> b!48478 (=> (not res!40714) (not e!32087))))

(assert (=> b!48478 (= res!40714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75113))))

(declare-fun b!48479 () Bool)

(declare-fun lt!75118 () (_ BitVec 64))

(assert (=> b!48479 (= e!32087 (bvsle lt!75113 (bvmul lt!75118 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48479 (or (= lt!75118 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75118 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75118)))))

(assert (=> b!48479 (= lt!75118 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))))))

(assert (= (and d!14802 res!40713) b!48478))

(assert (= (and b!48478 res!40714) b!48479))

(declare-fun m!75385 () Bool)

(assert (=> d!14802 m!75385))

(assert (=> d!14802 m!74819))

(assert (=> b!48214 d!14802))

(declare-fun d!14804 () Bool)

(assert (=> d!14804 (= (head!366 lt!74578) (h!662 lt!74578))))

(assert (=> b!48203 d!14804))

(declare-fun d!14806 () Bool)

(assert (=> d!14806 (= (head!366 (byteArrayBitContentToList!0 (_2!2381 lt!74570) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!662 (byteArrayBitContentToList!0 (_2!2381 lt!74570) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!48205 d!14806))

(declare-fun d!14808 () Bool)

(declare-fun c!3398 () Bool)

(assert (=> d!14808 (= c!3398 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32088 () List!547)

(assert (=> d!14808 (= (byteArrayBitContentToList!0 (_2!2381 lt!74570) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!32088)))

(declare-fun b!48480 () Bool)

(assert (=> b!48480 (= e!32088 Nil!544)))

(declare-fun b!48481 () Bool)

(assert (=> b!48481 (= e!32088 (Cons!543 (not (= (bvand ((_ sign_extend 24) (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2381 lt!74570) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14808 c!3398) b!48480))

(assert (= (and d!14808 (not c!3398)) b!48481))

(assert (=> b!48481 m!74853))

(assert (=> b!48481 m!75373))

(declare-fun m!75387 () Bool)

(assert (=> b!48481 m!75387))

(assert (=> b!48205 d!14808))

(declare-fun d!14810 () Bool)

(assert (=> d!14810 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3796 () Bool)

(assert (= bs!3796 d!14810))

(assert (=> bs!3796 m!74853))

(assert (=> bs!3796 m!75373))

(assert (=> b!48205 d!14810))

(declare-fun d!14812 () Bool)

(assert (=> d!14812 (= (invariant!0 (currentBit!2901 (_2!2381 lt!74573)) (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74573)))) (and (bvsge (currentBit!2901 (_2!2381 lt!74573)) #b00000000000000000000000000000000) (bvslt (currentBit!2901 (_2!2381 lt!74573)) #b00000000000000000000000000001000) (bvsge (currentByte!2906 (_2!2381 lt!74573)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74573)))) (and (= (currentBit!2901 (_2!2381 lt!74573)) #b00000000000000000000000000000000) (= (currentByte!2906 (_2!2381 lt!74573)) (size!1043 (buf!1395 (_2!2381 lt!74573))))))))))

(assert (=> b!48204 d!14812))

(declare-fun d!14814 () Bool)

(assert (=> d!14814 (= (tail!233 lt!74578) (t!1297 lt!74578))))

(assert (=> b!48217 d!14814))

(declare-fun d!14816 () Bool)

(declare-fun e!32091 () Bool)

(assert (=> d!14816 e!32091))

(declare-fun res!40717 () Bool)

(assert (=> d!14816 (=> (not res!40717) (not e!32091))))

(declare-fun lt!75124 () (_ BitVec 64))

(assert (=> d!14816 (= res!40717 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75124 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!75124) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14816 (= lt!75124 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75123 () Unit!3380)

(declare-fun choose!42 (BitStream!1812 BitStream!1812 BitStream!1812 BitStream!1812 (_ BitVec 64) List!547) Unit!3380)

(assert (=> d!14816 (= lt!75123 (choose!42 (_2!2381 lt!74570) (_2!2381 lt!74570) (_1!2382 lt!74579) (_1!2382 lt!74571) (bvsub to!314 i!635) lt!74578))))

(assert (=> d!14816 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14816 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2381 lt!74570) (_2!2381 lt!74570) (_1!2382 lt!74579) (_1!2382 lt!74571) (bvsub to!314 i!635) lt!74578) lt!75123)))

(declare-fun b!48484 () Bool)

(assert (=> b!48484 (= e!32091 (= (bitStreamReadBitsIntoList!0 (_2!2381 lt!74570) (_1!2382 lt!74571) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!233 lt!74578)))))

(assert (= (and d!14816 res!40717) b!48484))

(declare-fun m!75389 () Bool)

(assert (=> d!14816 m!75389))

(declare-fun m!75391 () Bool)

(assert (=> b!48484 m!75391))

(assert (=> b!48484 m!74867))

(assert (=> b!48217 d!14816))

(declare-fun d!14818 () Bool)

(declare-fun res!40718 () Bool)

(declare-fun e!32093 () Bool)

(assert (=> d!14818 (=> (not res!40718) (not e!32093))))

(assert (=> d!14818 (= res!40718 (= (size!1043 (buf!1395 thiss!1379)) (size!1043 (buf!1395 thiss!1379))))))

(assert (=> d!14818 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!32093)))

(declare-fun b!48485 () Bool)

(declare-fun res!40719 () Bool)

(assert (=> b!48485 (=> (not res!40719) (not e!32093))))

(assert (=> b!48485 (= res!40719 (bvsle (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)) (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379))))))

(declare-fun b!48486 () Bool)

(declare-fun e!32092 () Bool)

(assert (=> b!48486 (= e!32093 e!32092)))

(declare-fun res!40720 () Bool)

(assert (=> b!48486 (=> res!40720 e!32092)))

(assert (=> b!48486 (= res!40720 (= (size!1043 (buf!1395 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48487 () Bool)

(assert (=> b!48487 (= e!32092 (arrayBitRangesEq!0 (buf!1395 thiss!1379) (buf!1395 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379))))))

(assert (= (and d!14818 res!40718) b!48485))

(assert (= (and b!48485 res!40719) b!48486))

(assert (= (and b!48486 (not res!40720)) b!48487))

(assert (=> b!48485 m!74903))

(assert (=> b!48485 m!74903))

(assert (=> b!48487 m!74903))

(assert (=> b!48487 m!74903))

(declare-fun m!75393 () Bool)

(assert (=> b!48487 m!75393))

(assert (=> b!48206 d!14818))

(declare-fun d!14820 () Bool)

(assert (=> d!14820 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!75127 () Unit!3380)

(declare-fun choose!11 (BitStream!1812) Unit!3380)

(assert (=> d!14820 (= lt!75127 (choose!11 thiss!1379))))

(assert (=> d!14820 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!75127)))

(declare-fun bs!3798 () Bool)

(assert (= bs!3798 d!14820))

(assert (=> bs!3798 m!74899))

(declare-fun m!75395 () Bool)

(assert (=> bs!3798 m!75395))

(assert (=> b!48206 d!14820))

(declare-fun d!14822 () Bool)

(declare-fun e!32094 () Bool)

(assert (=> d!14822 e!32094))

(declare-fun res!40721 () Bool)

(assert (=> d!14822 (=> (not res!40721) (not e!32094))))

(declare-fun lt!75128 () (_ BitVec 64))

(declare-fun lt!75129 () (_ BitVec 64))

(declare-fun lt!75131 () (_ BitVec 64))

(assert (=> d!14822 (= res!40721 (= lt!75128 (bvsub lt!75131 lt!75129)))))

(assert (=> d!14822 (or (= (bvand lt!75131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75131 lt!75129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14822 (= lt!75129 (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 thiss!1379))) ((_ sign_extend 32) (currentByte!2906 thiss!1379)) ((_ sign_extend 32) (currentBit!2901 thiss!1379))))))

(declare-fun lt!75132 () (_ BitVec 64))

(declare-fun lt!75130 () (_ BitVec 64))

(assert (=> d!14822 (= lt!75131 (bvmul lt!75132 lt!75130))))

(assert (=> d!14822 (or (= lt!75132 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75130 (bvsdiv (bvmul lt!75132 lt!75130) lt!75132)))))

(assert (=> d!14822 (= lt!75130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14822 (= lt!75132 ((_ sign_extend 32) (size!1043 (buf!1395 thiss!1379))))))

(assert (=> d!14822 (= lt!75128 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2906 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2901 thiss!1379))))))

(assert (=> d!14822 (invariant!0 (currentBit!2901 thiss!1379) (currentByte!2906 thiss!1379) (size!1043 (buf!1395 thiss!1379)))))

(assert (=> d!14822 (= (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)) lt!75128)))

(declare-fun b!48488 () Bool)

(declare-fun res!40722 () Bool)

(assert (=> b!48488 (=> (not res!40722) (not e!32094))))

(assert (=> b!48488 (= res!40722 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75128))))

(declare-fun b!48489 () Bool)

(declare-fun lt!75133 () (_ BitVec 64))

(assert (=> b!48489 (= e!32094 (bvsle lt!75128 (bvmul lt!75133 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48489 (or (= lt!75133 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75133 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75133)))))

(assert (=> b!48489 (= lt!75133 ((_ sign_extend 32) (size!1043 (buf!1395 thiss!1379))))))

(assert (= (and d!14822 res!40721) b!48488))

(assert (= (and b!48488 res!40722) b!48489))

(assert (=> d!14822 m!74999))

(declare-fun m!75397 () Bool)

(assert (=> d!14822 m!75397))

(assert (=> b!48206 d!14822))

(declare-fun d!14824 () Bool)

(declare-fun e!32095 () Bool)

(assert (=> d!14824 e!32095))

(declare-fun res!40723 () Bool)

(assert (=> d!14824 (=> (not res!40723) (not e!32095))))

(declare-fun lt!75134 () (_ BitVec 64))

(declare-fun lt!75137 () (_ BitVec 64))

(declare-fun lt!75135 () (_ BitVec 64))

(assert (=> d!14824 (= res!40723 (= lt!75134 (bvsub lt!75137 lt!75135)))))

(assert (=> d!14824 (or (= (bvand lt!75137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75135 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75137 lt!75135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14824 (= lt!75135 (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74570))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74570)))))))

(declare-fun lt!75138 () (_ BitVec 64))

(declare-fun lt!75136 () (_ BitVec 64))

(assert (=> d!14824 (= lt!75137 (bvmul lt!75138 lt!75136))))

(assert (=> d!14824 (or (= lt!75138 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75136 (bvsdiv (bvmul lt!75138 lt!75136) lt!75138)))))

(assert (=> d!14824 (= lt!75136 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14824 (= lt!75138 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))))))

(assert (=> d!14824 (= lt!75134 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74570))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74570)))))))

(assert (=> d!14824 (invariant!0 (currentBit!2901 (_2!2381 lt!74570)) (currentByte!2906 (_2!2381 lt!74570)) (size!1043 (buf!1395 (_2!2381 lt!74570))))))

(assert (=> d!14824 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74570))) (currentByte!2906 (_2!2381 lt!74570)) (currentBit!2901 (_2!2381 lt!74570))) lt!75134)))

(declare-fun b!48490 () Bool)

(declare-fun res!40724 () Bool)

(assert (=> b!48490 (=> (not res!40724) (not e!32095))))

(assert (=> b!48490 (= res!40724 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75134))))

(declare-fun b!48491 () Bool)

(declare-fun lt!75139 () (_ BitVec 64))

(assert (=> b!48491 (= e!32095 (bvsle lt!75134 (bvmul lt!75139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48491 (or (= lt!75139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75139)))))

(assert (=> b!48491 (= lt!75139 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74570)))))))

(assert (= (and d!14824 res!40723) b!48490))

(assert (= (and b!48490 res!40724) b!48491))

(declare-fun m!75399 () Bool)

(assert (=> d!14824 m!75399))

(assert (=> d!14824 m!74835))

(assert (=> b!48216 d!14824))

(declare-fun d!14826 () Bool)

(declare-fun res!40725 () Bool)

(declare-fun e!32097 () Bool)

(assert (=> d!14826 (=> (not res!40725) (not e!32097))))

(assert (=> d!14826 (= res!40725 (= (size!1043 (buf!1395 thiss!1379)) (size!1043 (buf!1395 (_2!2381 lt!74573)))))))

(assert (=> d!14826 (= (isPrefixOf!0 thiss!1379 (_2!2381 lt!74573)) e!32097)))

(declare-fun b!48492 () Bool)

(declare-fun res!40726 () Bool)

(assert (=> b!48492 (=> (not res!40726) (not e!32097))))

(assert (=> b!48492 (= res!40726 (bvsle (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)) (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!74573))) (currentByte!2906 (_2!2381 lt!74573)) (currentBit!2901 (_2!2381 lt!74573)))))))

(declare-fun b!48493 () Bool)

(declare-fun e!32096 () Bool)

(assert (=> b!48493 (= e!32097 e!32096)))

(declare-fun res!40727 () Bool)

(assert (=> b!48493 (=> res!40727 e!32096)))

(assert (=> b!48493 (= res!40727 (= (size!1043 (buf!1395 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48494 () Bool)

(assert (=> b!48494 (= e!32096 (arrayBitRangesEq!0 (buf!1395 thiss!1379) (buf!1395 (_2!2381 lt!74573)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379))))))

(assert (= (and d!14826 res!40725) b!48492))

(assert (= (and b!48492 res!40726) b!48493))

(assert (= (and b!48493 (not res!40727)) b!48494))

(assert (=> b!48492 m!74903))

(assert (=> b!48492 m!74851))

(assert (=> b!48494 m!74903))

(assert (=> b!48494 m!74903))

(declare-fun m!75401 () Bool)

(assert (=> b!48494 m!75401))

(assert (=> b!48209 d!14826))

(declare-fun d!14828 () Bool)

(assert (=> d!14828 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) lt!74577) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573)))) lt!74577))))

(declare-fun bs!3799 () Bool)

(assert (= bs!3799 d!14828))

(assert (=> bs!3799 m!75385))

(assert (=> b!48209 d!14828))

(declare-fun d!14830 () Bool)

(declare-fun e!32100 () Bool)

(assert (=> d!14830 e!32100))

(declare-fun res!40730 () Bool)

(assert (=> d!14830 (=> (not res!40730) (not e!32100))))

(assert (=> d!14830 (= res!40730 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75142 () Unit!3380)

(declare-fun choose!27 (BitStream!1812 BitStream!1812 (_ BitVec 64) (_ BitVec 64)) Unit!3380)

(assert (=> d!14830 (= lt!75142 (choose!27 thiss!1379 (_2!2381 lt!74573) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14830 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!14830 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2381 lt!74573) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!75142)))

(declare-fun b!48497 () Bool)

(assert (=> b!48497 (= e!32100 (validate_offset_bits!1 ((_ sign_extend 32) (size!1043 (buf!1395 (_2!2381 lt!74573)))) ((_ sign_extend 32) (currentByte!2906 (_2!2381 lt!74573))) ((_ sign_extend 32) (currentBit!2901 (_2!2381 lt!74573))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14830 res!40730) b!48497))

(declare-fun m!75403 () Bool)

(assert (=> d!14830 m!75403))

(declare-fun m!75405 () Bool)

(assert (=> b!48497 m!75405))

(assert (=> b!48209 d!14830))

(declare-fun b!48515 () Bool)

(declare-fun res!40747 () Bool)

(declare-fun e!32109 () Bool)

(assert (=> b!48515 (=> (not res!40747) (not e!32109))))

(declare-fun lt!75170 () tuple2!4564)

(assert (=> b!48515 (= res!40747 (isPrefixOf!0 thiss!1379 (_2!2381 lt!75170)))))

(declare-fun b!48516 () Bool)

(declare-fun e!32111 () Bool)

(declare-datatypes ((tuple2!4578 0))(
  ( (tuple2!4579 (_1!2388 BitStream!1812) (_2!2388 Bool)) )
))
(declare-fun lt!75169 () tuple2!4578)

(assert (=> b!48516 (= e!32111 (= (bitIndex!0 (size!1043 (buf!1395 (_1!2388 lt!75169))) (currentByte!2906 (_1!2388 lt!75169)) (currentBit!2901 (_1!2388 lt!75169))) (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75170))) (currentByte!2906 (_2!2381 lt!75170)) (currentBit!2901 (_2!2381 lt!75170)))))))

(declare-fun b!48517 () Bool)

(assert (=> b!48517 (= e!32109 e!32111)))

(declare-fun res!40754 () Bool)

(assert (=> b!48517 (=> (not res!40754) (not e!32111))))

(declare-fun lt!75172 () Bool)

(assert (=> b!48517 (= res!40754 (and (= (_2!2388 lt!75169) lt!75172) (= (_1!2388 lt!75169) (_2!2381 lt!75170))))))

(declare-fun readBitPure!0 (BitStream!1812) tuple2!4578)

(declare-fun readerFrom!0 (BitStream!1812 (_ BitVec 32) (_ BitVec 32)) BitStream!1812)

(assert (=> b!48517 (= lt!75169 (readBitPure!0 (readerFrom!0 (_2!2381 lt!75170) (currentBit!2901 thiss!1379) (currentByte!2906 thiss!1379))))))

(declare-fun b!48518 () Bool)

(declare-fun res!40750 () Bool)

(declare-fun e!32112 () Bool)

(assert (=> b!48518 (=> (not res!40750) (not e!32112))))

(declare-fun lt!75177 () (_ BitVec 64))

(declare-fun lt!75174 () tuple2!4564)

(declare-fun lt!75176 () (_ BitVec 64))

(assert (=> b!48518 (= res!40750 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75174))) (currentByte!2906 (_2!2381 lt!75174)) (currentBit!2901 (_2!2381 lt!75174))) (bvadd lt!75176 lt!75177)))))

(assert (=> b!48518 (or (not (= (bvand lt!75176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75177 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!75176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!75176 lt!75177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48518 (= lt!75177 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!48518 (= lt!75176 (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)))))

(declare-fun d!14832 () Bool)

(assert (=> d!14832 e!32112))

(declare-fun res!40753 () Bool)

(assert (=> d!14832 (=> (not res!40753) (not e!32112))))

(assert (=> d!14832 (= res!40753 (= (size!1043 (buf!1395 (_2!2381 lt!75174))) (size!1043 (buf!1395 thiss!1379))))))

(declare-fun lt!75167 () (_ BitVec 8))

(declare-fun lt!75168 () array!2304)

(assert (=> d!14832 (= lt!75167 (select (arr!1566 lt!75168) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14832 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1043 lt!75168)))))

(assert (=> d!14832 (= lt!75168 (array!2305 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!75175 () tuple2!4564)

(assert (=> d!14832 (= lt!75174 (tuple2!4565 (_1!2381 lt!75175) (_2!2381 lt!75175)))))

(assert (=> d!14832 (= lt!75175 lt!75170)))

(assert (=> d!14832 e!32109))

(declare-fun res!40748 () Bool)

(assert (=> d!14832 (=> (not res!40748) (not e!32109))))

(assert (=> d!14832 (= res!40748 (= (size!1043 (buf!1395 thiss!1379)) (size!1043 (buf!1395 (_2!2381 lt!75170)))))))

(declare-fun appendBit!0 (BitStream!1812 Bool) tuple2!4564)

(assert (=> d!14832 (= lt!75170 (appendBit!0 thiss!1379 lt!75172))))

(assert (=> d!14832 (= lt!75172 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14832 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14832 (= (appendBitFromByte!0 thiss!1379 (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!75174)))

(declare-fun b!48519 () Bool)

(declare-fun e!32110 () Bool)

(assert (=> b!48519 (= e!32112 e!32110)))

(declare-fun res!40752 () Bool)

(assert (=> b!48519 (=> (not res!40752) (not e!32110))))

(declare-fun lt!75178 () tuple2!4578)

(assert (=> b!48519 (= res!40752 (and (= (_2!2388 lt!75178) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1566 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!75167)) #b00000000000000000000000000000000))) (= (_1!2388 lt!75178) (_2!2381 lt!75174))))))

(declare-fun lt!75173 () tuple2!4572)

(declare-fun lt!75171 () BitStream!1812)

(assert (=> b!48519 (= lt!75173 (readBits!0 lt!75171 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!48519 (= lt!75178 (readBitPure!0 lt!75171))))

(assert (=> b!48519 (= lt!75171 (readerFrom!0 (_2!2381 lt!75174) (currentBit!2901 thiss!1379) (currentByte!2906 thiss!1379)))))

(declare-fun b!48520 () Bool)

(assert (=> b!48520 (= e!32110 (= (bitIndex!0 (size!1043 (buf!1395 (_1!2388 lt!75178))) (currentByte!2906 (_1!2388 lt!75178)) (currentBit!2901 (_1!2388 lt!75178))) (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75174))) (currentByte!2906 (_2!2381 lt!75174)) (currentBit!2901 (_2!2381 lt!75174)))))))

(declare-fun b!48521 () Bool)

(declare-fun res!40749 () Bool)

(assert (=> b!48521 (=> (not res!40749) (not e!32109))))

(assert (=> b!48521 (= res!40749 (= (bitIndex!0 (size!1043 (buf!1395 (_2!2381 lt!75170))) (currentByte!2906 (_2!2381 lt!75170)) (currentBit!2901 (_2!2381 lt!75170))) (bvadd (bitIndex!0 (size!1043 (buf!1395 thiss!1379)) (currentByte!2906 thiss!1379) (currentBit!2901 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48522 () Bool)

(declare-fun res!40751 () Bool)

(assert (=> b!48522 (=> (not res!40751) (not e!32112))))

(assert (=> b!48522 (= res!40751 (isPrefixOf!0 thiss!1379 (_2!2381 lt!75174)))))

(assert (= (and d!14832 res!40748) b!48521))

(assert (= (and b!48521 res!40749) b!48515))

(assert (= (and b!48515 res!40747) b!48517))

(assert (= (and b!48517 res!40754) b!48516))

(assert (= (and d!14832 res!40753) b!48518))

(assert (= (and b!48518 res!40750) b!48522))

(assert (= (and b!48522 res!40751) b!48519))

(assert (= (and b!48519 res!40752) b!48520))

(declare-fun m!75407 () Bool)

(assert (=> d!14832 m!75407))

(declare-fun m!75409 () Bool)

(assert (=> d!14832 m!75409))

(assert (=> d!14832 m!75373))

(declare-fun m!75411 () Bool)

(assert (=> b!48518 m!75411))

(assert (=> b!48518 m!74903))

(declare-fun m!75413 () Bool)

(assert (=> b!48522 m!75413))

(declare-fun m!75415 () Bool)

(assert (=> b!48516 m!75415))

(declare-fun m!75417 () Bool)

(assert (=> b!48516 m!75417))

(declare-fun m!75419 () Bool)

(assert (=> b!48519 m!75419))

(declare-fun m!75421 () Bool)

(assert (=> b!48519 m!75421))

(declare-fun m!75423 () Bool)

(assert (=> b!48519 m!75423))

(assert (=> b!48521 m!75417))

(assert (=> b!48521 m!74903))

(declare-fun m!75425 () Bool)

(assert (=> b!48520 m!75425))

(assert (=> b!48520 m!75411))

(declare-fun m!75427 () Bool)

(assert (=> b!48517 m!75427))

(assert (=> b!48517 m!75427))

(declare-fun m!75429 () Bool)

(assert (=> b!48517 m!75429))

(declare-fun m!75431 () Bool)

(assert (=> b!48515 m!75431))

(assert (=> b!48209 d!14832))

(declare-fun d!14834 () Bool)

(assert (=> d!14834 (= (array_inv!959 (buf!1395 thiss!1379)) (bvsge (size!1043 (buf!1395 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!48208 d!14834))

(declare-fun d!14836 () Bool)

(assert (=> d!14836 (= (bitAt!0 (buf!1395 (_1!2382 lt!74571)) lt!74582) (not (= (bvand ((_ sign_extend 24) (select (arr!1566 (buf!1395 (_1!2382 lt!74571))) ((_ extract 31 0) (bvsdiv lt!74582 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!74582 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3800 () Bool)

(assert (= bs!3800 d!14836))

(declare-fun m!75433 () Bool)

(assert (=> bs!3800 m!75433))

(declare-fun m!75435 () Bool)

(assert (=> bs!3800 m!75435))

(assert (=> b!48210 d!14836))

(declare-fun d!14838 () Bool)

(assert (=> d!14838 (= (bitAt!0 (buf!1395 (_1!2382 lt!74579)) lt!74582) (not (= (bvand ((_ sign_extend 24) (select (arr!1566 (buf!1395 (_1!2382 lt!74579))) ((_ extract 31 0) (bvsdiv lt!74582 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!74582 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3801 () Bool)

(assert (= bs!3801 d!14838))

(declare-fun m!75437 () Bool)

(assert (=> bs!3801 m!75437))

(assert (=> bs!3801 m!75435))

(assert (=> b!48210 d!14838))

(declare-fun d!14840 () Bool)

(declare-fun size!1045 (List!547) Int)

(assert (=> d!14840 (= (length!242 lt!74578) (size!1045 lt!74578))))

(declare-fun bs!3802 () Bool)

(assert (= bs!3802 d!14840))

(declare-fun m!75439 () Bool)

(assert (=> bs!3802 m!75439))

(assert (=> b!48199 d!14840))

(declare-fun d!14842 () Bool)

(assert (=> d!14842 (= (array_inv!959 srcBuffer!2) (bvsge (size!1043 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9640 d!14842))

(declare-fun d!14844 () Bool)

(assert (=> d!14844 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2901 thiss!1379) (currentByte!2906 thiss!1379) (size!1043 (buf!1395 thiss!1379))))))

(declare-fun bs!3803 () Bool)

(assert (= bs!3803 d!14844))

(assert (=> bs!3803 m!75397))

(assert (=> start!9640 d!14844))

(check-sat (not b!48484) (not d!14790) (not b!48430) (not b!48471) (not b!48436) (not d!14830) (not d!14828) (not b!48452) (not b!48285) (not b!48472) (not b!48487) (not b!48463) (not b!48462) (not b!48461) (not b!48473) (not b!48469) (not d!14816) (not b!48449) (not d!14788) (not b!48492) (not b!48434) (not b!48448) (not d!14824) (not b!48516) (not b!48288) (not b!48447) (not b!48296) (not d!14844) (not b!48301) (not b!48485) (not d!14840) (not d!14832) (not d!14690) (not d!14782) (not b!48521) (not b!48453) (not b!48518) (not b!48435) (not b!48454) (not d!14780) (not b!48287) (not b!48497) (not b!48459) (not b!48299) (not b!48298) (not d!14786) (not d!14822) (not b!48437) (not b!48515) (not d!14688) (not d!14792) (not d!14674) (not b!48520) (not d!14802) (not d!14686) (not b!48481) (not d!14820) (not b!48522) (not b!48457) (not b!48432) (not b!48289) (not d!14678) (not b!48458) (not b!48456) (not b!48517) (not b!48519) (not d!14684) (not bm!601) (not b!48494) (not b!48450))
