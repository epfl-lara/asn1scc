; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13916 () Bool)

(assert start!13916)

(declare-fun res!58665 () Bool)

(declare-fun e!46343 () Bool)

(assert (=> start!13916 (=> (not res!58665) (not e!46343))))

(declare-datatypes ((array!2928 0))(
  ( (array!2929 (arr!1953 (Array (_ BitVec 32) (_ BitVec 8))) (size!1365 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2928)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13916 (= res!58665 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1365 srcBuffer!2))))))))

(assert (=> start!13916 e!46343))

(assert (=> start!13916 true))

(declare-fun array_inv!1217 (array!2928) Bool)

(assert (=> start!13916 (array_inv!1217 srcBuffer!2)))

(declare-datatypes ((BitStream!2316 0))(
  ( (BitStream!2317 (buf!1746 array!2928) (currentByte!3466 (_ BitVec 32)) (currentBit!3461 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2316)

(declare-fun e!46348 () Bool)

(declare-fun inv!12 (BitStream!2316) Bool)

(assert (=> start!13916 (and (inv!12 thiss!1379) e!46348)))

(declare-fun b!71152 () Bool)

(declare-fun e!46336 () Bool)

(declare-fun e!46340 () Bool)

(assert (=> b!71152 (= e!46336 e!46340)))

(declare-fun res!58674 () Bool)

(assert (=> b!71152 (=> res!58674 e!46340)))

(declare-datatypes ((List!733 0))(
  ( (Nil!730) (Cons!729 (h!848 Bool) (t!1483 List!733)) )
))
(declare-fun lt!114851 () List!733)

(declare-fun lt!114837 () List!733)

(assert (=> b!71152 (= res!58674 (not (= lt!114851 lt!114837)))))

(assert (=> b!71152 (= lt!114837 lt!114851)))

(declare-fun lt!114847 () List!733)

(declare-fun tail!337 (List!733) List!733)

(assert (=> b!71152 (= lt!114851 (tail!337 lt!114847))))

(declare-datatypes ((Unit!4759 0))(
  ( (Unit!4760) )
))
(declare-datatypes ((tuple2!6162 0))(
  ( (tuple2!6163 (_1!3195 Unit!4759) (_2!3195 BitStream!2316)) )
))
(declare-fun lt!114848 () tuple2!6162)

(declare-datatypes ((tuple2!6164 0))(
  ( (tuple2!6165 (_1!3196 BitStream!2316) (_2!3196 BitStream!2316)) )
))
(declare-fun lt!114850 () tuple2!6164)

(declare-fun lt!114834 () Unit!4759)

(declare-fun lt!114829 () tuple2!6164)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2316 BitStream!2316 BitStream!2316 BitStream!2316 (_ BitVec 64) List!733) Unit!4759)

(assert (=> b!71152 (= lt!114834 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3195 lt!114848) (_2!3195 lt!114848) (_1!3196 lt!114850) (_1!3196 lt!114829) (bvsub to!314 i!635) lt!114847))))

(declare-fun b!71153 () Bool)

(declare-fun e!46338 () Bool)

(declare-fun e!46337 () Bool)

(assert (=> b!71153 (= e!46338 e!46337)))

(declare-fun res!58668 () Bool)

(assert (=> b!71153 (=> res!58668 e!46337)))

(declare-fun lt!114843 () tuple2!6162)

(declare-fun isPrefixOf!0 (BitStream!2316 BitStream!2316) Bool)

(assert (=> b!71153 (= res!58668 (not (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!114848))))))

(assert (=> b!71153 (isPrefixOf!0 thiss!1379 (_2!3195 lt!114848))))

(declare-fun lt!114841 () Unit!4759)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2316 BitStream!2316 BitStream!2316) Unit!4759)

(assert (=> b!71153 (= lt!114841 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3195 lt!114843) (_2!3195 lt!114848)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2316 array!2928 (_ BitVec 64) (_ BitVec 64)) tuple2!6162)

(assert (=> b!71153 (= lt!114848 (appendBitsMSBFirstLoop!0 (_2!3195 lt!114843) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!46346 () Bool)

(assert (=> b!71153 e!46346))

(declare-fun res!58670 () Bool)

(assert (=> b!71153 (=> (not res!58670) (not e!46346))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71153 (= res!58670 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114844 () Unit!4759)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2316 array!2928 (_ BitVec 64)) Unit!4759)

(assert (=> b!71153 (= lt!114844 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1746 (_2!3195 lt!114843)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114830 () tuple2!6164)

(declare-fun reader!0 (BitStream!2316 BitStream!2316) tuple2!6164)

(assert (=> b!71153 (= lt!114830 (reader!0 thiss!1379 (_2!3195 lt!114843)))))

(declare-fun b!71154 () Bool)

(declare-fun e!46350 () Bool)

(declare-fun e!46339 () Bool)

(assert (=> b!71154 (= e!46350 e!46339)))

(declare-fun res!58664 () Bool)

(assert (=> b!71154 (=> res!58664 e!46339)))

(declare-fun lt!114831 () Bool)

(declare-fun lt!114842 () Bool)

(assert (=> b!71154 (= res!58664 (not (= lt!114831 lt!114842)))))

(declare-fun bitAt!0 (array!2928 (_ BitVec 64)) Bool)

(assert (=> b!71154 (= lt!114842 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun head!552 (List!733) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2316 array!2928 (_ BitVec 64) (_ BitVec 64)) List!733)

(assert (=> b!71154 (= lt!114831 (head!552 (byteArrayBitContentToList!0 (_2!3195 lt!114848) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!71155 () Bool)

(declare-fun e!46341 () Bool)

(assert (=> b!71155 (= e!46341 e!46338)))

(declare-fun res!58681 () Bool)

(assert (=> b!71155 (=> res!58681 e!46338)))

(assert (=> b!71155 (= res!58681 (not (isPrefixOf!0 thiss!1379 (_2!3195 lt!114843))))))

(declare-fun lt!114852 () (_ BitVec 64))

(assert (=> b!71155 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!114852)))

(assert (=> b!71155 (= lt!114852 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114839 () Unit!4759)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2316 BitStream!2316 (_ BitVec 64) (_ BitVec 64)) Unit!4759)

(assert (=> b!71155 (= lt!114839 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3195 lt!114843) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2316 (_ BitVec 8) (_ BitVec 32)) tuple2!6162)

(assert (=> b!71155 (= lt!114843 (appendBitFromByte!0 thiss!1379 (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!71156 () Bool)

(assert (=> b!71156 (= e!46348 (array_inv!1217 (buf!1746 thiss!1379)))))

(declare-fun b!71157 () Bool)

(declare-fun e!46352 () Bool)

(declare-fun e!46344 () Bool)

(assert (=> b!71157 (= e!46352 e!46344)))

(declare-fun res!58667 () Bool)

(assert (=> b!71157 (=> res!58667 e!46344)))

(declare-fun lt!114826 () Bool)

(assert (=> b!71157 (= res!58667 (not (= lt!114826 lt!114842)))))

(declare-fun lt!114828 () Bool)

(assert (=> b!71157 (= lt!114828 lt!114826)))

(declare-fun lt!114833 () (_ BitVec 64))

(assert (=> b!71157 (= lt!114826 (bitAt!0 (buf!1746 (_2!3195 lt!114848)) lt!114833))))

(declare-fun lt!114849 () Unit!4759)

(declare-fun lt!114838 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2928 array!2928 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4759)

(assert (=> b!71157 (= lt!114849 (arrayBitRangesEqImpliesEq!0 (buf!1746 (_2!3195 lt!114843)) (buf!1746 (_2!3195 lt!114848)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114833 lt!114838))))

(declare-fun b!71158 () Bool)

(declare-fun res!58676 () Bool)

(assert (=> b!71158 (=> (not res!58676) (not e!46343))))

(assert (=> b!71158 (= res!58676 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 thiss!1379))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!71159 () Bool)

(declare-fun e!46349 () Bool)

(assert (=> b!71159 (= e!46337 e!46349)))

(declare-fun res!58675 () Bool)

(assert (=> b!71159 (=> res!58675 e!46349)))

(declare-fun lt!114835 () (_ BitVec 64))

(declare-fun lt!114853 () (_ BitVec 64))

(assert (=> b!71159 (= res!58675 (not (= lt!114835 lt!114853)))))

(declare-fun lt!114840 () (_ BitVec 64))

(assert (=> b!71159 (= lt!114853 (bvsub lt!114840 i!635))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!71159 (= lt!114835 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114848))) (currentByte!3466 (_2!3195 lt!114848)) (currentBit!3461 (_2!3195 lt!114848))))))

(assert (=> b!71159 (= lt!114840 (bvadd lt!114833 to!314))))

(declare-fun b!71160 () Bool)

(declare-fun res!58677 () Bool)

(declare-fun e!46347 () Bool)

(assert (=> b!71160 (=> res!58677 e!46347)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!71160 (= res!58677 (not (invariant!0 (currentBit!3461 (_2!3195 lt!114843)) (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114843))))))))

(declare-fun b!71161 () Bool)

(assert (=> b!71161 (= e!46339 e!46352)))

(declare-fun res!58673 () Bool)

(assert (=> b!71161 (=> res!58673 e!46352)))

(assert (=> b!71161 (= res!58673 (not (= lt!114828 lt!114842)))))

(assert (=> b!71161 (= lt!114828 (bitAt!0 (buf!1746 (_2!3195 lt!114843)) lt!114833))))

(declare-fun b!71162 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2316 BitStream!2316 (_ BitVec 64)) List!733)

(assert (=> b!71162 (= e!46346 (= (head!552 (byteArrayBitContentToList!0 (_2!3195 lt!114843) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!552 (bitStreamReadBitsIntoList!0 (_2!3195 lt!114843) (_1!3196 lt!114830) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!71163 () Bool)

(declare-fun e!46351 () Bool)

(assert (=> b!71163 (= e!46351 e!46350)))

(declare-fun res!58671 () Bool)

(assert (=> b!71163 (=> res!58671 e!46350)))

(declare-fun lt!114845 () Bool)

(declare-fun lt!114836 () Bool)

(assert (=> b!71163 (= res!58671 (not (= lt!114845 lt!114836)))))

(assert (=> b!71163 (= lt!114845 (head!552 lt!114847))))

(declare-fun b!71164 () Bool)

(declare-fun res!58672 () Bool)

(assert (=> b!71164 (=> res!58672 e!46349)))

(assert (=> b!71164 (= res!58672 (not (= (size!1365 (buf!1746 thiss!1379)) (size!1365 (buf!1746 (_2!3195 lt!114848))))))))

(declare-fun b!71165 () Bool)

(declare-fun res!58669 () Bool)

(assert (=> b!71165 (=> res!58669 e!46349)))

(assert (=> b!71165 (= res!58669 (not (invariant!0 (currentBit!3461 (_2!3195 lt!114848)) (currentByte!3466 (_2!3195 lt!114848)) (size!1365 (buf!1746 (_2!3195 lt!114848))))))))

(declare-fun b!71166 () Bool)

(declare-fun res!58666 () Bool)

(assert (=> b!71166 (=> res!58666 e!46336)))

(declare-fun length!361 (List!733) Int)

(assert (=> b!71166 (= res!58666 (<= (length!361 lt!114847) 0))))

(declare-fun b!71167 () Bool)

(declare-fun res!58683 () Bool)

(assert (=> b!71167 (=> res!58683 e!46347)))

(assert (=> b!71167 (= res!58683 (not (invariant!0 (currentBit!3461 (_2!3195 lt!114843)) (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114848))))))))

(declare-fun b!71168 () Bool)

(assert (=> b!71168 (= e!46349 e!46347)))

(declare-fun res!58663 () Bool)

(assert (=> b!71168 (=> res!58663 e!46347)))

(assert (=> b!71168 (= res!58663 (not (= (size!1365 (buf!1746 (_2!3195 lt!114843))) (size!1365 (buf!1746 (_2!3195 lt!114848))))))))

(assert (=> b!71168 (= lt!114835 (bvsub (bvsub (bvadd lt!114838 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71168 (= lt!114838 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(assert (=> b!71168 (= (size!1365 (buf!1746 (_2!3195 lt!114848))) (size!1365 (buf!1746 thiss!1379)))))

(declare-fun b!71169 () Bool)

(assert (=> b!71169 (= e!46347 e!46336)))

(declare-fun res!58679 () Bool)

(assert (=> b!71169 (=> res!58679 e!46336)))

(assert (=> b!71169 (= res!58679 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!71169 (= lt!114837 (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_1!3196 lt!114829) lt!114852))))

(assert (=> b!71169 (= lt!114847 (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_1!3196 lt!114850) (bvsub to!314 i!635)))))

(assert (=> b!71169 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!114852)))

(declare-fun lt!114827 () Unit!4759)

(assert (=> b!71169 (= lt!114827 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3195 lt!114843) (buf!1746 (_2!3195 lt!114848)) lt!114852))))

(assert (=> b!71169 (= lt!114829 (reader!0 (_2!3195 lt!114843) (_2!3195 lt!114848)))))

(assert (=> b!71169 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!114832 () Unit!4759)

(assert (=> b!71169 (= lt!114832 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1746 (_2!3195 lt!114848)) (bvsub to!314 i!635)))))

(assert (=> b!71169 (= lt!114850 (reader!0 thiss!1379 (_2!3195 lt!114848)))))

(declare-fun b!71170 () Bool)

(assert (=> b!71170 (= e!46340 e!46351)))

(declare-fun res!58678 () Bool)

(assert (=> b!71170 (=> res!58678 e!46351)))

(assert (=> b!71170 (= res!58678 (not (= lt!114836 (bitAt!0 (buf!1746 (_1!3196 lt!114829)) lt!114833))))))

(assert (=> b!71170 (= lt!114836 (bitAt!0 (buf!1746 (_1!3196 lt!114850)) lt!114833))))

(declare-fun b!71171 () Bool)

(declare-fun res!58680 () Bool)

(assert (=> b!71171 (=> res!58680 e!46344)))

(declare-datatypes ((tuple2!6166 0))(
  ( (tuple2!6167 (_1!3197 BitStream!2316) (_2!3197 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2316) tuple2!6166)

(assert (=> b!71171 (= res!58680 (not (= (_2!3197 (readBitPure!0 (_1!3196 lt!114850))) lt!114842)))))

(declare-fun b!71172 () Bool)

(assert (=> b!71172 (= e!46343 (not e!46341))))

(declare-fun res!58682 () Bool)

(assert (=> b!71172 (=> res!58682 e!46341)))

(assert (=> b!71172 (= res!58682 (bvsge i!635 to!314))))

(assert (=> b!71172 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!114846 () Unit!4759)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2316) Unit!4759)

(assert (=> b!71172 (= lt!114846 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!71172 (= lt!114833 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(declare-fun b!71173 () Bool)

(assert (=> b!71173 (= e!46344 (or (not (= lt!114845 lt!114831)) (let ((bdg!3338 (bvand lt!114840 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!3338 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!3338 (bvand lt!114853 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!13916 res!58665) b!71158))

(assert (= (and b!71158 res!58676) b!71172))

(assert (= (and b!71172 (not res!58682)) b!71155))

(assert (= (and b!71155 (not res!58681)) b!71153))

(assert (= (and b!71153 res!58670) b!71162))

(assert (= (and b!71153 (not res!58668)) b!71159))

(assert (= (and b!71159 (not res!58675)) b!71165))

(assert (= (and b!71165 (not res!58669)) b!71164))

(assert (= (and b!71164 (not res!58672)) b!71168))

(assert (= (and b!71168 (not res!58663)) b!71160))

(assert (= (and b!71160 (not res!58677)) b!71167))

(assert (= (and b!71167 (not res!58683)) b!71169))

(assert (= (and b!71169 (not res!58679)) b!71166))

(assert (= (and b!71166 (not res!58666)) b!71152))

(assert (= (and b!71152 (not res!58674)) b!71170))

(assert (= (and b!71170 (not res!58678)) b!71163))

(assert (= (and b!71163 (not res!58671)) b!71154))

(assert (= (and b!71154 (not res!58664)) b!71161))

(assert (= (and b!71161 (not res!58673)) b!71157))

(assert (= (and b!71157 (not res!58667)) b!71171))

(assert (= (and b!71171 (not res!58680)) b!71173))

(assert (= start!13916 b!71156))

(declare-fun m!114081 () Bool)

(assert (=> b!71172 m!114081))

(declare-fun m!114083 () Bool)

(assert (=> b!71172 m!114083))

(declare-fun m!114085 () Bool)

(assert (=> b!71172 m!114085))

(declare-fun m!114087 () Bool)

(assert (=> b!71162 m!114087))

(assert (=> b!71162 m!114087))

(declare-fun m!114089 () Bool)

(assert (=> b!71162 m!114089))

(declare-fun m!114091 () Bool)

(assert (=> b!71162 m!114091))

(assert (=> b!71162 m!114091))

(declare-fun m!114093 () Bool)

(assert (=> b!71162 m!114093))

(declare-fun m!114095 () Bool)

(assert (=> b!71152 m!114095))

(declare-fun m!114097 () Bool)

(assert (=> b!71152 m!114097))

(declare-fun m!114099 () Bool)

(assert (=> b!71161 m!114099))

(declare-fun m!114101 () Bool)

(assert (=> b!71157 m!114101))

(declare-fun m!114103 () Bool)

(assert (=> b!71157 m!114103))

(declare-fun m!114105 () Bool)

(assert (=> b!71155 m!114105))

(declare-fun m!114107 () Bool)

(assert (=> b!71155 m!114107))

(assert (=> b!71155 m!114105))

(declare-fun m!114109 () Bool)

(assert (=> b!71155 m!114109))

(declare-fun m!114111 () Bool)

(assert (=> b!71155 m!114111))

(declare-fun m!114113 () Bool)

(assert (=> b!71155 m!114113))

(declare-fun m!114115 () Bool)

(assert (=> b!71163 m!114115))

(declare-fun m!114117 () Bool)

(assert (=> b!71170 m!114117))

(declare-fun m!114119 () Bool)

(assert (=> b!71170 m!114119))

(declare-fun m!114121 () Bool)

(assert (=> b!71154 m!114121))

(declare-fun m!114123 () Bool)

(assert (=> b!71154 m!114123))

(assert (=> b!71154 m!114123))

(declare-fun m!114125 () Bool)

(assert (=> b!71154 m!114125))

(declare-fun m!114127 () Bool)

(assert (=> b!71165 m!114127))

(declare-fun m!114129 () Bool)

(assert (=> b!71169 m!114129))

(declare-fun m!114131 () Bool)

(assert (=> b!71169 m!114131))

(declare-fun m!114133 () Bool)

(assert (=> b!71169 m!114133))

(declare-fun m!114135 () Bool)

(assert (=> b!71169 m!114135))

(declare-fun m!114137 () Bool)

(assert (=> b!71169 m!114137))

(declare-fun m!114139 () Bool)

(assert (=> b!71169 m!114139))

(declare-fun m!114141 () Bool)

(assert (=> b!71169 m!114141))

(declare-fun m!114143 () Bool)

(assert (=> b!71169 m!114143))

(declare-fun m!114145 () Bool)

(assert (=> b!71171 m!114145))

(declare-fun m!114147 () Bool)

(assert (=> b!71167 m!114147))

(declare-fun m!114149 () Bool)

(assert (=> start!13916 m!114149))

(declare-fun m!114151 () Bool)

(assert (=> start!13916 m!114151))

(declare-fun m!114153 () Bool)

(assert (=> b!71159 m!114153))

(declare-fun m!114155 () Bool)

(assert (=> b!71166 m!114155))

(declare-fun m!114157 () Bool)

(assert (=> b!71158 m!114157))

(declare-fun m!114159 () Bool)

(assert (=> b!71156 m!114159))

(declare-fun m!114161 () Bool)

(assert (=> b!71168 m!114161))

(declare-fun m!114163 () Bool)

(assert (=> b!71160 m!114163))

(declare-fun m!114165 () Bool)

(assert (=> b!71153 m!114165))

(declare-fun m!114167 () Bool)

(assert (=> b!71153 m!114167))

(declare-fun m!114169 () Bool)

(assert (=> b!71153 m!114169))

(declare-fun m!114171 () Bool)

(assert (=> b!71153 m!114171))

(declare-fun m!114173 () Bool)

(assert (=> b!71153 m!114173))

(declare-fun m!114175 () Bool)

(assert (=> b!71153 m!114175))

(declare-fun m!114177 () Bool)

(assert (=> b!71153 m!114177))

(check-sat (not b!71169) (not b!71157) (not b!71154) (not b!71160) (not b!71153) (not b!71155) (not b!71161) (not b!71152) (not b!71170) (not b!71171) (not b!71162) (not start!13916) (not b!71163) (not b!71165) (not b!71158) (not b!71159) (not b!71167) (not b!71166) (not b!71168) (not b!71156) (not b!71172))
(check-sat)
(get-model)

(declare-fun d!22956 () Bool)

(assert (=> d!22956 (= (bitAt!0 (buf!1746 (_1!3196 lt!114829)) lt!114833) (not (= (bvand ((_ sign_extend 24) (select (arr!1953 (buf!1746 (_1!3196 lt!114829))) ((_ extract 31 0) (bvsdiv lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5499 () Bool)

(assert (= bs!5499 d!22956))

(declare-fun m!114277 () Bool)

(assert (=> bs!5499 m!114277))

(declare-fun m!114279 () Bool)

(assert (=> bs!5499 m!114279))

(assert (=> b!71170 d!22956))

(declare-fun d!22958 () Bool)

(assert (=> d!22958 (= (bitAt!0 (buf!1746 (_1!3196 lt!114850)) lt!114833) (not (= (bvand ((_ sign_extend 24) (select (arr!1953 (buf!1746 (_1!3196 lt!114850))) ((_ extract 31 0) (bvsdiv lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5500 () Bool)

(assert (= bs!5500 d!22958))

(declare-fun m!114281 () Bool)

(assert (=> bs!5500 m!114281))

(assert (=> bs!5500 m!114279))

(assert (=> b!71170 d!22958))

(declare-fun d!22960 () Bool)

(declare-datatypes ((tuple2!6174 0))(
  ( (tuple2!6175 (_1!3201 Bool) (_2!3201 BitStream!2316)) )
))
(declare-fun lt!114940 () tuple2!6174)

(declare-fun readBit!0 (BitStream!2316) tuple2!6174)

(assert (=> d!22960 (= lt!114940 (readBit!0 (_1!3196 lt!114850)))))

(assert (=> d!22960 (= (readBitPure!0 (_1!3196 lt!114850)) (tuple2!6167 (_2!3201 lt!114940) (_1!3201 lt!114940)))))

(declare-fun bs!5501 () Bool)

(assert (= bs!5501 d!22960))

(declare-fun m!114283 () Bool)

(assert (=> bs!5501 m!114283))

(assert (=> b!71171 d!22960))

(declare-fun d!22962 () Bool)

(assert (=> d!22962 (= (invariant!0 (currentBit!3461 (_2!3195 lt!114843)) (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114843)))) (and (bvsge (currentBit!3461 (_2!3195 lt!114843)) #b00000000000000000000000000000000) (bvslt (currentBit!3461 (_2!3195 lt!114843)) #b00000000000000000000000000001000) (bvsge (currentByte!3466 (_2!3195 lt!114843)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114843)))) (and (= (currentBit!3461 (_2!3195 lt!114843)) #b00000000000000000000000000000000) (= (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114843))))))))))

(assert (=> b!71160 d!22962))

(declare-fun d!22964 () Bool)

(assert (=> d!22964 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!114852)))

(declare-fun lt!114943 () Unit!4759)

(declare-fun choose!9 (BitStream!2316 array!2928 (_ BitVec 64) BitStream!2316) Unit!4759)

(assert (=> d!22964 (= lt!114943 (choose!9 (_2!3195 lt!114843) (buf!1746 (_2!3195 lt!114848)) lt!114852 (BitStream!2317 (buf!1746 (_2!3195 lt!114848)) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843)))))))

(assert (=> d!22964 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3195 lt!114843) (buf!1746 (_2!3195 lt!114848)) lt!114852) lt!114943)))

(declare-fun bs!5502 () Bool)

(assert (= bs!5502 d!22964))

(assert (=> bs!5502 m!114129))

(declare-fun m!114285 () Bool)

(assert (=> bs!5502 m!114285))

(assert (=> b!71169 d!22964))

(declare-fun d!22966 () Bool)

(assert (=> d!22966 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!114944 () Unit!4759)

(assert (=> d!22966 (= lt!114944 (choose!9 thiss!1379 (buf!1746 (_2!3195 lt!114848)) (bvsub to!314 i!635) (BitStream!2317 (buf!1746 (_2!3195 lt!114848)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379))))))

(assert (=> d!22966 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1746 (_2!3195 lt!114848)) (bvsub to!314 i!635)) lt!114944)))

(declare-fun bs!5503 () Bool)

(assert (= bs!5503 d!22966))

(assert (=> bs!5503 m!114143))

(declare-fun m!114287 () Bool)

(assert (=> bs!5503 m!114287))

(assert (=> b!71169 d!22966))

(declare-fun b!71249 () Bool)

(declare-datatypes ((tuple2!6176 0))(
  ( (tuple2!6177 (_1!3202 List!733) (_2!3202 BitStream!2316)) )
))
(declare-fun e!46408 () tuple2!6176)

(declare-fun lt!114951 () tuple2!6174)

(declare-fun lt!114953 () (_ BitVec 64))

(assert (=> b!71249 (= e!46408 (tuple2!6177 (Cons!729 (_1!3201 lt!114951) (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_2!3201 lt!114951) (bvsub lt!114852 lt!114953))) (_2!3201 lt!114951)))))

(assert (=> b!71249 (= lt!114951 (readBit!0 (_1!3196 lt!114829)))))

(assert (=> b!71249 (= lt!114953 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71251 () Bool)

(declare-fun e!46409 () Bool)

(declare-fun lt!114952 () List!733)

(assert (=> b!71251 (= e!46409 (> (length!361 lt!114952) 0))))

(declare-fun b!71248 () Bool)

(assert (=> b!71248 (= e!46408 (tuple2!6177 Nil!730 (_1!3196 lt!114829)))))

(declare-fun b!71250 () Bool)

(declare-fun isEmpty!231 (List!733) Bool)

(assert (=> b!71250 (= e!46409 (isEmpty!231 lt!114952))))

(declare-fun d!22968 () Bool)

(assert (=> d!22968 e!46409))

(declare-fun c!5336 () Bool)

(assert (=> d!22968 (= c!5336 (= lt!114852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22968 (= lt!114952 (_1!3202 e!46408))))

(declare-fun c!5337 () Bool)

(assert (=> d!22968 (= c!5337 (= lt!114852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22968 (bvsge lt!114852 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22968 (= (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_1!3196 lt!114829) lt!114852) lt!114952)))

(assert (= (and d!22968 c!5337) b!71248))

(assert (= (and d!22968 (not c!5337)) b!71249))

(assert (= (and d!22968 c!5336) b!71250))

(assert (= (and d!22968 (not c!5336)) b!71251))

(declare-fun m!114289 () Bool)

(assert (=> b!71249 m!114289))

(declare-fun m!114291 () Bool)

(assert (=> b!71249 m!114291))

(declare-fun m!114293 () Bool)

(assert (=> b!71251 m!114293))

(declare-fun m!114295 () Bool)

(assert (=> b!71250 m!114295))

(assert (=> b!71169 d!22968))

(declare-fun lt!114995 () (_ BitVec 64))

(declare-fun lt!114998 () tuple2!6164)

(declare-fun lt!115005 () (_ BitVec 64))

(declare-fun e!46415 () Bool)

(declare-fun b!71262 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2316 (_ BitVec 64)) BitStream!2316)

(assert (=> b!71262 (= e!46415 (= (_1!3196 lt!114998) (withMovedBitIndex!0 (_2!3196 lt!114998) (bvsub lt!115005 lt!114995))))))

(assert (=> b!71262 (or (= (bvand lt!115005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115005 lt!114995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71262 (= lt!114995 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114848))) (currentByte!3466 (_2!3195 lt!114848)) (currentBit!3461 (_2!3195 lt!114848))))))

(assert (=> b!71262 (= lt!115005 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(declare-fun b!71263 () Bool)

(declare-fun e!46414 () Unit!4759)

(declare-fun lt!114994 () Unit!4759)

(assert (=> b!71263 (= e!46414 lt!114994)))

(declare-fun lt!115002 () (_ BitVec 64))

(assert (=> b!71263 (= lt!115002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115000 () (_ BitVec 64))

(assert (=> b!71263 (= lt!115000 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2928 array!2928 (_ BitVec 64) (_ BitVec 64)) Unit!4759)

(assert (=> b!71263 (= lt!114994 (arrayBitRangesEqSymmetric!0 (buf!1746 thiss!1379) (buf!1746 (_2!3195 lt!114848)) lt!115002 lt!115000))))

(declare-fun arrayBitRangesEq!0 (array!2928 array!2928 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71263 (arrayBitRangesEq!0 (buf!1746 (_2!3195 lt!114848)) (buf!1746 thiss!1379) lt!115002 lt!115000)))

(declare-fun b!71264 () Bool)

(declare-fun Unit!4763 () Unit!4759)

(assert (=> b!71264 (= e!46414 Unit!4763)))

(declare-fun d!22970 () Bool)

(assert (=> d!22970 e!46415))

(declare-fun res!58753 () Bool)

(assert (=> d!22970 (=> (not res!58753) (not e!46415))))

(assert (=> d!22970 (= res!58753 (isPrefixOf!0 (_1!3196 lt!114998) (_2!3196 lt!114998)))))

(declare-fun lt!114999 () BitStream!2316)

(assert (=> d!22970 (= lt!114998 (tuple2!6165 lt!114999 (_2!3195 lt!114848)))))

(declare-fun lt!115006 () Unit!4759)

(declare-fun lt!115007 () Unit!4759)

(assert (=> d!22970 (= lt!115006 lt!115007)))

(assert (=> d!22970 (isPrefixOf!0 lt!114999 (_2!3195 lt!114848))))

(assert (=> d!22970 (= lt!115007 (lemmaIsPrefixTransitive!0 lt!114999 (_2!3195 lt!114848) (_2!3195 lt!114848)))))

(declare-fun lt!115012 () Unit!4759)

(declare-fun lt!115001 () Unit!4759)

(assert (=> d!22970 (= lt!115012 lt!115001)))

(assert (=> d!22970 (isPrefixOf!0 lt!114999 (_2!3195 lt!114848))))

(assert (=> d!22970 (= lt!115001 (lemmaIsPrefixTransitive!0 lt!114999 thiss!1379 (_2!3195 lt!114848)))))

(declare-fun lt!114996 () Unit!4759)

(assert (=> d!22970 (= lt!114996 e!46414)))

(declare-fun c!5340 () Bool)

(assert (=> d!22970 (= c!5340 (not (= (size!1365 (buf!1746 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!115013 () Unit!4759)

(declare-fun lt!114997 () Unit!4759)

(assert (=> d!22970 (= lt!115013 lt!114997)))

(assert (=> d!22970 (isPrefixOf!0 (_2!3195 lt!114848) (_2!3195 lt!114848))))

(assert (=> d!22970 (= lt!114997 (lemmaIsPrefixRefl!0 (_2!3195 lt!114848)))))

(declare-fun lt!115009 () Unit!4759)

(declare-fun lt!115008 () Unit!4759)

(assert (=> d!22970 (= lt!115009 lt!115008)))

(assert (=> d!22970 (= lt!115008 (lemmaIsPrefixRefl!0 (_2!3195 lt!114848)))))

(declare-fun lt!115011 () Unit!4759)

(declare-fun lt!115010 () Unit!4759)

(assert (=> d!22970 (= lt!115011 lt!115010)))

(assert (=> d!22970 (isPrefixOf!0 lt!114999 lt!114999)))

(assert (=> d!22970 (= lt!115010 (lemmaIsPrefixRefl!0 lt!114999))))

(declare-fun lt!115003 () Unit!4759)

(declare-fun lt!115004 () Unit!4759)

(assert (=> d!22970 (= lt!115003 lt!115004)))

(assert (=> d!22970 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22970 (= lt!115004 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22970 (= lt!114999 (BitStream!2317 (buf!1746 (_2!3195 lt!114848)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(assert (=> d!22970 (isPrefixOf!0 thiss!1379 (_2!3195 lt!114848))))

(assert (=> d!22970 (= (reader!0 thiss!1379 (_2!3195 lt!114848)) lt!114998)))

(declare-fun b!71265 () Bool)

(declare-fun res!58755 () Bool)

(assert (=> b!71265 (=> (not res!58755) (not e!46415))))

(assert (=> b!71265 (= res!58755 (isPrefixOf!0 (_2!3196 lt!114998) (_2!3195 lt!114848)))))

(declare-fun b!71266 () Bool)

(declare-fun res!58754 () Bool)

(assert (=> b!71266 (=> (not res!58754) (not e!46415))))

(assert (=> b!71266 (= res!58754 (isPrefixOf!0 (_1!3196 lt!114998) thiss!1379))))

(assert (= (and d!22970 c!5340) b!71263))

(assert (= (and d!22970 (not c!5340)) b!71264))

(assert (= (and d!22970 res!58753) b!71266))

(assert (= (and b!71266 res!58754) b!71265))

(assert (= (and b!71265 res!58755) b!71262))

(declare-fun m!114297 () Bool)

(assert (=> b!71266 m!114297))

(assert (=> b!71263 m!114085))

(declare-fun m!114299 () Bool)

(assert (=> b!71263 m!114299))

(declare-fun m!114301 () Bool)

(assert (=> b!71263 m!114301))

(declare-fun m!114303 () Bool)

(assert (=> d!22970 m!114303))

(declare-fun m!114305 () Bool)

(assert (=> d!22970 m!114305))

(assert (=> d!22970 m!114083))

(assert (=> d!22970 m!114081))

(assert (=> d!22970 m!114167))

(declare-fun m!114307 () Bool)

(assert (=> d!22970 m!114307))

(declare-fun m!114309 () Bool)

(assert (=> d!22970 m!114309))

(declare-fun m!114311 () Bool)

(assert (=> d!22970 m!114311))

(declare-fun m!114313 () Bool)

(assert (=> d!22970 m!114313))

(declare-fun m!114315 () Bool)

(assert (=> d!22970 m!114315))

(declare-fun m!114317 () Bool)

(assert (=> d!22970 m!114317))

(declare-fun m!114319 () Bool)

(assert (=> b!71265 m!114319))

(declare-fun m!114321 () Bool)

(assert (=> b!71262 m!114321))

(assert (=> b!71262 m!114153))

(assert (=> b!71262 m!114085))

(assert (=> b!71169 d!22970))

(declare-fun d!22972 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22972 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5504 () Bool)

(assert (= bs!5504 d!22972))

(declare-fun m!114323 () Bool)

(assert (=> bs!5504 m!114323))

(assert (=> b!71169 d!22972))

(declare-fun e!46417 () Bool)

(declare-fun lt!115025 () (_ BitVec 64))

(declare-fun b!71267 () Bool)

(declare-fun lt!115015 () (_ BitVec 64))

(declare-fun lt!115018 () tuple2!6164)

(assert (=> b!71267 (= e!46417 (= (_1!3196 lt!115018) (withMovedBitIndex!0 (_2!3196 lt!115018) (bvsub lt!115025 lt!115015))))))

(assert (=> b!71267 (or (= (bvand lt!115025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115015 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115025 lt!115015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71267 (= lt!115015 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114848))) (currentByte!3466 (_2!3195 lt!114848)) (currentBit!3461 (_2!3195 lt!114848))))))

(assert (=> b!71267 (= lt!115025 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(declare-fun b!71268 () Bool)

(declare-fun e!46416 () Unit!4759)

(declare-fun lt!115014 () Unit!4759)

(assert (=> b!71268 (= e!46416 lt!115014)))

(declare-fun lt!115022 () (_ BitVec 64))

(assert (=> b!71268 (= lt!115022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115020 () (_ BitVec 64))

(assert (=> b!71268 (= lt!115020 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(assert (=> b!71268 (= lt!115014 (arrayBitRangesEqSymmetric!0 (buf!1746 (_2!3195 lt!114843)) (buf!1746 (_2!3195 lt!114848)) lt!115022 lt!115020))))

(assert (=> b!71268 (arrayBitRangesEq!0 (buf!1746 (_2!3195 lt!114848)) (buf!1746 (_2!3195 lt!114843)) lt!115022 lt!115020)))

(declare-fun b!71269 () Bool)

(declare-fun Unit!4764 () Unit!4759)

(assert (=> b!71269 (= e!46416 Unit!4764)))

(declare-fun d!22974 () Bool)

(assert (=> d!22974 e!46417))

(declare-fun res!58756 () Bool)

(assert (=> d!22974 (=> (not res!58756) (not e!46417))))

(assert (=> d!22974 (= res!58756 (isPrefixOf!0 (_1!3196 lt!115018) (_2!3196 lt!115018)))))

(declare-fun lt!115019 () BitStream!2316)

(assert (=> d!22974 (= lt!115018 (tuple2!6165 lt!115019 (_2!3195 lt!114848)))))

(declare-fun lt!115026 () Unit!4759)

(declare-fun lt!115027 () Unit!4759)

(assert (=> d!22974 (= lt!115026 lt!115027)))

(assert (=> d!22974 (isPrefixOf!0 lt!115019 (_2!3195 lt!114848))))

(assert (=> d!22974 (= lt!115027 (lemmaIsPrefixTransitive!0 lt!115019 (_2!3195 lt!114848) (_2!3195 lt!114848)))))

(declare-fun lt!115032 () Unit!4759)

(declare-fun lt!115021 () Unit!4759)

(assert (=> d!22974 (= lt!115032 lt!115021)))

(assert (=> d!22974 (isPrefixOf!0 lt!115019 (_2!3195 lt!114848))))

(assert (=> d!22974 (= lt!115021 (lemmaIsPrefixTransitive!0 lt!115019 (_2!3195 lt!114843) (_2!3195 lt!114848)))))

(declare-fun lt!115016 () Unit!4759)

(assert (=> d!22974 (= lt!115016 e!46416)))

(declare-fun c!5341 () Bool)

(assert (=> d!22974 (= c!5341 (not (= (size!1365 (buf!1746 (_2!3195 lt!114843))) #b00000000000000000000000000000000)))))

(declare-fun lt!115033 () Unit!4759)

(declare-fun lt!115017 () Unit!4759)

(assert (=> d!22974 (= lt!115033 lt!115017)))

(assert (=> d!22974 (isPrefixOf!0 (_2!3195 lt!114848) (_2!3195 lt!114848))))

(assert (=> d!22974 (= lt!115017 (lemmaIsPrefixRefl!0 (_2!3195 lt!114848)))))

(declare-fun lt!115029 () Unit!4759)

(declare-fun lt!115028 () Unit!4759)

(assert (=> d!22974 (= lt!115029 lt!115028)))

(assert (=> d!22974 (= lt!115028 (lemmaIsPrefixRefl!0 (_2!3195 lt!114848)))))

(declare-fun lt!115031 () Unit!4759)

(declare-fun lt!115030 () Unit!4759)

(assert (=> d!22974 (= lt!115031 lt!115030)))

(assert (=> d!22974 (isPrefixOf!0 lt!115019 lt!115019)))

(assert (=> d!22974 (= lt!115030 (lemmaIsPrefixRefl!0 lt!115019))))

(declare-fun lt!115023 () Unit!4759)

(declare-fun lt!115024 () Unit!4759)

(assert (=> d!22974 (= lt!115023 lt!115024)))

(assert (=> d!22974 (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!114843))))

(assert (=> d!22974 (= lt!115024 (lemmaIsPrefixRefl!0 (_2!3195 lt!114843)))))

(assert (=> d!22974 (= lt!115019 (BitStream!2317 (buf!1746 (_2!3195 lt!114848)) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(assert (=> d!22974 (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!114848))))

(assert (=> d!22974 (= (reader!0 (_2!3195 lt!114843) (_2!3195 lt!114848)) lt!115018)))

(declare-fun b!71270 () Bool)

(declare-fun res!58758 () Bool)

(assert (=> b!71270 (=> (not res!58758) (not e!46417))))

(assert (=> b!71270 (= res!58758 (isPrefixOf!0 (_2!3196 lt!115018) (_2!3195 lt!114848)))))

(declare-fun b!71271 () Bool)

(declare-fun res!58757 () Bool)

(assert (=> b!71271 (=> (not res!58757) (not e!46417))))

(assert (=> b!71271 (= res!58757 (isPrefixOf!0 (_1!3196 lt!115018) (_2!3195 lt!114843)))))

(assert (= (and d!22974 c!5341) b!71268))

(assert (= (and d!22974 (not c!5341)) b!71269))

(assert (= (and d!22974 res!58756) b!71271))

(assert (= (and b!71271 res!58757) b!71270))

(assert (= (and b!71270 res!58758) b!71267))

(declare-fun m!114325 () Bool)

(assert (=> b!71271 m!114325))

(assert (=> b!71268 m!114161))

(declare-fun m!114327 () Bool)

(assert (=> b!71268 m!114327))

(declare-fun m!114329 () Bool)

(assert (=> b!71268 m!114329))

(assert (=> d!22974 m!114303))

(declare-fun m!114331 () Bool)

(assert (=> d!22974 m!114331))

(declare-fun m!114333 () Bool)

(assert (=> d!22974 m!114333))

(declare-fun m!114335 () Bool)

(assert (=> d!22974 m!114335))

(assert (=> d!22974 m!114165))

(declare-fun m!114337 () Bool)

(assert (=> d!22974 m!114337))

(declare-fun m!114339 () Bool)

(assert (=> d!22974 m!114339))

(declare-fun m!114341 () Bool)

(assert (=> d!22974 m!114341))

(declare-fun m!114343 () Bool)

(assert (=> d!22974 m!114343))

(assert (=> d!22974 m!114315))

(declare-fun m!114345 () Bool)

(assert (=> d!22974 m!114345))

(declare-fun m!114347 () Bool)

(assert (=> b!71270 m!114347))

(declare-fun m!114349 () Bool)

(assert (=> b!71267 m!114349))

(assert (=> b!71267 m!114153))

(assert (=> b!71267 m!114161))

(assert (=> b!71169 d!22974))

(declare-fun b!71273 () Bool)

(declare-fun e!46418 () tuple2!6176)

(declare-fun lt!115034 () tuple2!6174)

(declare-fun lt!115036 () (_ BitVec 64))

(assert (=> b!71273 (= e!46418 (tuple2!6177 (Cons!729 (_1!3201 lt!115034) (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_2!3201 lt!115034) (bvsub (bvsub to!314 i!635) lt!115036))) (_2!3201 lt!115034)))))

(assert (=> b!71273 (= lt!115034 (readBit!0 (_1!3196 lt!114850)))))

(assert (=> b!71273 (= lt!115036 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71275 () Bool)

(declare-fun e!46419 () Bool)

(declare-fun lt!115035 () List!733)

(assert (=> b!71275 (= e!46419 (> (length!361 lt!115035) 0))))

(declare-fun b!71272 () Bool)

(assert (=> b!71272 (= e!46418 (tuple2!6177 Nil!730 (_1!3196 lt!114850)))))

(declare-fun b!71274 () Bool)

(assert (=> b!71274 (= e!46419 (isEmpty!231 lt!115035))))

(declare-fun d!22976 () Bool)

(assert (=> d!22976 e!46419))

(declare-fun c!5342 () Bool)

(assert (=> d!22976 (= c!5342 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22976 (= lt!115035 (_1!3202 e!46418))))

(declare-fun c!5343 () Bool)

(assert (=> d!22976 (= c!5343 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22976 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22976 (= (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_1!3196 lt!114850) (bvsub to!314 i!635)) lt!115035)))

(assert (= (and d!22976 c!5343) b!71272))

(assert (= (and d!22976 (not c!5343)) b!71273))

(assert (= (and d!22976 c!5342) b!71274))

(assert (= (and d!22976 (not c!5342)) b!71275))

(declare-fun m!114351 () Bool)

(assert (=> b!71273 m!114351))

(assert (=> b!71273 m!114283))

(declare-fun m!114353 () Bool)

(assert (=> b!71275 m!114353))

(declare-fun m!114355 () Bool)

(assert (=> b!71274 m!114355))

(assert (=> b!71169 d!22976))

(declare-fun d!22978 () Bool)

(assert (=> d!22978 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!114852) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843)))) lt!114852))))

(declare-fun bs!5505 () Bool)

(assert (= bs!5505 d!22978))

(declare-fun m!114357 () Bool)

(assert (=> bs!5505 m!114357))

(assert (=> b!71169 d!22978))

(declare-fun d!22980 () Bool)

(assert (=> d!22980 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 thiss!1379))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 thiss!1379))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5506 () Bool)

(assert (= bs!5506 d!22980))

(declare-fun m!114359 () Bool)

(assert (=> bs!5506 m!114359))

(assert (=> b!71158 d!22980))

(declare-fun d!22982 () Bool)

(declare-fun e!46422 () Bool)

(assert (=> d!22982 e!46422))

(declare-fun res!58763 () Bool)

(assert (=> d!22982 (=> (not res!58763) (not e!46422))))

(declare-fun lt!115054 () (_ BitVec 64))

(declare-fun lt!115052 () (_ BitVec 64))

(declare-fun lt!115051 () (_ BitVec 64))

(assert (=> d!22982 (= res!58763 (= lt!115054 (bvsub lt!115051 lt!115052)))))

(assert (=> d!22982 (or (= (bvand lt!115051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115051 lt!115052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22982 (= lt!115052 (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114848))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114848)))))))

(declare-fun lt!115049 () (_ BitVec 64))

(declare-fun lt!115050 () (_ BitVec 64))

(assert (=> d!22982 (= lt!115051 (bvmul lt!115049 lt!115050))))

(assert (=> d!22982 (or (= lt!115049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115050 (bvsdiv (bvmul lt!115049 lt!115050) lt!115049)))))

(assert (=> d!22982 (= lt!115050 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22982 (= lt!115049 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))))))

(assert (=> d!22982 (= lt!115054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114848))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114848)))))))

(assert (=> d!22982 (invariant!0 (currentBit!3461 (_2!3195 lt!114848)) (currentByte!3466 (_2!3195 lt!114848)) (size!1365 (buf!1746 (_2!3195 lt!114848))))))

(assert (=> d!22982 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114848))) (currentByte!3466 (_2!3195 lt!114848)) (currentBit!3461 (_2!3195 lt!114848))) lt!115054)))

(declare-fun b!71280 () Bool)

(declare-fun res!58764 () Bool)

(assert (=> b!71280 (=> (not res!58764) (not e!46422))))

(assert (=> b!71280 (= res!58764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115054))))

(declare-fun b!71281 () Bool)

(declare-fun lt!115053 () (_ BitVec 64))

(assert (=> b!71281 (= e!46422 (bvsle lt!115054 (bvmul lt!115053 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71281 (or (= lt!115053 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115053 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115053)))))

(assert (=> b!71281 (= lt!115053 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114848)))))))

(assert (= (and d!22982 res!58763) b!71280))

(assert (= (and b!71280 res!58764) b!71281))

(declare-fun m!114361 () Bool)

(assert (=> d!22982 m!114361))

(assert (=> d!22982 m!114127))

(assert (=> b!71159 d!22982))

(declare-fun d!22984 () Bool)

(assert (=> d!22984 (= (bitAt!0 (buf!1746 (_2!3195 lt!114848)) lt!114833) (not (= (bvand ((_ sign_extend 24) (select (arr!1953 (buf!1746 (_2!3195 lt!114848))) ((_ extract 31 0) (bvsdiv lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5507 () Bool)

(assert (= bs!5507 d!22984))

(declare-fun m!114363 () Bool)

(assert (=> bs!5507 m!114363))

(assert (=> bs!5507 m!114279))

(assert (=> b!71157 d!22984))

(declare-fun d!22986 () Bool)

(assert (=> d!22986 (= (bitAt!0 (buf!1746 (_2!3195 lt!114843)) lt!114833) (bitAt!0 (buf!1746 (_2!3195 lt!114848)) lt!114833))))

(declare-fun lt!115057 () Unit!4759)

(declare-fun choose!31 (array!2928 array!2928 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4759)

(assert (=> d!22986 (= lt!115057 (choose!31 (buf!1746 (_2!3195 lt!114843)) (buf!1746 (_2!3195 lt!114848)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114833 lt!114838))))

(assert (=> d!22986 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114838))))

(assert (=> d!22986 (= (arrayBitRangesEqImpliesEq!0 (buf!1746 (_2!3195 lt!114843)) (buf!1746 (_2!3195 lt!114848)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114833 lt!114838) lt!115057)))

(declare-fun bs!5508 () Bool)

(assert (= bs!5508 d!22986))

(assert (=> bs!5508 m!114099))

(assert (=> bs!5508 m!114101))

(declare-fun m!114365 () Bool)

(assert (=> bs!5508 m!114365))

(assert (=> b!71157 d!22986))

(declare-fun d!22988 () Bool)

(declare-fun e!46423 () Bool)

(assert (=> d!22988 e!46423))

(declare-fun res!58765 () Bool)

(assert (=> d!22988 (=> (not res!58765) (not e!46423))))

(declare-fun lt!115061 () (_ BitVec 64))

(declare-fun lt!115063 () (_ BitVec 64))

(declare-fun lt!115060 () (_ BitVec 64))

(assert (=> d!22988 (= res!58765 (= lt!115063 (bvsub lt!115060 lt!115061)))))

(assert (=> d!22988 (or (= (bvand lt!115060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115060 lt!115061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22988 (= lt!115061 (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843)))))))

(declare-fun lt!115058 () (_ BitVec 64))

(declare-fun lt!115059 () (_ BitVec 64))

(assert (=> d!22988 (= lt!115060 (bvmul lt!115058 lt!115059))))

(assert (=> d!22988 (or (= lt!115058 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115059 (bvsdiv (bvmul lt!115058 lt!115059) lt!115058)))))

(assert (=> d!22988 (= lt!115059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22988 (= lt!115058 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))))))

(assert (=> d!22988 (= lt!115063 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843)))))))

(assert (=> d!22988 (invariant!0 (currentBit!3461 (_2!3195 lt!114843)) (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114843))))))

(assert (=> d!22988 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))) lt!115063)))

(declare-fun b!71282 () Bool)

(declare-fun res!58766 () Bool)

(assert (=> b!71282 (=> (not res!58766) (not e!46423))))

(assert (=> b!71282 (= res!58766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115063))))

(declare-fun b!71283 () Bool)

(declare-fun lt!115062 () (_ BitVec 64))

(assert (=> b!71283 (= e!46423 (bvsle lt!115063 (bvmul lt!115062 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71283 (or (= lt!115062 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115062 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115062)))))

(assert (=> b!71283 (= lt!115062 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))))))

(assert (= (and d!22988 res!58765) b!71282))

(assert (= (and b!71282 res!58766) b!71283))

(declare-fun m!114367 () Bool)

(assert (=> d!22988 m!114367))

(assert (=> d!22988 m!114163))

(assert (=> b!71168 d!22988))

(declare-fun d!22990 () Bool)

(declare-fun size!1367 (List!733) Int)

(assert (=> d!22990 (= (length!361 lt!114847) (size!1367 lt!114847))))

(declare-fun bs!5509 () Bool)

(assert (= bs!5509 d!22990))

(declare-fun m!114369 () Bool)

(assert (=> bs!5509 m!114369))

(assert (=> b!71166 d!22990))

(declare-fun d!22992 () Bool)

(assert (=> d!22992 (= (invariant!0 (currentBit!3461 (_2!3195 lt!114843)) (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114848)))) (and (bvsge (currentBit!3461 (_2!3195 lt!114843)) #b00000000000000000000000000000000) (bvslt (currentBit!3461 (_2!3195 lt!114843)) #b00000000000000000000000000001000) (bvsge (currentByte!3466 (_2!3195 lt!114843)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114848)))) (and (= (currentBit!3461 (_2!3195 lt!114843)) #b00000000000000000000000000000000) (= (currentByte!3466 (_2!3195 lt!114843)) (size!1365 (buf!1746 (_2!3195 lt!114848))))))))))

(assert (=> b!71167 d!22992))

(declare-fun d!22994 () Bool)

(assert (=> d!22994 (= (array_inv!1217 (buf!1746 thiss!1379)) (bvsge (size!1365 (buf!1746 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!71156 d!22994))

(declare-fun d!22996 () Bool)

(assert (=> d!22996 (= (invariant!0 (currentBit!3461 (_2!3195 lt!114848)) (currentByte!3466 (_2!3195 lt!114848)) (size!1365 (buf!1746 (_2!3195 lt!114848)))) (and (bvsge (currentBit!3461 (_2!3195 lt!114848)) #b00000000000000000000000000000000) (bvslt (currentBit!3461 (_2!3195 lt!114848)) #b00000000000000000000000000001000) (bvsge (currentByte!3466 (_2!3195 lt!114848)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3466 (_2!3195 lt!114848)) (size!1365 (buf!1746 (_2!3195 lt!114848)))) (and (= (currentBit!3461 (_2!3195 lt!114848)) #b00000000000000000000000000000000) (= (currentByte!3466 (_2!3195 lt!114848)) (size!1365 (buf!1746 (_2!3195 lt!114848))))))))))

(assert (=> b!71165 d!22996))

(declare-fun d!22998 () Bool)

(assert (=> d!22998 (= (array_inv!1217 srcBuffer!2) (bvsge (size!1365 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13916 d!22998))

(declare-fun d!23000 () Bool)

(assert (=> d!23000 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3461 thiss!1379) (currentByte!3466 thiss!1379) (size!1365 (buf!1746 thiss!1379))))))

(declare-fun bs!5510 () Bool)

(assert (= bs!5510 d!23000))

(declare-fun m!114371 () Bool)

(assert (=> bs!5510 m!114371))

(assert (=> start!13916 d!23000))

(declare-fun d!23002 () Bool)

(assert (=> d!23002 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5511 () Bool)

(assert (= bs!5511 d!23002))

(assert (=> bs!5511 m!114105))

(declare-fun m!114373 () Bool)

(assert (=> bs!5511 m!114373))

(assert (=> b!71154 d!23002))

(declare-fun d!23004 () Bool)

(assert (=> d!23004 (= (head!552 (byteArrayBitContentToList!0 (_2!3195 lt!114848) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!848 (byteArrayBitContentToList!0 (_2!3195 lt!114848) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!71154 d!23004))

(declare-fun d!23006 () Bool)

(declare-fun c!5346 () Bool)

(assert (=> d!23006 (= c!5346 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46426 () List!733)

(assert (=> d!23006 (= (byteArrayBitContentToList!0 (_2!3195 lt!114848) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!46426)))

(declare-fun b!71288 () Bool)

(assert (=> b!71288 (= e!46426 Nil!730)))

(declare-fun b!71289 () Bool)

(assert (=> b!71289 (= e!46426 (Cons!729 (not (= (bvand ((_ sign_extend 24) (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3195 lt!114848) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23006 c!5346) b!71288))

(assert (= (and d!23006 (not c!5346)) b!71289))

(assert (=> b!71289 m!114105))

(assert (=> b!71289 m!114373))

(declare-fun m!114375 () Bool)

(assert (=> b!71289 m!114375))

(assert (=> b!71154 d!23006))

(declare-fun d!23008 () Bool)

(declare-fun res!58775 () Bool)

(declare-fun e!46432 () Bool)

(assert (=> d!23008 (=> (not res!58775) (not e!46432))))

(assert (=> d!23008 (= res!58775 (= (size!1365 (buf!1746 thiss!1379)) (size!1365 (buf!1746 (_2!3195 lt!114843)))))))

(assert (=> d!23008 (= (isPrefixOf!0 thiss!1379 (_2!3195 lt!114843)) e!46432)))

(declare-fun b!71296 () Bool)

(declare-fun res!58774 () Bool)

(assert (=> b!71296 (=> (not res!58774) (not e!46432))))

(assert (=> b!71296 (= res!58774 (bvsle (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)) (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843)))))))

(declare-fun b!71297 () Bool)

(declare-fun e!46431 () Bool)

(assert (=> b!71297 (= e!46432 e!46431)))

(declare-fun res!58773 () Bool)

(assert (=> b!71297 (=> res!58773 e!46431)))

(assert (=> b!71297 (= res!58773 (= (size!1365 (buf!1746 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71298 () Bool)

(assert (=> b!71298 (= e!46431 (arrayBitRangesEq!0 (buf!1746 thiss!1379) (buf!1746 (_2!3195 lt!114843)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379))))))

(assert (= (and d!23008 res!58775) b!71296))

(assert (= (and b!71296 res!58774) b!71297))

(assert (= (and b!71297 (not res!58773)) b!71298))

(assert (=> b!71296 m!114085))

(assert (=> b!71296 m!114161))

(assert (=> b!71298 m!114085))

(assert (=> b!71298 m!114085))

(declare-fun m!114377 () Bool)

(assert (=> b!71298 m!114377))

(assert (=> b!71155 d!23008))

(declare-fun d!23010 () Bool)

(assert (=> d!23010 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!114852) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843)))) lt!114852))))

(declare-fun bs!5512 () Bool)

(assert (= bs!5512 d!23010))

(assert (=> bs!5512 m!114367))

(assert (=> b!71155 d!23010))

(declare-fun d!23012 () Bool)

(declare-fun e!46435 () Bool)

(assert (=> d!23012 e!46435))

(declare-fun res!58778 () Bool)

(assert (=> d!23012 (=> (not res!58778) (not e!46435))))

(assert (=> d!23012 (= res!58778 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!115066 () Unit!4759)

(declare-fun choose!27 (BitStream!2316 BitStream!2316 (_ BitVec 64) (_ BitVec 64)) Unit!4759)

(assert (=> d!23012 (= lt!115066 (choose!27 thiss!1379 (_2!3195 lt!114843) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!23012 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!23012 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3195 lt!114843) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115066)))

(declare-fun b!71301 () Bool)

(assert (=> b!71301 (= e!46435 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23012 res!58778) b!71301))

(declare-fun m!114379 () Bool)

(assert (=> d!23012 m!114379))

(declare-fun m!114381 () Bool)

(assert (=> b!71301 m!114381))

(assert (=> b!71155 d!23012))

(declare-fun b!71328 () Bool)

(declare-fun e!46452 () Bool)

(declare-fun lt!115094 () tuple2!6166)

(declare-fun lt!115092 () tuple2!6162)

(assert (=> b!71328 (= e!46452 (= (bitIndex!0 (size!1365 (buf!1746 (_1!3197 lt!115094))) (currentByte!3466 (_1!3197 lt!115094)) (currentBit!3461 (_1!3197 lt!115094))) (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115092))) (currentByte!3466 (_2!3195 lt!115092)) (currentBit!3461 (_2!3195 lt!115092)))))))

(declare-fun b!71329 () Bool)

(declare-fun e!46450 () Bool)

(assert (=> b!71329 (= e!46450 e!46452)))

(declare-fun res!58811 () Bool)

(assert (=> b!71329 (=> (not res!58811) (not e!46452))))

(declare-fun lt!115100 () (_ BitVec 8))

(assert (=> b!71329 (= res!58811 (and (= (_2!3197 lt!115094) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!115100)) #b00000000000000000000000000000000))) (= (_1!3197 lt!115094) (_2!3195 lt!115092))))))

(declare-datatypes ((tuple2!6178 0))(
  ( (tuple2!6179 (_1!3203 array!2928) (_2!3203 BitStream!2316)) )
))
(declare-fun lt!115095 () tuple2!6178)

(declare-fun lt!115102 () BitStream!2316)

(declare-fun readBits!0 (BitStream!2316 (_ BitVec 64)) tuple2!6178)

(assert (=> b!71329 (= lt!115095 (readBits!0 lt!115102 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71329 (= lt!115094 (readBitPure!0 lt!115102))))

(declare-fun readerFrom!0 (BitStream!2316 (_ BitVec 32) (_ BitVec 32)) BitStream!2316)

(assert (=> b!71329 (= lt!115102 (readerFrom!0 (_2!3195 lt!115092) (currentBit!3461 thiss!1379) (currentByte!3466 thiss!1379)))))

(declare-fun b!71330 () Bool)

(declare-fun e!46453 () Bool)

(declare-fun e!46451 () Bool)

(assert (=> b!71330 (= e!46453 e!46451)))

(declare-fun res!58808 () Bool)

(assert (=> b!71330 (=> (not res!58808) (not e!46451))))

(declare-fun lt!115101 () Bool)

(declare-fun lt!115096 () tuple2!6162)

(declare-fun lt!115099 () tuple2!6166)

(assert (=> b!71330 (= res!58808 (and (= (_2!3197 lt!115099) lt!115101) (= (_1!3197 lt!115099) (_2!3195 lt!115096))))))

(assert (=> b!71330 (= lt!115099 (readBitPure!0 (readerFrom!0 (_2!3195 lt!115096) (currentBit!3461 thiss!1379) (currentByte!3466 thiss!1379))))))

(declare-fun d!23014 () Bool)

(assert (=> d!23014 e!46450))

(declare-fun res!58804 () Bool)

(assert (=> d!23014 (=> (not res!58804) (not e!46450))))

(assert (=> d!23014 (= res!58804 (= (size!1365 (buf!1746 (_2!3195 lt!115092))) (size!1365 (buf!1746 thiss!1379))))))

(declare-fun lt!115093 () array!2928)

(assert (=> d!23014 (= lt!115100 (select (arr!1953 lt!115093) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!23014 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1365 lt!115093)))))

(assert (=> d!23014 (= lt!115093 (array!2929 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!115097 () tuple2!6162)

(assert (=> d!23014 (= lt!115092 (tuple2!6163 (_1!3195 lt!115097) (_2!3195 lt!115097)))))

(assert (=> d!23014 (= lt!115097 lt!115096)))

(assert (=> d!23014 e!46453))

(declare-fun res!58806 () Bool)

(assert (=> d!23014 (=> (not res!58806) (not e!46453))))

(assert (=> d!23014 (= res!58806 (= (size!1365 (buf!1746 thiss!1379)) (size!1365 (buf!1746 (_2!3195 lt!115096)))))))

(declare-fun appendBit!0 (BitStream!2316 Bool) tuple2!6162)

(assert (=> d!23014 (= lt!115096 (appendBit!0 thiss!1379 lt!115101))))

(assert (=> d!23014 (= lt!115101 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!23014 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!23014 (= (appendBitFromByte!0 thiss!1379 (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!115092)))

(declare-fun b!71331 () Bool)

(declare-fun res!58807 () Bool)

(assert (=> b!71331 (=> (not res!58807) (not e!46453))))

(assert (=> b!71331 (= res!58807 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115096))) (currentByte!3466 (_2!3195 lt!115096)) (currentBit!3461 (_2!3195 lt!115096))) (bvadd (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!71332 () Bool)

(declare-fun res!58810 () Bool)

(assert (=> b!71332 (=> (not res!58810) (not e!46450))))

(assert (=> b!71332 (= res!58810 (isPrefixOf!0 thiss!1379 (_2!3195 lt!115092)))))

(declare-fun b!71333 () Bool)

(declare-fun res!58809 () Bool)

(assert (=> b!71333 (=> (not res!58809) (not e!46453))))

(assert (=> b!71333 (= res!58809 (isPrefixOf!0 thiss!1379 (_2!3195 lt!115096)))))

(declare-fun b!71334 () Bool)

(assert (=> b!71334 (= e!46451 (= (bitIndex!0 (size!1365 (buf!1746 (_1!3197 lt!115099))) (currentByte!3466 (_1!3197 lt!115099)) (currentBit!3461 (_1!3197 lt!115099))) (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115096))) (currentByte!3466 (_2!3195 lt!115096)) (currentBit!3461 (_2!3195 lt!115096)))))))

(declare-fun b!71335 () Bool)

(declare-fun res!58805 () Bool)

(assert (=> b!71335 (=> (not res!58805) (not e!46450))))

(declare-fun lt!115098 () (_ BitVec 64))

(declare-fun lt!115091 () (_ BitVec 64))

(assert (=> b!71335 (= res!58805 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115092))) (currentByte!3466 (_2!3195 lt!115092)) (currentBit!3461 (_2!3195 lt!115092))) (bvadd lt!115091 lt!115098)))))

(assert (=> b!71335 (or (not (= (bvand lt!115091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115098 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!115091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!115091 lt!115098) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71335 (= lt!115098 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!71335 (= lt!115091 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(assert (= (and d!23014 res!58806) b!71331))

(assert (= (and b!71331 res!58807) b!71333))

(assert (= (and b!71333 res!58809) b!71330))

(assert (= (and b!71330 res!58808) b!71334))

(assert (= (and d!23014 res!58804) b!71335))

(assert (= (and b!71335 res!58805) b!71332))

(assert (= (and b!71332 res!58810) b!71329))

(assert (= (and b!71329 res!58811) b!71328))

(declare-fun m!114387 () Bool)

(assert (=> b!71333 m!114387))

(declare-fun m!114389 () Bool)

(assert (=> b!71332 m!114389))

(declare-fun m!114391 () Bool)

(assert (=> b!71335 m!114391))

(assert (=> b!71335 m!114085))

(declare-fun m!114393 () Bool)

(assert (=> b!71328 m!114393))

(assert (=> b!71328 m!114391))

(declare-fun m!114395 () Bool)

(assert (=> b!71330 m!114395))

(assert (=> b!71330 m!114395))

(declare-fun m!114397 () Bool)

(assert (=> b!71330 m!114397))

(declare-fun m!114399 () Bool)

(assert (=> b!71334 m!114399))

(declare-fun m!114401 () Bool)

(assert (=> b!71334 m!114401))

(assert (=> b!71331 m!114401))

(assert (=> b!71331 m!114085))

(declare-fun m!114403 () Bool)

(assert (=> d!23014 m!114403))

(declare-fun m!114405 () Bool)

(assert (=> d!23014 m!114405))

(assert (=> d!23014 m!114373))

(declare-fun m!114407 () Bool)

(assert (=> b!71329 m!114407))

(declare-fun m!114409 () Bool)

(assert (=> b!71329 m!114409))

(declare-fun m!114411 () Bool)

(assert (=> b!71329 m!114411))

(assert (=> b!71155 d!23014))

(declare-fun d!23022 () Bool)

(assert (=> d!23022 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5514 () Bool)

(assert (= bs!5514 d!23022))

(declare-fun m!114413 () Bool)

(assert (=> bs!5514 m!114413))

(assert (=> b!71153 d!23022))

(declare-fun d!23024 () Bool)

(declare-fun res!58816 () Bool)

(declare-fun e!46457 () Bool)

(assert (=> d!23024 (=> (not res!58816) (not e!46457))))

(assert (=> d!23024 (= res!58816 (= (size!1365 (buf!1746 (_2!3195 lt!114843))) (size!1365 (buf!1746 (_2!3195 lt!114848)))))))

(assert (=> d!23024 (= (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!114848)) e!46457)))

(declare-fun b!71338 () Bool)

(declare-fun res!58815 () Bool)

(assert (=> b!71338 (=> (not res!58815) (not e!46457))))

(assert (=> b!71338 (= res!58815 (bvsle (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))) (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114848))) (currentByte!3466 (_2!3195 lt!114848)) (currentBit!3461 (_2!3195 lt!114848)))))))

(declare-fun b!71339 () Bool)

(declare-fun e!46456 () Bool)

(assert (=> b!71339 (= e!46457 e!46456)))

(declare-fun res!58814 () Bool)

(assert (=> b!71339 (=> res!58814 e!46456)))

(assert (=> b!71339 (= res!58814 (= (size!1365 (buf!1746 (_2!3195 lt!114843))) #b00000000000000000000000000000000))))

(declare-fun b!71340 () Bool)

(assert (=> b!71340 (= e!46456 (arrayBitRangesEq!0 (buf!1746 (_2!3195 lt!114843)) (buf!1746 (_2!3195 lt!114848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843)))))))

(assert (= (and d!23024 res!58816) b!71338))

(assert (= (and b!71338 res!58815) b!71339))

(assert (= (and b!71339 (not res!58814)) b!71340))

(assert (=> b!71338 m!114161))

(assert (=> b!71338 m!114153))

(assert (=> b!71340 m!114161))

(assert (=> b!71340 m!114161))

(declare-fun m!114415 () Bool)

(assert (=> b!71340 m!114415))

(assert (=> b!71153 d!23024))

(declare-fun d!23026 () Bool)

(assert (=> d!23026 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115105 () Unit!4759)

(assert (=> d!23026 (= lt!115105 (choose!9 thiss!1379 (buf!1746 (_2!3195 lt!114843)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2317 (buf!1746 (_2!3195 lt!114843)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379))))))

(assert (=> d!23026 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1746 (_2!3195 lt!114843)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115105)))

(declare-fun bs!5515 () Bool)

(assert (= bs!5515 d!23026))

(assert (=> bs!5515 m!114175))

(declare-fun m!114417 () Bool)

(assert (=> bs!5515 m!114417))

(assert (=> b!71153 d!23026))

(declare-fun d!23028 () Bool)

(assert (=> d!23028 (isPrefixOf!0 thiss!1379 (_2!3195 lt!114848))))

(declare-fun lt!115109 () Unit!4759)

(declare-fun choose!30 (BitStream!2316 BitStream!2316 BitStream!2316) Unit!4759)

(assert (=> d!23028 (= lt!115109 (choose!30 thiss!1379 (_2!3195 lt!114843) (_2!3195 lt!114848)))))

(assert (=> d!23028 (isPrefixOf!0 thiss!1379 (_2!3195 lt!114843))))

(assert (=> d!23028 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3195 lt!114843) (_2!3195 lt!114848)) lt!115109)))

(declare-fun bs!5516 () Bool)

(assert (= bs!5516 d!23028))

(assert (=> bs!5516 m!114167))

(declare-fun m!114423 () Bool)

(assert (=> bs!5516 m!114423))

(assert (=> bs!5516 m!114111))

(assert (=> b!71153 d!23028))

(declare-fun d!23032 () Bool)

(declare-fun res!58820 () Bool)

(declare-fun e!46460 () Bool)

(assert (=> d!23032 (=> (not res!58820) (not e!46460))))

(assert (=> d!23032 (= res!58820 (= (size!1365 (buf!1746 thiss!1379)) (size!1365 (buf!1746 (_2!3195 lt!114848)))))))

(assert (=> d!23032 (= (isPrefixOf!0 thiss!1379 (_2!3195 lt!114848)) e!46460)))

(declare-fun b!71342 () Bool)

(declare-fun res!58819 () Bool)

(assert (=> b!71342 (=> (not res!58819) (not e!46460))))

(assert (=> b!71342 (= res!58819 (bvsle (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)) (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114848))) (currentByte!3466 (_2!3195 lt!114848)) (currentBit!3461 (_2!3195 lt!114848)))))))

(declare-fun b!71343 () Bool)

(declare-fun e!46459 () Bool)

(assert (=> b!71343 (= e!46460 e!46459)))

(declare-fun res!58818 () Bool)

(assert (=> b!71343 (=> res!58818 e!46459)))

(assert (=> b!71343 (= res!58818 (= (size!1365 (buf!1746 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71344 () Bool)

(assert (=> b!71344 (= e!46459 (arrayBitRangesEq!0 (buf!1746 thiss!1379) (buf!1746 (_2!3195 lt!114848)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379))))))

(assert (= (and d!23032 res!58820) b!71342))

(assert (= (and b!71342 res!58819) b!71343))

(assert (= (and b!71343 (not res!58818)) b!71344))

(assert (=> b!71342 m!114085))

(assert (=> b!71342 m!114153))

(assert (=> b!71344 m!114085))

(assert (=> b!71344 m!114085))

(declare-fun m!114425 () Bool)

(assert (=> b!71344 m!114425))

(assert (=> b!71153 d!23032))

(declare-fun lt!115121 () (_ BitVec 64))

(declare-fun e!46462 () Bool)

(declare-fun lt!115111 () (_ BitVec 64))

(declare-fun b!71345 () Bool)

(declare-fun lt!115114 () tuple2!6164)

(assert (=> b!71345 (= e!46462 (= (_1!3196 lt!115114) (withMovedBitIndex!0 (_2!3196 lt!115114) (bvsub lt!115121 lt!115111))))))

(assert (=> b!71345 (or (= (bvand lt!115121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115121 lt!115111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71345 (= lt!115111 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(assert (=> b!71345 (= lt!115121 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(declare-fun b!71346 () Bool)

(declare-fun e!46461 () Unit!4759)

(declare-fun lt!115110 () Unit!4759)

(assert (=> b!71346 (= e!46461 lt!115110)))

(declare-fun lt!115118 () (_ BitVec 64))

(assert (=> b!71346 (= lt!115118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115116 () (_ BitVec 64))

(assert (=> b!71346 (= lt!115116 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(assert (=> b!71346 (= lt!115110 (arrayBitRangesEqSymmetric!0 (buf!1746 thiss!1379) (buf!1746 (_2!3195 lt!114843)) lt!115118 lt!115116))))

(assert (=> b!71346 (arrayBitRangesEq!0 (buf!1746 (_2!3195 lt!114843)) (buf!1746 thiss!1379) lt!115118 lt!115116)))

(declare-fun b!71347 () Bool)

(declare-fun Unit!4765 () Unit!4759)

(assert (=> b!71347 (= e!46461 Unit!4765)))

(declare-fun d!23034 () Bool)

(assert (=> d!23034 e!46462))

(declare-fun res!58821 () Bool)

(assert (=> d!23034 (=> (not res!58821) (not e!46462))))

(assert (=> d!23034 (= res!58821 (isPrefixOf!0 (_1!3196 lt!115114) (_2!3196 lt!115114)))))

(declare-fun lt!115115 () BitStream!2316)

(assert (=> d!23034 (= lt!115114 (tuple2!6165 lt!115115 (_2!3195 lt!114843)))))

(declare-fun lt!115122 () Unit!4759)

(declare-fun lt!115123 () Unit!4759)

(assert (=> d!23034 (= lt!115122 lt!115123)))

(assert (=> d!23034 (isPrefixOf!0 lt!115115 (_2!3195 lt!114843))))

(assert (=> d!23034 (= lt!115123 (lemmaIsPrefixTransitive!0 lt!115115 (_2!3195 lt!114843) (_2!3195 lt!114843)))))

(declare-fun lt!115128 () Unit!4759)

(declare-fun lt!115117 () Unit!4759)

(assert (=> d!23034 (= lt!115128 lt!115117)))

(assert (=> d!23034 (isPrefixOf!0 lt!115115 (_2!3195 lt!114843))))

(assert (=> d!23034 (= lt!115117 (lemmaIsPrefixTransitive!0 lt!115115 thiss!1379 (_2!3195 lt!114843)))))

(declare-fun lt!115112 () Unit!4759)

(assert (=> d!23034 (= lt!115112 e!46461)))

(declare-fun c!5347 () Bool)

(assert (=> d!23034 (= c!5347 (not (= (size!1365 (buf!1746 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!115129 () Unit!4759)

(declare-fun lt!115113 () Unit!4759)

(assert (=> d!23034 (= lt!115129 lt!115113)))

(assert (=> d!23034 (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!114843))))

(assert (=> d!23034 (= lt!115113 (lemmaIsPrefixRefl!0 (_2!3195 lt!114843)))))

(declare-fun lt!115125 () Unit!4759)

(declare-fun lt!115124 () Unit!4759)

(assert (=> d!23034 (= lt!115125 lt!115124)))

(assert (=> d!23034 (= lt!115124 (lemmaIsPrefixRefl!0 (_2!3195 lt!114843)))))

(declare-fun lt!115127 () Unit!4759)

(declare-fun lt!115126 () Unit!4759)

(assert (=> d!23034 (= lt!115127 lt!115126)))

(assert (=> d!23034 (isPrefixOf!0 lt!115115 lt!115115)))

(assert (=> d!23034 (= lt!115126 (lemmaIsPrefixRefl!0 lt!115115))))

(declare-fun lt!115119 () Unit!4759)

(declare-fun lt!115120 () Unit!4759)

(assert (=> d!23034 (= lt!115119 lt!115120)))

(assert (=> d!23034 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23034 (= lt!115120 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23034 (= lt!115115 (BitStream!2317 (buf!1746 (_2!3195 lt!114843)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)))))

(assert (=> d!23034 (isPrefixOf!0 thiss!1379 (_2!3195 lt!114843))))

(assert (=> d!23034 (= (reader!0 thiss!1379 (_2!3195 lt!114843)) lt!115114)))

(declare-fun b!71348 () Bool)

(declare-fun res!58823 () Bool)

(assert (=> b!71348 (=> (not res!58823) (not e!46462))))

(assert (=> b!71348 (= res!58823 (isPrefixOf!0 (_2!3196 lt!115114) (_2!3195 lt!114843)))))

(declare-fun b!71349 () Bool)

(declare-fun res!58822 () Bool)

(assert (=> b!71349 (=> (not res!58822) (not e!46462))))

(assert (=> b!71349 (= res!58822 (isPrefixOf!0 (_1!3196 lt!115114) thiss!1379))))

(assert (= (and d!23034 c!5347) b!71346))

(assert (= (and d!23034 (not c!5347)) b!71347))

(assert (= (and d!23034 res!58821) b!71349))

(assert (= (and b!71349 res!58822) b!71348))

(assert (= (and b!71348 res!58823) b!71345))

(declare-fun m!114427 () Bool)

(assert (=> b!71349 m!114427))

(assert (=> b!71346 m!114085))

(declare-fun m!114429 () Bool)

(assert (=> b!71346 m!114429))

(declare-fun m!114431 () Bool)

(assert (=> b!71346 m!114431))

(assert (=> d!23034 m!114335))

(declare-fun m!114433 () Bool)

(assert (=> d!23034 m!114433))

(assert (=> d!23034 m!114083))

(assert (=> d!23034 m!114081))

(assert (=> d!23034 m!114111))

(declare-fun m!114435 () Bool)

(assert (=> d!23034 m!114435))

(declare-fun m!114437 () Bool)

(assert (=> d!23034 m!114437))

(declare-fun m!114439 () Bool)

(assert (=> d!23034 m!114439))

(declare-fun m!114441 () Bool)

(assert (=> d!23034 m!114441))

(assert (=> d!23034 m!114333))

(declare-fun m!114443 () Bool)

(assert (=> d!23034 m!114443))

(declare-fun m!114445 () Bool)

(assert (=> b!71348 m!114445))

(declare-fun m!114447 () Bool)

(assert (=> b!71345 m!114447))

(assert (=> b!71345 m!114161))

(assert (=> b!71345 m!114085))

(assert (=> b!71153 d!23034))

(declare-fun b!71524 () Bool)

(declare-fun e!46551 () tuple2!6162)

(declare-fun lt!115553 () tuple2!6162)

(declare-fun Unit!4766 () Unit!4759)

(assert (=> b!71524 (= e!46551 (tuple2!6163 Unit!4766 (_2!3195 lt!115553)))))

(declare-fun lt!115547 () tuple2!6162)

(assert (=> b!71524 (= lt!115547 (appendBitFromByte!0 (_2!3195 lt!114843) (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!115535 () (_ BitVec 64))

(assert (=> b!71524 (= lt!115535 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115557 () (_ BitVec 64))

(assert (=> b!71524 (= lt!115557 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115531 () Unit!4759)

(assert (=> b!71524 (= lt!115531 (validateOffsetBitsIneqLemma!0 (_2!3195 lt!114843) (_2!3195 lt!115547) lt!115535 lt!115557))))

(assert (=> b!71524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!115547)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!115547))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!115547))) (bvsub lt!115535 lt!115557))))

(declare-fun lt!115572 () Unit!4759)

(assert (=> b!71524 (= lt!115572 lt!115531)))

(declare-fun lt!115532 () tuple2!6164)

(assert (=> b!71524 (= lt!115532 (reader!0 (_2!3195 lt!114843) (_2!3195 lt!115547)))))

(declare-fun lt!115552 () (_ BitVec 64))

(assert (=> b!71524 (= lt!115552 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115537 () Unit!4759)

(assert (=> b!71524 (= lt!115537 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3195 lt!114843) (buf!1746 (_2!3195 lt!115547)) lt!115552))))

(assert (=> b!71524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!115547)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!115552)))

(declare-fun lt!115541 () Unit!4759)

(assert (=> b!71524 (= lt!115541 lt!115537)))

(assert (=> b!71524 (= (head!552 (byteArrayBitContentToList!0 (_2!3195 lt!115547) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!552 (bitStreamReadBitsIntoList!0 (_2!3195 lt!115547) (_1!3196 lt!115532) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115565 () Unit!4759)

(declare-fun Unit!4767 () Unit!4759)

(assert (=> b!71524 (= lt!115565 Unit!4767)))

(assert (=> b!71524 (= lt!115553 (appendBitsMSBFirstLoop!0 (_2!3195 lt!115547) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!115550 () Unit!4759)

(assert (=> b!71524 (= lt!115550 (lemmaIsPrefixTransitive!0 (_2!3195 lt!114843) (_2!3195 lt!115547) (_2!3195 lt!115553)))))

(assert (=> b!71524 (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!115553))))

(declare-fun lt!115538 () Unit!4759)

(assert (=> b!71524 (= lt!115538 lt!115550)))

(assert (=> b!71524 (= (size!1365 (buf!1746 (_2!3195 lt!115553))) (size!1365 (buf!1746 (_2!3195 lt!114843))))))

(declare-fun lt!115539 () Unit!4759)

(declare-fun Unit!4768 () Unit!4759)

(assert (=> b!71524 (= lt!115539 Unit!4768)))

(assert (=> b!71524 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115553))) (currentByte!3466 (_2!3195 lt!115553)) (currentBit!3461 (_2!3195 lt!115553))) (bvsub (bvadd (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115546 () Unit!4759)

(declare-fun Unit!4769 () Unit!4759)

(assert (=> b!71524 (= lt!115546 Unit!4769)))

(assert (=> b!71524 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115553))) (currentByte!3466 (_2!3195 lt!115553)) (currentBit!3461 (_2!3195 lt!115553))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115547))) (currentByte!3466 (_2!3195 lt!115547)) (currentBit!3461 (_2!3195 lt!115547))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!115571 () Unit!4759)

(declare-fun Unit!4770 () Unit!4759)

(assert (=> b!71524 (= lt!115571 Unit!4770)))

(declare-fun lt!115564 () tuple2!6164)

(declare-fun call!928 () tuple2!6164)

(assert (=> b!71524 (= lt!115564 call!928)))

(declare-fun lt!115534 () (_ BitVec 64))

(assert (=> b!71524 (= lt!115534 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115544 () Unit!4759)

(assert (=> b!71524 (= lt!115544 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3195 lt!114843) (buf!1746 (_2!3195 lt!115553)) lt!115534))))

(assert (=> b!71524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!115553)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!115534)))

(declare-fun lt!115563 () Unit!4759)

(assert (=> b!71524 (= lt!115563 lt!115544)))

(declare-fun lt!115561 () tuple2!6164)

(assert (=> b!71524 (= lt!115561 (reader!0 (_2!3195 lt!115547) (_2!3195 lt!115553)))))

(declare-fun lt!115568 () (_ BitVec 64))

(assert (=> b!71524 (= lt!115568 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!115556 () Unit!4759)

(assert (=> b!71524 (= lt!115556 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3195 lt!115547) (buf!1746 (_2!3195 lt!115553)) lt!115568))))

(assert (=> b!71524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!115553)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!115547))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!115547))) lt!115568)))

(declare-fun lt!115548 () Unit!4759)

(assert (=> b!71524 (= lt!115548 lt!115556)))

(declare-fun lt!115542 () List!733)

(assert (=> b!71524 (= lt!115542 (byteArrayBitContentToList!0 (_2!3195 lt!115553) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!115545 () List!733)

(assert (=> b!71524 (= lt!115545 (byteArrayBitContentToList!0 (_2!3195 lt!115553) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115560 () List!733)

(assert (=> b!71524 (= lt!115560 (bitStreamReadBitsIntoList!0 (_2!3195 lt!115553) (_1!3196 lt!115564) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!115555 () List!733)

(assert (=> b!71524 (= lt!115555 (bitStreamReadBitsIntoList!0 (_2!3195 lt!115553) (_1!3196 lt!115561) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115529 () (_ BitVec 64))

(assert (=> b!71524 (= lt!115529 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115562 () Unit!4759)

(assert (=> b!71524 (= lt!115562 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3195 lt!115553) (_2!3195 lt!115553) (_1!3196 lt!115564) (_1!3196 lt!115561) lt!115529 lt!115560))))

(assert (=> b!71524 (= (bitStreamReadBitsIntoList!0 (_2!3195 lt!115553) (_1!3196 lt!115561) (bvsub lt!115529 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!337 lt!115560))))

(declare-fun lt!115549 () Unit!4759)

(assert (=> b!71524 (= lt!115549 lt!115562)))

(declare-fun lt!115570 () (_ BitVec 64))

(declare-fun lt!115566 () Unit!4759)

(assert (=> b!71524 (= lt!115566 (arrayBitRangesEqImpliesEq!0 (buf!1746 (_2!3195 lt!115547)) (buf!1746 (_2!3195 lt!115553)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!115570 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115547))) (currentByte!3466 (_2!3195 lt!115547)) (currentBit!3461 (_2!3195 lt!115547)))))))

(assert (=> b!71524 (= (bitAt!0 (buf!1746 (_2!3195 lt!115547)) lt!115570) (bitAt!0 (buf!1746 (_2!3195 lt!115553)) lt!115570))))

(declare-fun lt!115533 () Unit!4759)

(assert (=> b!71524 (= lt!115533 lt!115566)))

(declare-fun d!23036 () Bool)

(declare-fun e!46552 () Bool)

(assert (=> d!23036 e!46552))

(declare-fun res!58947 () Bool)

(assert (=> d!23036 (=> (not res!58947) (not e!46552))))

(declare-fun lt!115569 () (_ BitVec 64))

(declare-fun lt!115551 () tuple2!6162)

(assert (=> d!23036 (= res!58947 (= (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!115551))) (currentByte!3466 (_2!3195 lt!115551)) (currentBit!3461 (_2!3195 lt!115551))) (bvsub lt!115569 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!23036 (or (= (bvand lt!115569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115569 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!115536 () (_ BitVec 64))

(assert (=> d!23036 (= lt!115569 (bvadd lt!115536 to!314))))

(assert (=> d!23036 (or (not (= (bvand lt!115536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!115536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!115536 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23036 (= lt!115536 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(assert (=> d!23036 (= lt!115551 e!46551)))

(declare-fun c!5375 () Bool)

(assert (=> d!23036 (= c!5375 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!115567 () Unit!4759)

(declare-fun lt!115554 () Unit!4759)

(assert (=> d!23036 (= lt!115567 lt!115554)))

(assert (=> d!23036 (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!114843))))

(assert (=> d!23036 (= lt!115554 (lemmaIsPrefixRefl!0 (_2!3195 lt!114843)))))

(assert (=> d!23036 (= lt!115570 (bitIndex!0 (size!1365 (buf!1746 (_2!3195 lt!114843))) (currentByte!3466 (_2!3195 lt!114843)) (currentBit!3461 (_2!3195 lt!114843))))))

(assert (=> d!23036 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23036 (= (appendBitsMSBFirstLoop!0 (_2!3195 lt!114843) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!115551)))

(declare-fun b!71525 () Bool)

(declare-fun e!46550 () Bool)

(declare-fun lt!115559 () (_ BitVec 64))

(assert (=> b!71525 (= e!46550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!114843)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!115559))))

(declare-fun lt!115540 () tuple2!6164)

(declare-fun b!71526 () Bool)

(assert (=> b!71526 (= e!46552 (= (bitStreamReadBitsIntoList!0 (_2!3195 lt!115551) (_1!3196 lt!115540) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3195 lt!115551) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!71526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!115530 () Unit!4759)

(declare-fun lt!115558 () Unit!4759)

(assert (=> b!71526 (= lt!115530 lt!115558)))

(assert (=> b!71526 (validate_offset_bits!1 ((_ sign_extend 32) (size!1365 (buf!1746 (_2!3195 lt!115551)))) ((_ sign_extend 32) (currentByte!3466 (_2!3195 lt!114843))) ((_ sign_extend 32) (currentBit!3461 (_2!3195 lt!114843))) lt!115559)))

(assert (=> b!71526 (= lt!115558 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3195 lt!114843) (buf!1746 (_2!3195 lt!115551)) lt!115559))))

(assert (=> b!71526 e!46550))

(declare-fun res!58946 () Bool)

(assert (=> b!71526 (=> (not res!58946) (not e!46550))))

(assert (=> b!71526 (= res!58946 (and (= (size!1365 (buf!1746 (_2!3195 lt!114843))) (size!1365 (buf!1746 (_2!3195 lt!115551)))) (bvsge lt!115559 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71526 (= lt!115559 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!71526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71526 (= lt!115540 (reader!0 (_2!3195 lt!114843) (_2!3195 lt!115551)))))

(declare-fun b!71527 () Bool)

(declare-fun Unit!4771 () Unit!4759)

(assert (=> b!71527 (= e!46551 (tuple2!6163 Unit!4771 (_2!3195 lt!114843)))))

(assert (=> b!71527 (= (size!1365 (buf!1746 (_2!3195 lt!114843))) (size!1365 (buf!1746 (_2!3195 lt!114843))))))

(declare-fun lt!115543 () Unit!4759)

(declare-fun Unit!4772 () Unit!4759)

(assert (=> b!71527 (= lt!115543 Unit!4772)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2316 array!2928 array!2928 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71527 (checkByteArrayBitContent!0 (_2!3195 lt!114843) srcBuffer!2 (_1!3203 (readBits!0 (_1!3196 call!928) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!71528 () Bool)

(declare-fun res!58944 () Bool)

(assert (=> b!71528 (=> (not res!58944) (not e!46552))))

(assert (=> b!71528 (= res!58944 (invariant!0 (currentBit!3461 (_2!3195 lt!115551)) (currentByte!3466 (_2!3195 lt!115551)) (size!1365 (buf!1746 (_2!3195 lt!115551)))))))

(declare-fun b!71529 () Bool)

(declare-fun res!58945 () Bool)

(assert (=> b!71529 (=> (not res!58945) (not e!46552))))

(assert (=> b!71529 (= res!58945 (isPrefixOf!0 (_2!3195 lt!114843) (_2!3195 lt!115551)))))

(declare-fun b!71530 () Bool)

(declare-fun res!58942 () Bool)

(assert (=> b!71530 (=> (not res!58942) (not e!46552))))

(assert (=> b!71530 (= res!58942 (= (size!1365 (buf!1746 (_2!3195 lt!114843))) (size!1365 (buf!1746 (_2!3195 lt!115551)))))))

(declare-fun bm!925 () Bool)

(assert (=> bm!925 (= call!928 (reader!0 (_2!3195 lt!114843) (ite c!5375 (_2!3195 lt!115553) (_2!3195 lt!114843))))))

(declare-fun b!71531 () Bool)

(declare-fun res!58943 () Bool)

(assert (=> b!71531 (=> (not res!58943) (not e!46552))))

(assert (=> b!71531 (= res!58943 (= (size!1365 (buf!1746 (_2!3195 lt!115551))) (size!1365 (buf!1746 (_2!3195 lt!114843)))))))

(assert (= (and d!23036 c!5375) b!71524))

(assert (= (and d!23036 (not c!5375)) b!71527))

(assert (= (or b!71524 b!71527) bm!925))

(assert (= (and d!23036 res!58947) b!71528))

(assert (= (and b!71528 res!58944) b!71530))

(assert (= (and b!71530 res!58942) b!71529))

(assert (= (and b!71529 res!58945) b!71531))

(assert (= (and b!71531 res!58943) b!71526))

(assert (= (and b!71526 res!58946) b!71525))

(declare-fun m!114693 () Bool)

(assert (=> b!71528 m!114693))

(declare-fun m!114695 () Bool)

(assert (=> b!71526 m!114695))

(declare-fun m!114697 () Bool)

(assert (=> b!71526 m!114697))

(declare-fun m!114699 () Bool)

(assert (=> b!71526 m!114699))

(declare-fun m!114701 () Bool)

(assert (=> b!71526 m!114701))

(declare-fun m!114703 () Bool)

(assert (=> b!71526 m!114703))

(declare-fun m!114705 () Bool)

(assert (=> bm!925 m!114705))

(declare-fun m!114707 () Bool)

(assert (=> d!23036 m!114707))

(assert (=> d!23036 m!114161))

(assert (=> d!23036 m!114335))

(assert (=> d!23036 m!114333))

(declare-fun m!114709 () Bool)

(assert (=> b!71524 m!114709))

(declare-fun m!114711 () Bool)

(assert (=> b!71524 m!114711))

(declare-fun m!114713 () Bool)

(assert (=> b!71524 m!114713))

(declare-fun m!114715 () Bool)

(assert (=> b!71524 m!114715))

(declare-fun m!114717 () Bool)

(assert (=> b!71524 m!114717))

(declare-fun m!114719 () Bool)

(assert (=> b!71524 m!114719))

(declare-fun m!114721 () Bool)

(assert (=> b!71524 m!114721))

(declare-fun m!114723 () Bool)

(assert (=> b!71524 m!114723))

(declare-fun m!114725 () Bool)

(assert (=> b!71524 m!114725))

(declare-fun m!114727 () Bool)

(assert (=> b!71524 m!114727))

(declare-fun m!114729 () Bool)

(assert (=> b!71524 m!114729))

(declare-fun m!114731 () Bool)

(assert (=> b!71524 m!114731))

(declare-fun m!114733 () Bool)

(assert (=> b!71524 m!114733))

(assert (=> b!71524 m!114161))

(declare-fun m!114735 () Bool)

(assert (=> b!71524 m!114735))

(declare-fun m!114737 () Bool)

(assert (=> b!71524 m!114737))

(assert (=> b!71524 m!114713))

(declare-fun m!114739 () Bool)

(assert (=> b!71524 m!114739))

(declare-fun m!114741 () Bool)

(assert (=> b!71524 m!114741))

(declare-fun m!114743 () Bool)

(assert (=> b!71524 m!114743))

(declare-fun m!114745 () Bool)

(assert (=> b!71524 m!114745))

(declare-fun m!114747 () Bool)

(assert (=> b!71524 m!114747))

(declare-fun m!114749 () Bool)

(assert (=> b!71524 m!114749))

(declare-fun m!114751 () Bool)

(assert (=> b!71524 m!114751))

(declare-fun m!114753 () Bool)

(assert (=> b!71524 m!114753))

(declare-fun m!114755 () Bool)

(assert (=> b!71524 m!114755))

(declare-fun m!114757 () Bool)

(assert (=> b!71524 m!114757))

(assert (=> b!71524 m!114715))

(declare-fun m!114759 () Bool)

(assert (=> b!71524 m!114759))

(declare-fun m!114761 () Bool)

(assert (=> b!71524 m!114761))

(assert (=> b!71524 m!114719))

(declare-fun m!114763 () Bool)

(assert (=> b!71524 m!114763))

(declare-fun m!114765 () Bool)

(assert (=> b!71524 m!114765))

(declare-fun m!114767 () Bool)

(assert (=> b!71524 m!114767))

(declare-fun m!114769 () Bool)

(assert (=> b!71524 m!114769))

(assert (=> b!71524 m!114743))

(declare-fun m!114771 () Bool)

(assert (=> b!71525 m!114771))

(declare-fun m!114773 () Bool)

(assert (=> b!71529 m!114773))

(declare-fun m!114775 () Bool)

(assert (=> b!71527 m!114775))

(declare-fun m!114777 () Bool)

(assert (=> b!71527 m!114777))

(assert (=> b!71153 d!23036))

(declare-fun d!23146 () Bool)

(assert (=> d!23146 (= (head!552 (byteArrayBitContentToList!0 (_2!3195 lt!114843) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!848 (byteArrayBitContentToList!0 (_2!3195 lt!114843) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!71162 d!23146))

(declare-fun d!23148 () Bool)

(declare-fun c!5376 () Bool)

(assert (=> d!23148 (= c!5376 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46553 () List!733)

(assert (=> d!23148 (= (byteArrayBitContentToList!0 (_2!3195 lt!114843) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!46553)))

(declare-fun b!71532 () Bool)

(assert (=> b!71532 (= e!46553 Nil!730)))

(declare-fun b!71533 () Bool)

(assert (=> b!71533 (= e!46553 (Cons!729 (not (= (bvand ((_ sign_extend 24) (select (arr!1953 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3195 lt!114843) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23148 c!5376) b!71532))

(assert (= (and d!23148 (not c!5376)) b!71533))

(assert (=> b!71533 m!114105))

(assert (=> b!71533 m!114373))

(declare-fun m!114779 () Bool)

(assert (=> b!71533 m!114779))

(assert (=> b!71162 d!23148))

(declare-fun d!23150 () Bool)

(assert (=> d!23150 (= (head!552 (bitStreamReadBitsIntoList!0 (_2!3195 lt!114843) (_1!3196 lt!114830) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!848 (bitStreamReadBitsIntoList!0 (_2!3195 lt!114843) (_1!3196 lt!114830) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!71162 d!23150))

(declare-fun lt!115573 () tuple2!6174)

(declare-fun b!71535 () Bool)

(declare-fun lt!115575 () (_ BitVec 64))

(declare-fun e!46554 () tuple2!6176)

(assert (=> b!71535 (= e!46554 (tuple2!6177 (Cons!729 (_1!3201 lt!115573) (bitStreamReadBitsIntoList!0 (_2!3195 lt!114843) (_2!3201 lt!115573) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!115575))) (_2!3201 lt!115573)))))

(assert (=> b!71535 (= lt!115573 (readBit!0 (_1!3196 lt!114830)))))

(assert (=> b!71535 (= lt!115575 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71537 () Bool)

(declare-fun e!46555 () Bool)

(declare-fun lt!115574 () List!733)

(assert (=> b!71537 (= e!46555 (> (length!361 lt!115574) 0))))

(declare-fun b!71534 () Bool)

(assert (=> b!71534 (= e!46554 (tuple2!6177 Nil!730 (_1!3196 lt!114830)))))

(declare-fun b!71536 () Bool)

(assert (=> b!71536 (= e!46555 (isEmpty!231 lt!115574))))

(declare-fun d!23152 () Bool)

(assert (=> d!23152 e!46555))

(declare-fun c!5377 () Bool)

(assert (=> d!23152 (= c!5377 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23152 (= lt!115574 (_1!3202 e!46554))))

(declare-fun c!5378 () Bool)

(assert (=> d!23152 (= c!5378 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23152 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23152 (= (bitStreamReadBitsIntoList!0 (_2!3195 lt!114843) (_1!3196 lt!114830) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115574)))

(assert (= (and d!23152 c!5378) b!71534))

(assert (= (and d!23152 (not c!5378)) b!71535))

(assert (= (and d!23152 c!5377) b!71536))

(assert (= (and d!23152 (not c!5377)) b!71537))

(declare-fun m!114781 () Bool)

(assert (=> b!71535 m!114781))

(declare-fun m!114783 () Bool)

(assert (=> b!71535 m!114783))

(declare-fun m!114785 () Bool)

(assert (=> b!71537 m!114785))

(declare-fun m!114787 () Bool)

(assert (=> b!71536 m!114787))

(assert (=> b!71162 d!23152))

(declare-fun d!23154 () Bool)

(assert (=> d!23154 (= (head!552 lt!114847) (h!848 lt!114847))))

(assert (=> b!71163 d!23154))

(declare-fun d!23156 () Bool)

(assert (=> d!23156 (= (tail!337 lt!114847) (t!1483 lt!114847))))

(assert (=> b!71152 d!23156))

(declare-fun d!23158 () Bool)

(declare-fun e!46558 () Bool)

(assert (=> d!23158 e!46558))

(declare-fun res!58950 () Bool)

(assert (=> d!23158 (=> (not res!58950) (not e!46558))))

(declare-fun lt!115581 () (_ BitVec 64))

(assert (=> d!23158 (= res!58950 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!115581) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23158 (= lt!115581 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115580 () Unit!4759)

(declare-fun choose!42 (BitStream!2316 BitStream!2316 BitStream!2316 BitStream!2316 (_ BitVec 64) List!733) Unit!4759)

(assert (=> d!23158 (= lt!115580 (choose!42 (_2!3195 lt!114848) (_2!3195 lt!114848) (_1!3196 lt!114850) (_1!3196 lt!114829) (bvsub to!314 i!635) lt!114847))))

(assert (=> d!23158 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23158 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3195 lt!114848) (_2!3195 lt!114848) (_1!3196 lt!114850) (_1!3196 lt!114829) (bvsub to!314 i!635) lt!114847) lt!115580)))

(declare-fun b!71540 () Bool)

(assert (=> b!71540 (= e!46558 (= (bitStreamReadBitsIntoList!0 (_2!3195 lt!114848) (_1!3196 lt!114829) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!337 lt!114847)))))

(assert (= (and d!23158 res!58950) b!71540))

(declare-fun m!114789 () Bool)

(assert (=> d!23158 m!114789))

(declare-fun m!114791 () Bool)

(assert (=> b!71540 m!114791))

(assert (=> b!71540 m!114095))

(assert (=> b!71152 d!23158))

(declare-fun d!23160 () Bool)

(assert (=> d!23160 (= (bitAt!0 (buf!1746 (_2!3195 lt!114843)) lt!114833) (not (= (bvand ((_ sign_extend 24) (select (arr!1953 (buf!1746 (_2!3195 lt!114843))) ((_ extract 31 0) (bvsdiv lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114833 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5537 () Bool)

(assert (= bs!5537 d!23160))

(declare-fun m!114793 () Bool)

(assert (=> bs!5537 m!114793))

(assert (=> bs!5537 m!114279))

(assert (=> b!71161 d!23160))

(declare-fun d!23162 () Bool)

(declare-fun res!58953 () Bool)

(declare-fun e!46560 () Bool)

(assert (=> d!23162 (=> (not res!58953) (not e!46560))))

(assert (=> d!23162 (= res!58953 (= (size!1365 (buf!1746 thiss!1379)) (size!1365 (buf!1746 thiss!1379))))))

(assert (=> d!23162 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!46560)))

(declare-fun b!71541 () Bool)

(declare-fun res!58952 () Bool)

(assert (=> b!71541 (=> (not res!58952) (not e!46560))))

(assert (=> b!71541 (= res!58952 (bvsle (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)) (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379))))))

(declare-fun b!71542 () Bool)

(declare-fun e!46559 () Bool)

(assert (=> b!71542 (= e!46560 e!46559)))

(declare-fun res!58951 () Bool)

(assert (=> b!71542 (=> res!58951 e!46559)))

(assert (=> b!71542 (= res!58951 (= (size!1365 (buf!1746 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71543 () Bool)

(assert (=> b!71543 (= e!46559 (arrayBitRangesEq!0 (buf!1746 thiss!1379) (buf!1746 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379))))))

(assert (= (and d!23162 res!58953) b!71541))

(assert (= (and b!71541 res!58952) b!71542))

(assert (= (and b!71542 (not res!58951)) b!71543))

(assert (=> b!71541 m!114085))

(assert (=> b!71541 m!114085))

(assert (=> b!71543 m!114085))

(assert (=> b!71543 m!114085))

(declare-fun m!114795 () Bool)

(assert (=> b!71543 m!114795))

(assert (=> b!71172 d!23162))

(declare-fun d!23164 () Bool)

(assert (=> d!23164 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!115584 () Unit!4759)

(declare-fun choose!11 (BitStream!2316) Unit!4759)

(assert (=> d!23164 (= lt!115584 (choose!11 thiss!1379))))

(assert (=> d!23164 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!115584)))

(declare-fun bs!5539 () Bool)

(assert (= bs!5539 d!23164))

(assert (=> bs!5539 m!114081))

(declare-fun m!114797 () Bool)

(assert (=> bs!5539 m!114797))

(assert (=> b!71172 d!23164))

(declare-fun d!23166 () Bool)

(declare-fun e!46561 () Bool)

(assert (=> d!23166 e!46561))

(declare-fun res!58954 () Bool)

(assert (=> d!23166 (=> (not res!58954) (not e!46561))))

(declare-fun lt!115590 () (_ BitVec 64))

(declare-fun lt!115588 () (_ BitVec 64))

(declare-fun lt!115587 () (_ BitVec 64))

(assert (=> d!23166 (= res!58954 (= lt!115590 (bvsub lt!115587 lt!115588)))))

(assert (=> d!23166 (or (= (bvand lt!115587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115587 lt!115588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23166 (= lt!115588 (remainingBits!0 ((_ sign_extend 32) (size!1365 (buf!1746 thiss!1379))) ((_ sign_extend 32) (currentByte!3466 thiss!1379)) ((_ sign_extend 32) (currentBit!3461 thiss!1379))))))

(declare-fun lt!115585 () (_ BitVec 64))

(declare-fun lt!115586 () (_ BitVec 64))

(assert (=> d!23166 (= lt!115587 (bvmul lt!115585 lt!115586))))

(assert (=> d!23166 (or (= lt!115585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115586 (bvsdiv (bvmul lt!115585 lt!115586) lt!115585)))))

(assert (=> d!23166 (= lt!115586 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23166 (= lt!115585 ((_ sign_extend 32) (size!1365 (buf!1746 thiss!1379))))))

(assert (=> d!23166 (= lt!115590 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3466 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3461 thiss!1379))))))

(assert (=> d!23166 (invariant!0 (currentBit!3461 thiss!1379) (currentByte!3466 thiss!1379) (size!1365 (buf!1746 thiss!1379)))))

(assert (=> d!23166 (= (bitIndex!0 (size!1365 (buf!1746 thiss!1379)) (currentByte!3466 thiss!1379) (currentBit!3461 thiss!1379)) lt!115590)))

(declare-fun b!71544 () Bool)

(declare-fun res!58955 () Bool)

(assert (=> b!71544 (=> (not res!58955) (not e!46561))))

(assert (=> b!71544 (= res!58955 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115590))))

(declare-fun b!71545 () Bool)

(declare-fun lt!115589 () (_ BitVec 64))

(assert (=> b!71545 (= e!46561 (bvsle lt!115590 (bvmul lt!115589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71545 (or (= lt!115589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115589)))))

(assert (=> b!71545 (= lt!115589 ((_ sign_extend 32) (size!1365 (buf!1746 thiss!1379))))))

(assert (= (and d!23166 res!58954) b!71544))

(assert (= (and b!71544 res!58955) b!71545))

(assert (=> d!23166 m!114359))

(assert (=> d!23166 m!114371))

(assert (=> b!71172 d!23166))

(check-sat (not b!71271) (not b!71332) (not b!71338) (not b!71333) (not b!71540) (not b!71335) (not b!71266) (not b!71268) (not b!71289) (not b!71543) (not d!23166) (not b!71275) (not b!71251) (not d!22974) (not b!71536) (not d!22986) (not d!22964) (not b!71529) (not bm!925) (not d!23036) (not d!22970) (not b!71524) (not b!71250) (not d!23010) (not b!71349) (not d!23022) (not d!22960) (not b!71346) (not b!71298) (not b!71528) (not b!71525) (not b!71342) (not b!71265) (not d!23164) (not b!71274) (not b!71273) (not d!22988) (not d!23158) (not b!71249) (not d!22966) (not b!71535) (not b!71533) (not d!22972) (not d!23034) (not d!23014) (not b!71345) (not b!71270) (not b!71301) (not b!71348) (not b!71267) (not d!22978) (not d!23000) (not b!71537) (not b!71331) (not b!71263) (not b!71328) (not b!71340) (not b!71334) (not d!22982) (not b!71541) (not d!22990) (not b!71344) (not b!71527) (not b!71262) (not b!71330) (not d!23028) (not d!22980) (not b!71526) (not d!23012) (not d!23026) (not b!71296) (not b!71329))
