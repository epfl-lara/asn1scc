; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5644 () Bool)

(assert start!5644)

(declare-fun b!23160 () Bool)

(declare-fun e!15650 () Bool)

(declare-fun e!15655 () Bool)

(assert (=> b!23160 (= e!15650 e!15655)))

(declare-fun res!19910 () Bool)

(assert (=> b!23160 (=> res!19910 e!15655)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!33775 () (_ BitVec 64))

(declare-fun lt!33776 () (_ BitVec 64))

(assert (=> b!23160 (= res!19910 (not (= lt!33776 (bvsub (bvadd lt!33775 to!314) i!635))))))

(declare-datatypes ((array!1567 0))(
  ( (array!1568 (arr!1125 (Array (_ BitVec 32) (_ BitVec 8))) (size!669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1170 0))(
  ( (BitStream!1171 (buf!990 array!1567) (currentByte!2303 (_ BitVec 32)) (currentBit!2298 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1981 0))(
  ( (Unit!1982) )
))
(declare-datatypes ((tuple2!2658 0))(
  ( (tuple2!2659 (_1!1416 Unit!1981) (_2!1416 BitStream!1170)) )
))
(declare-fun lt!33771 () tuple2!2658)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23160 (= lt!33776 (bitIndex!0 (size!669 (buf!990 (_2!1416 lt!33771))) (currentByte!2303 (_2!1416 lt!33771)) (currentBit!2298 (_2!1416 lt!33771))))))

(declare-fun b!23161 () Bool)

(declare-fun res!19907 () Bool)

(assert (=> b!23161 (=> res!19907 e!15655)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23161 (= res!19907 (not (invariant!0 (currentBit!2298 (_2!1416 lt!33771)) (currentByte!2303 (_2!1416 lt!33771)) (size!669 (buf!990 (_2!1416 lt!33771))))))))

(declare-fun b!23162 () Bool)

(declare-fun e!15648 () Bool)

(assert (=> b!23162 (= e!15655 e!15648)))

(declare-fun res!19909 () Bool)

(assert (=> b!23162 (=> res!19909 e!15648)))

(declare-fun lt!33777 () tuple2!2658)

(assert (=> b!23162 (= res!19909 (not (= (size!669 (buf!990 (_2!1416 lt!33777))) (size!669 (buf!990 (_2!1416 lt!33771))))))))

(declare-fun e!15649 () Bool)

(assert (=> b!23162 e!15649))

(declare-fun res!19904 () Bool)

(assert (=> b!23162 (=> (not res!19904) (not e!15649))))

(declare-fun thiss!1379 () BitStream!1170)

(assert (=> b!23162 (= res!19904 (= (size!669 (buf!990 (_2!1416 lt!33771))) (size!669 (buf!990 thiss!1379))))))

(declare-fun b!23163 () Bool)

(declare-fun e!15653 () Bool)

(assert (=> b!23163 (= e!15653 e!15650)))

(declare-fun res!19902 () Bool)

(assert (=> b!23163 (=> res!19902 e!15650)))

(declare-fun isPrefixOf!0 (BitStream!1170 BitStream!1170) Bool)

(assert (=> b!23163 (= res!19902 (not (isPrefixOf!0 (_2!1416 lt!33777) (_2!1416 lt!33771))))))

(assert (=> b!23163 (isPrefixOf!0 thiss!1379 (_2!1416 lt!33771))))

(declare-fun lt!33774 () Unit!1981)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1170 BitStream!1170 BitStream!1170) Unit!1981)

(assert (=> b!23163 (= lt!33774 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1416 lt!33777) (_2!1416 lt!33771)))))

(declare-fun srcBuffer!2 () array!1567)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1170 array!1567 (_ BitVec 64) (_ BitVec 64)) tuple2!2658)

(assert (=> b!23163 (= lt!33771 (appendBitsMSBFirstLoop!0 (_2!1416 lt!33777) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15658 () Bool)

(assert (=> b!23163 e!15658))

(declare-fun res!19911 () Bool)

(assert (=> b!23163 (=> (not res!19911) (not e!15658))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23163 (= res!19911 (validate_offset_bits!1 ((_ sign_extend 32) (size!669 (buf!990 (_2!1416 lt!33777)))) ((_ sign_extend 32) (currentByte!2303 thiss!1379)) ((_ sign_extend 32) (currentBit!2298 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33772 () Unit!1981)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1170 array!1567 (_ BitVec 64)) Unit!1981)

(assert (=> b!23163 (= lt!33772 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!990 (_2!1416 lt!33777)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2660 0))(
  ( (tuple2!2661 (_1!1417 BitStream!1170) (_2!1417 BitStream!1170)) )
))
(declare-fun lt!33778 () tuple2!2660)

(declare-fun reader!0 (BitStream!1170 BitStream!1170) tuple2!2660)

(assert (=> b!23163 (= lt!33778 (reader!0 thiss!1379 (_2!1416 lt!33777)))))

(declare-fun res!19913 () Bool)

(declare-fun e!15656 () Bool)

(assert (=> start!5644 (=> (not res!19913) (not e!15656))))

(assert (=> start!5644 (= res!19913 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!669 srcBuffer!2))))))))

(assert (=> start!5644 e!15656))

(assert (=> start!5644 true))

(declare-fun array_inv!638 (array!1567) Bool)

(assert (=> start!5644 (array_inv!638 srcBuffer!2)))

(declare-fun e!15651 () Bool)

(declare-fun inv!12 (BitStream!1170) Bool)

(assert (=> start!5644 (and (inv!12 thiss!1379) e!15651)))

(declare-fun b!23164 () Bool)

(assert (=> b!23164 (= e!15648 true)))

(declare-fun lt!33769 () tuple2!2660)

(assert (=> b!23164 (= lt!33769 (reader!0 thiss!1379 (_2!1416 lt!33771)))))

(declare-fun b!23165 () Bool)

(declare-fun res!19906 () Bool)

(assert (=> b!23165 (=> (not res!19906) (not e!15656))))

(assert (=> b!23165 (= res!19906 (validate_offset_bits!1 ((_ sign_extend 32) (size!669 (buf!990 thiss!1379))) ((_ sign_extend 32) (currentByte!2303 thiss!1379)) ((_ sign_extend 32) (currentBit!2298 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23166 () Bool)

(declare-fun e!15657 () Bool)

(assert (=> b!23166 (= e!15656 (not e!15657))))

(declare-fun res!19905 () Bool)

(assert (=> b!23166 (=> res!19905 e!15657)))

(assert (=> b!23166 (= res!19905 (bvsge i!635 to!314))))

(assert (=> b!23166 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33773 () Unit!1981)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1170) Unit!1981)

(assert (=> b!23166 (= lt!33773 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23166 (= lt!33775 (bitIndex!0 (size!669 (buf!990 thiss!1379)) (currentByte!2303 thiss!1379) (currentBit!2298 thiss!1379)))))

(declare-fun b!23167 () Bool)

(declare-datatypes ((List!286 0))(
  ( (Nil!283) (Cons!282 (h!401 Bool) (t!1036 List!286)) )
))
(declare-fun head!123 (List!286) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1170 array!1567 (_ BitVec 64) (_ BitVec 64)) List!286)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1170 BitStream!1170 (_ BitVec 64)) List!286)

(assert (=> b!23167 (= e!15658 (= (head!123 (byteArrayBitContentToList!0 (_2!1416 lt!33777) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!123 (bitStreamReadBitsIntoList!0 (_2!1416 lt!33777) (_1!1417 lt!33778) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23168 () Bool)

(declare-fun res!19908 () Bool)

(assert (=> b!23168 (=> res!19908 e!15648)))

(assert (=> b!23168 (= res!19908 (not (invariant!0 (currentBit!2298 (_2!1416 lt!33777)) (currentByte!2303 (_2!1416 lt!33777)) (size!669 (buf!990 (_2!1416 lt!33777))))))))

(declare-fun b!23169 () Bool)

(assert (=> b!23169 (= e!15649 (= lt!33776 (bvsub (bvsub (bvadd (bitIndex!0 (size!669 (buf!990 (_2!1416 lt!33777))) (currentByte!2303 (_2!1416 lt!33777)) (currentBit!2298 (_2!1416 lt!33777))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23170 () Bool)

(assert (=> b!23170 (= e!15651 (array_inv!638 (buf!990 thiss!1379)))))

(declare-fun b!23171 () Bool)

(declare-fun res!19912 () Bool)

(assert (=> b!23171 (=> res!19912 e!15655)))

(assert (=> b!23171 (= res!19912 (not (= (size!669 (buf!990 thiss!1379)) (size!669 (buf!990 (_2!1416 lt!33771))))))))

(declare-fun b!23172 () Bool)

(assert (=> b!23172 (= e!15657 e!15653)))

(declare-fun res!19914 () Bool)

(assert (=> b!23172 (=> res!19914 e!15653)))

(assert (=> b!23172 (= res!19914 (not (isPrefixOf!0 thiss!1379 (_2!1416 lt!33777))))))

(assert (=> b!23172 (validate_offset_bits!1 ((_ sign_extend 32) (size!669 (buf!990 (_2!1416 lt!33777)))) ((_ sign_extend 32) (currentByte!2303 (_2!1416 lt!33777))) ((_ sign_extend 32) (currentBit!2298 (_2!1416 lt!33777))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33770 () Unit!1981)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1170 BitStream!1170 (_ BitVec 64) (_ BitVec 64)) Unit!1981)

(assert (=> b!23172 (= lt!33770 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1416 lt!33777) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1170 (_ BitVec 8) (_ BitVec 32)) tuple2!2658)

(assert (=> b!23172 (= lt!33777 (appendBitFromByte!0 thiss!1379 (select (arr!1125 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23173 () Bool)

(declare-fun res!19903 () Bool)

(assert (=> b!23173 (=> res!19903 e!15648)))

(assert (=> b!23173 (= res!19903 (not (invariant!0 (currentBit!2298 (_2!1416 lt!33777)) (currentByte!2303 (_2!1416 lt!33777)) (size!669 (buf!990 (_2!1416 lt!33771))))))))

(assert (= (and start!5644 res!19913) b!23165))

(assert (= (and b!23165 res!19906) b!23166))

(assert (= (and b!23166 (not res!19905)) b!23172))

(assert (= (and b!23172 (not res!19914)) b!23163))

(assert (= (and b!23163 res!19911) b!23167))

(assert (= (and b!23163 (not res!19902)) b!23160))

(assert (= (and b!23160 (not res!19910)) b!23161))

(assert (= (and b!23161 (not res!19907)) b!23171))

(assert (= (and b!23171 (not res!19912)) b!23162))

(assert (= (and b!23162 res!19904) b!23169))

(assert (= (and b!23162 (not res!19909)) b!23168))

(assert (= (and b!23168 (not res!19908)) b!23173))

(assert (= (and b!23173 (not res!19903)) b!23164))

(assert (= start!5644 b!23170))

(declare-fun m!32545 () Bool)

(assert (=> start!5644 m!32545))

(declare-fun m!32547 () Bool)

(assert (=> start!5644 m!32547))

(declare-fun m!32549 () Bool)

(assert (=> b!23167 m!32549))

(assert (=> b!23167 m!32549))

(declare-fun m!32551 () Bool)

(assert (=> b!23167 m!32551))

(declare-fun m!32553 () Bool)

(assert (=> b!23167 m!32553))

(assert (=> b!23167 m!32553))

(declare-fun m!32555 () Bool)

(assert (=> b!23167 m!32555))

(declare-fun m!32557 () Bool)

(assert (=> b!23161 m!32557))

(declare-fun m!32559 () Bool)

(assert (=> b!23173 m!32559))

(declare-fun m!32561 () Bool)

(assert (=> b!23169 m!32561))

(declare-fun m!32563 () Bool)

(assert (=> b!23168 m!32563))

(declare-fun m!32565 () Bool)

(assert (=> b!23165 m!32565))

(declare-fun m!32567 () Bool)

(assert (=> b!23160 m!32567))

(declare-fun m!32569 () Bool)

(assert (=> b!23172 m!32569))

(declare-fun m!32571 () Bool)

(assert (=> b!23172 m!32571))

(assert (=> b!23172 m!32569))

(declare-fun m!32573 () Bool)

(assert (=> b!23172 m!32573))

(declare-fun m!32575 () Bool)

(assert (=> b!23172 m!32575))

(declare-fun m!32577 () Bool)

(assert (=> b!23172 m!32577))

(declare-fun m!32579 () Bool)

(assert (=> b!23164 m!32579))

(declare-fun m!32581 () Bool)

(assert (=> b!23166 m!32581))

(declare-fun m!32583 () Bool)

(assert (=> b!23166 m!32583))

(declare-fun m!32585 () Bool)

(assert (=> b!23166 m!32585))

(declare-fun m!32587 () Bool)

(assert (=> b!23170 m!32587))

(declare-fun m!32589 () Bool)

(assert (=> b!23163 m!32589))

(declare-fun m!32591 () Bool)

(assert (=> b!23163 m!32591))

(declare-fun m!32593 () Bool)

(assert (=> b!23163 m!32593))

(declare-fun m!32595 () Bool)

(assert (=> b!23163 m!32595))

(declare-fun m!32597 () Bool)

(assert (=> b!23163 m!32597))

(declare-fun m!32599 () Bool)

(assert (=> b!23163 m!32599))

(declare-fun m!32601 () Bool)

(assert (=> b!23163 m!32601))

(check-sat (not b!23164) (not b!23163) (not b!23170) (not start!5644) (not b!23169) (not b!23161) (not b!23172) (not b!23160) (not b!23166) (not b!23165) (not b!23168) (not b!23173) (not b!23167))
