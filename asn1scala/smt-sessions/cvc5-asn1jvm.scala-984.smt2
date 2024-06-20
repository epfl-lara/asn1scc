; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27588 () Bool)

(assert start!27588)

(declare-fun b!142042 () Bool)

(declare-fun res!118534 () Bool)

(declare-fun e!94619 () Bool)

(assert (=> b!142042 (=> (not res!118534) (not e!94619))))

(declare-datatypes ((array!6510 0))(
  ( (array!6511 (arr!3660 (Array (_ BitVec 32) (_ BitVec 8))) (size!2947 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5152 0))(
  ( (BitStream!5153 (buf!3371 array!6510) (currentByte!6240 (_ BitVec 32)) (currentBit!6235 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8882 0))(
  ( (Unit!8883) )
))
(declare-datatypes ((tuple2!12598 0))(
  ( (tuple2!12599 (_1!6632 Unit!8882) (_2!6632 BitStream!5152)) )
))
(declare-fun lt!220348 () tuple2!12598)

(declare-fun thiss!1634 () BitStream!5152)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142042 (= res!118534 (= (bitIndex!0 (size!2947 (buf!3371 (_2!6632 lt!220348))) (currentByte!6240 (_2!6632 lt!220348)) (currentBit!6235 (_2!6632 lt!220348))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2947 (buf!3371 thiss!1634)) (currentByte!6240 thiss!1634) (currentBit!6235 thiss!1634)))))))

(declare-fun b!142043 () Bool)

(declare-fun res!118536 () Bool)

(declare-fun e!94615 () Bool)

(assert (=> b!142043 (=> (not res!118536) (not e!94615))))

(declare-fun lt!220351 () tuple2!12598)

(declare-fun isPrefixOf!0 (BitStream!5152 BitStream!5152) Bool)

(assert (=> b!142043 (= res!118536 (isPrefixOf!0 (_2!6632 lt!220348) (_2!6632 lt!220351)))))

(declare-fun b!142044 () Bool)

(declare-fun e!94611 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142044 (= e!94611 (invariant!0 (currentBit!6235 thiss!1634) (currentByte!6240 thiss!1634) (size!2947 (buf!3371 (_2!6632 lt!220348)))))))

(declare-fun b!142045 () Bool)

(declare-fun res!118535 () Bool)

(assert (=> b!142045 (=> (not res!118535) (not e!94619))))

(assert (=> b!142045 (= res!118535 (isPrefixOf!0 thiss!1634 (_2!6632 lt!220348)))))

(declare-fun b!142046 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6510)

(declare-datatypes ((tuple2!12600 0))(
  ( (tuple2!12601 (_1!6633 BitStream!5152) (_2!6633 array!6510)) )
))
(declare-fun lt!220349 () tuple2!12600)

(declare-fun e!94618 () Bool)

(declare-fun arrayRangesEq!263 (array!6510 array!6510 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142046 (= e!94618 (not (arrayRangesEq!263 arr!237 (_2!6633 lt!220349) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142047 () Bool)

(declare-fun res!118530 () Bool)

(declare-fun e!94620 () Bool)

(assert (=> b!142047 (=> (not res!118530) (not e!94620))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!142047 (= res!118530 (bvslt from!447 to!404))))

(declare-fun b!142048 () Bool)

(declare-fun res!118529 () Bool)

(assert (=> b!142048 (=> (not res!118529) (not e!94620))))

(assert (=> b!142048 (= res!118529 (invariant!0 (currentBit!6235 thiss!1634) (currentByte!6240 thiss!1634) (size!2947 (buf!3371 thiss!1634))))))

(declare-fun b!142049 () Bool)

(declare-fun e!94612 () Bool)

(declare-fun array_inv!2736 (array!6510) Bool)

(assert (=> b!142049 (= e!94612 (array_inv!2736 (buf!3371 thiss!1634)))))

(declare-fun b!142050 () Bool)

(declare-fun res!118538 () Bool)

(assert (=> b!142050 (=> (not res!118538) (not e!94620))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142050 (= res!118538 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2947 (buf!3371 thiss!1634))) ((_ sign_extend 32) (currentByte!6240 thiss!1634)) ((_ sign_extend 32) (currentBit!6235 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142051 () Bool)

(declare-fun e!94616 () Bool)

(assert (=> b!142051 (= e!94620 (not e!94616))))

(declare-fun res!118537 () Bool)

(assert (=> b!142051 (=> res!118537 e!94616)))

(declare-fun lt!220352 () (_ BitVec 64))

(assert (=> b!142051 (= res!118537 (bvsgt lt!220352 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2947 (buf!3371 (_2!6632 lt!220348)))))))))

(assert (=> b!142051 (= lt!220352 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2947 (buf!3371 (_2!6632 lt!220348))) (currentByte!6240 thiss!1634) (currentBit!6235 thiss!1634))))))

(assert (=> b!142051 e!94611))

(declare-fun res!118532 () Bool)

(assert (=> b!142051 (=> (not res!118532) (not e!94611))))

(assert (=> b!142051 (= res!118532 (isPrefixOf!0 thiss!1634 (_2!6632 lt!220351)))))

(declare-fun lt!220355 () Unit!8882)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5152 BitStream!5152 BitStream!5152) Unit!8882)

(assert (=> b!142051 (= lt!220355 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6632 lt!220348) (_2!6632 lt!220351)))))

(declare-fun e!94613 () Bool)

(assert (=> b!142051 e!94613))

(declare-fun res!118540 () Bool)

(assert (=> b!142051 (=> (not res!118540) (not e!94613))))

(assert (=> b!142051 (= res!118540 (= (size!2947 (buf!3371 (_2!6632 lt!220348))) (size!2947 (buf!3371 (_2!6632 lt!220351)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5152 array!6510 (_ BitVec 32) (_ BitVec 32)) tuple2!12598)

(assert (=> b!142051 (= lt!220351 (appendByteArrayLoop!0 (_2!6632 lt!220348) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!142051 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2947 (buf!3371 (_2!6632 lt!220348)))) ((_ sign_extend 32) (currentByte!6240 (_2!6632 lt!220348))) ((_ sign_extend 32) (currentBit!6235 (_2!6632 lt!220348))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!220356 () Unit!8882)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5152 BitStream!5152 (_ BitVec 64) (_ BitVec 32)) Unit!8882)

(assert (=> b!142051 (= lt!220356 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6632 lt!220348) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142051 e!94619))

(declare-fun res!118528 () Bool)

(assert (=> b!142051 (=> (not res!118528) (not e!94619))))

(assert (=> b!142051 (= res!118528 (= (size!2947 (buf!3371 thiss!1634)) (size!2947 (buf!3371 (_2!6632 lt!220348)))))))

(declare-fun appendByte!0 (BitStream!5152 (_ BitVec 8)) tuple2!12598)

(assert (=> b!142051 (= lt!220348 (appendByte!0 thiss!1634 (select (arr!3660 arr!237) from!447)))))

(declare-fun b!142052 () Bool)

(assert (=> b!142052 (= e!94615 (not e!94618))))

(declare-fun res!118539 () Bool)

(assert (=> b!142052 (=> res!118539 e!94618)))

(declare-datatypes ((tuple2!12602 0))(
  ( (tuple2!12603 (_1!6634 BitStream!5152) (_2!6634 BitStream!5152)) )
))
(declare-fun lt!220357 () tuple2!12602)

(assert (=> b!142052 (= res!118539 (or (not (= (size!2947 (_2!6633 lt!220349)) (size!2947 arr!237))) (not (= (_1!6633 lt!220349) (_2!6634 lt!220357)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5152 array!6510 (_ BitVec 32) (_ BitVec 32)) tuple2!12600)

(assert (=> b!142052 (= lt!220349 (readByteArrayLoopPure!0 (_1!6634 lt!220357) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220358 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142052 (validate_offset_bits!1 ((_ sign_extend 32) (size!2947 (buf!3371 (_2!6632 lt!220351)))) ((_ sign_extend 32) (currentByte!6240 (_2!6632 lt!220348))) ((_ sign_extend 32) (currentBit!6235 (_2!6632 lt!220348))) lt!220358)))

(declare-fun lt!220354 () Unit!8882)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5152 array!6510 (_ BitVec 64)) Unit!8882)

(assert (=> b!142052 (= lt!220354 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6632 lt!220348) (buf!3371 (_2!6632 lt!220351)) lt!220358))))

(declare-fun reader!0 (BitStream!5152 BitStream!5152) tuple2!12602)

(assert (=> b!142052 (= lt!220357 (reader!0 (_2!6632 lt!220348) (_2!6632 lt!220351)))))

(declare-fun res!118533 () Bool)

(assert (=> start!27588 (=> (not res!118533) (not e!94620))))

(assert (=> start!27588 (= res!118533 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2947 arr!237))))))

(assert (=> start!27588 e!94620))

(assert (=> start!27588 true))

(assert (=> start!27588 (array_inv!2736 arr!237)))

(declare-fun inv!12 (BitStream!5152) Bool)

(assert (=> start!27588 (and (inv!12 thiss!1634) e!94612)))

(declare-fun b!142053 () Bool)

(assert (=> b!142053 (= e!94613 e!94615)))

(declare-fun res!118531 () Bool)

(assert (=> b!142053 (=> (not res!118531) (not e!94615))))

(assert (=> b!142053 (= res!118531 (= (bitIndex!0 (size!2947 (buf!3371 (_2!6632 lt!220351))) (currentByte!6240 (_2!6632 lt!220351)) (currentBit!6235 (_2!6632 lt!220351))) (bvadd (bitIndex!0 (size!2947 (buf!3371 (_2!6632 lt!220348))) (currentByte!6240 (_2!6632 lt!220348)) (currentBit!6235 (_2!6632 lt!220348))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!220358))))))

(assert (=> b!142053 (= lt!220358 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!220350 () tuple2!12602)

(declare-datatypes ((tuple2!12604 0))(
  ( (tuple2!12605 (_1!6635 BitStream!5152) (_2!6635 (_ BitVec 8))) )
))
(declare-fun lt!220353 () tuple2!12604)

(declare-fun b!142054 () Bool)

(assert (=> b!142054 (= e!94619 (and (= (_2!6635 lt!220353) (select (arr!3660 arr!237) from!447)) (= (_1!6635 lt!220353) (_2!6634 lt!220350))))))

(declare-fun readBytePure!0 (BitStream!5152) tuple2!12604)

(assert (=> b!142054 (= lt!220353 (readBytePure!0 (_1!6634 lt!220350)))))

(assert (=> b!142054 (= lt!220350 (reader!0 thiss!1634 (_2!6632 lt!220348)))))

(declare-fun b!142055 () Bool)

(assert (=> b!142055 (= e!94616 (bvsle lt!220352 (bitIndex!0 (size!2947 (buf!3371 (_2!6632 lt!220351))) (currentByte!6240 (_2!6632 lt!220351)) (currentBit!6235 (_2!6632 lt!220351)))))))

(assert (= (and start!27588 res!118533) b!142050))

(assert (= (and b!142050 res!118538) b!142047))

(assert (= (and b!142047 res!118530) b!142048))

(assert (= (and b!142048 res!118529) b!142051))

(assert (= (and b!142051 res!118528) b!142042))

(assert (= (and b!142042 res!118534) b!142045))

(assert (= (and b!142045 res!118535) b!142054))

(assert (= (and b!142051 res!118540) b!142053))

(assert (= (and b!142053 res!118531) b!142043))

(assert (= (and b!142043 res!118536) b!142052))

(assert (= (and b!142052 (not res!118539)) b!142046))

(assert (= (and b!142051 res!118532) b!142044))

(assert (= (and b!142051 (not res!118537)) b!142055))

(assert (= start!27588 b!142049))

(declare-fun m!218159 () Bool)

(assert (=> b!142053 m!218159))

(declare-fun m!218161 () Bool)

(assert (=> b!142053 m!218161))

(declare-fun m!218163 () Bool)

(assert (=> b!142045 m!218163))

(declare-fun m!218165 () Bool)

(assert (=> start!27588 m!218165))

(declare-fun m!218167 () Bool)

(assert (=> start!27588 m!218167))

(declare-fun m!218169 () Bool)

(assert (=> b!142054 m!218169))

(declare-fun m!218171 () Bool)

(assert (=> b!142054 m!218171))

(declare-fun m!218173 () Bool)

(assert (=> b!142054 m!218173))

(assert (=> b!142055 m!218159))

(declare-fun m!218175 () Bool)

(assert (=> b!142044 m!218175))

(declare-fun m!218177 () Bool)

(assert (=> b!142043 m!218177))

(declare-fun m!218179 () Bool)

(assert (=> b!142049 m!218179))

(declare-fun m!218181 () Bool)

(assert (=> b!142048 m!218181))

(assert (=> b!142042 m!218161))

(declare-fun m!218183 () Bool)

(assert (=> b!142042 m!218183))

(declare-fun m!218185 () Bool)

(assert (=> b!142046 m!218185))

(declare-fun m!218187 () Bool)

(assert (=> b!142052 m!218187))

(declare-fun m!218189 () Bool)

(assert (=> b!142052 m!218189))

(declare-fun m!218191 () Bool)

(assert (=> b!142052 m!218191))

(declare-fun m!218193 () Bool)

(assert (=> b!142052 m!218193))

(declare-fun m!218195 () Bool)

(assert (=> b!142051 m!218195))

(declare-fun m!218197 () Bool)

(assert (=> b!142051 m!218197))

(declare-fun m!218199 () Bool)

(assert (=> b!142051 m!218199))

(declare-fun m!218201 () Bool)

(assert (=> b!142051 m!218201))

(assert (=> b!142051 m!218169))

(declare-fun m!218203 () Bool)

(assert (=> b!142051 m!218203))

(assert (=> b!142051 m!218169))

(declare-fun m!218205 () Bool)

(assert (=> b!142051 m!218205))

(declare-fun m!218207 () Bool)

(assert (=> b!142051 m!218207))

(declare-fun m!218209 () Bool)

(assert (=> b!142050 m!218209))

(push 1)

(assert (not b!142055))

(assert (not b!142051))

(assert (not b!142044))

(assert (not b!142043))

(assert (not b!142048))

(assert (not b!142050))

(assert (not b!142042))

(assert (not b!142046))

(assert (not b!142054))

(assert (not b!142053))

(assert (not b!142052))

(assert (not b!142045))

(assert (not b!142049))

(assert (not start!27588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

