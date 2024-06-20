; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5942 () Bool)

(assert start!5942)

(declare-fun b!26148 () Bool)

(declare-fun res!22514 () Bool)

(declare-fun e!17775 () Bool)

(assert (=> b!26148 (=> res!22514 e!17775)))

(declare-datatypes ((array!1679 0))(
  ( (array!1680 (arr!1184 (Array (_ BitVec 32) (_ BitVec 8))) (size!722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1276 0))(
  ( (BitStream!1277 (buf!1049 array!1679) (currentByte!2374 (_ BitVec 32)) (currentBit!2369 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2147 0))(
  ( (Unit!2148) )
))
(declare-datatypes ((tuple2!2918 0))(
  ( (tuple2!2919 (_1!1546 Unit!2147) (_2!1546 BitStream!1276)) )
))
(declare-fun lt!37839 () tuple2!2918)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26148 (= res!22514 (not (invariant!0 (currentBit!2369 (_2!1546 lt!37839)) (currentByte!2374 (_2!1546 lt!37839)) (size!722 (buf!1049 (_2!1546 lt!37839))))))))

(declare-fun b!26149 () Bool)

(declare-fun res!22525 () Bool)

(declare-fun e!17767 () Bool)

(assert (=> b!26149 (=> res!22525 e!17767)))

(declare-fun lt!37830 () tuple2!2918)

(assert (=> b!26149 (= res!22525 (not (invariant!0 (currentBit!2369 (_2!1546 lt!37830)) (currentByte!2374 (_2!1546 lt!37830)) (size!722 (buf!1049 (_2!1546 lt!37839))))))))

(declare-fun b!26150 () Bool)

(declare-fun e!17771 () Bool)

(declare-fun e!17772 () Bool)

(assert (=> b!26150 (= e!17771 e!17772)))

(declare-fun res!22523 () Bool)

(assert (=> b!26150 (=> res!22523 e!17772)))

(declare-fun isPrefixOf!0 (BitStream!1276 BitStream!1276) Bool)

(assert (=> b!26150 (= res!22523 (not (isPrefixOf!0 (_2!1546 lt!37830) (_2!1546 lt!37839))))))

(declare-fun thiss!1379 () BitStream!1276)

(assert (=> b!26150 (isPrefixOf!0 thiss!1379 (_2!1546 lt!37839))))

(declare-fun lt!37825 () Unit!2147)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1276 BitStream!1276 BitStream!1276) Unit!2147)

(assert (=> b!26150 (= lt!37825 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1546 lt!37830) (_2!1546 lt!37839)))))

(declare-fun srcBuffer!2 () array!1679)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1276 array!1679 (_ BitVec 64) (_ BitVec 64)) tuple2!2918)

(assert (=> b!26150 (= lt!37839 (appendBitsMSBFirstLoop!0 (_2!1546 lt!37830) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17774 () Bool)

(assert (=> b!26150 e!17774))

(declare-fun res!22516 () Bool)

(assert (=> b!26150 (=> (not res!22516) (not e!17774))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26150 (= res!22516 (validate_offset_bits!1 ((_ sign_extend 32) (size!722 (buf!1049 (_2!1546 lt!37830)))) ((_ sign_extend 32) (currentByte!2374 thiss!1379)) ((_ sign_extend 32) (currentBit!2369 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37827 () Unit!2147)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1276 array!1679 (_ BitVec 64)) Unit!2147)

(assert (=> b!26150 (= lt!37827 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1049 (_2!1546 lt!37830)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2920 0))(
  ( (tuple2!2921 (_1!1547 BitStream!1276) (_2!1547 BitStream!1276)) )
))
(declare-fun lt!37826 () tuple2!2920)

(declare-fun reader!0 (BitStream!1276 BitStream!1276) tuple2!2920)

(assert (=> b!26150 (= lt!37826 (reader!0 thiss!1379 (_2!1546 lt!37830)))))

(declare-fun b!26151 () Bool)

(declare-fun res!22526 () Bool)

(declare-fun e!17776 () Bool)

(assert (=> b!26151 (=> res!22526 e!17776)))

(declare-fun lt!37834 () tuple2!2920)

(assert (=> b!26151 (= res!22526 (not (isPrefixOf!0 (_1!1547 lt!37834) (_2!1546 lt!37839))))))

(declare-fun e!17769 () Bool)

(declare-fun b!26152 () Bool)

(declare-fun lt!37838 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26152 (= e!17769 (= lt!37838 (bvsub (bvsub (bvadd (bitIndex!0 (size!722 (buf!1049 (_2!1546 lt!37830))) (currentByte!2374 (_2!1546 lt!37830)) (currentBit!2369 (_2!1546 lt!37830))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26153 () Bool)

(declare-fun e!17768 () Bool)

(declare-fun e!17770 () Bool)

(assert (=> b!26153 (= e!17768 (not e!17770))))

(declare-fun res!22513 () Bool)

(assert (=> b!26153 (=> res!22513 e!17770)))

(assert (=> b!26153 (= res!22513 (bvsge i!635 to!314))))

(assert (=> b!26153 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!37829 () Unit!2147)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1276) Unit!2147)

(assert (=> b!26153 (= lt!37829 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!37831 () (_ BitVec 64))

(assert (=> b!26153 (= lt!37831 (bitIndex!0 (size!722 (buf!1049 thiss!1379)) (currentByte!2374 thiss!1379) (currentBit!2369 thiss!1379)))))

(declare-fun res!22518 () Bool)

(assert (=> start!5942 (=> (not res!22518) (not e!17768))))

(assert (=> start!5942 (= res!22518 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!722 srcBuffer!2))))))))

(assert (=> start!5942 e!17768))

(assert (=> start!5942 true))

(declare-fun array_inv!691 (array!1679) Bool)

(assert (=> start!5942 (array_inv!691 srcBuffer!2)))

(declare-fun e!17773 () Bool)

(declare-fun inv!12 (BitStream!1276) Bool)

(assert (=> start!5942 (and (inv!12 thiss!1379) e!17773)))

(declare-fun b!26154 () Bool)

(declare-fun res!22512 () Bool)

(assert (=> b!26154 (=> res!22512 e!17776)))

(declare-fun lt!37840 () tuple2!2920)

(assert (=> b!26154 (= res!22512 (not (isPrefixOf!0 (_1!1547 lt!37834) (_1!1547 lt!37840))))))

(declare-fun b!26155 () Bool)

(assert (=> b!26155 (= e!17767 e!17776)))

(declare-fun res!22527 () Bool)

(assert (=> b!26155 (=> res!22527 e!17776)))

(assert (=> b!26155 (= res!22527 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!339 0))(
  ( (Nil!336) (Cons!335 (h!454 Bool) (t!1089 List!339)) )
))
(declare-fun lt!37828 () List!339)

(declare-fun lt!37833 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1276 BitStream!1276 (_ BitVec 64)) List!339)

(assert (=> b!26155 (= lt!37828 (bitStreamReadBitsIntoList!0 (_2!1546 lt!37839) (_1!1547 lt!37840) lt!37833))))

(declare-fun lt!37836 () List!339)

(assert (=> b!26155 (= lt!37836 (bitStreamReadBitsIntoList!0 (_2!1546 lt!37839) (_1!1547 lt!37834) (bvsub to!314 i!635)))))

(assert (=> b!26155 (validate_offset_bits!1 ((_ sign_extend 32) (size!722 (buf!1049 (_2!1546 lt!37839)))) ((_ sign_extend 32) (currentByte!2374 (_2!1546 lt!37830))) ((_ sign_extend 32) (currentBit!2369 (_2!1546 lt!37830))) lt!37833)))

(declare-fun lt!37832 () Unit!2147)

(assert (=> b!26155 (= lt!37832 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1546 lt!37830) (buf!1049 (_2!1546 lt!37839)) lt!37833))))

(assert (=> b!26155 (= lt!37840 (reader!0 (_2!1546 lt!37830) (_2!1546 lt!37839)))))

(assert (=> b!26155 (validate_offset_bits!1 ((_ sign_extend 32) (size!722 (buf!1049 (_2!1546 lt!37839)))) ((_ sign_extend 32) (currentByte!2374 thiss!1379)) ((_ sign_extend 32) (currentBit!2369 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!37837 () Unit!2147)

(assert (=> b!26155 (= lt!37837 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1049 (_2!1546 lt!37839)) (bvsub to!314 i!635)))))

(assert (=> b!26155 (= lt!37834 (reader!0 thiss!1379 (_2!1546 lt!37839)))))

(declare-fun b!26156 () Bool)

(declare-fun head!176 (List!339) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1276 array!1679 (_ BitVec 64) (_ BitVec 64)) List!339)

(assert (=> b!26156 (= e!17774 (= (head!176 (byteArrayBitContentToList!0 (_2!1546 lt!37830) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!176 (bitStreamReadBitsIntoList!0 (_2!1546 lt!37830) (_1!1547 lt!37826) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26157 () Bool)

(declare-fun res!22510 () Bool)

(assert (=> b!26157 (=> res!22510 e!17776)))

(assert (=> b!26157 (= res!22510 (not (isPrefixOf!0 (_1!1547 lt!37840) (_2!1546 lt!37839))))))

(declare-fun b!26158 () Bool)

(assert (=> b!26158 (= e!17772 e!17775)))

(declare-fun res!22509 () Bool)

(assert (=> b!26158 (=> res!22509 e!17775)))

(assert (=> b!26158 (= res!22509 (not (= lt!37838 (bvsub (bvadd lt!37831 to!314) i!635))))))

(assert (=> b!26158 (= lt!37838 (bitIndex!0 (size!722 (buf!1049 (_2!1546 lt!37839))) (currentByte!2374 (_2!1546 lt!37839)) (currentBit!2369 (_2!1546 lt!37839))))))

(declare-fun b!26159 () Bool)

(declare-fun res!22520 () Bool)

(assert (=> b!26159 (=> res!22520 e!17776)))

(declare-fun length!65 (List!339) Int)

(assert (=> b!26159 (= res!22520 (<= (length!65 lt!37836) 0))))

(declare-fun b!26160 () Bool)

(assert (=> b!26160 (= e!17773 (array_inv!691 (buf!1049 thiss!1379)))))

(declare-fun b!26161 () Bool)

(assert (=> b!26161 (= e!17775 e!17767)))

(declare-fun res!22524 () Bool)

(assert (=> b!26161 (=> res!22524 e!17767)))

(assert (=> b!26161 (= res!22524 (not (= (size!722 (buf!1049 (_2!1546 lt!37830))) (size!722 (buf!1049 (_2!1546 lt!37839))))))))

(assert (=> b!26161 e!17769))

(declare-fun res!22517 () Bool)

(assert (=> b!26161 (=> (not res!22517) (not e!17769))))

(assert (=> b!26161 (= res!22517 (= (size!722 (buf!1049 (_2!1546 lt!37839))) (size!722 (buf!1049 thiss!1379))))))

(declare-fun b!26162 () Bool)

(assert (=> b!26162 (= e!17776 true)))

(declare-fun lt!37835 () (_ BitVec 64))

(assert (=> b!26162 (= lt!37835 (bitIndex!0 (size!722 (buf!1049 (_1!1547 lt!37840))) (currentByte!2374 (_1!1547 lt!37840)) (currentBit!2369 (_1!1547 lt!37840))))))

(declare-fun lt!37823 () (_ BitVec 64))

(assert (=> b!26162 (= lt!37823 (bitIndex!0 (size!722 (buf!1049 (_1!1547 lt!37834))) (currentByte!2374 (_1!1547 lt!37834)) (currentBit!2369 (_1!1547 lt!37834))))))

(declare-fun b!26163 () Bool)

(assert (=> b!26163 (= e!17770 e!17771)))

(declare-fun res!22511 () Bool)

(assert (=> b!26163 (=> res!22511 e!17771)))

(assert (=> b!26163 (= res!22511 (not (isPrefixOf!0 thiss!1379 (_2!1546 lt!37830))))))

(assert (=> b!26163 (validate_offset_bits!1 ((_ sign_extend 32) (size!722 (buf!1049 (_2!1546 lt!37830)))) ((_ sign_extend 32) (currentByte!2374 (_2!1546 lt!37830))) ((_ sign_extend 32) (currentBit!2369 (_2!1546 lt!37830))) lt!37833)))

(assert (=> b!26163 (= lt!37833 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37824 () Unit!2147)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1276 BitStream!1276 (_ BitVec 64) (_ BitVec 64)) Unit!2147)

(assert (=> b!26163 (= lt!37824 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1546 lt!37830) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1276 (_ BitVec 8) (_ BitVec 32)) tuple2!2918)

(assert (=> b!26163 (= lt!37830 (appendBitFromByte!0 thiss!1379 (select (arr!1184 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26164 () Bool)

(declare-fun res!22522 () Bool)

(assert (=> b!26164 (=> res!22522 e!17775)))

(assert (=> b!26164 (= res!22522 (not (= (size!722 (buf!1049 thiss!1379)) (size!722 (buf!1049 (_2!1546 lt!37839))))))))

(declare-fun b!26165 () Bool)

(declare-fun res!22519 () Bool)

(assert (=> b!26165 (=> (not res!22519) (not e!17768))))

(assert (=> b!26165 (= res!22519 (validate_offset_bits!1 ((_ sign_extend 32) (size!722 (buf!1049 thiss!1379))) ((_ sign_extend 32) (currentByte!2374 thiss!1379)) ((_ sign_extend 32) (currentBit!2369 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26166 () Bool)

(declare-fun res!22521 () Bool)

(assert (=> b!26166 (=> res!22521 e!17776)))

(assert (=> b!26166 (= res!22521 (or (not (= (buf!1049 (_1!1547 lt!37834)) (buf!1049 (_1!1547 lt!37840)))) (not (= (buf!1049 (_1!1547 lt!37834)) (buf!1049 (_2!1546 lt!37839)))) (bvsge lt!37838 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26167 () Bool)

(declare-fun res!22515 () Bool)

(assert (=> b!26167 (=> res!22515 e!17767)))

(assert (=> b!26167 (= res!22515 (not (invariant!0 (currentBit!2369 (_2!1546 lt!37830)) (currentByte!2374 (_2!1546 lt!37830)) (size!722 (buf!1049 (_2!1546 lt!37830))))))))

(assert (= (and start!5942 res!22518) b!26165))

(assert (= (and b!26165 res!22519) b!26153))

(assert (= (and b!26153 (not res!22513)) b!26163))

(assert (= (and b!26163 (not res!22511)) b!26150))

(assert (= (and b!26150 res!22516) b!26156))

(assert (= (and b!26150 (not res!22523)) b!26158))

(assert (= (and b!26158 (not res!22509)) b!26148))

(assert (= (and b!26148 (not res!22514)) b!26164))

(assert (= (and b!26164 (not res!22522)) b!26161))

(assert (= (and b!26161 res!22517) b!26152))

(assert (= (and b!26161 (not res!22524)) b!26167))

(assert (= (and b!26167 (not res!22515)) b!26149))

(assert (= (and b!26149 (not res!22525)) b!26155))

(assert (= (and b!26155 (not res!22527)) b!26159))

(assert (= (and b!26159 (not res!22520)) b!26151))

(assert (= (and b!26151 (not res!22526)) b!26157))

(assert (= (and b!26157 (not res!22510)) b!26154))

(assert (= (and b!26154 (not res!22512)) b!26166))

(assert (= (and b!26166 (not res!22521)) b!26162))

(assert (= start!5942 b!26160))

(declare-fun m!37509 () Bool)

(assert (=> b!26163 m!37509))

(declare-fun m!37511 () Bool)

(assert (=> b!26163 m!37511))

(declare-fun m!37513 () Bool)

(assert (=> b!26163 m!37513))

(assert (=> b!26163 m!37509))

(declare-fun m!37515 () Bool)

(assert (=> b!26163 m!37515))

(declare-fun m!37517 () Bool)

(assert (=> b!26163 m!37517))

(declare-fun m!37519 () Bool)

(assert (=> b!26148 m!37519))

(declare-fun m!37521 () Bool)

(assert (=> b!26155 m!37521))

(declare-fun m!37523 () Bool)

(assert (=> b!26155 m!37523))

(declare-fun m!37525 () Bool)

(assert (=> b!26155 m!37525))

(declare-fun m!37527 () Bool)

(assert (=> b!26155 m!37527))

(declare-fun m!37529 () Bool)

(assert (=> b!26155 m!37529))

(declare-fun m!37531 () Bool)

(assert (=> b!26155 m!37531))

(declare-fun m!37533 () Bool)

(assert (=> b!26155 m!37533))

(declare-fun m!37535 () Bool)

(assert (=> b!26155 m!37535))

(declare-fun m!37537 () Bool)

(assert (=> b!26154 m!37537))

(declare-fun m!37539 () Bool)

(assert (=> b!26158 m!37539))

(declare-fun m!37541 () Bool)

(assert (=> b!26156 m!37541))

(assert (=> b!26156 m!37541))

(declare-fun m!37543 () Bool)

(assert (=> b!26156 m!37543))

(declare-fun m!37545 () Bool)

(assert (=> b!26156 m!37545))

(assert (=> b!26156 m!37545))

(declare-fun m!37547 () Bool)

(assert (=> b!26156 m!37547))

(declare-fun m!37549 () Bool)

(assert (=> b!26165 m!37549))

(declare-fun m!37551 () Bool)

(assert (=> b!26159 m!37551))

(declare-fun m!37553 () Bool)

(assert (=> b!26150 m!37553))

(declare-fun m!37555 () Bool)

(assert (=> b!26150 m!37555))

(declare-fun m!37557 () Bool)

(assert (=> b!26150 m!37557))

(declare-fun m!37559 () Bool)

(assert (=> b!26150 m!37559))

(declare-fun m!37561 () Bool)

(assert (=> b!26150 m!37561))

(declare-fun m!37563 () Bool)

(assert (=> b!26150 m!37563))

(declare-fun m!37565 () Bool)

(assert (=> b!26150 m!37565))

(declare-fun m!37567 () Bool)

(assert (=> b!26167 m!37567))

(declare-fun m!37569 () Bool)

(assert (=> b!26153 m!37569))

(declare-fun m!37571 () Bool)

(assert (=> b!26153 m!37571))

(declare-fun m!37573 () Bool)

(assert (=> b!26153 m!37573))

(declare-fun m!37575 () Bool)

(assert (=> b!26157 m!37575))

(declare-fun m!37577 () Bool)

(assert (=> start!5942 m!37577))

(declare-fun m!37579 () Bool)

(assert (=> start!5942 m!37579))

(declare-fun m!37581 () Bool)

(assert (=> b!26160 m!37581))

(declare-fun m!37583 () Bool)

(assert (=> b!26162 m!37583))

(declare-fun m!37585 () Bool)

(assert (=> b!26162 m!37585))

(declare-fun m!37587 () Bool)

(assert (=> b!26149 m!37587))

(declare-fun m!37589 () Bool)

(assert (=> b!26151 m!37589))

(declare-fun m!37591 () Bool)

(assert (=> b!26152 m!37591))

(push 1)

