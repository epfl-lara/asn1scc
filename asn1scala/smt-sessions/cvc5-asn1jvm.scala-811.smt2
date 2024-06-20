; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23912 () Bool)

(assert start!23912)

(declare-fun b!120942 () Bool)

(declare-fun e!79208 () Bool)

(declare-fun e!79199 () Bool)

(assert (=> b!120942 (= e!79208 (not e!79199))))

(declare-fun res!100145 () Bool)

(assert (=> b!120942 (=> res!100145 e!79199)))

(declare-datatypes ((array!5372 0))(
  ( (array!5373 (arr!3024 (Array (_ BitVec 32) (_ BitVec 8))) (size!2431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4336 0))(
  ( (BitStream!4337 (buf!2865 array!5372) (currentByte!5550 (_ BitVec 32)) (currentBit!5545 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10144 0))(
  ( (tuple2!10145 (_1!5337 BitStream!4336) (_2!5337 (_ BitVec 64))) )
))
(declare-fun lt!188875 () tuple2!10144)

(declare-datatypes ((tuple2!10146 0))(
  ( (tuple2!10147 (_1!5338 BitStream!4336) (_2!5338 BitStream!4336)) )
))
(declare-fun lt!188866 () tuple2!10146)

(assert (=> b!120942 (= res!100145 (not (= (_1!5337 lt!188875) (_2!5338 lt!188866))))))

(declare-fun lt!188867 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10144)

(assert (=> b!120942 (= lt!188875 (readNLeastSignificantBitsLoopPure!0 (_1!5338 lt!188866) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188867))))

(declare-datatypes ((Unit!7453 0))(
  ( (Unit!7454) )
))
(declare-datatypes ((tuple2!10148 0))(
  ( (tuple2!10149 (_1!5339 Unit!7453) (_2!5339 BitStream!4336)) )
))
(declare-fun lt!188872 () tuple2!10148)

(declare-fun lt!188864 () tuple2!10148)

(declare-fun lt!188881 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2431 (buf!2865 (_2!5339 lt!188872)))) ((_ sign_extend 32) (currentByte!5550 (_2!5339 lt!188864))) ((_ sign_extend 32) (currentBit!5545 (_2!5339 lt!188864))) lt!188881)))

(declare-fun lt!188873 () Unit!7453)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4336 array!5372 (_ BitVec 64)) Unit!7453)

(assert (=> b!120942 (= lt!188873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5339 lt!188864) (buf!2865 (_2!5339 lt!188872)) lt!188881))))

(assert (=> b!120942 (= lt!188881 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!188887 () (_ BitVec 64))

(declare-fun lt!188865 () (_ BitVec 64))

(declare-datatypes ((tuple2!10150 0))(
  ( (tuple2!10151 (_1!5340 BitStream!4336) (_2!5340 Bool)) )
))
(declare-fun lt!188862 () tuple2!10150)

(assert (=> b!120942 (= lt!188867 (bvor lt!188865 (ite (_2!5340 lt!188862) lt!188887 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!188861 () tuple2!10146)

(declare-fun lt!188870 () tuple2!10144)

(assert (=> b!120942 (= lt!188870 (readNLeastSignificantBitsLoopPure!0 (_1!5338 lt!188861) nBits!396 i!615 lt!188865))))

(declare-fun thiss!1305 () BitStream!4336)

(declare-fun lt!188888 () (_ BitVec 64))

(assert (=> b!120942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2431 (buf!2865 (_2!5339 lt!188872)))) ((_ sign_extend 32) (currentByte!5550 thiss!1305)) ((_ sign_extend 32) (currentBit!5545 thiss!1305)) lt!188888)))

(declare-fun lt!188863 () Unit!7453)

(assert (=> b!120942 (= lt!188863 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2865 (_2!5339 lt!188872)) lt!188888))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120942 (= lt!188865 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!188879 () Bool)

(assert (=> b!120942 (= (_2!5340 lt!188862) lt!188879)))

(declare-fun readBitPure!0 (BitStream!4336) tuple2!10150)

(assert (=> b!120942 (= lt!188862 (readBitPure!0 (_1!5338 lt!188861)))))

(declare-fun reader!0 (BitStream!4336 BitStream!4336) tuple2!10146)

(assert (=> b!120942 (= lt!188866 (reader!0 (_2!5339 lt!188864) (_2!5339 lt!188872)))))

(assert (=> b!120942 (= lt!188861 (reader!0 thiss!1305 (_2!5339 lt!188872)))))

(declare-fun e!79203 () Bool)

(assert (=> b!120942 e!79203))

(declare-fun res!100149 () Bool)

(assert (=> b!120942 (=> (not res!100149) (not e!79203))))

(declare-fun lt!188869 () tuple2!10150)

(declare-fun lt!188885 () tuple2!10150)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120942 (= res!100149 (= (bitIndex!0 (size!2431 (buf!2865 (_1!5340 lt!188869))) (currentByte!5550 (_1!5340 lt!188869)) (currentBit!5545 (_1!5340 lt!188869))) (bitIndex!0 (size!2431 (buf!2865 (_1!5340 lt!188885))) (currentByte!5550 (_1!5340 lt!188885)) (currentBit!5545 (_1!5340 lt!188885)))))))

(declare-fun lt!188886 () Unit!7453)

(declare-fun lt!188877 () BitStream!4336)

(declare-fun readBitPrefixLemma!0 (BitStream!4336 BitStream!4336) Unit!7453)

(assert (=> b!120942 (= lt!188886 (readBitPrefixLemma!0 lt!188877 (_2!5339 lt!188872)))))

(assert (=> b!120942 (= lt!188885 (readBitPure!0 (BitStream!4337 (buf!2865 (_2!5339 lt!188872)) (currentByte!5550 thiss!1305) (currentBit!5545 thiss!1305))))))

(assert (=> b!120942 (= lt!188869 (readBitPure!0 lt!188877))))

(assert (=> b!120942 (= lt!188877 (BitStream!4337 (buf!2865 (_2!5339 lt!188864)) (currentByte!5550 thiss!1305) (currentBit!5545 thiss!1305)))))

(declare-fun e!79207 () Bool)

(assert (=> b!120942 e!79207))

(declare-fun res!100153 () Bool)

(assert (=> b!120942 (=> (not res!100153) (not e!79207))))

(declare-fun isPrefixOf!0 (BitStream!4336 BitStream!4336) Bool)

(assert (=> b!120942 (= res!100153 (isPrefixOf!0 thiss!1305 (_2!5339 lt!188872)))))

(declare-fun lt!188884 () Unit!7453)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4336 BitStream!4336 BitStream!4336) Unit!7453)

(assert (=> b!120942 (= lt!188884 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5339 lt!188864) (_2!5339 lt!188872)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4336 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10148)

(assert (=> b!120942 (= lt!188872 (appendNLeastSignificantBitsLoop!0 (_2!5339 lt!188864) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79200 () Bool)

(assert (=> b!120942 e!79200))

(declare-fun res!100151 () Bool)

(assert (=> b!120942 (=> (not res!100151) (not e!79200))))

(assert (=> b!120942 (= res!100151 (= (size!2431 (buf!2865 thiss!1305)) (size!2431 (buf!2865 (_2!5339 lt!188864)))))))

(declare-fun appendBit!0 (BitStream!4336 Bool) tuple2!10148)

(assert (=> b!120942 (= lt!188864 (appendBit!0 thiss!1305 lt!188879))))

(assert (=> b!120942 (= lt!188879 (not (= (bvand v!199 lt!188887) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120942 (= lt!188887 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!120943 () Bool)

(assert (=> b!120943 (= e!79203 (= (_2!5340 lt!188869) (_2!5340 lt!188885)))))

(declare-fun b!120944 () Bool)

(declare-fun e!79201 () Bool)

(declare-fun array_inv!2233 (array!5372) Bool)

(assert (=> b!120944 (= e!79201 (array_inv!2233 (buf!2865 thiss!1305)))))

(declare-fun b!120945 () Bool)

(declare-fun e!79202 () Bool)

(declare-fun lt!188889 () tuple2!10150)

(declare-fun lt!188876 () (_ BitVec 64))

(assert (=> b!120945 (= e!79202 (= (bitIndex!0 (size!2431 (buf!2865 (_1!5340 lt!188889))) (currentByte!5550 (_1!5340 lt!188889)) (currentBit!5545 (_1!5340 lt!188889))) lt!188876))))

(declare-fun b!120946 () Bool)

(declare-fun res!100148 () Bool)

(assert (=> b!120946 (=> (not res!100148) (not e!79208))))

(assert (=> b!120946 (= res!100148 (bvslt i!615 nBits!396))))

(declare-fun b!120947 () Bool)

(declare-fun res!100147 () Bool)

(declare-fun e!79206 () Bool)

(assert (=> b!120947 (=> (not res!100147) (not e!79206))))

(assert (=> b!120947 (= res!100147 (isPrefixOf!0 thiss!1305 (_2!5339 lt!188864)))))

(declare-fun lt!188878 () BitStream!4336)

(declare-fun b!120948 () Bool)

(assert (=> b!120948 (= e!79199 (or (not (= (_1!5338 lt!188866) lt!188878)) (= (_2!5337 lt!188870) (_2!5337 lt!188875))))))

(declare-fun e!79209 () Bool)

(assert (=> b!120948 e!79209))

(declare-fun res!100155 () Bool)

(assert (=> b!120948 (=> (not res!100155) (not e!79209))))

(declare-fun lt!188880 () (_ BitVec 64))

(declare-fun lt!188882 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4336 (_ BitVec 64)) BitStream!4336)

(assert (=> b!120948 (= res!100155 (= (_1!5338 lt!188866) (withMovedBitIndex!0 (_2!5338 lt!188866) (bvsub lt!188882 lt!188880))))))

(assert (=> b!120948 (= lt!188882 (bitIndex!0 (size!2431 (buf!2865 (_2!5339 lt!188864))) (currentByte!5550 (_2!5339 lt!188864)) (currentBit!5545 (_2!5339 lt!188864))))))

(declare-fun lt!188871 () (_ BitVec 64))

(assert (=> b!120948 (= (_1!5338 lt!188861) (withMovedBitIndex!0 (_2!5338 lt!188861) (bvsub lt!188871 lt!188880)))))

(assert (=> b!120948 (= lt!188880 (bitIndex!0 (size!2431 (buf!2865 (_2!5339 lt!188872))) (currentByte!5550 (_2!5339 lt!188872)) (currentBit!5545 (_2!5339 lt!188872))))))

(assert (=> b!120948 (= lt!188871 (bitIndex!0 (size!2431 (buf!2865 thiss!1305)) (currentByte!5550 thiss!1305) (currentBit!5545 thiss!1305)))))

(declare-fun lt!188883 () tuple2!10144)

(assert (=> b!120948 (and (= (_2!5337 lt!188870) (_2!5337 lt!188883)) (= (_1!5337 lt!188870) (_1!5337 lt!188883)))))

(declare-fun lt!188874 () Unit!7453)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7453)

(assert (=> b!120948 (= lt!188874 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5338 lt!188861) nBits!396 i!615 lt!188865))))

(assert (=> b!120948 (= lt!188883 (readNLeastSignificantBitsLoopPure!0 lt!188878 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188867))))

(assert (=> b!120948 (= lt!188878 (withMovedBitIndex!0 (_1!5338 lt!188861) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!120949 () Bool)

(declare-fun res!100150 () Bool)

(assert (=> b!120949 (=> (not res!100150) (not e!79208))))

(assert (=> b!120949 (= res!100150 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120950 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120950 (= e!79207 (invariant!0 (currentBit!5545 thiss!1305) (currentByte!5550 thiss!1305) (size!2431 (buf!2865 (_2!5339 lt!188872)))))))

(declare-fun b!120951 () Bool)

(assert (=> b!120951 (= e!79206 e!79202)))

(declare-fun res!100146 () Bool)

(assert (=> b!120951 (=> (not res!100146) (not e!79202))))

(assert (=> b!120951 (= res!100146 (and (= (_2!5340 lt!188889) lt!188879) (= (_1!5340 lt!188889) (_2!5339 lt!188864))))))

(declare-fun readerFrom!0 (BitStream!4336 (_ BitVec 32) (_ BitVec 32)) BitStream!4336)

(assert (=> b!120951 (= lt!188889 (readBitPure!0 (readerFrom!0 (_2!5339 lt!188864) (currentBit!5545 thiss!1305) (currentByte!5550 thiss!1305))))))

(declare-fun b!120952 () Bool)

(declare-fun res!100154 () Bool)

(assert (=> b!120952 (=> (not res!100154) (not e!79207))))

(assert (=> b!120952 (= res!100154 (invariant!0 (currentBit!5545 thiss!1305) (currentByte!5550 thiss!1305) (size!2431 (buf!2865 (_2!5339 lt!188864)))))))

(declare-fun res!100152 () Bool)

(declare-fun e!79205 () Bool)

(assert (=> start!23912 (=> (not res!100152) (not e!79205))))

(assert (=> start!23912 (= res!100152 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23912 e!79205))

(assert (=> start!23912 true))

(declare-fun inv!12 (BitStream!4336) Bool)

(assert (=> start!23912 (and (inv!12 thiss!1305) e!79201)))

(declare-fun b!120953 () Bool)

(assert (=> b!120953 (= e!79205 e!79208)))

(declare-fun res!100143 () Bool)

(assert (=> b!120953 (=> (not res!100143) (not e!79208))))

(assert (=> b!120953 (= res!100143 (validate_offset_bits!1 ((_ sign_extend 32) (size!2431 (buf!2865 thiss!1305))) ((_ sign_extend 32) (currentByte!5550 thiss!1305)) ((_ sign_extend 32) (currentBit!5545 thiss!1305)) lt!188888))))

(assert (=> b!120953 (= lt!188888 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120954 () Bool)

(assert (=> b!120954 (= e!79200 e!79206)))

(declare-fun res!100144 () Bool)

(assert (=> b!120954 (=> (not res!100144) (not e!79206))))

(declare-fun lt!188868 () (_ BitVec 64))

(assert (=> b!120954 (= res!100144 (= lt!188876 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!188868)))))

(assert (=> b!120954 (= lt!188876 (bitIndex!0 (size!2431 (buf!2865 (_2!5339 lt!188864))) (currentByte!5550 (_2!5339 lt!188864)) (currentBit!5545 (_2!5339 lt!188864))))))

(assert (=> b!120954 (= lt!188868 (bitIndex!0 (size!2431 (buf!2865 thiss!1305)) (currentByte!5550 thiss!1305) (currentBit!5545 thiss!1305)))))

(declare-fun b!120955 () Bool)

(assert (=> b!120955 (= e!79209 (= lt!188871 (bvsub lt!188882 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!23912 res!100152) b!120953))

(assert (= (and b!120953 res!100143) b!120949))

(assert (= (and b!120949 res!100150) b!120946))

(assert (= (and b!120946 res!100148) b!120942))

(assert (= (and b!120942 res!100151) b!120954))

(assert (= (and b!120954 res!100144) b!120947))

(assert (= (and b!120947 res!100147) b!120951))

(assert (= (and b!120951 res!100146) b!120945))

(assert (= (and b!120942 res!100153) b!120952))

(assert (= (and b!120952 res!100154) b!120950))

(assert (= (and b!120942 res!100149) b!120943))

(assert (= (and b!120942 (not res!100145)) b!120948))

(assert (= (and b!120948 res!100155) b!120955))

(assert (= start!23912 b!120944))

(declare-fun m!183029 () Bool)

(assert (=> b!120950 m!183029))

(declare-fun m!183031 () Bool)

(assert (=> b!120952 m!183031))

(declare-fun m!183033 () Bool)

(assert (=> b!120951 m!183033))

(assert (=> b!120951 m!183033))

(declare-fun m!183035 () Bool)

(assert (=> b!120951 m!183035))

(declare-fun m!183037 () Bool)

(assert (=> b!120944 m!183037))

(declare-fun m!183039 () Bool)

(assert (=> start!23912 m!183039))

(declare-fun m!183041 () Bool)

(assert (=> b!120949 m!183041))

(declare-fun m!183043 () Bool)

(assert (=> b!120947 m!183043))

(declare-fun m!183045 () Bool)

(assert (=> b!120948 m!183045))

(declare-fun m!183047 () Bool)

(assert (=> b!120948 m!183047))

(declare-fun m!183049 () Bool)

(assert (=> b!120948 m!183049))

(declare-fun m!183051 () Bool)

(assert (=> b!120948 m!183051))

(declare-fun m!183053 () Bool)

(assert (=> b!120948 m!183053))

(declare-fun m!183055 () Bool)

(assert (=> b!120948 m!183055))

(declare-fun m!183057 () Bool)

(assert (=> b!120948 m!183057))

(declare-fun m!183059 () Bool)

(assert (=> b!120948 m!183059))

(declare-fun m!183061 () Bool)

(assert (=> b!120945 m!183061))

(declare-fun m!183063 () Bool)

(assert (=> b!120953 m!183063))

(assert (=> b!120954 m!183051))

(assert (=> b!120954 m!183053))

(declare-fun m!183065 () Bool)

(assert (=> b!120942 m!183065))

(declare-fun m!183067 () Bool)

(assert (=> b!120942 m!183067))

(declare-fun m!183069 () Bool)

(assert (=> b!120942 m!183069))

(declare-fun m!183071 () Bool)

(assert (=> b!120942 m!183071))

(declare-fun m!183073 () Bool)

(assert (=> b!120942 m!183073))

(declare-fun m!183075 () Bool)

(assert (=> b!120942 m!183075))

(declare-fun m!183077 () Bool)

(assert (=> b!120942 m!183077))

(declare-fun m!183079 () Bool)

(assert (=> b!120942 m!183079))

(declare-fun m!183081 () Bool)

(assert (=> b!120942 m!183081))

(declare-fun m!183083 () Bool)

(assert (=> b!120942 m!183083))

(declare-fun m!183085 () Bool)

(assert (=> b!120942 m!183085))

(declare-fun m!183087 () Bool)

(assert (=> b!120942 m!183087))

(declare-fun m!183089 () Bool)

(assert (=> b!120942 m!183089))

(declare-fun m!183091 () Bool)

(assert (=> b!120942 m!183091))

(declare-fun m!183093 () Bool)

(assert (=> b!120942 m!183093))

(declare-fun m!183095 () Bool)

(assert (=> b!120942 m!183095))

(declare-fun m!183097 () Bool)

(assert (=> b!120942 m!183097))

(declare-fun m!183099 () Bool)

(assert (=> b!120942 m!183099))

(declare-fun m!183101 () Bool)

(assert (=> b!120942 m!183101))

(push 1)

(assert (not b!120949))

(assert (not start!23912))

(assert (not b!120947))

(assert (not b!120954))

(assert (not b!120953))

(assert (not b!120951))

(assert (not b!120948))

(assert (not b!120945))

(assert (not b!120950))

(assert (not b!120942))

(assert (not b!120952))

(assert (not b!120944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

