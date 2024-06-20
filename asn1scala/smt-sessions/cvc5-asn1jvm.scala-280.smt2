; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5660 () Bool)

(assert start!5660)

(declare-fun b!23496 () Bool)

(declare-fun res!20222 () Bool)

(declare-fun e!15915 () Bool)

(assert (=> b!23496 (=> res!20222 e!15915)))

(declare-datatypes ((array!1583 0))(
  ( (array!1584 (arr!1133 (Array (_ BitVec 32) (_ BitVec 8))) (size!677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1186 0))(
  ( (BitStream!1187 (buf!998 array!1583) (currentByte!2311 (_ BitVec 32)) (currentBit!2306 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1997 0))(
  ( (Unit!1998) )
))
(declare-datatypes ((tuple2!2690 0))(
  ( (tuple2!2691 (_1!1432 Unit!1997) (_2!1432 BitStream!1186)) )
))
(declare-fun lt!34026 () tuple2!2690)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23496 (= res!20222 (not (invariant!0 (currentBit!2306 (_2!1432 lt!34026)) (currentByte!2311 (_2!1432 lt!34026)) (size!677 (buf!998 (_2!1432 lt!34026))))))))

(declare-fun b!23497 () Bool)

(declare-fun e!15916 () Bool)

(declare-fun thiss!1379 () BitStream!1186)

(declare-fun array_inv!646 (array!1583) Bool)

(assert (=> b!23497 (= e!15916 (array_inv!646 (buf!998 thiss!1379)))))

(declare-fun b!23498 () Bool)

(declare-fun e!15919 () Bool)

(declare-fun e!15922 () Bool)

(assert (=> b!23498 (= e!15919 e!15922)))

(declare-fun res!20224 () Bool)

(assert (=> b!23498 (=> res!20224 e!15922)))

(declare-fun lt!34024 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!34027 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!23498 (= res!20224 (not (= lt!34027 (bvsub (bvadd lt!34024 to!314) i!635))))))

(declare-fun lt!34030 () tuple2!2690)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23498 (= lt!34027 (bitIndex!0 (size!677 (buf!998 (_2!1432 lt!34030))) (currentByte!2311 (_2!1432 lt!34030)) (currentBit!2306 (_2!1432 lt!34030))))))

(declare-fun b!23499 () Bool)

(declare-fun res!20221 () Bool)

(assert (=> b!23499 (=> res!20221 e!15922)))

(assert (=> b!23499 (= res!20221 (not (= (size!677 (buf!998 thiss!1379)) (size!677 (buf!998 (_2!1432 lt!34030))))))))

(declare-fun res!20220 () Bool)

(declare-fun e!15917 () Bool)

(assert (=> start!5660 (=> (not res!20220) (not e!15917))))

(declare-fun srcBuffer!2 () array!1583)

(assert (=> start!5660 (= res!20220 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!677 srcBuffer!2))))))))

(assert (=> start!5660 e!15917))

(assert (=> start!5660 true))

(assert (=> start!5660 (array_inv!646 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1186) Bool)

(assert (=> start!5660 (and (inv!12 thiss!1379) e!15916)))

(declare-fun b!23500 () Bool)

(declare-fun res!20225 () Bool)

(assert (=> b!23500 (=> (not res!20225) (not e!15917))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23500 (= res!20225 (validate_offset_bits!1 ((_ sign_extend 32) (size!677 (buf!998 thiss!1379))) ((_ sign_extend 32) (currentByte!2311 thiss!1379)) ((_ sign_extend 32) (currentBit!2306 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23501 () Bool)

(declare-fun e!15912 () Bool)

(declare-fun e!15921 () Bool)

(assert (=> b!23501 (= e!15912 e!15921)))

(declare-fun res!20215 () Bool)

(assert (=> b!23501 (=> res!20215 e!15921)))

(declare-fun isPrefixOf!0 (BitStream!1186 BitStream!1186) Bool)

(assert (=> b!23501 (= res!20215 (not (isPrefixOf!0 thiss!1379 (_2!1432 lt!34026))))))

(assert (=> b!23501 (validate_offset_bits!1 ((_ sign_extend 32) (size!677 (buf!998 (_2!1432 lt!34026)))) ((_ sign_extend 32) (currentByte!2311 (_2!1432 lt!34026))) ((_ sign_extend 32) (currentBit!2306 (_2!1432 lt!34026))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34033 () Unit!1997)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1186 BitStream!1186 (_ BitVec 64) (_ BitVec 64)) Unit!1997)

(assert (=> b!23501 (= lt!34033 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1432 lt!34026) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1186 (_ BitVec 8) (_ BitVec 32)) tuple2!2690)

(assert (=> b!23501 (= lt!34026 (appendBitFromByte!0 thiss!1379 (select (arr!1133 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23502 () Bool)

(declare-fun res!20226 () Bool)

(assert (=> b!23502 (=> res!20226 e!15922)))

(assert (=> b!23502 (= res!20226 (not (invariant!0 (currentBit!2306 (_2!1432 lt!34030)) (currentByte!2311 (_2!1432 lt!34030)) (size!677 (buf!998 (_2!1432 lt!34030))))))))

(declare-fun b!23503 () Bool)

(assert (=> b!23503 (= e!15915 true)))

(declare-datatypes ((tuple2!2692 0))(
  ( (tuple2!2693 (_1!1433 BitStream!1186) (_2!1433 BitStream!1186)) )
))
(declare-fun lt!34029 () tuple2!2692)

(declare-fun reader!0 (BitStream!1186 BitStream!1186) tuple2!2692)

(assert (=> b!23503 (= lt!34029 (reader!0 (_2!1432 lt!34026) (_2!1432 lt!34030)))))

(assert (=> b!23503 (validate_offset_bits!1 ((_ sign_extend 32) (size!677 (buf!998 (_2!1432 lt!34030)))) ((_ sign_extend 32) (currentByte!2311 thiss!1379)) ((_ sign_extend 32) (currentBit!2306 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34022 () Unit!1997)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1186 array!1583 (_ BitVec 64)) Unit!1997)

(assert (=> b!23503 (= lt!34022 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!998 (_2!1432 lt!34030)) (bvsub to!314 i!635)))))

(declare-fun lt!34032 () tuple2!2692)

(assert (=> b!23503 (= lt!34032 (reader!0 thiss!1379 (_2!1432 lt!34030)))))

(declare-fun b!23504 () Bool)

(assert (=> b!23504 (= e!15922 e!15915)))

(declare-fun res!20218 () Bool)

(assert (=> b!23504 (=> res!20218 e!15915)))

(assert (=> b!23504 (= res!20218 (not (= (size!677 (buf!998 (_2!1432 lt!34026))) (size!677 (buf!998 (_2!1432 lt!34030))))))))

(declare-fun e!15918 () Bool)

(assert (=> b!23504 e!15918))

(declare-fun res!20223 () Bool)

(assert (=> b!23504 (=> (not res!20223) (not e!15918))))

(assert (=> b!23504 (= res!20223 (= (size!677 (buf!998 (_2!1432 lt!34030))) (size!677 (buf!998 thiss!1379))))))

(declare-fun b!23505 () Bool)

(assert (=> b!23505 (= e!15921 e!15919)))

(declare-fun res!20217 () Bool)

(assert (=> b!23505 (=> res!20217 e!15919)))

(assert (=> b!23505 (= res!20217 (not (isPrefixOf!0 (_2!1432 lt!34026) (_2!1432 lt!34030))))))

(assert (=> b!23505 (isPrefixOf!0 thiss!1379 (_2!1432 lt!34030))))

(declare-fun lt!34028 () Unit!1997)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1186 BitStream!1186 BitStream!1186) Unit!1997)

(assert (=> b!23505 (= lt!34028 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1432 lt!34026) (_2!1432 lt!34030)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1186 array!1583 (_ BitVec 64) (_ BitVec 64)) tuple2!2690)

(assert (=> b!23505 (= lt!34030 (appendBitsMSBFirstLoop!0 (_2!1432 lt!34026) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15913 () Bool)

(assert (=> b!23505 e!15913))

(declare-fun res!20219 () Bool)

(assert (=> b!23505 (=> (not res!20219) (not e!15913))))

(assert (=> b!23505 (= res!20219 (validate_offset_bits!1 ((_ sign_extend 32) (size!677 (buf!998 (_2!1432 lt!34026)))) ((_ sign_extend 32) (currentByte!2311 thiss!1379)) ((_ sign_extend 32) (currentBit!2306 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34023 () Unit!1997)

(assert (=> b!23505 (= lt!34023 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!998 (_2!1432 lt!34026)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34031 () tuple2!2692)

(assert (=> b!23505 (= lt!34031 (reader!0 thiss!1379 (_2!1432 lt!34026)))))

(declare-fun b!23506 () Bool)

(declare-datatypes ((List!294 0))(
  ( (Nil!291) (Cons!290 (h!409 Bool) (t!1044 List!294)) )
))
(declare-fun head!131 (List!294) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1186 array!1583 (_ BitVec 64) (_ BitVec 64)) List!294)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1186 BitStream!1186 (_ BitVec 64)) List!294)

(assert (=> b!23506 (= e!15913 (= (head!131 (byteArrayBitContentToList!0 (_2!1432 lt!34026) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!131 (bitStreamReadBitsIntoList!0 (_2!1432 lt!34026) (_1!1433 lt!34031) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23507 () Bool)

(declare-fun res!20216 () Bool)

(assert (=> b!23507 (=> res!20216 e!15915)))

(assert (=> b!23507 (= res!20216 (not (invariant!0 (currentBit!2306 (_2!1432 lt!34026)) (currentByte!2311 (_2!1432 lt!34026)) (size!677 (buf!998 (_2!1432 lt!34030))))))))

(declare-fun b!23508 () Bool)

(assert (=> b!23508 (= e!15917 (not e!15912))))

(declare-fun res!20214 () Bool)

(assert (=> b!23508 (=> res!20214 e!15912)))

(assert (=> b!23508 (= res!20214 (bvsge i!635 to!314))))

(assert (=> b!23508 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34025 () Unit!1997)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1186) Unit!1997)

(assert (=> b!23508 (= lt!34025 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23508 (= lt!34024 (bitIndex!0 (size!677 (buf!998 thiss!1379)) (currentByte!2311 thiss!1379) (currentBit!2306 thiss!1379)))))

(declare-fun b!23509 () Bool)

(assert (=> b!23509 (= e!15918 (= lt!34027 (bvsub (bvsub (bvadd (bitIndex!0 (size!677 (buf!998 (_2!1432 lt!34026))) (currentByte!2311 (_2!1432 lt!34026)) (currentBit!2306 (_2!1432 lt!34026))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!5660 res!20220) b!23500))

(assert (= (and b!23500 res!20225) b!23508))

(assert (= (and b!23508 (not res!20214)) b!23501))

(assert (= (and b!23501 (not res!20215)) b!23505))

(assert (= (and b!23505 res!20219) b!23506))

(assert (= (and b!23505 (not res!20217)) b!23498))

(assert (= (and b!23498 (not res!20224)) b!23502))

(assert (= (and b!23502 (not res!20226)) b!23499))

(assert (= (and b!23499 (not res!20221)) b!23504))

(assert (= (and b!23504 res!20223) b!23509))

(assert (= (and b!23504 (not res!20218)) b!23496))

(assert (= (and b!23496 (not res!20222)) b!23507))

(assert (= (and b!23507 (not res!20216)) b!23503))

(assert (= start!5660 b!23497))

(declare-fun m!33021 () Bool)

(assert (=> b!23496 m!33021))

(declare-fun m!33023 () Bool)

(assert (=> b!23507 m!33023))

(declare-fun m!33025 () Bool)

(assert (=> b!23506 m!33025))

(assert (=> b!23506 m!33025))

(declare-fun m!33027 () Bool)

(assert (=> b!23506 m!33027))

(declare-fun m!33029 () Bool)

(assert (=> b!23506 m!33029))

(assert (=> b!23506 m!33029))

(declare-fun m!33031 () Bool)

(assert (=> b!23506 m!33031))

(declare-fun m!33033 () Bool)

(assert (=> b!23505 m!33033))

(declare-fun m!33035 () Bool)

(assert (=> b!23505 m!33035))

(declare-fun m!33037 () Bool)

(assert (=> b!23505 m!33037))

(declare-fun m!33039 () Bool)

(assert (=> b!23505 m!33039))

(declare-fun m!33041 () Bool)

(assert (=> b!23505 m!33041))

(declare-fun m!33043 () Bool)

(assert (=> b!23505 m!33043))

(declare-fun m!33045 () Bool)

(assert (=> b!23505 m!33045))

(declare-fun m!33047 () Bool)

(assert (=> b!23497 m!33047))

(declare-fun m!33049 () Bool)

(assert (=> b!23498 m!33049))

(declare-fun m!33051 () Bool)

(assert (=> b!23508 m!33051))

(declare-fun m!33053 () Bool)

(assert (=> b!23508 m!33053))

(declare-fun m!33055 () Bool)

(assert (=> b!23508 m!33055))

(declare-fun m!33057 () Bool)

(assert (=> start!5660 m!33057))

(declare-fun m!33059 () Bool)

(assert (=> start!5660 m!33059))

(declare-fun m!33061 () Bool)

(assert (=> b!23509 m!33061))

(declare-fun m!33063 () Bool)

(assert (=> b!23502 m!33063))

(declare-fun m!33065 () Bool)

(assert (=> b!23503 m!33065))

(declare-fun m!33067 () Bool)

(assert (=> b!23503 m!33067))

(declare-fun m!33069 () Bool)

(assert (=> b!23503 m!33069))

(declare-fun m!33071 () Bool)

(assert (=> b!23503 m!33071))

(declare-fun m!33073 () Bool)

(assert (=> b!23501 m!33073))

(declare-fun m!33075 () Bool)

(assert (=> b!23501 m!33075))

(declare-fun m!33077 () Bool)

(assert (=> b!23501 m!33077))

(assert (=> b!23501 m!33073))

(declare-fun m!33079 () Bool)

(assert (=> b!23501 m!33079))

(declare-fun m!33081 () Bool)

(assert (=> b!23501 m!33081))

(declare-fun m!33083 () Bool)

(assert (=> b!23500 m!33083))

(push 1)

(assert (not b!23498))

(assert (not b!23509))

(assert (not b!23501))

(assert (not b!23503))

(assert (not b!23505))

(assert (not b!23497))

(assert (not b!23502))

(assert (not start!5660))

(assert (not b!23506))

(assert (not b!23508))

(assert (not b!23496))

(assert (not b!23507))

(assert (not b!23500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

