; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25532 () Bool)

(assert start!25532)

(declare-fun b!129937 () Bool)

(declare-fun e!86118 () Bool)

(declare-datatypes ((array!6017 0))(
  ( (array!6018 (arr!3341 (Array (_ BitVec 32) (_ BitVec 8))) (size!2724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4712 0))(
  ( (BitStream!4713 (buf!3082 array!6017) (currentByte!5843 (_ BitVec 32)) (currentBit!5838 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4712)

(declare-fun array_inv!2513 (array!6017) Bool)

(assert (=> b!129937 (= e!86118 (array_inv!2513 (buf!3082 thiss!1634)))))

(declare-fun res!107666 () Bool)

(declare-fun e!86111 () Bool)

(assert (=> start!25532 (=> (not res!107666) (not e!86111))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6017)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25532 (= res!107666 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2724 arr!237))))))

(assert (=> start!25532 e!86111))

(assert (=> start!25532 true))

(assert (=> start!25532 (array_inv!2513 arr!237)))

(declare-fun inv!12 (BitStream!4712) Bool)

(assert (=> start!25532 (and (inv!12 thiss!1634) e!86118)))

(declare-fun b!129938 () Bool)

(declare-fun res!107669 () Bool)

(assert (=> b!129938 (=> (not res!107669) (not e!86111))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129938 (= res!107669 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2724 (buf!3082 thiss!1634))) ((_ sign_extend 32) (currentByte!5843 thiss!1634)) ((_ sign_extend 32) (currentBit!5838 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun e!86117 () Bool)

(declare-datatypes ((tuple2!11150 0))(
  ( (tuple2!11151 (_1!5872 BitStream!4712) (_2!5872 BitStream!4712)) )
))
(declare-fun lt!200489 () tuple2!11150)

(declare-datatypes ((tuple2!11152 0))(
  ( (tuple2!11153 (_1!5873 BitStream!4712) (_2!5873 (_ BitVec 8))) )
))
(declare-fun lt!200484 () tuple2!11152)

(declare-fun b!129939 () Bool)

(assert (=> b!129939 (= e!86117 (and (= (_2!5873 lt!200484) (select (arr!3341 arr!237) from!447)) (= (_1!5873 lt!200484) (_2!5872 lt!200489))))))

(declare-fun readBytePure!0 (BitStream!4712) tuple2!11152)

(assert (=> b!129939 (= lt!200484 (readBytePure!0 (_1!5872 lt!200489)))))

(declare-datatypes ((Unit!8053 0))(
  ( (Unit!8054) )
))
(declare-datatypes ((tuple2!11154 0))(
  ( (tuple2!11155 (_1!5874 Unit!8053) (_2!5874 BitStream!4712)) )
))
(declare-fun lt!200479 () tuple2!11154)

(declare-fun reader!0 (BitStream!4712 BitStream!4712) tuple2!11150)

(assert (=> b!129939 (= lt!200489 (reader!0 thiss!1634 (_2!5874 lt!200479)))))

(declare-fun b!129940 () Bool)

(declare-datatypes ((tuple2!11156 0))(
  ( (tuple2!11157 (_1!5875 BitStream!4712) (_2!5875 array!6017)) )
))
(declare-fun lt!200487 () tuple2!11156)

(declare-fun e!86115 () Bool)

(declare-fun arrayRangesEq!127 (array!6017 array!6017 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129940 (= e!86115 (not (arrayRangesEq!127 arr!237 (_2!5875 lt!200487) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129941 () Bool)

(declare-fun res!107665 () Bool)

(assert (=> b!129941 (=> (not res!107665) (not e!86111))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129941 (= res!107665 (invariant!0 (currentBit!5838 thiss!1634) (currentByte!5843 thiss!1634) (size!2724 (buf!3082 thiss!1634))))))

(declare-fun b!129942 () Bool)

(declare-fun res!107668 () Bool)

(assert (=> b!129942 (=> (not res!107668) (not e!86117))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129942 (= res!107668 (= (bitIndex!0 (size!2724 (buf!3082 (_2!5874 lt!200479))) (currentByte!5843 (_2!5874 lt!200479)) (currentBit!5838 (_2!5874 lt!200479))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2724 (buf!3082 thiss!1634)) (currentByte!5843 thiss!1634) (currentBit!5838 thiss!1634)))))))

(declare-fun b!129943 () Bool)

(declare-fun e!86114 () Bool)

(declare-fun lt!200490 () tuple2!11152)

(declare-fun lt!200481 () tuple2!11152)

(assert (=> b!129943 (= e!86114 (= (_2!5873 lt!200490) (_2!5873 lt!200481)))))

(declare-fun b!129944 () Bool)

(declare-fun e!86116 () Bool)

(assert (=> b!129944 (= e!86116 (invariant!0 (currentBit!5838 thiss!1634) (currentByte!5843 thiss!1634) (size!2724 (buf!3082 (_2!5874 lt!200479)))))))

(declare-fun b!129945 () Bool)

(declare-fun res!107671 () Bool)

(assert (=> b!129945 (=> (not res!107671) (not e!86111))))

(assert (=> b!129945 (= res!107671 (bvslt from!447 to!404))))

(declare-fun b!129946 () Bool)

(declare-fun res!107667 () Bool)

(assert (=> b!129946 (=> (not res!107667) (not e!86117))))

(declare-fun isPrefixOf!0 (BitStream!4712 BitStream!4712) Bool)

(assert (=> b!129946 (= res!107667 (isPrefixOf!0 thiss!1634 (_2!5874 lt!200479)))))

(declare-fun b!129947 () Bool)

(declare-fun e!86112 () Bool)

(declare-fun e!86120 () Bool)

(assert (=> b!129947 (= e!86112 e!86120)))

(declare-fun res!107670 () Bool)

(assert (=> b!129947 (=> (not res!107670) (not e!86120))))

(declare-fun lt!200491 () tuple2!11154)

(declare-fun lt!200492 () (_ BitVec 64))

(assert (=> b!129947 (= res!107670 (= (bitIndex!0 (size!2724 (buf!3082 (_2!5874 lt!200491))) (currentByte!5843 (_2!5874 lt!200491)) (currentBit!5838 (_2!5874 lt!200491))) (bvadd (bitIndex!0 (size!2724 (buf!3082 (_2!5874 lt!200479))) (currentByte!5843 (_2!5874 lt!200479)) (currentBit!5838 (_2!5874 lt!200479))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200492))))))

(assert (=> b!129947 (= lt!200492 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129948 () Bool)

(assert (=> b!129948 (= e!86111 (not true))))

(assert (=> b!129948 e!86114))

(declare-fun res!107674 () Bool)

(assert (=> b!129948 (=> (not res!107674) (not e!86114))))

(assert (=> b!129948 (= res!107674 (= (bitIndex!0 (size!2724 (buf!3082 (_1!5873 lt!200490))) (currentByte!5843 (_1!5873 lt!200490)) (currentBit!5838 (_1!5873 lt!200490))) (bitIndex!0 (size!2724 (buf!3082 (_1!5873 lt!200481))) (currentByte!5843 (_1!5873 lt!200481)) (currentBit!5838 (_1!5873 lt!200481)))))))

(declare-fun lt!200488 () Unit!8053)

(declare-fun lt!200485 () BitStream!4712)

(declare-fun readBytePrefixLemma!0 (BitStream!4712 BitStream!4712) Unit!8053)

(assert (=> b!129948 (= lt!200488 (readBytePrefixLemma!0 lt!200485 (_2!5874 lt!200491)))))

(assert (=> b!129948 (= lt!200481 (readBytePure!0 (BitStream!4713 (buf!3082 (_2!5874 lt!200491)) (currentByte!5843 thiss!1634) (currentBit!5838 thiss!1634))))))

(assert (=> b!129948 (= lt!200490 (readBytePure!0 lt!200485))))

(assert (=> b!129948 (= lt!200485 (BitStream!4713 (buf!3082 (_2!5874 lt!200479)) (currentByte!5843 thiss!1634) (currentBit!5838 thiss!1634)))))

(assert (=> b!129948 e!86116))

(declare-fun res!107672 () Bool)

(assert (=> b!129948 (=> (not res!107672) (not e!86116))))

(assert (=> b!129948 (= res!107672 (isPrefixOf!0 thiss!1634 (_2!5874 lt!200491)))))

(declare-fun lt!200480 () Unit!8053)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4712 BitStream!4712 BitStream!4712) Unit!8053)

(assert (=> b!129948 (= lt!200480 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5874 lt!200479) (_2!5874 lt!200491)))))

(assert (=> b!129948 e!86112))

(declare-fun res!107673 () Bool)

(assert (=> b!129948 (=> (not res!107673) (not e!86112))))

(assert (=> b!129948 (= res!107673 (= (size!2724 (buf!3082 (_2!5874 lt!200479))) (size!2724 (buf!3082 (_2!5874 lt!200491)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4712 array!6017 (_ BitVec 32) (_ BitVec 32)) tuple2!11154)

(assert (=> b!129948 (= lt!200491 (appendByteArrayLoop!0 (_2!5874 lt!200479) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129948 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2724 (buf!3082 (_2!5874 lt!200479)))) ((_ sign_extend 32) (currentByte!5843 (_2!5874 lt!200479))) ((_ sign_extend 32) (currentBit!5838 (_2!5874 lt!200479))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200483 () Unit!8053)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4712 BitStream!4712 (_ BitVec 64) (_ BitVec 32)) Unit!8053)

(assert (=> b!129948 (= lt!200483 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5874 lt!200479) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129948 e!86117))

(declare-fun res!107664 () Bool)

(assert (=> b!129948 (=> (not res!107664) (not e!86117))))

(assert (=> b!129948 (= res!107664 (= (size!2724 (buf!3082 thiss!1634)) (size!2724 (buf!3082 (_2!5874 lt!200479)))))))

(declare-fun appendByte!0 (BitStream!4712 (_ BitVec 8)) tuple2!11154)

(assert (=> b!129948 (= lt!200479 (appendByte!0 thiss!1634 (select (arr!3341 arr!237) from!447)))))

(declare-fun b!129949 () Bool)

(declare-fun res!107663 () Bool)

(assert (=> b!129949 (=> (not res!107663) (not e!86120))))

(assert (=> b!129949 (= res!107663 (isPrefixOf!0 (_2!5874 lt!200479) (_2!5874 lt!200491)))))

(declare-fun b!129950 () Bool)

(assert (=> b!129950 (= e!86120 (not e!86115))))

(declare-fun res!107662 () Bool)

(assert (=> b!129950 (=> res!107662 e!86115)))

(declare-fun lt!200482 () tuple2!11150)

(assert (=> b!129950 (= res!107662 (or (not (= (size!2724 (_2!5875 lt!200487)) (size!2724 arr!237))) (not (= (_1!5875 lt!200487) (_2!5872 lt!200482)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4712 array!6017 (_ BitVec 32) (_ BitVec 32)) tuple2!11156)

(assert (=> b!129950 (= lt!200487 (readByteArrayLoopPure!0 (_1!5872 lt!200482) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129950 (validate_offset_bits!1 ((_ sign_extend 32) (size!2724 (buf!3082 (_2!5874 lt!200491)))) ((_ sign_extend 32) (currentByte!5843 (_2!5874 lt!200479))) ((_ sign_extend 32) (currentBit!5838 (_2!5874 lt!200479))) lt!200492)))

(declare-fun lt!200486 () Unit!8053)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4712 array!6017 (_ BitVec 64)) Unit!8053)

(assert (=> b!129950 (= lt!200486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5874 lt!200479) (buf!3082 (_2!5874 lt!200491)) lt!200492))))

(assert (=> b!129950 (= lt!200482 (reader!0 (_2!5874 lt!200479) (_2!5874 lt!200491)))))

(assert (= (and start!25532 res!107666) b!129938))

(assert (= (and b!129938 res!107669) b!129945))

(assert (= (and b!129945 res!107671) b!129941))

(assert (= (and b!129941 res!107665) b!129948))

(assert (= (and b!129948 res!107664) b!129942))

(assert (= (and b!129942 res!107668) b!129946))

(assert (= (and b!129946 res!107667) b!129939))

(assert (= (and b!129948 res!107673) b!129947))

(assert (= (and b!129947 res!107670) b!129949))

(assert (= (and b!129949 res!107663) b!129950))

(assert (= (and b!129950 (not res!107662)) b!129940))

(assert (= (and b!129948 res!107672) b!129944))

(assert (= (and b!129948 res!107674) b!129943))

(assert (= start!25532 b!129937))

(declare-fun m!195901 () Bool)

(assert (=> b!129941 m!195901))

(declare-fun m!195903 () Bool)

(assert (=> b!129950 m!195903))

(declare-fun m!195905 () Bool)

(assert (=> b!129950 m!195905))

(declare-fun m!195907 () Bool)

(assert (=> b!129950 m!195907))

(declare-fun m!195909 () Bool)

(assert (=> b!129950 m!195909))

(declare-fun m!195911 () Bool)

(assert (=> b!129946 m!195911))

(declare-fun m!195913 () Bool)

(assert (=> b!129947 m!195913))

(declare-fun m!195915 () Bool)

(assert (=> b!129947 m!195915))

(declare-fun m!195917 () Bool)

(assert (=> b!129937 m!195917))

(declare-fun m!195919 () Bool)

(assert (=> start!25532 m!195919))

(declare-fun m!195921 () Bool)

(assert (=> start!25532 m!195921))

(declare-fun m!195923 () Bool)

(assert (=> b!129939 m!195923))

(declare-fun m!195925 () Bool)

(assert (=> b!129939 m!195925))

(declare-fun m!195927 () Bool)

(assert (=> b!129939 m!195927))

(declare-fun m!195929 () Bool)

(assert (=> b!129949 m!195929))

(assert (=> b!129942 m!195915))

(declare-fun m!195931 () Bool)

(assert (=> b!129942 m!195931))

(declare-fun m!195933 () Bool)

(assert (=> b!129944 m!195933))

(declare-fun m!195935 () Bool)

(assert (=> b!129938 m!195935))

(declare-fun m!195937 () Bool)

(assert (=> b!129940 m!195937))

(declare-fun m!195939 () Bool)

(assert (=> b!129948 m!195939))

(declare-fun m!195941 () Bool)

(assert (=> b!129948 m!195941))

(declare-fun m!195943 () Bool)

(assert (=> b!129948 m!195943))

(declare-fun m!195945 () Bool)

(assert (=> b!129948 m!195945))

(declare-fun m!195947 () Bool)

(assert (=> b!129948 m!195947))

(declare-fun m!195949 () Bool)

(assert (=> b!129948 m!195949))

(declare-fun m!195951 () Bool)

(assert (=> b!129948 m!195951))

(declare-fun m!195953 () Bool)

(assert (=> b!129948 m!195953))

(assert (=> b!129948 m!195923))

(declare-fun m!195955 () Bool)

(assert (=> b!129948 m!195955))

(declare-fun m!195957 () Bool)

(assert (=> b!129948 m!195957))

(declare-fun m!195959 () Bool)

(assert (=> b!129948 m!195959))

(assert (=> b!129948 m!195923))

(push 1)

(assert (not b!129950))

(assert (not start!25532))

(assert (not b!129944))

(assert (not b!129939))

(assert (not b!129947))

(assert (not b!129949))

(assert (not b!129948))

(assert (not b!129941))

(assert (not b!129937))

(assert (not b!129938))

(assert (not b!129940))

(assert (not b!129942))

(assert (not b!129946))

(check-sat)

