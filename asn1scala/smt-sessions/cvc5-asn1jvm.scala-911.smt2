; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25540 () Bool)

(assert start!25540)

(declare-fun b!130105 () Bool)

(declare-fun res!107826 () Bool)

(declare-fun e!86239 () Bool)

(assert (=> b!130105 (=> (not res!107826) (not e!86239))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!130105 (= res!107826 (bvslt from!447 to!404))))

(declare-fun b!130106 () Bool)

(declare-fun e!86235 () Bool)

(declare-fun e!86237 () Bool)

(assert (=> b!130106 (= e!86235 e!86237)))

(declare-fun res!107825 () Bool)

(assert (=> b!130106 (=> (not res!107825) (not e!86237))))

(declare-fun lt!200660 () (_ BitVec 64))

(declare-datatypes ((array!6025 0))(
  ( (array!6026 (arr!3345 (Array (_ BitVec 32) (_ BitVec 8))) (size!2728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4720 0))(
  ( (BitStream!4721 (buf!3086 array!6025) (currentByte!5847 (_ BitVec 32)) (currentBit!5842 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8061 0))(
  ( (Unit!8062) )
))
(declare-datatypes ((tuple2!11182 0))(
  ( (tuple2!11183 (_1!5888 Unit!8061) (_2!5888 BitStream!4720)) )
))
(declare-fun lt!200663 () tuple2!11182)

(declare-fun lt!200673 () tuple2!11182)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130106 (= res!107825 (= (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200663))) (currentByte!5847 (_2!5888 lt!200663)) (currentBit!5842 (_2!5888 lt!200663))) (bvadd (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200660))))))

(assert (=> b!130106 (= lt!200660 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130107 () Bool)

(declare-fun e!86240 () Bool)

(declare-fun thiss!1634 () BitStream!4720)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130107 (= e!86240 (invariant!0 (currentBit!5842 thiss!1634) (currentByte!5847 thiss!1634) (size!2728 (buf!3086 (_2!5888 lt!200673)))))))

(declare-fun b!130108 () Bool)

(declare-fun res!107828 () Bool)

(assert (=> b!130108 (=> (not res!107828) (not e!86237))))

(declare-fun isPrefixOf!0 (BitStream!4720 BitStream!4720) Bool)

(assert (=> b!130108 (= res!107828 (isPrefixOf!0 (_2!5888 lt!200673) (_2!5888 lt!200663)))))

(declare-fun b!130109 () Bool)

(declare-datatypes ((tuple2!11184 0))(
  ( (tuple2!11185 (_1!5889 BitStream!4720) (_2!5889 BitStream!4720)) )
))
(declare-fun lt!200672 () tuple2!11184)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130109 (= e!86239 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5889 lt!200672)))) ((_ sign_extend 32) (currentByte!5847 (_1!5889 lt!200672))) ((_ sign_extend 32) (currentBit!5842 (_1!5889 lt!200672))))))))

(declare-fun lt!200662 () tuple2!11184)

(declare-fun reader!0 (BitStream!4720 BitStream!4720) tuple2!11184)

(assert (=> b!130109 (= lt!200662 (reader!0 (_2!5888 lt!200673) (_2!5888 lt!200663)))))

(assert (=> b!130109 (= lt!200672 (reader!0 thiss!1634 (_2!5888 lt!200663)))))

(declare-fun e!86231 () Bool)

(assert (=> b!130109 e!86231))

(declare-fun res!107820 () Bool)

(assert (=> b!130109 (=> (not res!107820) (not e!86231))))

(declare-datatypes ((tuple2!11186 0))(
  ( (tuple2!11187 (_1!5890 BitStream!4720) (_2!5890 (_ BitVec 8))) )
))
(declare-fun lt!200670 () tuple2!11186)

(declare-fun lt!200666 () tuple2!11186)

(assert (=> b!130109 (= res!107820 (= (bitIndex!0 (size!2728 (buf!3086 (_1!5890 lt!200670))) (currentByte!5847 (_1!5890 lt!200670)) (currentBit!5842 (_1!5890 lt!200670))) (bitIndex!0 (size!2728 (buf!3086 (_1!5890 lt!200666))) (currentByte!5847 (_1!5890 lt!200666)) (currentBit!5842 (_1!5890 lt!200666)))))))

(declare-fun lt!200661 () Unit!8061)

(declare-fun lt!200671 () BitStream!4720)

(declare-fun readBytePrefixLemma!0 (BitStream!4720 BitStream!4720) Unit!8061)

(assert (=> b!130109 (= lt!200661 (readBytePrefixLemma!0 lt!200671 (_2!5888 lt!200663)))))

(declare-fun readBytePure!0 (BitStream!4720) tuple2!11186)

(assert (=> b!130109 (= lt!200666 (readBytePure!0 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634))))))

(assert (=> b!130109 (= lt!200670 (readBytePure!0 lt!200671))))

(assert (=> b!130109 (= lt!200671 (BitStream!4721 (buf!3086 (_2!5888 lt!200673)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(assert (=> b!130109 e!86240))

(declare-fun res!107824 () Bool)

(assert (=> b!130109 (=> (not res!107824) (not e!86240))))

(assert (=> b!130109 (= res!107824 (isPrefixOf!0 thiss!1634 (_2!5888 lt!200663)))))

(declare-fun lt!200668 () Unit!8061)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4720 BitStream!4720 BitStream!4720) Unit!8061)

(assert (=> b!130109 (= lt!200668 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5888 lt!200673) (_2!5888 lt!200663)))))

(assert (=> b!130109 e!86235))

(declare-fun res!107822 () Bool)

(assert (=> b!130109 (=> (not res!107822) (not e!86235))))

(assert (=> b!130109 (= res!107822 (= (size!2728 (buf!3086 (_2!5888 lt!200673))) (size!2728 (buf!3086 (_2!5888 lt!200663)))))))

(declare-fun arr!237 () array!6025)

(declare-fun appendByteArrayLoop!0 (BitStream!4720 array!6025 (_ BitVec 32) (_ BitVec 32)) tuple2!11182)

(assert (=> b!130109 (= lt!200663 (appendByteArrayLoop!0 (_2!5888 lt!200673) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130109 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200674 () Unit!8061)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4720 BitStream!4720 (_ BitVec 64) (_ BitVec 32)) Unit!8061)

(assert (=> b!130109 (= lt!200674 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5888 lt!200673) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86232 () Bool)

(assert (=> b!130109 e!86232))

(declare-fun res!107819 () Bool)

(assert (=> b!130109 (=> (not res!107819) (not e!86232))))

(assert (=> b!130109 (= res!107819 (= (size!2728 (buf!3086 thiss!1634)) (size!2728 (buf!3086 (_2!5888 lt!200673)))))))

(declare-fun appendByte!0 (BitStream!4720 (_ BitVec 8)) tuple2!11182)

(assert (=> b!130109 (= lt!200673 (appendByte!0 thiss!1634 (select (arr!3345 arr!237) from!447)))))

(declare-fun lt!200667 () tuple2!11186)

(declare-fun b!130110 () Bool)

(declare-fun lt!200669 () tuple2!11184)

(assert (=> b!130110 (= e!86232 (and (= (_2!5890 lt!200667) (select (arr!3345 arr!237) from!447)) (= (_1!5890 lt!200667) (_2!5889 lt!200669))))))

(assert (=> b!130110 (= lt!200667 (readBytePure!0 (_1!5889 lt!200669)))))

(assert (=> b!130110 (= lt!200669 (reader!0 thiss!1634 (_2!5888 lt!200673)))))

(declare-fun b!130111 () Bool)

(declare-fun e!86236 () Bool)

(assert (=> b!130111 (= e!86237 (not e!86236))))

(declare-fun res!107829 () Bool)

(assert (=> b!130111 (=> res!107829 e!86236)))

(declare-fun lt!200665 () tuple2!11184)

(declare-datatypes ((tuple2!11188 0))(
  ( (tuple2!11189 (_1!5891 BitStream!4720) (_2!5891 array!6025)) )
))
(declare-fun lt!200664 () tuple2!11188)

(assert (=> b!130111 (= res!107829 (or (not (= (size!2728 (_2!5891 lt!200664)) (size!2728 arr!237))) (not (= (_1!5891 lt!200664) (_2!5889 lt!200665)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4720 array!6025 (_ BitVec 32) (_ BitVec 32)) tuple2!11188)

(assert (=> b!130111 (= lt!200664 (readByteArrayLoopPure!0 (_1!5889 lt!200665) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130111 (validate_offset_bits!1 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) lt!200660)))

(declare-fun lt!200675 () Unit!8061)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4720 array!6025 (_ BitVec 64)) Unit!8061)

(assert (=> b!130111 (= lt!200675 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5888 lt!200673) (buf!3086 (_2!5888 lt!200663)) lt!200660))))

(assert (=> b!130111 (= lt!200665 (reader!0 (_2!5888 lt!200673) (_2!5888 lt!200663)))))

(declare-fun b!130112 () Bool)

(declare-fun arrayRangesEq!131 (array!6025 array!6025 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130112 (= e!86236 (not (arrayRangesEq!131 arr!237 (_2!5891 lt!200664) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130113 () Bool)

(assert (=> b!130113 (= e!86231 (= (_2!5890 lt!200670) (_2!5890 lt!200666)))))

(declare-fun b!130114 () Bool)

(declare-fun res!107818 () Bool)

(assert (=> b!130114 (=> (not res!107818) (not e!86232))))

(assert (=> b!130114 (= res!107818 (isPrefixOf!0 thiss!1634 (_2!5888 lt!200673)))))

(declare-fun b!130116 () Bool)

(declare-fun e!86233 () Bool)

(declare-fun array_inv!2517 (array!6025) Bool)

(assert (=> b!130116 (= e!86233 (array_inv!2517 (buf!3086 thiss!1634)))))

(declare-fun b!130117 () Bool)

(declare-fun res!107821 () Bool)

(assert (=> b!130117 (=> (not res!107821) (not e!86232))))

(assert (=> b!130117 (= res!107821 (= (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))))

(declare-fun b!130118 () Bool)

(declare-fun res!107823 () Bool)

(assert (=> b!130118 (=> (not res!107823) (not e!86239))))

(assert (=> b!130118 (= res!107823 (invariant!0 (currentBit!5842 thiss!1634) (currentByte!5847 thiss!1634) (size!2728 (buf!3086 thiss!1634))))))

(declare-fun b!130115 () Bool)

(declare-fun res!107830 () Bool)

(assert (=> b!130115 (=> (not res!107830) (not e!86239))))

(assert (=> b!130115 (= res!107830 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))) ((_ sign_extend 32) (currentByte!5847 thiss!1634)) ((_ sign_extend 32) (currentBit!5842 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!107827 () Bool)

(assert (=> start!25540 (=> (not res!107827) (not e!86239))))

(assert (=> start!25540 (= res!107827 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2728 arr!237))))))

(assert (=> start!25540 e!86239))

(assert (=> start!25540 true))

(assert (=> start!25540 (array_inv!2517 arr!237)))

(declare-fun inv!12 (BitStream!4720) Bool)

(assert (=> start!25540 (and (inv!12 thiss!1634) e!86233)))

(assert (= (and start!25540 res!107827) b!130115))

(assert (= (and b!130115 res!107830) b!130105))

(assert (= (and b!130105 res!107826) b!130118))

(assert (= (and b!130118 res!107823) b!130109))

(assert (= (and b!130109 res!107819) b!130117))

(assert (= (and b!130117 res!107821) b!130114))

(assert (= (and b!130114 res!107818) b!130110))

(assert (= (and b!130109 res!107822) b!130106))

(assert (= (and b!130106 res!107825) b!130108))

(assert (= (and b!130108 res!107828) b!130111))

(assert (= (and b!130111 (not res!107829)) b!130112))

(assert (= (and b!130109 res!107824) b!130107))

(assert (= (and b!130109 res!107820) b!130113))

(assert (= start!25540 b!130116))

(declare-fun m!196147 () Bool)

(assert (=> b!130118 m!196147))

(declare-fun m!196149 () Bool)

(assert (=> b!130111 m!196149))

(declare-fun m!196151 () Bool)

(assert (=> b!130111 m!196151))

(declare-fun m!196153 () Bool)

(assert (=> b!130111 m!196153))

(declare-fun m!196155 () Bool)

(assert (=> b!130111 m!196155))

(declare-fun m!196157 () Bool)

(assert (=> b!130110 m!196157))

(declare-fun m!196159 () Bool)

(assert (=> b!130110 m!196159))

(declare-fun m!196161 () Bool)

(assert (=> b!130110 m!196161))

(declare-fun m!196163 () Bool)

(assert (=> b!130115 m!196163))

(declare-fun m!196165 () Bool)

(assert (=> b!130107 m!196165))

(declare-fun m!196167 () Bool)

(assert (=> b!130114 m!196167))

(declare-fun m!196169 () Bool)

(assert (=> b!130112 m!196169))

(declare-fun m!196171 () Bool)

(assert (=> b!130106 m!196171))

(declare-fun m!196173 () Bool)

(assert (=> b!130106 m!196173))

(declare-fun m!196175 () Bool)

(assert (=> b!130108 m!196175))

(declare-fun m!196177 () Bool)

(assert (=> b!130116 m!196177))

(declare-fun m!196179 () Bool)

(assert (=> b!130109 m!196179))

(declare-fun m!196181 () Bool)

(assert (=> b!130109 m!196181))

(declare-fun m!196183 () Bool)

(assert (=> b!130109 m!196183))

(declare-fun m!196185 () Bool)

(assert (=> b!130109 m!196185))

(declare-fun m!196187 () Bool)

(assert (=> b!130109 m!196187))

(declare-fun m!196189 () Bool)

(assert (=> b!130109 m!196189))

(declare-fun m!196191 () Bool)

(assert (=> b!130109 m!196191))

(declare-fun m!196193 () Bool)

(assert (=> b!130109 m!196193))

(declare-fun m!196195 () Bool)

(assert (=> b!130109 m!196195))

(assert (=> b!130109 m!196155))

(declare-fun m!196197 () Bool)

(assert (=> b!130109 m!196197))

(declare-fun m!196199 () Bool)

(assert (=> b!130109 m!196199))

(declare-fun m!196201 () Bool)

(assert (=> b!130109 m!196201))

(assert (=> b!130109 m!196157))

(declare-fun m!196203 () Bool)

(assert (=> b!130109 m!196203))

(assert (=> b!130109 m!196157))

(assert (=> b!130117 m!196173))

(declare-fun m!196205 () Bool)

(assert (=> b!130117 m!196205))

(declare-fun m!196207 () Bool)

(assert (=> start!25540 m!196207))

(declare-fun m!196209 () Bool)

(assert (=> start!25540 m!196209))

(push 1)

(assert (not b!130111))

(assert (not b!130112))

(assert (not b!130117))

(assert (not b!130115))

(assert (not b!130108))

(assert (not b!130116))

(assert (not b!130107))

(assert (not b!130114))

(assert (not b!130106))

(assert (not b!130109))

(assert (not start!25540))

(assert (not b!130110))

(assert (not b!130118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41548 () Bool)

(declare-fun res!107959 () Bool)

(declare-fun e!86332 () Bool)

(assert (=> d!41548 (=> (not res!107959) (not e!86332))))

(assert (=> d!41548 (= res!107959 (= (size!2728 (buf!3086 thiss!1634)) (size!2728 (buf!3086 (_2!5888 lt!200673)))))))

(assert (=> d!41548 (= (isPrefixOf!0 thiss!1634 (_2!5888 lt!200673)) e!86332)))

(declare-fun b!130251 () Bool)

(declare-fun res!107957 () Bool)

(assert (=> b!130251 (=> (not res!107957) (not e!86332))))

(assert (=> b!130251 (= res!107957 (bvsle (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)) (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673)))))))

(declare-fun b!130252 () Bool)

(declare-fun e!86333 () Bool)

(assert (=> b!130252 (= e!86332 e!86333)))

(declare-fun res!107958 () Bool)

(assert (=> b!130252 (=> res!107958 e!86333)))

(assert (=> b!130252 (= res!107958 (= (size!2728 (buf!3086 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!130253 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6025 array!6025 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130253 (= e!86333 (arrayBitRangesEq!0 (buf!3086 thiss!1634) (buf!3086 (_2!5888 lt!200673)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634))))))

(assert (= (and d!41548 res!107959) b!130251))

(assert (= (and b!130251 res!107957) b!130252))

(assert (= (and b!130252 (not res!107958)) b!130253))

(assert (=> b!130251 m!196205))

(assert (=> b!130251 m!196173))

(assert (=> b!130253 m!196205))

(assert (=> b!130253 m!196205))

(declare-fun m!196381 () Bool)

(assert (=> b!130253 m!196381))

(assert (=> b!130114 d!41548))

(declare-fun d!41550 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41550 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))) ((_ sign_extend 32) (currentByte!5847 thiss!1634)) ((_ sign_extend 32) (currentBit!5842 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))) ((_ sign_extend 32) (currentByte!5847 thiss!1634)) ((_ sign_extend 32) (currentBit!5842 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10143 () Bool)

(assert (= bs!10143 d!41550))

(declare-fun m!196383 () Bool)

(assert (=> bs!10143 m!196383))

(assert (=> b!130115 d!41550))

(declare-fun d!41552 () Bool)

(declare-fun e!86344 () Bool)

(assert (=> d!41552 e!86344))

(declare-fun res!107977 () Bool)

(assert (=> d!41552 (=> (not res!107977) (not e!86344))))

(declare-fun lt!200932 () (_ BitVec 64))

(declare-fun lt!200935 () (_ BitVec 64))

(declare-fun lt!200934 () (_ BitVec 64))

(assert (=> d!41552 (= res!107977 (= lt!200934 (bvsub lt!200935 lt!200932)))))

(assert (=> d!41552 (or (= (bvand lt!200935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200935 lt!200932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41552 (= lt!200932 (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200663))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200663)))))))

(declare-fun lt!200930 () (_ BitVec 64))

(declare-fun lt!200933 () (_ BitVec 64))

(assert (=> d!41552 (= lt!200935 (bvmul lt!200930 lt!200933))))

(assert (=> d!41552 (or (= lt!200930 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200933 (bvsdiv (bvmul lt!200930 lt!200933) lt!200930)))))

(assert (=> d!41552 (= lt!200933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41552 (= lt!200930 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))))))

(assert (=> d!41552 (= lt!200934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200663))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200663)))))))

(assert (=> d!41552 (invariant!0 (currentBit!5842 (_2!5888 lt!200663)) (currentByte!5847 (_2!5888 lt!200663)) (size!2728 (buf!3086 (_2!5888 lt!200663))))))

(assert (=> d!41552 (= (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200663))) (currentByte!5847 (_2!5888 lt!200663)) (currentBit!5842 (_2!5888 lt!200663))) lt!200934)))

(declare-fun b!130278 () Bool)

(declare-fun res!107976 () Bool)

(assert (=> b!130278 (=> (not res!107976) (not e!86344))))

(assert (=> b!130278 (= res!107976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200934))))

(declare-fun b!130279 () Bool)

(declare-fun lt!200931 () (_ BitVec 64))

(assert (=> b!130279 (= e!86344 (bvsle lt!200934 (bvmul lt!200931 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130279 (or (= lt!200931 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200931 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200931)))))

(assert (=> b!130279 (= lt!200931 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))))))

(assert (= (and d!41552 res!107977) b!130278))

(assert (= (and b!130278 res!107976) b!130279))

(declare-fun m!196443 () Bool)

(assert (=> d!41552 m!196443))

(declare-fun m!196445 () Bool)

(assert (=> d!41552 m!196445))

(assert (=> b!130106 d!41552))

(declare-fun d!41562 () Bool)

(declare-fun e!86345 () Bool)

(assert (=> d!41562 e!86345))

(declare-fun res!107979 () Bool)

(assert (=> d!41562 (=> (not res!107979) (not e!86345))))

(declare-fun lt!200941 () (_ BitVec 64))

(declare-fun lt!200938 () (_ BitVec 64))

(declare-fun lt!200940 () (_ BitVec 64))

(assert (=> d!41562 (= res!107979 (= lt!200940 (bvsub lt!200941 lt!200938)))))

(assert (=> d!41562 (or (= (bvand lt!200941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200938 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200941 lt!200938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41562 (= lt!200938 (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673)))))))

(declare-fun lt!200936 () (_ BitVec 64))

(declare-fun lt!200939 () (_ BitVec 64))

(assert (=> d!41562 (= lt!200941 (bvmul lt!200936 lt!200939))))

(assert (=> d!41562 (or (= lt!200936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200939 (bvsdiv (bvmul lt!200936 lt!200939) lt!200936)))))

(assert (=> d!41562 (= lt!200939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41562 (= lt!200936 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))))))

(assert (=> d!41562 (= lt!200940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673)))))))

(assert (=> d!41562 (invariant!0 (currentBit!5842 (_2!5888 lt!200673)) (currentByte!5847 (_2!5888 lt!200673)) (size!2728 (buf!3086 (_2!5888 lt!200673))))))

(assert (=> d!41562 (= (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))) lt!200940)))

(declare-fun b!130280 () Bool)

(declare-fun res!107978 () Bool)

(assert (=> b!130280 (=> (not res!107978) (not e!86345))))

(assert (=> b!130280 (= res!107978 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200940))))

(declare-fun b!130281 () Bool)

(declare-fun lt!200937 () (_ BitVec 64))

(assert (=> b!130281 (= e!86345 (bvsle lt!200940 (bvmul lt!200937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130281 (or (= lt!200937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200937)))))

(assert (=> b!130281 (= lt!200937 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))))))

(assert (= (and d!41562 res!107979) b!130280))

(assert (= (and b!130280 res!107978) b!130281))

(declare-fun m!196447 () Bool)

(assert (=> d!41562 m!196447))

(declare-fun m!196449 () Bool)

(assert (=> d!41562 m!196449))

(assert (=> b!130106 d!41562))

(assert (=> b!130117 d!41562))

(declare-fun d!41564 () Bool)

(declare-fun e!86346 () Bool)

(assert (=> d!41564 e!86346))

(declare-fun res!107981 () Bool)

(assert (=> d!41564 (=> (not res!107981) (not e!86346))))

(declare-fun lt!200944 () (_ BitVec 64))

(declare-fun lt!200946 () (_ BitVec 64))

(declare-fun lt!200947 () (_ BitVec 64))

(assert (=> d!41564 (= res!107981 (= lt!200946 (bvsub lt!200947 lt!200944)))))

(assert (=> d!41564 (or (= (bvand lt!200947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200947 lt!200944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41564 (= lt!200944 (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))) ((_ sign_extend 32) (currentByte!5847 thiss!1634)) ((_ sign_extend 32) (currentBit!5842 thiss!1634))))))

(declare-fun lt!200942 () (_ BitVec 64))

(declare-fun lt!200945 () (_ BitVec 64))

(assert (=> d!41564 (= lt!200947 (bvmul lt!200942 lt!200945))))

(assert (=> d!41564 (or (= lt!200942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200945 (bvsdiv (bvmul lt!200942 lt!200945) lt!200942)))))

(assert (=> d!41564 (= lt!200945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41564 (= lt!200942 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))))))

(assert (=> d!41564 (= lt!200946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5847 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5842 thiss!1634))))))

(assert (=> d!41564 (invariant!0 (currentBit!5842 thiss!1634) (currentByte!5847 thiss!1634) (size!2728 (buf!3086 thiss!1634)))))

(assert (=> d!41564 (= (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)) lt!200946)))

(declare-fun b!130282 () Bool)

(declare-fun res!107980 () Bool)

(assert (=> b!130282 (=> (not res!107980) (not e!86346))))

(assert (=> b!130282 (= res!107980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200946))))

(declare-fun b!130283 () Bool)

(declare-fun lt!200943 () (_ BitVec 64))

(assert (=> b!130283 (= e!86346 (bvsle lt!200946 (bvmul lt!200943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130283 (or (= lt!200943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200943)))))

(assert (=> b!130283 (= lt!200943 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))))))

(assert (= (and d!41564 res!107981) b!130282))

(assert (= (and b!130282 res!107980) b!130283))

(assert (=> d!41564 m!196383))

(assert (=> d!41564 m!196147))

(assert (=> b!130117 d!41564))

(declare-fun d!41566 () Bool)

(assert (=> d!41566 (= (array_inv!2517 (buf!3086 thiss!1634)) (bvsge (size!2728 (buf!3086 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!130116 d!41566))

(declare-fun d!41568 () Bool)

(assert (=> d!41568 (= (invariant!0 (currentBit!5842 thiss!1634) (currentByte!5847 thiss!1634) (size!2728 (buf!3086 thiss!1634))) (and (bvsge (currentBit!5842 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5842 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5847 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5847 thiss!1634) (size!2728 (buf!3086 thiss!1634))) (and (= (currentBit!5842 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5847 thiss!1634) (size!2728 (buf!3086 thiss!1634)))))))))

(assert (=> b!130118 d!41568))

(declare-fun d!41574 () Bool)

(assert (=> d!41574 (= (array_inv!2517 arr!237) (bvsge (size!2728 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25540 d!41574))

(declare-fun d!41576 () Bool)

(assert (=> d!41576 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5842 thiss!1634) (currentByte!5847 thiss!1634) (size!2728 (buf!3086 thiss!1634))))))

(declare-fun bs!10148 () Bool)

(assert (= bs!10148 d!41576))

(assert (=> bs!10148 m!196147))

(assert (=> start!25540 d!41576))

(declare-fun d!41582 () Bool)

(assert (=> d!41582 (= (invariant!0 (currentBit!5842 thiss!1634) (currentByte!5847 thiss!1634) (size!2728 (buf!3086 (_2!5888 lt!200673)))) (and (bvsge (currentBit!5842 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5842 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5847 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5847 thiss!1634) (size!2728 (buf!3086 (_2!5888 lt!200673)))) (and (= (currentBit!5842 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5847 thiss!1634) (size!2728 (buf!3086 (_2!5888 lt!200673))))))))))

(assert (=> b!130107 d!41582))

(declare-fun d!41584 () Bool)

(declare-fun e!86350 () Bool)

(assert (=> d!41584 e!86350))

(declare-fun res!107988 () Bool)

(assert (=> d!41584 (=> (not res!107988) (not e!86350))))

(declare-fun lt!200960 () (_ BitVec 64))

(declare-fun lt!200963 () (_ BitVec 64))

(declare-fun lt!200962 () (_ BitVec 64))

(assert (=> d!41584 (= res!107988 (= lt!200962 (bvsub lt!200963 lt!200960)))))

(assert (=> d!41584 (or (= (bvand lt!200963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200963 lt!200960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41584 (= lt!200960 (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5890 lt!200670)))) ((_ sign_extend 32) (currentByte!5847 (_1!5890 lt!200670))) ((_ sign_extend 32) (currentBit!5842 (_1!5890 lt!200670)))))))

(declare-fun lt!200958 () (_ BitVec 64))

(declare-fun lt!200961 () (_ BitVec 64))

(assert (=> d!41584 (= lt!200963 (bvmul lt!200958 lt!200961))))

(assert (=> d!41584 (or (= lt!200958 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200961 (bvsdiv (bvmul lt!200958 lt!200961) lt!200958)))))

(assert (=> d!41584 (= lt!200961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41584 (= lt!200958 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5890 lt!200670)))))))

(assert (=> d!41584 (= lt!200962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5847 (_1!5890 lt!200670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5842 (_1!5890 lt!200670)))))))

(assert (=> d!41584 (invariant!0 (currentBit!5842 (_1!5890 lt!200670)) (currentByte!5847 (_1!5890 lt!200670)) (size!2728 (buf!3086 (_1!5890 lt!200670))))))

(assert (=> d!41584 (= (bitIndex!0 (size!2728 (buf!3086 (_1!5890 lt!200670))) (currentByte!5847 (_1!5890 lt!200670)) (currentBit!5842 (_1!5890 lt!200670))) lt!200962)))

(declare-fun b!130289 () Bool)

(declare-fun res!107987 () Bool)

(assert (=> b!130289 (=> (not res!107987) (not e!86350))))

(assert (=> b!130289 (= res!107987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200962))))

(declare-fun b!130290 () Bool)

(declare-fun lt!200959 () (_ BitVec 64))

(assert (=> b!130290 (= e!86350 (bvsle lt!200962 (bvmul lt!200959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130290 (or (= lt!200959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200959)))))

(assert (=> b!130290 (= lt!200959 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5890 lt!200670)))))))

(assert (= (and d!41584 res!107988) b!130289))

(assert (= (and b!130289 res!107987) b!130290))

(declare-fun m!196461 () Bool)

(assert (=> d!41584 m!196461))

(declare-fun m!196463 () Bool)

(assert (=> d!41584 m!196463))

(assert (=> b!130109 d!41584))

(declare-fun d!41586 () Bool)

(declare-datatypes ((tuple2!11208 0))(
  ( (tuple2!11209 (_1!5902 (_ BitVec 8)) (_2!5902 BitStream!4720)) )
))
(declare-fun lt!200966 () tuple2!11208)

(declare-fun readByte!0 (BitStream!4720) tuple2!11208)

(assert (=> d!41586 (= lt!200966 (readByte!0 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634))))))

(assert (=> d!41586 (= (readBytePure!0 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634))) (tuple2!11187 (_2!5902 lt!200966) (_1!5902 lt!200966)))))

(declare-fun bs!10149 () Bool)

(assert (= bs!10149 d!41586))

(declare-fun m!196465 () Bool)

(assert (=> bs!10149 m!196465))

(assert (=> b!130109 d!41586))

(declare-fun d!41590 () Bool)

(declare-fun e!86357 () Bool)

(assert (=> d!41590 e!86357))

(declare-fun res!107996 () Bool)

(assert (=> d!41590 (=> (not res!107996) (not e!86357))))

(declare-fun lt!200971 () (_ BitVec 64))

(declare-fun lt!200969 () (_ BitVec 64))

(declare-fun lt!200972 () (_ BitVec 64))

(assert (=> d!41590 (= res!107996 (= lt!200971 (bvsub lt!200972 lt!200969)))))

(assert (=> d!41590 (or (= (bvand lt!200972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200972 lt!200969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41590 (= lt!200969 (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5890 lt!200666)))) ((_ sign_extend 32) (currentByte!5847 (_1!5890 lt!200666))) ((_ sign_extend 32) (currentBit!5842 (_1!5890 lt!200666)))))))

(declare-fun lt!200967 () (_ BitVec 64))

(declare-fun lt!200970 () (_ BitVec 64))

(assert (=> d!41590 (= lt!200972 (bvmul lt!200967 lt!200970))))

(assert (=> d!41590 (or (= lt!200967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200970 (bvsdiv (bvmul lt!200967 lt!200970) lt!200967)))))

(assert (=> d!41590 (= lt!200970 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41590 (= lt!200967 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5890 lt!200666)))))))

(assert (=> d!41590 (= lt!200971 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5847 (_1!5890 lt!200666))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5842 (_1!5890 lt!200666)))))))

(assert (=> d!41590 (invariant!0 (currentBit!5842 (_1!5890 lt!200666)) (currentByte!5847 (_1!5890 lt!200666)) (size!2728 (buf!3086 (_1!5890 lt!200666))))))

(assert (=> d!41590 (= (bitIndex!0 (size!2728 (buf!3086 (_1!5890 lt!200666))) (currentByte!5847 (_1!5890 lt!200666)) (currentBit!5842 (_1!5890 lt!200666))) lt!200971)))

(declare-fun b!130297 () Bool)

(declare-fun res!107995 () Bool)

(assert (=> b!130297 (=> (not res!107995) (not e!86357))))

(assert (=> b!130297 (= res!107995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200971))))

(declare-fun b!130298 () Bool)

(declare-fun lt!200968 () (_ BitVec 64))

(assert (=> b!130298 (= e!86357 (bvsle lt!200971 (bvmul lt!200968 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130298 (or (= lt!200968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200968)))))

(assert (=> b!130298 (= lt!200968 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5890 lt!200666)))))))

(assert (= (and d!41590 res!107996) b!130297))

(assert (= (and b!130297 res!107995) b!130298))

(declare-fun m!196473 () Bool)

(assert (=> d!41590 m!196473))

(declare-fun m!196475 () Bool)

(assert (=> d!41590 m!196475))

(assert (=> b!130109 d!41590))

(declare-fun d!41594 () Bool)

(declare-fun e!86360 () Bool)

(assert (=> d!41594 e!86360))

(declare-fun res!107999 () Bool)

(assert (=> d!41594 (=> (not res!107999) (not e!86360))))

(assert (=> d!41594 (= res!107999 (and (or (let ((rhs!3070 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3070 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3070) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41595 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41595 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41595 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3069 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3069 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3069) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!200979 () Unit!8061)

(declare-fun choose!57 (BitStream!4720 BitStream!4720 (_ BitVec 64) (_ BitVec 32)) Unit!8061)

(assert (=> d!41594 (= lt!200979 (choose!57 thiss!1634 (_2!5888 lt!200673) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41594 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5888 lt!200673) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!200979)))

(declare-fun lt!200980 () (_ BitVec 32))

(declare-fun b!130301 () Bool)

(assert (=> b!130301 (= e!86360 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) (bvsub (bvsub to!404 from!447) lt!200980)))))

(assert (=> b!130301 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!200980 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!200980) #b10000000000000000000000000000000)))))

(declare-fun lt!200981 () (_ BitVec 64))

(assert (=> b!130301 (= lt!200980 ((_ extract 31 0) lt!200981))))

(assert (=> b!130301 (and (bvslt lt!200981 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!200981 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!130301 (= lt!200981 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41594 res!107999) b!130301))

(declare-fun m!196477 () Bool)

(assert (=> d!41594 m!196477))

(declare-fun m!196479 () Bool)

(assert (=> b!130301 m!196479))

(assert (=> b!130109 d!41594))

(declare-fun d!41597 () Bool)

(assert (=> d!41597 (isPrefixOf!0 thiss!1634 (_2!5888 lt!200663))))

(declare-fun lt!200984 () Unit!8061)

(declare-fun choose!30 (BitStream!4720 BitStream!4720 BitStream!4720) Unit!8061)

(assert (=> d!41597 (= lt!200984 (choose!30 thiss!1634 (_2!5888 lt!200673) (_2!5888 lt!200663)))))

(assert (=> d!41597 (isPrefixOf!0 thiss!1634 (_2!5888 lt!200673))))

(assert (=> d!41597 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5888 lt!200673) (_2!5888 lt!200663)) lt!200984)))

(declare-fun bs!10150 () Bool)

(assert (= bs!10150 d!41597))

(assert (=> bs!10150 m!196195))

(declare-fun m!196481 () Bool)

(assert (=> bs!10150 m!196481))

(assert (=> bs!10150 m!196167))

(assert (=> b!130109 d!41597))

(declare-fun d!41599 () Bool)

(declare-fun res!108002 () Bool)

(declare-fun e!86361 () Bool)

(assert (=> d!41599 (=> (not res!108002) (not e!86361))))

(assert (=> d!41599 (= res!108002 (= (size!2728 (buf!3086 thiss!1634)) (size!2728 (buf!3086 (_2!5888 lt!200663)))))))

(assert (=> d!41599 (= (isPrefixOf!0 thiss!1634 (_2!5888 lt!200663)) e!86361)))

(declare-fun b!130302 () Bool)

(declare-fun res!108000 () Bool)

(assert (=> b!130302 (=> (not res!108000) (not e!86361))))

(assert (=> b!130302 (= res!108000 (bvsle (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)) (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200663))) (currentByte!5847 (_2!5888 lt!200663)) (currentBit!5842 (_2!5888 lt!200663)))))))

(declare-fun b!130303 () Bool)

(declare-fun e!86362 () Bool)

(assert (=> b!130303 (= e!86361 e!86362)))

(declare-fun res!108001 () Bool)

(assert (=> b!130303 (=> res!108001 e!86362)))

(assert (=> b!130303 (= res!108001 (= (size!2728 (buf!3086 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!130304 () Bool)

(assert (=> b!130304 (= e!86362 (arrayBitRangesEq!0 (buf!3086 thiss!1634) (buf!3086 (_2!5888 lt!200663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634))))))

(assert (= (and d!41599 res!108002) b!130302))

(assert (= (and b!130302 res!108000) b!130303))

(assert (= (and b!130303 (not res!108001)) b!130304))

(assert (=> b!130302 m!196205))

(assert (=> b!130302 m!196171))

(assert (=> b!130304 m!196205))

(assert (=> b!130304 m!196205))

(declare-fun m!196483 () Bool)

(assert (=> b!130304 m!196483))

(assert (=> b!130109 d!41599))

(declare-fun d!41601 () Bool)

(assert (=> d!41601 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10151 () Bool)

(assert (= bs!10151 d!41601))

(assert (=> bs!10151 m!196447))

(assert (=> b!130109 d!41601))

(declare-fun d!41603 () Bool)

(declare-fun e!86368 () Bool)

(assert (=> d!41603 e!86368))

(declare-fun res!108014 () Bool)

(assert (=> d!41603 (=> (not res!108014) (not e!86368))))

(declare-fun lt!201010 () tuple2!11186)

(declare-fun lt!201008 () tuple2!11186)

(assert (=> d!41603 (= res!108014 (= (bitIndex!0 (size!2728 (buf!3086 (_1!5890 lt!201010))) (currentByte!5847 (_1!5890 lt!201010)) (currentBit!5842 (_1!5890 lt!201010))) (bitIndex!0 (size!2728 (buf!3086 (_1!5890 lt!201008))) (currentByte!5847 (_1!5890 lt!201008)) (currentBit!5842 (_1!5890 lt!201008)))))))

(declare-fun lt!201011 () BitStream!4720)

(declare-fun lt!201009 () Unit!8061)

(declare-fun choose!14 (BitStream!4720 BitStream!4720 BitStream!4720 tuple2!11186 tuple2!11186 BitStream!4720 (_ BitVec 8) tuple2!11186 tuple2!11186 BitStream!4720 (_ BitVec 8)) Unit!8061)

(assert (=> d!41603 (= lt!201009 (choose!14 lt!200671 (_2!5888 lt!200663) lt!201011 lt!201010 (tuple2!11187 (_1!5890 lt!201010) (_2!5890 lt!201010)) (_1!5890 lt!201010) (_2!5890 lt!201010) lt!201008 (tuple2!11187 (_1!5890 lt!201008) (_2!5890 lt!201008)) (_1!5890 lt!201008) (_2!5890 lt!201008)))))

(assert (=> d!41603 (= lt!201008 (readBytePure!0 lt!201011))))

(assert (=> d!41603 (= lt!201010 (readBytePure!0 lt!200671))))

(assert (=> d!41603 (= lt!201011 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 lt!200671) (currentBit!5842 lt!200671)))))

(assert (=> d!41603 (= (readBytePrefixLemma!0 lt!200671 (_2!5888 lt!200663)) lt!201009)))

(declare-fun b!130316 () Bool)

(assert (=> b!130316 (= e!86368 (= (_2!5890 lt!201010) (_2!5890 lt!201008)))))

(assert (= (and d!41603 res!108014) b!130316))

(declare-fun m!196497 () Bool)

(assert (=> d!41603 m!196497))

(declare-fun m!196499 () Bool)

(assert (=> d!41603 m!196499))

(assert (=> d!41603 m!196185))

(declare-fun m!196501 () Bool)

(assert (=> d!41603 m!196501))

(declare-fun m!196503 () Bool)

(assert (=> d!41603 m!196503))

(assert (=> b!130109 d!41603))

(declare-fun d!41608 () Bool)

(declare-fun lt!201012 () tuple2!11208)

(assert (=> d!41608 (= lt!201012 (readByte!0 lt!200671))))

(assert (=> d!41608 (= (readBytePure!0 lt!200671) (tuple2!11187 (_2!5902 lt!201012) (_1!5902 lt!201012)))))

(declare-fun bs!10152 () Bool)

(assert (= bs!10152 d!41608))

(declare-fun m!196505 () Bool)

(assert (=> bs!10152 m!196505))

(assert (=> b!130109 d!41608))

(declare-fun lt!201170 () (_ BitVec 64))

(declare-fun lt!201169 () tuple2!11184)

(declare-fun e!86390 () Bool)

(declare-fun lt!201174 () (_ BitVec 64))

(declare-fun b!130356 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4720 (_ BitVec 64)) BitStream!4720)

(assert (=> b!130356 (= e!86390 (= (_1!5889 lt!201169) (withMovedBitIndex!0 (_2!5889 lt!201169) (bvsub lt!201174 lt!201170))))))

(assert (=> b!130356 (or (= (bvand lt!201174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201174 lt!201170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130356 (= lt!201170 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200663))) (currentByte!5847 (_2!5888 lt!200663)) (currentBit!5842 (_2!5888 lt!200663))))))

(assert (=> b!130356 (= lt!201174 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(declare-fun d!41610 () Bool)

(assert (=> d!41610 e!86390))

(declare-fun res!108043 () Bool)

(assert (=> d!41610 (=> (not res!108043) (not e!86390))))

(assert (=> d!41610 (= res!108043 (isPrefixOf!0 (_1!5889 lt!201169) (_2!5889 lt!201169)))))

(declare-fun lt!201172 () BitStream!4720)

(assert (=> d!41610 (= lt!201169 (tuple2!11185 lt!201172 (_2!5888 lt!200663)))))

(declare-fun lt!201183 () Unit!8061)

(declare-fun lt!201165 () Unit!8061)

(assert (=> d!41610 (= lt!201183 lt!201165)))

(assert (=> d!41610 (isPrefixOf!0 lt!201172 (_2!5888 lt!200663))))

(assert (=> d!41610 (= lt!201165 (lemmaIsPrefixTransitive!0 lt!201172 (_2!5888 lt!200663) (_2!5888 lt!200663)))))

(declare-fun lt!201178 () Unit!8061)

(declare-fun lt!201168 () Unit!8061)

(assert (=> d!41610 (= lt!201178 lt!201168)))

(assert (=> d!41610 (isPrefixOf!0 lt!201172 (_2!5888 lt!200663))))

(assert (=> d!41610 (= lt!201168 (lemmaIsPrefixTransitive!0 lt!201172 thiss!1634 (_2!5888 lt!200663)))))

(declare-fun lt!201179 () Unit!8061)

(declare-fun e!86389 () Unit!8061)

(assert (=> d!41610 (= lt!201179 e!86389)))

(declare-fun c!7550 () Bool)

(assert (=> d!41610 (= c!7550 (not (= (size!2728 (buf!3086 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!201173 () Unit!8061)

(declare-fun lt!201166 () Unit!8061)

(assert (=> d!41610 (= lt!201173 lt!201166)))

(assert (=> d!41610 (isPrefixOf!0 (_2!5888 lt!200663) (_2!5888 lt!200663))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4720) Unit!8061)

(assert (=> d!41610 (= lt!201166 (lemmaIsPrefixRefl!0 (_2!5888 lt!200663)))))

(declare-fun lt!201167 () Unit!8061)

(declare-fun lt!201164 () Unit!8061)

(assert (=> d!41610 (= lt!201167 lt!201164)))

(assert (=> d!41610 (= lt!201164 (lemmaIsPrefixRefl!0 (_2!5888 lt!200663)))))

(declare-fun lt!201177 () Unit!8061)

(declare-fun lt!201181 () Unit!8061)

(assert (=> d!41610 (= lt!201177 lt!201181)))

(assert (=> d!41610 (isPrefixOf!0 lt!201172 lt!201172)))

(assert (=> d!41610 (= lt!201181 (lemmaIsPrefixRefl!0 lt!201172))))

(declare-fun lt!201182 () Unit!8061)

(declare-fun lt!201176 () Unit!8061)

(assert (=> d!41610 (= lt!201182 lt!201176)))

(assert (=> d!41610 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41610 (= lt!201176 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41610 (= lt!201172 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(assert (=> d!41610 (isPrefixOf!0 thiss!1634 (_2!5888 lt!200663))))

(assert (=> d!41610 (= (reader!0 thiss!1634 (_2!5888 lt!200663)) lt!201169)))

(declare-fun b!130357 () Bool)

(declare-fun lt!201180 () Unit!8061)

(assert (=> b!130357 (= e!86389 lt!201180)))

(declare-fun lt!201175 () (_ BitVec 64))

(assert (=> b!130357 (= lt!201175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201171 () (_ BitVec 64))

(assert (=> b!130357 (= lt!201171 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6025 array!6025 (_ BitVec 64) (_ BitVec 64)) Unit!8061)

(assert (=> b!130357 (= lt!201180 (arrayBitRangesEqSymmetric!0 (buf!3086 thiss!1634) (buf!3086 (_2!5888 lt!200663)) lt!201175 lt!201171))))

(assert (=> b!130357 (arrayBitRangesEq!0 (buf!3086 (_2!5888 lt!200663)) (buf!3086 thiss!1634) lt!201175 lt!201171)))

(declare-fun b!130358 () Bool)

(declare-fun res!108044 () Bool)

(assert (=> b!130358 (=> (not res!108044) (not e!86390))))

(assert (=> b!130358 (= res!108044 (isPrefixOf!0 (_1!5889 lt!201169) thiss!1634))))

(declare-fun b!130359 () Bool)

(declare-fun Unit!8072 () Unit!8061)

(assert (=> b!130359 (= e!86389 Unit!8072)))

(declare-fun b!130360 () Bool)

(declare-fun res!108042 () Bool)

(assert (=> b!130360 (=> (not res!108042) (not e!86390))))

(assert (=> b!130360 (= res!108042 (isPrefixOf!0 (_2!5889 lt!201169) (_2!5888 lt!200663)))))

(assert (= (and d!41610 c!7550) b!130357))

(assert (= (and d!41610 (not c!7550)) b!130359))

(assert (= (and d!41610 res!108043) b!130358))

(assert (= (and b!130358 res!108044) b!130360))

(assert (= (and b!130360 res!108042) b!130356))

(assert (=> b!130357 m!196205))

(declare-fun m!196583 () Bool)

(assert (=> b!130357 m!196583))

(declare-fun m!196585 () Bool)

(assert (=> b!130357 m!196585))

(declare-fun m!196587 () Bool)

(assert (=> b!130356 m!196587))

(assert (=> b!130356 m!196171))

(assert (=> b!130356 m!196205))

(declare-fun m!196589 () Bool)

(assert (=> b!130360 m!196589))

(declare-fun m!196591 () Bool)

(assert (=> b!130358 m!196591))

(declare-fun m!196593 () Bool)

(assert (=> d!41610 m!196593))

(declare-fun m!196595 () Bool)

(assert (=> d!41610 m!196595))

(declare-fun m!196597 () Bool)

(assert (=> d!41610 m!196597))

(declare-fun m!196599 () Bool)

(assert (=> d!41610 m!196599))

(declare-fun m!196601 () Bool)

(assert (=> d!41610 m!196601))

(assert (=> d!41610 m!196195))

(declare-fun m!196603 () Bool)

(assert (=> d!41610 m!196603))

(declare-fun m!196605 () Bool)

(assert (=> d!41610 m!196605))

(declare-fun m!196607 () Bool)

(assert (=> d!41610 m!196607))

(declare-fun m!196609 () Bool)

(assert (=> d!41610 m!196609))

(declare-fun m!196611 () Bool)

(assert (=> d!41610 m!196611))

(assert (=> b!130109 d!41610))

(declare-fun lt!201194 () (_ BitVec 64))

(declare-fun b!130361 () Bool)

(declare-fun lt!201190 () (_ BitVec 64))

(declare-fun e!86392 () Bool)

(declare-fun lt!201189 () tuple2!11184)

(assert (=> b!130361 (= e!86392 (= (_1!5889 lt!201189) (withMovedBitIndex!0 (_2!5889 lt!201189) (bvsub lt!201194 lt!201190))))))

(assert (=> b!130361 (or (= (bvand lt!201194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201194 lt!201190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130361 (= lt!201190 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200663))) (currentByte!5847 (_2!5888 lt!200663)) (currentBit!5842 (_2!5888 lt!200663))))))

(assert (=> b!130361 (= lt!201194 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))))))

(declare-fun d!41630 () Bool)

(assert (=> d!41630 e!86392))

(declare-fun res!108046 () Bool)

(assert (=> d!41630 (=> (not res!108046) (not e!86392))))

(assert (=> d!41630 (= res!108046 (isPrefixOf!0 (_1!5889 lt!201189) (_2!5889 lt!201189)))))

(declare-fun lt!201192 () BitStream!4720)

(assert (=> d!41630 (= lt!201189 (tuple2!11185 lt!201192 (_2!5888 lt!200663)))))

(declare-fun lt!201203 () Unit!8061)

(declare-fun lt!201185 () Unit!8061)

(assert (=> d!41630 (= lt!201203 lt!201185)))

(assert (=> d!41630 (isPrefixOf!0 lt!201192 (_2!5888 lt!200663))))

(assert (=> d!41630 (= lt!201185 (lemmaIsPrefixTransitive!0 lt!201192 (_2!5888 lt!200663) (_2!5888 lt!200663)))))

(declare-fun lt!201198 () Unit!8061)

(declare-fun lt!201188 () Unit!8061)

(assert (=> d!41630 (= lt!201198 lt!201188)))

(assert (=> d!41630 (isPrefixOf!0 lt!201192 (_2!5888 lt!200663))))

(assert (=> d!41630 (= lt!201188 (lemmaIsPrefixTransitive!0 lt!201192 (_2!5888 lt!200673) (_2!5888 lt!200663)))))

(declare-fun lt!201199 () Unit!8061)

(declare-fun e!86391 () Unit!8061)

(assert (=> d!41630 (= lt!201199 e!86391)))

(declare-fun c!7551 () Bool)

(assert (=> d!41630 (= c!7551 (not (= (size!2728 (buf!3086 (_2!5888 lt!200673))) #b00000000000000000000000000000000)))))

(declare-fun lt!201193 () Unit!8061)

(declare-fun lt!201186 () Unit!8061)

(assert (=> d!41630 (= lt!201193 lt!201186)))

(assert (=> d!41630 (isPrefixOf!0 (_2!5888 lt!200663) (_2!5888 lt!200663))))

(assert (=> d!41630 (= lt!201186 (lemmaIsPrefixRefl!0 (_2!5888 lt!200663)))))

(declare-fun lt!201187 () Unit!8061)

(declare-fun lt!201184 () Unit!8061)

(assert (=> d!41630 (= lt!201187 lt!201184)))

(assert (=> d!41630 (= lt!201184 (lemmaIsPrefixRefl!0 (_2!5888 lt!200663)))))

(declare-fun lt!201197 () Unit!8061)

(declare-fun lt!201201 () Unit!8061)

(assert (=> d!41630 (= lt!201197 lt!201201)))

(assert (=> d!41630 (isPrefixOf!0 lt!201192 lt!201192)))

(assert (=> d!41630 (= lt!201201 (lemmaIsPrefixRefl!0 lt!201192))))

(declare-fun lt!201202 () Unit!8061)

(declare-fun lt!201196 () Unit!8061)

(assert (=> d!41630 (= lt!201202 lt!201196)))

(assert (=> d!41630 (isPrefixOf!0 (_2!5888 lt!200673) (_2!5888 lt!200673))))

(assert (=> d!41630 (= lt!201196 (lemmaIsPrefixRefl!0 (_2!5888 lt!200673)))))

(assert (=> d!41630 (= lt!201192 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))))))

(assert (=> d!41630 (isPrefixOf!0 (_2!5888 lt!200673) (_2!5888 lt!200663))))

(assert (=> d!41630 (= (reader!0 (_2!5888 lt!200673) (_2!5888 lt!200663)) lt!201189)))

(declare-fun b!130362 () Bool)

(declare-fun lt!201200 () Unit!8061)

(assert (=> b!130362 (= e!86391 lt!201200)))

(declare-fun lt!201195 () (_ BitVec 64))

(assert (=> b!130362 (= lt!201195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201191 () (_ BitVec 64))

(assert (=> b!130362 (= lt!201191 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))))))

(assert (=> b!130362 (= lt!201200 (arrayBitRangesEqSymmetric!0 (buf!3086 (_2!5888 lt!200673)) (buf!3086 (_2!5888 lt!200663)) lt!201195 lt!201191))))

(assert (=> b!130362 (arrayBitRangesEq!0 (buf!3086 (_2!5888 lt!200663)) (buf!3086 (_2!5888 lt!200673)) lt!201195 lt!201191)))

(declare-fun b!130363 () Bool)

(declare-fun res!108047 () Bool)

(assert (=> b!130363 (=> (not res!108047) (not e!86392))))

(assert (=> b!130363 (= res!108047 (isPrefixOf!0 (_1!5889 lt!201189) (_2!5888 lt!200673)))))

(declare-fun b!130364 () Bool)

(declare-fun Unit!8073 () Unit!8061)

(assert (=> b!130364 (= e!86391 Unit!8073)))

(declare-fun b!130365 () Bool)

(declare-fun res!108045 () Bool)

(assert (=> b!130365 (=> (not res!108045) (not e!86392))))

(assert (=> b!130365 (= res!108045 (isPrefixOf!0 (_2!5889 lt!201189) (_2!5888 lt!200663)))))

(assert (= (and d!41630 c!7551) b!130362))

(assert (= (and d!41630 (not c!7551)) b!130364))

(assert (= (and d!41630 res!108046) b!130363))

(assert (= (and b!130363 res!108047) b!130365))

(assert (= (and b!130365 res!108045) b!130361))

(assert (=> b!130362 m!196173))

(declare-fun m!196613 () Bool)

(assert (=> b!130362 m!196613))

(declare-fun m!196615 () Bool)

(assert (=> b!130362 m!196615))

(declare-fun m!196617 () Bool)

(assert (=> b!130361 m!196617))

(assert (=> b!130361 m!196171))

(assert (=> b!130361 m!196173))

(declare-fun m!196619 () Bool)

(assert (=> b!130365 m!196619))

(declare-fun m!196621 () Bool)

(assert (=> b!130363 m!196621))

(assert (=> d!41630 m!196593))

(declare-fun m!196623 () Bool)

(assert (=> d!41630 m!196623))

(declare-fun m!196625 () Bool)

(assert (=> d!41630 m!196625))

(declare-fun m!196627 () Bool)

(assert (=> d!41630 m!196627))

(declare-fun m!196629 () Bool)

(assert (=> d!41630 m!196629))

(assert (=> d!41630 m!196175))

(assert (=> d!41630 m!196603))

(declare-fun m!196631 () Bool)

(assert (=> d!41630 m!196631))

(declare-fun m!196633 () Bool)

(assert (=> d!41630 m!196633))

(declare-fun m!196635 () Bool)

(assert (=> d!41630 m!196635))

(declare-fun m!196637 () Bool)

(assert (=> d!41630 m!196637))

(assert (=> b!130109 d!41630))

(declare-fun d!41632 () Bool)

(declare-fun e!86395 () Bool)

(assert (=> d!41632 e!86395))

(declare-fun res!108056 () Bool)

(assert (=> d!41632 (=> (not res!108056) (not e!86395))))

(declare-fun lt!201218 () tuple2!11182)

(assert (=> d!41632 (= res!108056 (= (size!2728 (buf!3086 thiss!1634)) (size!2728 (buf!3086 (_2!5888 lt!201218)))))))

(declare-fun choose!6 (BitStream!4720 (_ BitVec 8)) tuple2!11182)

(assert (=> d!41632 (= lt!201218 (choose!6 thiss!1634 (select (arr!3345 arr!237) from!447)))))

(assert (=> d!41632 (validate_offset_byte!0 ((_ sign_extend 32) (size!2728 (buf!3086 thiss!1634))) ((_ sign_extend 32) (currentByte!5847 thiss!1634)) ((_ sign_extend 32) (currentBit!5842 thiss!1634)))))

(assert (=> d!41632 (= (appendByte!0 thiss!1634 (select (arr!3345 arr!237) from!447)) lt!201218)))

(declare-fun b!130372 () Bool)

(declare-fun res!108054 () Bool)

(assert (=> b!130372 (=> (not res!108054) (not e!86395))))

(declare-fun lt!201216 () (_ BitVec 64))

(declare-fun lt!201214 () (_ BitVec 64))

(assert (=> b!130372 (= res!108054 (= (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!201218))) (currentByte!5847 (_2!5888 lt!201218)) (currentBit!5842 (_2!5888 lt!201218))) (bvadd lt!201214 lt!201216)))))

(assert (=> b!130372 (or (not (= (bvand lt!201214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201216 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!201214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!201214 lt!201216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130372 (= lt!201216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!130372 (= lt!201214 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(declare-fun b!130373 () Bool)

(declare-fun res!108055 () Bool)

(assert (=> b!130373 (=> (not res!108055) (not e!86395))))

(assert (=> b!130373 (= res!108055 (isPrefixOf!0 thiss!1634 (_2!5888 lt!201218)))))

(declare-fun b!130374 () Bool)

(declare-fun lt!201215 () tuple2!11186)

(declare-fun lt!201217 () tuple2!11184)

(assert (=> b!130374 (= e!86395 (and (= (_2!5890 lt!201215) (select (arr!3345 arr!237) from!447)) (= (_1!5890 lt!201215) (_2!5889 lt!201217))))))

(assert (=> b!130374 (= lt!201215 (readBytePure!0 (_1!5889 lt!201217)))))

(assert (=> b!130374 (= lt!201217 (reader!0 thiss!1634 (_2!5888 lt!201218)))))

(assert (= (and d!41632 res!108056) b!130372))

(assert (= (and b!130372 res!108054) b!130373))

(assert (= (and b!130373 res!108055) b!130374))

(assert (=> d!41632 m!196157))

(declare-fun m!196639 () Bool)

(assert (=> d!41632 m!196639))

(declare-fun m!196641 () Bool)

(assert (=> d!41632 m!196641))

(declare-fun m!196643 () Bool)

(assert (=> b!130372 m!196643))

(assert (=> b!130372 m!196205))

(declare-fun m!196645 () Bool)

(assert (=> b!130373 m!196645))

(declare-fun m!196647 () Bool)

(assert (=> b!130374 m!196647))

(declare-fun m!196649 () Bool)

(assert (=> b!130374 m!196649))

(assert (=> b!130109 d!41632))

(declare-fun d!41634 () Bool)

(assert (=> d!41634 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5889 lt!200672)))) ((_ sign_extend 32) (currentByte!5847 (_1!5889 lt!200672))) ((_ sign_extend 32) (currentBit!5842 (_1!5889 lt!200672)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_1!5889 lt!200672)))) ((_ sign_extend 32) (currentByte!5847 (_1!5889 lt!200672))) ((_ sign_extend 32) (currentBit!5842 (_1!5889 lt!200672)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10158 () Bool)

(assert (= bs!10158 d!41634))

(declare-fun m!196651 () Bool)

(assert (=> bs!10158 m!196651))

(assert (=> b!130109 d!41634))

(declare-fun b!130434 () Bool)

(declare-fun res!108116 () Bool)

(declare-fun e!86430 () Bool)

(assert (=> b!130434 (=> (not res!108116) (not e!86430))))

(declare-fun lt!201344 () (_ BitVec 64))

(declare-fun lt!201339 () (_ BitVec 64))

(declare-fun lt!201338 () tuple2!11182)

(assert (=> b!130434 (= res!108116 (= (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!201338))) (currentByte!5847 (_2!5888 lt!201338)) (currentBit!5842 (_2!5888 lt!201338))) (bvadd lt!201344 lt!201339)))))

(assert (=> b!130434 (or (not (= (bvand lt!201344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201339 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!201344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!201344 lt!201339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!201343 () (_ BitVec 64))

(assert (=> b!130434 (= lt!201339 (bvmul lt!201343 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!130434 (or (= lt!201343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201343)))))

(assert (=> b!130434 (= lt!201343 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!130434 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!130434 (= lt!201344 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))))))

(declare-fun d!41636 () Bool)

(assert (=> d!41636 e!86430))

(declare-fun res!108115 () Bool)

(assert (=> d!41636 (=> (not res!108115) (not e!86430))))

(assert (=> d!41636 (= res!108115 (= (size!2728 (buf!3086 (_2!5888 lt!200673))) (size!2728 (buf!3086 (_2!5888 lt!201338)))))))

(declare-fun choose!64 (BitStream!4720 array!6025 (_ BitVec 32) (_ BitVec 32)) tuple2!11182)

(assert (=> d!41636 (= lt!201338 (choose!64 (_2!5888 lt!200673) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41636 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2728 arr!237)))))

(assert (=> d!41636 (= (appendByteArrayLoop!0 (_2!5888 lt!200673) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!201338)))

(declare-fun b!130435 () Bool)

(declare-fun e!86431 () Bool)

(assert (=> b!130435 (= e!86430 e!86431)))

(declare-fun res!108118 () Bool)

(assert (=> b!130435 (=> (not res!108118) (not e!86431))))

(declare-fun lt!201340 () tuple2!11188)

(declare-fun lt!201341 () tuple2!11184)

(assert (=> b!130435 (= res!108118 (and (= (size!2728 (_2!5891 lt!201340)) (size!2728 arr!237)) (= (_1!5891 lt!201340) (_2!5889 lt!201341))))))

(assert (=> b!130435 (= lt!201340 (readByteArrayLoopPure!0 (_1!5889 lt!201341) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!201342 () Unit!8061)

(declare-fun lt!201346 () Unit!8061)

(assert (=> b!130435 (= lt!201342 lt!201346)))

(declare-fun lt!201345 () (_ BitVec 64))

(assert (=> b!130435 (validate_offset_bits!1 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!201338)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) lt!201345)))

(assert (=> b!130435 (= lt!201346 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5888 lt!200673) (buf!3086 (_2!5888 lt!201338)) lt!201345))))

(declare-fun e!86429 () Bool)

(assert (=> b!130435 e!86429))

(declare-fun res!108114 () Bool)

(assert (=> b!130435 (=> (not res!108114) (not e!86429))))

(assert (=> b!130435 (= res!108114 (and (= (size!2728 (buf!3086 (_2!5888 lt!200673))) (size!2728 (buf!3086 (_2!5888 lt!201338)))) (bvsge lt!201345 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130435 (= lt!201345 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!130435 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!130435 (= lt!201341 (reader!0 (_2!5888 lt!200673) (_2!5888 lt!201338)))))

(declare-fun b!130436 () Bool)

(declare-fun res!108117 () Bool)

(assert (=> b!130436 (=> (not res!108117) (not e!86430))))

(assert (=> b!130436 (= res!108117 (isPrefixOf!0 (_2!5888 lt!200673) (_2!5888 lt!201338)))))

(declare-fun b!130437 () Bool)

(assert (=> b!130437 (= e!86429 (validate_offset_bits!1 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200673)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) lt!201345))))

(declare-fun b!130438 () Bool)

(assert (=> b!130438 (= e!86431 (arrayRangesEq!131 arr!237 (_2!5891 lt!201340) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!41636 res!108115) b!130434))

(assert (= (and b!130434 res!108116) b!130436))

(assert (= (and b!130436 res!108117) b!130435))

(assert (= (and b!130435 res!108114) b!130437))

(assert (= (and b!130435 res!108118) b!130438))

(declare-fun m!196733 () Bool)

(assert (=> d!41636 m!196733))

(declare-fun m!196735 () Bool)

(assert (=> b!130436 m!196735))

(declare-fun m!196737 () Bool)

(assert (=> b!130434 m!196737))

(assert (=> b!130434 m!196173))

(declare-fun m!196739 () Bool)

(assert (=> b!130438 m!196739))

(declare-fun m!196741 () Bool)

(assert (=> b!130437 m!196741))

(declare-fun m!196743 () Bool)

(assert (=> b!130435 m!196743))

(declare-fun m!196745 () Bool)

(assert (=> b!130435 m!196745))

(declare-fun m!196747 () Bool)

(assert (=> b!130435 m!196747))

(declare-fun m!196749 () Bool)

(assert (=> b!130435 m!196749))

(assert (=> b!130109 d!41636))

(declare-fun d!41658 () Bool)

(declare-fun res!108121 () Bool)

(declare-fun e!86432 () Bool)

(assert (=> d!41658 (=> (not res!108121) (not e!86432))))

(assert (=> d!41658 (= res!108121 (= (size!2728 (buf!3086 (_2!5888 lt!200673))) (size!2728 (buf!3086 (_2!5888 lt!200663)))))))

(assert (=> d!41658 (= (isPrefixOf!0 (_2!5888 lt!200673) (_2!5888 lt!200663)) e!86432)))

(declare-fun b!130439 () Bool)

(declare-fun res!108119 () Bool)

(assert (=> b!130439 (=> (not res!108119) (not e!86432))))

(assert (=> b!130439 (= res!108119 (bvsle (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))) (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200663))) (currentByte!5847 (_2!5888 lt!200663)) (currentBit!5842 (_2!5888 lt!200663)))))))

(declare-fun b!130440 () Bool)

(declare-fun e!86433 () Bool)

(assert (=> b!130440 (= e!86432 e!86433)))

(declare-fun res!108120 () Bool)

(assert (=> b!130440 (=> res!108120 e!86433)))

(assert (=> b!130440 (= res!108120 (= (size!2728 (buf!3086 (_2!5888 lt!200673))) #b00000000000000000000000000000000))))

(declare-fun b!130441 () Bool)

(assert (=> b!130441 (= e!86433 (arrayBitRangesEq!0 (buf!3086 (_2!5888 lt!200673)) (buf!3086 (_2!5888 lt!200663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673)))))))

(assert (= (and d!41658 res!108121) b!130439))

(assert (= (and b!130439 res!108119) b!130440))

(assert (= (and b!130440 (not res!108120)) b!130441))

(assert (=> b!130439 m!196173))

(assert (=> b!130439 m!196171))

(assert (=> b!130441 m!196173))

(assert (=> b!130441 m!196173))

(declare-fun m!196751 () Bool)

(assert (=> b!130441 m!196751))

(assert (=> b!130108 d!41658))

(declare-fun d!41661 () Bool)

(declare-fun lt!201347 () tuple2!11208)

(assert (=> d!41661 (= lt!201347 (readByte!0 (_1!5889 lt!200669)))))

(assert (=> d!41661 (= (readBytePure!0 (_1!5889 lt!200669)) (tuple2!11187 (_2!5902 lt!201347) (_1!5902 lt!201347)))))

(declare-fun bs!10162 () Bool)

(assert (= bs!10162 d!41661))

(declare-fun m!196753 () Bool)

(assert (=> bs!10162 m!196753))

(assert (=> b!130110 d!41661))

(declare-fun lt!201354 () (_ BitVec 64))

(declare-fun lt!201353 () tuple2!11184)

(declare-fun lt!201358 () (_ BitVec 64))

(declare-fun e!86435 () Bool)

(declare-fun b!130442 () Bool)

(assert (=> b!130442 (= e!86435 (= (_1!5889 lt!201353) (withMovedBitIndex!0 (_2!5889 lt!201353) (bvsub lt!201358 lt!201354))))))

(assert (=> b!130442 (or (= (bvand lt!201358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201358 lt!201354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130442 (= lt!201354 (bitIndex!0 (size!2728 (buf!3086 (_2!5888 lt!200673))) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673))))))

(assert (=> b!130442 (= lt!201358 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(declare-fun d!41663 () Bool)

(assert (=> d!41663 e!86435))

(declare-fun res!108123 () Bool)

(assert (=> d!41663 (=> (not res!108123) (not e!86435))))

(assert (=> d!41663 (= res!108123 (isPrefixOf!0 (_1!5889 lt!201353) (_2!5889 lt!201353)))))

(declare-fun lt!201356 () BitStream!4720)

(assert (=> d!41663 (= lt!201353 (tuple2!11185 lt!201356 (_2!5888 lt!200673)))))

(declare-fun lt!201367 () Unit!8061)

(declare-fun lt!201349 () Unit!8061)

(assert (=> d!41663 (= lt!201367 lt!201349)))

(assert (=> d!41663 (isPrefixOf!0 lt!201356 (_2!5888 lt!200673))))

(assert (=> d!41663 (= lt!201349 (lemmaIsPrefixTransitive!0 lt!201356 (_2!5888 lt!200673) (_2!5888 lt!200673)))))

(declare-fun lt!201362 () Unit!8061)

(declare-fun lt!201352 () Unit!8061)

(assert (=> d!41663 (= lt!201362 lt!201352)))

(assert (=> d!41663 (isPrefixOf!0 lt!201356 (_2!5888 lt!200673))))

(assert (=> d!41663 (= lt!201352 (lemmaIsPrefixTransitive!0 lt!201356 thiss!1634 (_2!5888 lt!200673)))))

(declare-fun lt!201363 () Unit!8061)

(declare-fun e!86434 () Unit!8061)

(assert (=> d!41663 (= lt!201363 e!86434)))

(declare-fun c!7553 () Bool)

(assert (=> d!41663 (= c!7553 (not (= (size!2728 (buf!3086 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!201357 () Unit!8061)

(declare-fun lt!201350 () Unit!8061)

(assert (=> d!41663 (= lt!201357 lt!201350)))

(assert (=> d!41663 (isPrefixOf!0 (_2!5888 lt!200673) (_2!5888 lt!200673))))

(assert (=> d!41663 (= lt!201350 (lemmaIsPrefixRefl!0 (_2!5888 lt!200673)))))

(declare-fun lt!201351 () Unit!8061)

(declare-fun lt!201348 () Unit!8061)

(assert (=> d!41663 (= lt!201351 lt!201348)))

(assert (=> d!41663 (= lt!201348 (lemmaIsPrefixRefl!0 (_2!5888 lt!200673)))))

(declare-fun lt!201361 () Unit!8061)

(declare-fun lt!201365 () Unit!8061)

(assert (=> d!41663 (= lt!201361 lt!201365)))

(assert (=> d!41663 (isPrefixOf!0 lt!201356 lt!201356)))

(assert (=> d!41663 (= lt!201365 (lemmaIsPrefixRefl!0 lt!201356))))

(declare-fun lt!201366 () Unit!8061)

(declare-fun lt!201360 () Unit!8061)

(assert (=> d!41663 (= lt!201366 lt!201360)))

(assert (=> d!41663 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41663 (= lt!201360 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41663 (= lt!201356 (BitStream!4721 (buf!3086 (_2!5888 lt!200673)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(assert (=> d!41663 (isPrefixOf!0 thiss!1634 (_2!5888 lt!200673))))

(assert (=> d!41663 (= (reader!0 thiss!1634 (_2!5888 lt!200673)) lt!201353)))

(declare-fun b!130443 () Bool)

(declare-fun lt!201364 () Unit!8061)

(assert (=> b!130443 (= e!86434 lt!201364)))

(declare-fun lt!201359 () (_ BitVec 64))

(assert (=> b!130443 (= lt!201359 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201355 () (_ BitVec 64))

(assert (=> b!130443 (= lt!201355 (bitIndex!0 (size!2728 (buf!3086 thiss!1634)) (currentByte!5847 thiss!1634) (currentBit!5842 thiss!1634)))))

(assert (=> b!130443 (= lt!201364 (arrayBitRangesEqSymmetric!0 (buf!3086 thiss!1634) (buf!3086 (_2!5888 lt!200673)) lt!201359 lt!201355))))

(assert (=> b!130443 (arrayBitRangesEq!0 (buf!3086 (_2!5888 lt!200673)) (buf!3086 thiss!1634) lt!201359 lt!201355)))

(declare-fun b!130444 () Bool)

(declare-fun res!108124 () Bool)

(assert (=> b!130444 (=> (not res!108124) (not e!86435))))

(assert (=> b!130444 (= res!108124 (isPrefixOf!0 (_1!5889 lt!201353) thiss!1634))))

(declare-fun b!130445 () Bool)

(declare-fun Unit!8075 () Unit!8061)

(assert (=> b!130445 (= e!86434 Unit!8075)))

(declare-fun b!130446 () Bool)

(declare-fun res!108122 () Bool)

(assert (=> b!130446 (=> (not res!108122) (not e!86435))))

(assert (=> b!130446 (= res!108122 (isPrefixOf!0 (_2!5889 lt!201353) (_2!5888 lt!200673)))))

(assert (= (and d!41663 c!7553) b!130443))

(assert (= (and d!41663 (not c!7553)) b!130445))

(assert (= (and d!41663 res!108123) b!130444))

(assert (= (and b!130444 res!108124) b!130446))

(assert (= (and b!130446 res!108122) b!130442))

(assert (=> b!130443 m!196205))

(declare-fun m!196755 () Bool)

(assert (=> b!130443 m!196755))

(declare-fun m!196757 () Bool)

(assert (=> b!130443 m!196757))

(declare-fun m!196759 () Bool)

(assert (=> b!130442 m!196759))

(assert (=> b!130442 m!196173))

(assert (=> b!130442 m!196205))

(declare-fun m!196761 () Bool)

(assert (=> b!130446 m!196761))

(declare-fun m!196763 () Bool)

(assert (=> b!130444 m!196763))

(assert (=> d!41663 m!196631))

(declare-fun m!196765 () Bool)

(assert (=> d!41663 m!196765))

(declare-fun m!196767 () Bool)

(assert (=> d!41663 m!196767))

(declare-fun m!196769 () Bool)

(assert (=> d!41663 m!196769))

(assert (=> d!41663 m!196601))

(assert (=> d!41663 m!196167))

(assert (=> d!41663 m!196629))

(assert (=> d!41663 m!196605))

(declare-fun m!196771 () Bool)

(assert (=> d!41663 m!196771))

(declare-fun m!196773 () Bool)

(assert (=> d!41663 m!196773))

(declare-fun m!196775 () Bool)

(assert (=> d!41663 m!196775))

(assert (=> b!130110 d!41663))

(declare-fun d!41665 () Bool)

(declare-datatypes ((tuple3!488 0))(
  ( (tuple3!489 (_1!5905 Unit!8061) (_2!5905 BitStream!4720) (_3!299 array!6025)) )
))
(declare-fun lt!201401 () tuple3!488)

(declare-fun readByteArrayLoop!0 (BitStream!4720 array!6025 (_ BitVec 32) (_ BitVec 32)) tuple3!488)

(assert (=> d!41665 (= lt!201401 (readByteArrayLoop!0 (_1!5889 lt!200665) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41665 (= (readByteArrayLoopPure!0 (_1!5889 lt!200665) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11189 (_2!5905 lt!201401) (_3!299 lt!201401)))))

(declare-fun bs!10165 () Bool)

(assert (= bs!10165 d!41665))

(declare-fun m!196807 () Bool)

(assert (=> bs!10165 m!196807))

(assert (=> b!130111 d!41665))

(declare-fun d!41675 () Bool)

(assert (=> d!41675 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) lt!200660) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673)))) lt!200660))))

(declare-fun bs!10166 () Bool)

(assert (= bs!10166 d!41675))

(declare-fun m!196809 () Bool)

(assert (=> bs!10166 m!196809))

(assert (=> b!130111 d!41675))

(declare-fun d!41679 () Bool)

(assert (=> d!41679 (validate_offset_bits!1 ((_ sign_extend 32) (size!2728 (buf!3086 (_2!5888 lt!200663)))) ((_ sign_extend 32) (currentByte!5847 (_2!5888 lt!200673))) ((_ sign_extend 32) (currentBit!5842 (_2!5888 lt!200673))) lt!200660)))

(declare-fun lt!201404 () Unit!8061)

(declare-fun choose!9 (BitStream!4720 array!6025 (_ BitVec 64) BitStream!4720) Unit!8061)

(assert (=> d!41679 (= lt!201404 (choose!9 (_2!5888 lt!200673) (buf!3086 (_2!5888 lt!200663)) lt!200660 (BitStream!4721 (buf!3086 (_2!5888 lt!200663)) (currentByte!5847 (_2!5888 lt!200673)) (currentBit!5842 (_2!5888 lt!200673)))))))

(assert (=> d!41679 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5888 lt!200673) (buf!3086 (_2!5888 lt!200663)) lt!200660) lt!201404)))

(declare-fun bs!10167 () Bool)

(assert (= bs!10167 d!41679))

(assert (=> bs!10167 m!196151))

(declare-fun m!196811 () Bool)

(assert (=> bs!10167 m!196811))

(assert (=> b!130111 d!41679))

(assert (=> b!130111 d!41630))

(declare-fun d!41681 () Bool)

(declare-fun res!108135 () Bool)

(declare-fun e!86445 () Bool)

(assert (=> d!41681 (=> res!108135 e!86445)))

(assert (=> d!41681 (= res!108135 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41681 (= (arrayRangesEq!131 arr!237 (_2!5891 lt!200664) #b00000000000000000000000000000000 to!404) e!86445)))

(declare-fun b!130459 () Bool)

(declare-fun e!86446 () Bool)

(assert (=> b!130459 (= e!86445 e!86446)))

(declare-fun res!108136 () Bool)

(assert (=> b!130459 (=> (not res!108136) (not e!86446))))

(assert (=> b!130459 (= res!108136 (= (select (arr!3345 arr!237) #b00000000000000000000000000000000) (select (arr!3345 (_2!5891 lt!200664)) #b00000000000000000000000000000000)))))

(declare-fun b!130460 () Bool)

(assert (=> b!130460 (= e!86446 (arrayRangesEq!131 arr!237 (_2!5891 lt!200664) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41681 (not res!108135)) b!130459))

(assert (= (and b!130459 res!108136) b!130460))

(declare-fun m!196815 () Bool)

(assert (=> b!130459 m!196815))

(declare-fun m!196817 () Bool)

(assert (=> b!130459 m!196817))

(declare-fun m!196819 () Bool)

(assert (=> b!130460 m!196819))

(assert (=> b!130112 d!41681))

(push 1)

(assert (not d!41632))

(assert (not d!41608))

(assert (not b!130442))

(assert (not d!41630))

(assert (not d!41594))

(assert (not b!130434))

(assert (not b!130357))

(assert (not b!130441))

(assert (not d!41550))

(assert (not d!41552))

(assert (not d!41634))

(assert (not b!130435))

(assert (not d!41597))

(assert (not b!130361))

(assert (not b!130362))

(assert (not d!41584))

(assert (not b!130356))

(assert (not b!130372))

(assert (not d!41603))

(assert (not b!130374))

(assert (not b!130437))

(assert (not d!41675))

(assert (not b!130301))

(assert (not d!41586))

(assert (not b!130365))

(assert (not b!130304))

(assert (not d!41636))

(assert (not d!41665))

(assert (not b!130460))

(assert (not b!130373))

(assert (not d!41610))

(assert (not d!41661))

(assert (not b!130439))

(assert (not b!130358))

(assert (not d!41590))

(assert (not b!130360))

(assert (not b!130444))

(assert (not d!41601))

(assert (not b!130302))

(assert (not b!130446))

(assert (not b!130363))

(assert (not b!130436))

(assert (not b!130438))

(assert (not d!41564))

(assert (not b!130253))

(assert (not d!41562))

(assert (not d!41576))

(assert (not d!41663))

(assert (not d!41679))

(assert (not b!130251))

(assert (not b!130443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

