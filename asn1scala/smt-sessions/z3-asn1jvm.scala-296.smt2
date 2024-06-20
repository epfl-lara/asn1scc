; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5950 () Bool)

(assert start!5950)

(declare-fun b!26388 () Bool)

(declare-fun e!17909 () Bool)

(declare-fun e!17911 () Bool)

(assert (=> b!26388 (= e!17909 e!17911)))

(declare-fun res!22747 () Bool)

(assert (=> b!26388 (=> res!22747 e!17911)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!26388 (= res!22747 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!1687 0))(
  ( (array!1688 (arr!1188 (Array (_ BitVec 32) (_ BitVec 8))) (size!726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1284 0))(
  ( (BitStream!1285 (buf!1053 array!1687) (currentByte!2378 (_ BitVec 32)) (currentBit!2373 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2934 0))(
  ( (tuple2!2935 (_1!1554 BitStream!1284) (_2!1554 BitStream!1284)) )
))
(declare-fun lt!38048 () tuple2!2934)

(declare-datatypes ((List!343 0))(
  ( (Nil!340) (Cons!339 (h!458 Bool) (t!1093 List!343)) )
))
(declare-fun lt!38047 () List!343)

(declare-datatypes ((Unit!2155 0))(
  ( (Unit!2156) )
))
(declare-datatypes ((tuple2!2936 0))(
  ( (tuple2!2937 (_1!1555 Unit!2155) (_2!1555 BitStream!1284)) )
))
(declare-fun lt!38043 () tuple2!2936)

(declare-fun lt!38041 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1284 BitStream!1284 (_ BitVec 64)) List!343)

(assert (=> b!26388 (= lt!38047 (bitStreamReadBitsIntoList!0 (_2!1555 lt!38043) (_1!1554 lt!38048) lt!38041))))

(declare-fun lt!38056 () List!343)

(declare-fun lt!38054 () tuple2!2934)

(assert (=> b!26388 (= lt!38056 (bitStreamReadBitsIntoList!0 (_2!1555 lt!38043) (_1!1554 lt!38054) (bvsub to!314 i!635)))))

(declare-fun lt!38044 () tuple2!2936)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26388 (validate_offset_bits!1 ((_ sign_extend 32) (size!726 (buf!1053 (_2!1555 lt!38043)))) ((_ sign_extend 32) (currentByte!2378 (_2!1555 lt!38044))) ((_ sign_extend 32) (currentBit!2373 (_2!1555 lt!38044))) lt!38041)))

(declare-fun lt!38040 () Unit!2155)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1284 array!1687 (_ BitVec 64)) Unit!2155)

(assert (=> b!26388 (= lt!38040 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1555 lt!38044) (buf!1053 (_2!1555 lt!38043)) lt!38041))))

(declare-fun reader!0 (BitStream!1284 BitStream!1284) tuple2!2934)

(assert (=> b!26388 (= lt!38048 (reader!0 (_2!1555 lt!38044) (_2!1555 lt!38043)))))

(declare-fun thiss!1379 () BitStream!1284)

(assert (=> b!26388 (validate_offset_bits!1 ((_ sign_extend 32) (size!726 (buf!1053 (_2!1555 lt!38043)))) ((_ sign_extend 32) (currentByte!2378 thiss!1379)) ((_ sign_extend 32) (currentBit!2373 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38042 () Unit!2155)

(assert (=> b!26388 (= lt!38042 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1053 (_2!1555 lt!38043)) (bvsub to!314 i!635)))))

(assert (=> b!26388 (= lt!38054 (reader!0 thiss!1379 (_2!1555 lt!38043)))))

(declare-fun b!26389 () Bool)

(declare-fun res!22750 () Bool)

(assert (=> b!26389 (=> res!22750 e!17911)))

(declare-fun isPrefixOf!0 (BitStream!1284 BitStream!1284) Bool)

(assert (=> b!26389 (= res!22750 (not (isPrefixOf!0 (_1!1554 lt!38054) (_2!1555 lt!38043))))))

(declare-fun b!26390 () Bool)

(declare-fun e!17913 () Bool)

(assert (=> b!26390 (= e!17913 e!17909)))

(declare-fun res!22746 () Bool)

(assert (=> b!26390 (=> res!22746 e!17909)))

(assert (=> b!26390 (= res!22746 (not (= (size!726 (buf!1053 (_2!1555 lt!38044))) (size!726 (buf!1053 (_2!1555 lt!38043))))))))

(declare-fun e!17910 () Bool)

(assert (=> b!26390 e!17910))

(declare-fun res!22745 () Bool)

(assert (=> b!26390 (=> (not res!22745) (not e!17910))))

(assert (=> b!26390 (= res!22745 (= (size!726 (buf!1053 (_2!1555 lt!38043))) (size!726 (buf!1053 thiss!1379))))))

(declare-fun srcBuffer!2 () array!1687)

(declare-fun e!17918 () Bool)

(declare-fun b!26391 () Bool)

(declare-fun lt!38052 () tuple2!2934)

(declare-fun head!180 (List!343) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1284 array!1687 (_ BitVec 64) (_ BitVec 64)) List!343)

(assert (=> b!26391 (= e!17918 (= (head!180 (byteArrayBitContentToList!0 (_2!1555 lt!38044) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!180 (bitStreamReadBitsIntoList!0 (_2!1555 lt!38044) (_1!1554 lt!38052) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!38050 () (_ BitVec 64))

(declare-fun b!26392 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26392 (= e!17910 (= lt!38050 (bvsub (bvsub (bvadd (bitIndex!0 (size!726 (buf!1053 (_2!1555 lt!38044))) (currentByte!2378 (_2!1555 lt!38044)) (currentBit!2373 (_2!1555 lt!38044))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26393 () Bool)

(assert (=> b!26393 (= e!17911 true)))

(declare-fun lt!38039 () (_ BitVec 64))

(assert (=> b!26393 (= lt!38039 (bitIndex!0 (size!726 (buf!1053 (_1!1554 lt!38048))) (currentByte!2378 (_1!1554 lt!38048)) (currentBit!2373 (_1!1554 lt!38048))))))

(declare-fun lt!38049 () (_ BitVec 64))

(assert (=> b!26393 (= lt!38049 (bitIndex!0 (size!726 (buf!1053 (_1!1554 lt!38054))) (currentByte!2378 (_1!1554 lt!38054)) (currentBit!2373 (_1!1554 lt!38054))))))

(declare-fun b!26394 () Bool)

(declare-fun res!22749 () Bool)

(assert (=> b!26394 (=> res!22749 e!17909)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26394 (= res!22749 (not (invariant!0 (currentBit!2373 (_2!1555 lt!38044)) (currentByte!2378 (_2!1555 lt!38044)) (size!726 (buf!1053 (_2!1555 lt!38044))))))))

(declare-fun b!26395 () Bool)

(declare-fun res!22737 () Bool)

(assert (=> b!26395 (=> res!22737 e!17913)))

(assert (=> b!26395 (= res!22737 (not (= (size!726 (buf!1053 thiss!1379)) (size!726 (buf!1053 (_2!1555 lt!38043))))))))

(declare-fun b!26396 () Bool)

(declare-fun res!22753 () Bool)

(declare-fun e!17912 () Bool)

(assert (=> b!26396 (=> (not res!22753) (not e!17912))))

(assert (=> b!26396 (= res!22753 (validate_offset_bits!1 ((_ sign_extend 32) (size!726 (buf!1053 thiss!1379))) ((_ sign_extend 32) (currentByte!2378 thiss!1379)) ((_ sign_extend 32) (currentBit!2373 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26397 () Bool)

(declare-fun res!22751 () Bool)

(assert (=> b!26397 (=> res!22751 e!17913)))

(assert (=> b!26397 (= res!22751 (not (invariant!0 (currentBit!2373 (_2!1555 lt!38043)) (currentByte!2378 (_2!1555 lt!38043)) (size!726 (buf!1053 (_2!1555 lt!38043))))))))

(declare-fun b!26398 () Bool)

(declare-fun res!22740 () Bool)

(assert (=> b!26398 (=> res!22740 e!17909)))

(assert (=> b!26398 (= res!22740 (not (invariant!0 (currentBit!2373 (_2!1555 lt!38044)) (currentByte!2378 (_2!1555 lt!38044)) (size!726 (buf!1053 (_2!1555 lt!38043))))))))

(declare-fun b!26399 () Bool)

(declare-fun e!17916 () Bool)

(declare-fun array_inv!695 (array!1687) Bool)

(assert (=> b!26399 (= e!17916 (array_inv!695 (buf!1053 thiss!1379)))))

(declare-fun b!26400 () Bool)

(declare-fun e!17914 () Bool)

(assert (=> b!26400 (= e!17912 (not e!17914))))

(declare-fun res!22738 () Bool)

(assert (=> b!26400 (=> res!22738 e!17914)))

(assert (=> b!26400 (= res!22738 (bvsge i!635 to!314))))

(assert (=> b!26400 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38055 () Unit!2155)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1284) Unit!2155)

(assert (=> b!26400 (= lt!38055 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38046 () (_ BitVec 64))

(assert (=> b!26400 (= lt!38046 (bitIndex!0 (size!726 (buf!1053 thiss!1379)) (currentByte!2378 thiss!1379) (currentBit!2373 thiss!1379)))))

(declare-fun b!26401 () Bool)

(declare-fun res!22754 () Bool)

(assert (=> b!26401 (=> res!22754 e!17911)))

(assert (=> b!26401 (= res!22754 (not (isPrefixOf!0 (_1!1554 lt!38048) (_2!1555 lt!38043))))))

(declare-fun b!26402 () Bool)

(declare-fun res!22755 () Bool)

(assert (=> b!26402 (=> res!22755 e!17911)))

(assert (=> b!26402 (= res!22755 (not (isPrefixOf!0 (_1!1554 lt!38054) (_1!1554 lt!38048))))))

(declare-fun b!26403 () Bool)

(declare-fun res!22741 () Bool)

(assert (=> b!26403 (=> res!22741 e!17911)))

(assert (=> b!26403 (= res!22741 (or (not (= (buf!1053 (_1!1554 lt!38054)) (buf!1053 (_1!1554 lt!38048)))) (not (= (buf!1053 (_1!1554 lt!38054)) (buf!1053 (_2!1555 lt!38043)))) (bvsge lt!38050 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26404 () Bool)

(declare-fun e!17920 () Bool)

(declare-fun e!17915 () Bool)

(assert (=> b!26404 (= e!17920 e!17915)))

(declare-fun res!22752 () Bool)

(assert (=> b!26404 (=> res!22752 e!17915)))

(assert (=> b!26404 (= res!22752 (not (isPrefixOf!0 (_2!1555 lt!38044) (_2!1555 lt!38043))))))

(assert (=> b!26404 (isPrefixOf!0 thiss!1379 (_2!1555 lt!38043))))

(declare-fun lt!38051 () Unit!2155)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1284 BitStream!1284 BitStream!1284) Unit!2155)

(assert (=> b!26404 (= lt!38051 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1555 lt!38044) (_2!1555 lt!38043)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1284 array!1687 (_ BitVec 64) (_ BitVec 64)) tuple2!2936)

(assert (=> b!26404 (= lt!38043 (appendBitsMSBFirstLoop!0 (_2!1555 lt!38044) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26404 e!17918))

(declare-fun res!22739 () Bool)

(assert (=> b!26404 (=> (not res!22739) (not e!17918))))

(assert (=> b!26404 (= res!22739 (validate_offset_bits!1 ((_ sign_extend 32) (size!726 (buf!1053 (_2!1555 lt!38044)))) ((_ sign_extend 32) (currentByte!2378 thiss!1379)) ((_ sign_extend 32) (currentBit!2373 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38045 () Unit!2155)

(assert (=> b!26404 (= lt!38045 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1053 (_2!1555 lt!38044)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!26404 (= lt!38052 (reader!0 thiss!1379 (_2!1555 lt!38044)))))

(declare-fun b!26405 () Bool)

(declare-fun res!22748 () Bool)

(assert (=> b!26405 (=> res!22748 e!17911)))

(declare-fun length!69 (List!343) Int)

(assert (=> b!26405 (= res!22748 (<= (length!69 lt!38056) 0))))

(declare-fun res!22743 () Bool)

(assert (=> start!5950 (=> (not res!22743) (not e!17912))))

(assert (=> start!5950 (= res!22743 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!726 srcBuffer!2))))))))

(assert (=> start!5950 e!17912))

(assert (=> start!5950 true))

(assert (=> start!5950 (array_inv!695 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1284) Bool)

(assert (=> start!5950 (and (inv!12 thiss!1379) e!17916)))

(declare-fun b!26406 () Bool)

(assert (=> b!26406 (= e!17915 e!17913)))

(declare-fun res!22744 () Bool)

(assert (=> b!26406 (=> res!22744 e!17913)))

(assert (=> b!26406 (= res!22744 (not (= lt!38050 (bvsub (bvadd lt!38046 to!314) i!635))))))

(assert (=> b!26406 (= lt!38050 (bitIndex!0 (size!726 (buf!1053 (_2!1555 lt!38043))) (currentByte!2378 (_2!1555 lt!38043)) (currentBit!2373 (_2!1555 lt!38043))))))

(declare-fun b!26407 () Bool)

(assert (=> b!26407 (= e!17914 e!17920)))

(declare-fun res!22742 () Bool)

(assert (=> b!26407 (=> res!22742 e!17920)))

(assert (=> b!26407 (= res!22742 (not (isPrefixOf!0 thiss!1379 (_2!1555 lt!38044))))))

(assert (=> b!26407 (validate_offset_bits!1 ((_ sign_extend 32) (size!726 (buf!1053 (_2!1555 lt!38044)))) ((_ sign_extend 32) (currentByte!2378 (_2!1555 lt!38044))) ((_ sign_extend 32) (currentBit!2373 (_2!1555 lt!38044))) lt!38041)))

(assert (=> b!26407 (= lt!38041 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38053 () Unit!2155)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1284 BitStream!1284 (_ BitVec 64) (_ BitVec 64)) Unit!2155)

(assert (=> b!26407 (= lt!38053 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1555 lt!38044) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1284 (_ BitVec 8) (_ BitVec 32)) tuple2!2936)

(assert (=> b!26407 (= lt!38044 (appendBitFromByte!0 thiss!1379 (select (arr!1188 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5950 res!22743) b!26396))

(assert (= (and b!26396 res!22753) b!26400))

(assert (= (and b!26400 (not res!22738)) b!26407))

(assert (= (and b!26407 (not res!22742)) b!26404))

(assert (= (and b!26404 res!22739) b!26391))

(assert (= (and b!26404 (not res!22752)) b!26406))

(assert (= (and b!26406 (not res!22744)) b!26397))

(assert (= (and b!26397 (not res!22751)) b!26395))

(assert (= (and b!26395 (not res!22737)) b!26390))

(assert (= (and b!26390 res!22745) b!26392))

(assert (= (and b!26390 (not res!22746)) b!26394))

(assert (= (and b!26394 (not res!22749)) b!26398))

(assert (= (and b!26398 (not res!22740)) b!26388))

(assert (= (and b!26388 (not res!22747)) b!26405))

(assert (= (and b!26405 (not res!22748)) b!26389))

(assert (= (and b!26389 (not res!22750)) b!26401))

(assert (= (and b!26401 (not res!22754)) b!26402))

(assert (= (and b!26402 (not res!22755)) b!26403))

(assert (= (and b!26403 (not res!22741)) b!26393))

(assert (= start!5950 b!26399))

(declare-fun m!37845 () Bool)

(assert (=> b!26399 m!37845))

(declare-fun m!37847 () Bool)

(assert (=> b!26396 m!37847))

(declare-fun m!37849 () Bool)

(assert (=> b!26407 m!37849))

(declare-fun m!37851 () Bool)

(assert (=> b!26407 m!37851))

(declare-fun m!37853 () Bool)

(assert (=> b!26407 m!37853))

(declare-fun m!37855 () Bool)

(assert (=> b!26407 m!37855))

(assert (=> b!26407 m!37851))

(declare-fun m!37857 () Bool)

(assert (=> b!26407 m!37857))

(declare-fun m!37859 () Bool)

(assert (=> b!26389 m!37859))

(declare-fun m!37861 () Bool)

(assert (=> b!26402 m!37861))

(declare-fun m!37863 () Bool)

(assert (=> b!26388 m!37863))

(declare-fun m!37865 () Bool)

(assert (=> b!26388 m!37865))

(declare-fun m!37867 () Bool)

(assert (=> b!26388 m!37867))

(declare-fun m!37869 () Bool)

(assert (=> b!26388 m!37869))

(declare-fun m!37871 () Bool)

(assert (=> b!26388 m!37871))

(declare-fun m!37873 () Bool)

(assert (=> b!26388 m!37873))

(declare-fun m!37875 () Bool)

(assert (=> b!26388 m!37875))

(declare-fun m!37877 () Bool)

(assert (=> b!26388 m!37877))

(declare-fun m!37879 () Bool)

(assert (=> b!26405 m!37879))

(declare-fun m!37881 () Bool)

(assert (=> b!26393 m!37881))

(declare-fun m!37883 () Bool)

(assert (=> b!26393 m!37883))

(declare-fun m!37885 () Bool)

(assert (=> b!26406 m!37885))

(declare-fun m!37887 () Bool)

(assert (=> b!26400 m!37887))

(declare-fun m!37889 () Bool)

(assert (=> b!26400 m!37889))

(declare-fun m!37891 () Bool)

(assert (=> b!26400 m!37891))

(declare-fun m!37893 () Bool)

(assert (=> b!26394 m!37893))

(declare-fun m!37895 () Bool)

(assert (=> b!26401 m!37895))

(declare-fun m!37897 () Bool)

(assert (=> b!26397 m!37897))

(declare-fun m!37899 () Bool)

(assert (=> start!5950 m!37899))

(declare-fun m!37901 () Bool)

(assert (=> start!5950 m!37901))

(declare-fun m!37903 () Bool)

(assert (=> b!26398 m!37903))

(declare-fun m!37905 () Bool)

(assert (=> b!26392 m!37905))

(declare-fun m!37907 () Bool)

(assert (=> b!26404 m!37907))

(declare-fun m!37909 () Bool)

(assert (=> b!26404 m!37909))

(declare-fun m!37911 () Bool)

(assert (=> b!26404 m!37911))

(declare-fun m!37913 () Bool)

(assert (=> b!26404 m!37913))

(declare-fun m!37915 () Bool)

(assert (=> b!26404 m!37915))

(declare-fun m!37917 () Bool)

(assert (=> b!26404 m!37917))

(declare-fun m!37919 () Bool)

(assert (=> b!26404 m!37919))

(declare-fun m!37921 () Bool)

(assert (=> b!26391 m!37921))

(assert (=> b!26391 m!37921))

(declare-fun m!37923 () Bool)

(assert (=> b!26391 m!37923))

(declare-fun m!37925 () Bool)

(assert (=> b!26391 m!37925))

(assert (=> b!26391 m!37925))

(declare-fun m!37927 () Bool)

(assert (=> b!26391 m!37927))

(check-sat (not b!26392) (not b!26388) (not start!5950) (not b!26406) (not b!26400) (not b!26402) (not b!26391) (not b!26396) (not b!26389) (not b!26407) (not b!26405) (not b!26401) (not b!26393) (not b!26397) (not b!26398) (not b!26394) (not b!26404) (not b!26399))
