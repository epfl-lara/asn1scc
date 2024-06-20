; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27980 () Bool)

(assert start!27980)

(declare-fun res!120609 () Bool)

(declare-fun e!96174 () Bool)

(assert (=> start!27980 (=> (not res!120609) (not e!96174))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6572 0))(
  ( (array!6573 (arr!3707 (Array (_ BitVec 32) (_ BitVec 8))) (size!2974 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6572)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27980 (= res!120609 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2974 arr!237))))))

(assert (=> start!27980 e!96174))

(assert (=> start!27980 true))

(declare-fun array_inv!2763 (array!6572) Bool)

(assert (=> start!27980 (array_inv!2763 arr!237)))

(declare-datatypes ((BitStream!5206 0))(
  ( (BitStream!5207 (buf!3413 array!6572) (currentByte!6303 (_ BitVec 32)) (currentBit!6298 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5206)

(declare-fun e!96173 () Bool)

(declare-fun inv!12 (BitStream!5206) Bool)

(assert (=> start!27980 (and (inv!12 thiss!1634) e!96173)))

(declare-fun b!144350 () Bool)

(declare-fun e!96175 () Bool)

(declare-datatypes ((tuple2!12834 0))(
  ( (tuple2!12835 (_1!6763 BitStream!5206) (_2!6763 (_ BitVec 8))) )
))
(declare-fun lt!223930 () tuple2!12834)

(declare-datatypes ((tuple2!12836 0))(
  ( (tuple2!12837 (_1!6764 BitStream!5206) (_2!6764 BitStream!5206)) )
))
(declare-fun lt!223944 () tuple2!12836)

(assert (=> b!144350 (= e!96175 (and (= (_2!6763 lt!223930) (select (arr!3707 arr!237) from!447)) (= (_1!6763 lt!223930) (_2!6764 lt!223944))))))

(declare-fun readBytePure!0 (BitStream!5206) tuple2!12834)

(assert (=> b!144350 (= lt!223930 (readBytePure!0 (_1!6764 lt!223944)))))

(declare-datatypes ((Unit!9021 0))(
  ( (Unit!9022) )
))
(declare-datatypes ((tuple2!12838 0))(
  ( (tuple2!12839 (_1!6765 Unit!9021) (_2!6765 BitStream!5206)) )
))
(declare-fun lt!223938 () tuple2!12838)

(declare-fun reader!0 (BitStream!5206 BitStream!5206) tuple2!12836)

(assert (=> b!144350 (= lt!223944 (reader!0 thiss!1634 (_2!6765 lt!223938)))))

(declare-fun b!144351 () Bool)

(assert (=> b!144351 (= e!96174 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun e!96182 () Bool)

(assert (=> b!144351 e!96182))

(declare-fun res!120605 () Bool)

(assert (=> b!144351 (=> (not res!120605) (not e!96182))))

(declare-fun lt!223943 () tuple2!12838)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144351 (= res!120605 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2974 (buf!3413 (_2!6765 lt!223943)))) ((_ sign_extend 32) (currentByte!6303 thiss!1634)) ((_ sign_extend 32) (currentBit!6298 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!223933 () Unit!9021)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5206 array!6572 (_ BitVec 32)) Unit!9021)

(assert (=> b!144351 (= lt!223933 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3413 (_2!6765 lt!223943)) (bvsub to!404 from!447)))))

(declare-fun lt!223937 () tuple2!12836)

(assert (=> b!144351 (= (_2!6763 (readBytePure!0 (_1!6764 lt!223937))) (select (arr!3707 arr!237) from!447))))

(declare-fun lt!223941 () tuple2!12836)

(assert (=> b!144351 (= lt!223941 (reader!0 (_2!6765 lt!223938) (_2!6765 lt!223943)))))

(assert (=> b!144351 (= lt!223937 (reader!0 thiss!1634 (_2!6765 lt!223943)))))

(declare-fun e!96178 () Bool)

(assert (=> b!144351 e!96178))

(declare-fun res!120607 () Bool)

(assert (=> b!144351 (=> (not res!120607) (not e!96178))))

(declare-fun lt!223935 () tuple2!12834)

(declare-fun lt!223942 () tuple2!12834)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144351 (= res!120607 (= (bitIndex!0 (size!2974 (buf!3413 (_1!6763 lt!223935))) (currentByte!6303 (_1!6763 lt!223935)) (currentBit!6298 (_1!6763 lt!223935))) (bitIndex!0 (size!2974 (buf!3413 (_1!6763 lt!223942))) (currentByte!6303 (_1!6763 lt!223942)) (currentBit!6298 (_1!6763 lt!223942)))))))

(declare-fun lt!223936 () Unit!9021)

(declare-fun lt!223940 () BitStream!5206)

(declare-fun readBytePrefixLemma!0 (BitStream!5206 BitStream!5206) Unit!9021)

(assert (=> b!144351 (= lt!223936 (readBytePrefixLemma!0 lt!223940 (_2!6765 lt!223943)))))

(assert (=> b!144351 (= lt!223942 (readBytePure!0 (BitStream!5207 (buf!3413 (_2!6765 lt!223943)) (currentByte!6303 thiss!1634) (currentBit!6298 thiss!1634))))))

(assert (=> b!144351 (= lt!223935 (readBytePure!0 lt!223940))))

(assert (=> b!144351 (= lt!223940 (BitStream!5207 (buf!3413 (_2!6765 lt!223938)) (currentByte!6303 thiss!1634) (currentBit!6298 thiss!1634)))))

(declare-fun e!96179 () Bool)

(assert (=> b!144351 e!96179))

(declare-fun res!120603 () Bool)

(assert (=> b!144351 (=> (not res!120603) (not e!96179))))

(declare-fun isPrefixOf!0 (BitStream!5206 BitStream!5206) Bool)

(assert (=> b!144351 (= res!120603 (isPrefixOf!0 thiss!1634 (_2!6765 lt!223943)))))

(declare-fun lt!223931 () Unit!9021)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5206 BitStream!5206 BitStream!5206) Unit!9021)

(assert (=> b!144351 (= lt!223931 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6765 lt!223938) (_2!6765 lt!223943)))))

(declare-fun e!96177 () Bool)

(assert (=> b!144351 e!96177))

(declare-fun res!120602 () Bool)

(assert (=> b!144351 (=> (not res!120602) (not e!96177))))

(assert (=> b!144351 (= res!120602 (= (size!2974 (buf!3413 (_2!6765 lt!223938))) (size!2974 (buf!3413 (_2!6765 lt!223943)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5206 array!6572 (_ BitVec 32) (_ BitVec 32)) tuple2!12838)

(assert (=> b!144351 (= lt!223943 (appendByteArrayLoop!0 (_2!6765 lt!223938) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144351 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2974 (buf!3413 (_2!6765 lt!223938)))) ((_ sign_extend 32) (currentByte!6303 (_2!6765 lt!223938))) ((_ sign_extend 32) (currentBit!6298 (_2!6765 lt!223938))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!223934 () Unit!9021)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5206 BitStream!5206 (_ BitVec 64) (_ BitVec 32)) Unit!9021)

(assert (=> b!144351 (= lt!223934 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6765 lt!223938) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144351 e!96175))

(declare-fun res!120597 () Bool)

(assert (=> b!144351 (=> (not res!120597) (not e!96175))))

(assert (=> b!144351 (= res!120597 (= (size!2974 (buf!3413 thiss!1634)) (size!2974 (buf!3413 (_2!6765 lt!223938)))))))

(declare-fun appendByte!0 (BitStream!5206 (_ BitVec 8)) tuple2!12838)

(assert (=> b!144351 (= lt!223938 (appendByte!0 thiss!1634 (select (arr!3707 arr!237) from!447)))))

(declare-fun b!144352 () Bool)

(declare-fun e!96181 () Bool)

(assert (=> b!144352 (= e!96177 e!96181)))

(declare-fun res!120606 () Bool)

(assert (=> b!144352 (=> (not res!120606) (not e!96181))))

(declare-fun lt!223939 () (_ BitVec 64))

(assert (=> b!144352 (= res!120606 (= (bitIndex!0 (size!2974 (buf!3413 (_2!6765 lt!223943))) (currentByte!6303 (_2!6765 lt!223943)) (currentBit!6298 (_2!6765 lt!223943))) (bvadd (bitIndex!0 (size!2974 (buf!3413 (_2!6765 lt!223938))) (currentByte!6303 (_2!6765 lt!223938)) (currentBit!6298 (_2!6765 lt!223938))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!223939))))))

(assert (=> b!144352 (= lt!223939 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144353 () Bool)

(assert (=> b!144353 (= e!96178 (= (_2!6763 lt!223935) (_2!6763 lt!223942)))))

(declare-fun b!144354 () Bool)

(declare-fun res!120604 () Bool)

(assert (=> b!144354 (=> (not res!120604) (not e!96174))))

(assert (=> b!144354 (= res!120604 (bvslt from!447 to!404))))

(declare-fun b!144355 () Bool)

(declare-fun res!120601 () Bool)

(assert (=> b!144355 (=> (not res!120601) (not e!96174))))

(assert (=> b!144355 (= res!120601 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2974 (buf!3413 thiss!1634))) ((_ sign_extend 32) (currentByte!6303 thiss!1634)) ((_ sign_extend 32) (currentBit!6298 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12840 0))(
  ( (tuple2!12841 (_1!6766 BitStream!5206) (_2!6766 array!6572)) )
))
(declare-fun lt!223928 () tuple2!12840)

(declare-fun b!144356 () Bool)

(declare-fun e!96176 () Bool)

(declare-fun arrayRangesEq!290 (array!6572 array!6572 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144356 (= e!96176 (not (arrayRangesEq!290 arr!237 (_2!6766 lt!223928) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144357 () Bool)

(declare-fun res!120599 () Bool)

(assert (=> b!144357 (=> (not res!120599) (not e!96175))))

(assert (=> b!144357 (= res!120599 (isPrefixOf!0 thiss!1634 (_2!6765 lt!223938)))))

(declare-fun b!144358 () Bool)

(declare-fun res!120608 () Bool)

(assert (=> b!144358 (=> (not res!120608) (not e!96174))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144358 (= res!120608 (invariant!0 (currentBit!6298 thiss!1634) (currentByte!6303 thiss!1634) (size!2974 (buf!3413 thiss!1634))))))

(declare-fun b!144359 () Bool)

(declare-fun res!120610 () Bool)

(assert (=> b!144359 (=> (not res!120610) (not e!96175))))

(assert (=> b!144359 (= res!120610 (= (bitIndex!0 (size!2974 (buf!3413 (_2!6765 lt!223938))) (currentByte!6303 (_2!6765 lt!223938)) (currentBit!6298 (_2!6765 lt!223938))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2974 (buf!3413 thiss!1634)) (currentByte!6303 thiss!1634) (currentBit!6298 thiss!1634)))))))

(declare-fun b!144360 () Bool)

(assert (=> b!144360 (= e!96173 (array_inv!2763 (buf!3413 thiss!1634)))))

(declare-fun b!144361 () Bool)

(declare-fun res!120598 () Bool)

(assert (=> b!144361 (=> (not res!120598) (not e!96181))))

(assert (=> b!144361 (= res!120598 (isPrefixOf!0 (_2!6765 lt!223938) (_2!6765 lt!223943)))))

(declare-fun b!144362 () Bool)

(assert (=> b!144362 (= e!96179 (invariant!0 (currentBit!6298 thiss!1634) (currentByte!6303 thiss!1634) (size!2974 (buf!3413 (_2!6765 lt!223938)))))))

(declare-fun b!144363 () Bool)

(assert (=> b!144363 (= e!96181 (not e!96176))))

(declare-fun res!120600 () Bool)

(assert (=> b!144363 (=> res!120600 e!96176)))

(declare-fun lt!223932 () tuple2!12836)

(assert (=> b!144363 (= res!120600 (or (not (= (size!2974 (_2!6766 lt!223928)) (size!2974 arr!237))) (not (= (_1!6766 lt!223928) (_2!6764 lt!223932)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5206 array!6572 (_ BitVec 32) (_ BitVec 32)) tuple2!12840)

(assert (=> b!144363 (= lt!223928 (readByteArrayLoopPure!0 (_1!6764 lt!223932) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144363 (validate_offset_bits!1 ((_ sign_extend 32) (size!2974 (buf!3413 (_2!6765 lt!223943)))) ((_ sign_extend 32) (currentByte!6303 (_2!6765 lt!223938))) ((_ sign_extend 32) (currentBit!6298 (_2!6765 lt!223938))) lt!223939)))

(declare-fun lt!223929 () Unit!9021)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5206 array!6572 (_ BitVec 64)) Unit!9021)

(assert (=> b!144363 (= lt!223929 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6765 lt!223938) (buf!3413 (_2!6765 lt!223943)) lt!223939))))

(assert (=> b!144363 (= lt!223932 (reader!0 (_2!6765 lt!223938) (_2!6765 lt!223943)))))

(declare-fun b!144364 () Bool)

(assert (=> b!144364 (= e!96182 (= (_1!6766 (readByteArrayLoopPure!0 (_1!6764 lt!223937) arr!237 from!447 to!404)) (_2!6764 lt!223937)))))

(assert (= (and start!27980 res!120609) b!144355))

(assert (= (and b!144355 res!120601) b!144354))

(assert (= (and b!144354 res!120604) b!144358))

(assert (= (and b!144358 res!120608) b!144351))

(assert (= (and b!144351 res!120597) b!144359))

(assert (= (and b!144359 res!120610) b!144357))

(assert (= (and b!144357 res!120599) b!144350))

(assert (= (and b!144351 res!120602) b!144352))

(assert (= (and b!144352 res!120606) b!144361))

(assert (= (and b!144361 res!120598) b!144363))

(assert (= (and b!144363 (not res!120600)) b!144356))

(assert (= (and b!144351 res!120603) b!144362))

(assert (= (and b!144351 res!120607) b!144353))

(assert (= (and b!144351 res!120605) b!144364))

(assert (= start!27980 b!144360))

(declare-fun m!222011 () Bool)

(assert (=> b!144351 m!222011))

(declare-fun m!222013 () Bool)

(assert (=> b!144351 m!222013))

(declare-fun m!222015 () Bool)

(assert (=> b!144351 m!222015))

(declare-fun m!222017 () Bool)

(assert (=> b!144351 m!222017))

(declare-fun m!222019 () Bool)

(assert (=> b!144351 m!222019))

(declare-fun m!222021 () Bool)

(assert (=> b!144351 m!222021))

(declare-fun m!222023 () Bool)

(assert (=> b!144351 m!222023))

(declare-fun m!222025 () Bool)

(assert (=> b!144351 m!222025))

(declare-fun m!222027 () Bool)

(assert (=> b!144351 m!222027))

(declare-fun m!222029 () Bool)

(assert (=> b!144351 m!222029))

(declare-fun m!222031 () Bool)

(assert (=> b!144351 m!222031))

(declare-fun m!222033 () Bool)

(assert (=> b!144351 m!222033))

(assert (=> b!144351 m!222031))

(declare-fun m!222035 () Bool)

(assert (=> b!144351 m!222035))

(declare-fun m!222037 () Bool)

(assert (=> b!144351 m!222037))

(declare-fun m!222039 () Bool)

(assert (=> b!144351 m!222039))

(declare-fun m!222041 () Bool)

(assert (=> b!144351 m!222041))

(declare-fun m!222043 () Bool)

(assert (=> b!144351 m!222043))

(declare-fun m!222045 () Bool)

(assert (=> b!144362 m!222045))

(declare-fun m!222047 () Bool)

(assert (=> b!144357 m!222047))

(declare-fun m!222049 () Bool)

(assert (=> b!144363 m!222049))

(declare-fun m!222051 () Bool)

(assert (=> b!144363 m!222051))

(declare-fun m!222053 () Bool)

(assert (=> b!144363 m!222053))

(assert (=> b!144363 m!222035))

(declare-fun m!222055 () Bool)

(assert (=> b!144359 m!222055))

(declare-fun m!222057 () Bool)

(assert (=> b!144359 m!222057))

(declare-fun m!222059 () Bool)

(assert (=> b!144352 m!222059))

(assert (=> b!144352 m!222055))

(declare-fun m!222061 () Bool)

(assert (=> b!144364 m!222061))

(declare-fun m!222063 () Bool)

(assert (=> b!144356 m!222063))

(declare-fun m!222065 () Bool)

(assert (=> b!144355 m!222065))

(assert (=> b!144350 m!222031))

(declare-fun m!222067 () Bool)

(assert (=> b!144350 m!222067))

(declare-fun m!222069 () Bool)

(assert (=> b!144350 m!222069))

(declare-fun m!222071 () Bool)

(assert (=> start!27980 m!222071))

(declare-fun m!222073 () Bool)

(assert (=> start!27980 m!222073))

(declare-fun m!222075 () Bool)

(assert (=> b!144358 m!222075))

(declare-fun m!222077 () Bool)

(assert (=> b!144360 m!222077))

(declare-fun m!222079 () Bool)

(assert (=> b!144361 m!222079))

(push 1)

(assert (not b!144351))

(assert (not b!144358))

(assert (not b!144363))

(assert (not b!144359))

(assert (not b!144362))

(assert (not b!144350))

(assert (not start!27980))

(assert (not b!144355))

(assert (not b!144352))

(assert (not b!144357))

(assert (not b!144361))

(assert (not b!144364))

(assert (not b!144360))

(assert (not b!144356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

