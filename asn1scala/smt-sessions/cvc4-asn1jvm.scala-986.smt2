; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27706 () Bool)

(assert start!27706)

(declare-fun b!142690 () Bool)

(declare-fun res!119118 () Bool)

(declare-fun e!95044 () Bool)

(assert (=> b!142690 (=> (not res!119118) (not e!95044))))

(declare-datatypes ((array!6529 0))(
  ( (array!6530 (arr!3674 (Array (_ BitVec 32) (_ BitVec 8))) (size!2955 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5168 0))(
  ( (BitStream!5169 (buf!3382 array!6529) (currentByte!6260 (_ BitVec 32)) (currentBit!6255 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5168)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142690 (= res!119118 (invariant!0 (currentBit!6255 thiss!1634) (currentByte!6260 thiss!1634) (size!2955 (buf!3382 thiss!1634))))))

(declare-fun b!142691 () Bool)

(declare-fun res!119119 () Bool)

(declare-fun e!95049 () Bool)

(assert (=> b!142691 (=> (not res!119119) (not e!95049))))

(declare-datatypes ((Unit!8904 0))(
  ( (Unit!8905) )
))
(declare-datatypes ((tuple2!12668 0))(
  ( (tuple2!12669 (_1!6673 Unit!8904) (_2!6673 BitStream!5168)) )
))
(declare-fun lt!221237 () tuple2!12668)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142691 (= res!119119 (= (bitIndex!0 (size!2955 (buf!3382 (_2!6673 lt!221237))) (currentByte!6260 (_2!6673 lt!221237)) (currentBit!6255 (_2!6673 lt!221237))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2955 (buf!3382 thiss!1634)) (currentByte!6260 thiss!1634) (currentBit!6255 thiss!1634)))))))

(declare-fun res!119110 () Bool)

(assert (=> start!27706 (=> (not res!119110) (not e!95044))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6529)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27706 (= res!119110 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2955 arr!237))))))

(assert (=> start!27706 e!95044))

(assert (=> start!27706 true))

(declare-fun array_inv!2744 (array!6529) Bool)

(assert (=> start!27706 (array_inv!2744 arr!237)))

(declare-fun e!95046 () Bool)

(declare-fun inv!12 (BitStream!5168) Bool)

(assert (=> start!27706 (and (inv!12 thiss!1634) e!95046)))

(declare-fun e!95048 () Bool)

(declare-fun b!142692 () Bool)

(declare-datatypes ((tuple2!12670 0))(
  ( (tuple2!12671 (_1!6674 BitStream!5168) (_2!6674 array!6529)) )
))
(declare-fun lt!221232 () tuple2!12670)

(declare-fun arrayRangesEq!271 (array!6529 array!6529 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142692 (= e!95048 (not (arrayRangesEq!271 arr!237 (_2!6674 lt!221232) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142693 () Bool)

(declare-datatypes ((tuple2!12672 0))(
  ( (tuple2!12673 (_1!6675 BitStream!5168) (_2!6675 (_ BitVec 8))) )
))
(declare-fun lt!221230 () tuple2!12672)

(declare-datatypes ((tuple2!12674 0))(
  ( (tuple2!12675 (_1!6676 BitStream!5168) (_2!6676 BitStream!5168)) )
))
(declare-fun lt!221240 () tuple2!12674)

(assert (=> b!142693 (= e!95049 (and (= (_2!6675 lt!221230) (select (arr!3674 arr!237) from!447)) (= (_1!6675 lt!221230) (_2!6676 lt!221240))))))

(declare-fun readBytePure!0 (BitStream!5168) tuple2!12672)

(assert (=> b!142693 (= lt!221230 (readBytePure!0 (_1!6676 lt!221240)))))

(declare-fun reader!0 (BitStream!5168 BitStream!5168) tuple2!12674)

(assert (=> b!142693 (= lt!221240 (reader!0 thiss!1634 (_2!6673 lt!221237)))))

(declare-fun b!142694 () Bool)

(declare-fun e!95043 () Bool)

(declare-fun e!95042 () Bool)

(assert (=> b!142694 (= e!95043 e!95042)))

(declare-fun res!119120 () Bool)

(assert (=> b!142694 (=> (not res!119120) (not e!95042))))

(declare-fun lt!221227 () tuple2!12668)

(declare-fun lt!221233 () (_ BitVec 64))

(assert (=> b!142694 (= res!119120 (= (bitIndex!0 (size!2955 (buf!3382 (_2!6673 lt!221227))) (currentByte!6260 (_2!6673 lt!221227)) (currentBit!6255 (_2!6673 lt!221227))) (bvadd (bitIndex!0 (size!2955 (buf!3382 (_2!6673 lt!221237))) (currentByte!6260 (_2!6673 lt!221237)) (currentBit!6255 (_2!6673 lt!221237))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221233))))))

(assert (=> b!142694 (= lt!221233 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142695 () Bool)

(assert (=> b!142695 (= e!95046 (array_inv!2744 (buf!3382 thiss!1634)))))

(declare-fun b!142696 () Bool)

(declare-fun res!119116 () Bool)

(assert (=> b!142696 (=> (not res!119116) (not e!95049))))

(declare-fun isPrefixOf!0 (BitStream!5168 BitStream!5168) Bool)

(assert (=> b!142696 (= res!119116 (isPrefixOf!0 thiss!1634 (_2!6673 lt!221237)))))

(declare-fun b!142697 () Bool)

(declare-fun res!119111 () Bool)

(assert (=> b!142697 (=> (not res!119111) (not e!95042))))

(assert (=> b!142697 (= res!119111 (isPrefixOf!0 (_2!6673 lt!221237) (_2!6673 lt!221227)))))

(declare-fun b!142698 () Bool)

(declare-fun res!119122 () Bool)

(assert (=> b!142698 (=> (not res!119122) (not e!95044))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142698 (= res!119122 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2955 (buf!3382 thiss!1634))) ((_ sign_extend 32) (currentByte!6260 thiss!1634)) ((_ sign_extend 32) (currentBit!6255 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142699 () Bool)

(declare-fun e!95045 () Bool)

(assert (=> b!142699 (= e!95045 (invariant!0 (currentBit!6255 thiss!1634) (currentByte!6260 thiss!1634) (size!2955 (buf!3382 (_2!6673 lt!221237)))))))

(declare-fun b!142700 () Bool)

(assert (=> b!142700 (= e!95044 (not (bvslt from!447 (size!2955 arr!237))))))

(declare-fun lt!221239 () tuple2!12672)

(declare-fun lt!221236 () tuple2!12674)

(assert (=> b!142700 (= lt!221239 (readBytePure!0 (_1!6676 lt!221236)))))

(declare-fun lt!221228 () tuple2!12674)

(assert (=> b!142700 (= lt!221228 (reader!0 (_2!6673 lt!221237) (_2!6673 lt!221227)))))

(assert (=> b!142700 (= lt!221236 (reader!0 thiss!1634 (_2!6673 lt!221227)))))

(declare-fun e!95040 () Bool)

(assert (=> b!142700 e!95040))

(declare-fun res!119113 () Bool)

(assert (=> b!142700 (=> (not res!119113) (not e!95040))))

(declare-fun lt!221229 () tuple2!12672)

(declare-fun lt!221224 () tuple2!12672)

(assert (=> b!142700 (= res!119113 (= (bitIndex!0 (size!2955 (buf!3382 (_1!6675 lt!221229))) (currentByte!6260 (_1!6675 lt!221229)) (currentBit!6255 (_1!6675 lt!221229))) (bitIndex!0 (size!2955 (buf!3382 (_1!6675 lt!221224))) (currentByte!6260 (_1!6675 lt!221224)) (currentBit!6255 (_1!6675 lt!221224)))))))

(declare-fun lt!221234 () Unit!8904)

(declare-fun lt!221225 () BitStream!5168)

(declare-fun readBytePrefixLemma!0 (BitStream!5168 BitStream!5168) Unit!8904)

(assert (=> b!142700 (= lt!221234 (readBytePrefixLemma!0 lt!221225 (_2!6673 lt!221227)))))

(assert (=> b!142700 (= lt!221224 (readBytePure!0 (BitStream!5169 (buf!3382 (_2!6673 lt!221227)) (currentByte!6260 thiss!1634) (currentBit!6255 thiss!1634))))))

(assert (=> b!142700 (= lt!221229 (readBytePure!0 lt!221225))))

(assert (=> b!142700 (= lt!221225 (BitStream!5169 (buf!3382 (_2!6673 lt!221237)) (currentByte!6260 thiss!1634) (currentBit!6255 thiss!1634)))))

(assert (=> b!142700 e!95045))

(declare-fun res!119117 () Bool)

(assert (=> b!142700 (=> (not res!119117) (not e!95045))))

(assert (=> b!142700 (= res!119117 (isPrefixOf!0 thiss!1634 (_2!6673 lt!221227)))))

(declare-fun lt!221231 () Unit!8904)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5168 BitStream!5168 BitStream!5168) Unit!8904)

(assert (=> b!142700 (= lt!221231 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6673 lt!221237) (_2!6673 lt!221227)))))

(assert (=> b!142700 e!95043))

(declare-fun res!119112 () Bool)

(assert (=> b!142700 (=> (not res!119112) (not e!95043))))

(assert (=> b!142700 (= res!119112 (= (size!2955 (buf!3382 (_2!6673 lt!221237))) (size!2955 (buf!3382 (_2!6673 lt!221227)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5168 array!6529 (_ BitVec 32) (_ BitVec 32)) tuple2!12668)

(assert (=> b!142700 (= lt!221227 (appendByteArrayLoop!0 (_2!6673 lt!221237) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!142700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2955 (buf!3382 (_2!6673 lt!221237)))) ((_ sign_extend 32) (currentByte!6260 (_2!6673 lt!221237))) ((_ sign_extend 32) (currentBit!6255 (_2!6673 lt!221237))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221226 () Unit!8904)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5168 BitStream!5168 (_ BitVec 64) (_ BitVec 32)) Unit!8904)

(assert (=> b!142700 (= lt!221226 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6673 lt!221237) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142700 e!95049))

(declare-fun res!119121 () Bool)

(assert (=> b!142700 (=> (not res!119121) (not e!95049))))

(assert (=> b!142700 (= res!119121 (= (size!2955 (buf!3382 thiss!1634)) (size!2955 (buf!3382 (_2!6673 lt!221237)))))))

(declare-fun appendByte!0 (BitStream!5168 (_ BitVec 8)) tuple2!12668)

(assert (=> b!142700 (= lt!221237 (appendByte!0 thiss!1634 (select (arr!3674 arr!237) from!447)))))

(declare-fun b!142701 () Bool)

(declare-fun res!119115 () Bool)

(assert (=> b!142701 (=> (not res!119115) (not e!95044))))

(assert (=> b!142701 (= res!119115 (bvslt from!447 to!404))))

(declare-fun b!142702 () Bool)

(assert (=> b!142702 (= e!95042 (not e!95048))))

(declare-fun res!119114 () Bool)

(assert (=> b!142702 (=> res!119114 e!95048)))

(declare-fun lt!221238 () tuple2!12674)

(assert (=> b!142702 (= res!119114 (or (not (= (size!2955 (_2!6674 lt!221232)) (size!2955 arr!237))) (not (= (_1!6674 lt!221232) (_2!6676 lt!221238)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5168 array!6529 (_ BitVec 32) (_ BitVec 32)) tuple2!12670)

(assert (=> b!142702 (= lt!221232 (readByteArrayLoopPure!0 (_1!6676 lt!221238) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142702 (validate_offset_bits!1 ((_ sign_extend 32) (size!2955 (buf!3382 (_2!6673 lt!221227)))) ((_ sign_extend 32) (currentByte!6260 (_2!6673 lt!221237))) ((_ sign_extend 32) (currentBit!6255 (_2!6673 lt!221237))) lt!221233)))

(declare-fun lt!221235 () Unit!8904)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5168 array!6529 (_ BitVec 64)) Unit!8904)

(assert (=> b!142702 (= lt!221235 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6673 lt!221237) (buf!3382 (_2!6673 lt!221227)) lt!221233))))

(assert (=> b!142702 (= lt!221238 (reader!0 (_2!6673 lt!221237) (_2!6673 lt!221227)))))

(declare-fun b!142703 () Bool)

(assert (=> b!142703 (= e!95040 (= (_2!6675 lt!221229) (_2!6675 lt!221224)))))

(assert (= (and start!27706 res!119110) b!142698))

(assert (= (and b!142698 res!119122) b!142701))

(assert (= (and b!142701 res!119115) b!142690))

(assert (= (and b!142690 res!119118) b!142700))

(assert (= (and b!142700 res!119121) b!142691))

(assert (= (and b!142691 res!119119) b!142696))

(assert (= (and b!142696 res!119116) b!142693))

(assert (= (and b!142700 res!119112) b!142694))

(assert (= (and b!142694 res!119120) b!142697))

(assert (= (and b!142697 res!119111) b!142702))

(assert (= (and b!142702 (not res!119114)) b!142692))

(assert (= (and b!142700 res!119117) b!142699))

(assert (= (and b!142700 res!119113) b!142703))

(assert (= start!27706 b!142695))

(declare-fun m!219025 () Bool)

(assert (=> b!142690 m!219025))

(declare-fun m!219027 () Bool)

(assert (=> b!142697 m!219027))

(declare-fun m!219029 () Bool)

(assert (=> b!142695 m!219029))

(declare-fun m!219031 () Bool)

(assert (=> b!142702 m!219031))

(declare-fun m!219033 () Bool)

(assert (=> b!142702 m!219033))

(declare-fun m!219035 () Bool)

(assert (=> b!142702 m!219035))

(declare-fun m!219037 () Bool)

(assert (=> b!142702 m!219037))

(declare-fun m!219039 () Bool)

(assert (=> b!142698 m!219039))

(declare-fun m!219041 () Bool)

(assert (=> b!142692 m!219041))

(declare-fun m!219043 () Bool)

(assert (=> b!142693 m!219043))

(declare-fun m!219045 () Bool)

(assert (=> b!142693 m!219045))

(declare-fun m!219047 () Bool)

(assert (=> b!142693 m!219047))

(declare-fun m!219049 () Bool)

(assert (=> b!142696 m!219049))

(declare-fun m!219051 () Bool)

(assert (=> start!27706 m!219051))

(declare-fun m!219053 () Bool)

(assert (=> start!27706 m!219053))

(declare-fun m!219055 () Bool)

(assert (=> b!142700 m!219055))

(declare-fun m!219057 () Bool)

(assert (=> b!142700 m!219057))

(declare-fun m!219059 () Bool)

(assert (=> b!142700 m!219059))

(declare-fun m!219061 () Bool)

(assert (=> b!142700 m!219061))

(assert (=> b!142700 m!219037))

(declare-fun m!219063 () Bool)

(assert (=> b!142700 m!219063))

(declare-fun m!219065 () Bool)

(assert (=> b!142700 m!219065))

(declare-fun m!219067 () Bool)

(assert (=> b!142700 m!219067))

(declare-fun m!219069 () Bool)

(assert (=> b!142700 m!219069))

(declare-fun m!219071 () Bool)

(assert (=> b!142700 m!219071))

(assert (=> b!142700 m!219043))

(declare-fun m!219073 () Bool)

(assert (=> b!142700 m!219073))

(declare-fun m!219075 () Bool)

(assert (=> b!142700 m!219075))

(declare-fun m!219077 () Bool)

(assert (=> b!142700 m!219077))

(assert (=> b!142700 m!219043))

(declare-fun m!219079 () Bool)

(assert (=> b!142700 m!219079))

(declare-fun m!219081 () Bool)

(assert (=> b!142694 m!219081))

(declare-fun m!219083 () Bool)

(assert (=> b!142694 m!219083))

(assert (=> b!142691 m!219083))

(declare-fun m!219085 () Bool)

(assert (=> b!142691 m!219085))

(declare-fun m!219087 () Bool)

(assert (=> b!142699 m!219087))

(push 1)

(assert (not start!27706))

(assert (not b!142698))

(assert (not b!142697))

(assert (not b!142699))

(assert (not b!142693))

(assert (not b!142692))

(assert (not b!142690))

(assert (not b!142696))

(assert (not b!142691))

(assert (not b!142702))

(assert (not b!142694))

(assert (not b!142695))

(assert (not b!142700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

