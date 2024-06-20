; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27786 () Bool)

(assert start!27786)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6543 0))(
  ( (array!6544 (arr!3684 (Array (_ BitVec 32) (_ BitVec 8))) (size!2961 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5180 0))(
  ( (BitStream!5181 (buf!3390 array!6543) (currentByte!6274 (_ BitVec 32)) (currentBit!6269 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12720 0))(
  ( (tuple2!12721 (_1!6701 BitStream!5180) (_2!6701 array!6543)) )
))
(declare-fun lt!221963 () tuple2!12720)

(declare-fun arr!237 () array!6543)

(declare-fun b!143122 () Bool)

(declare-fun e!95323 () Bool)

(declare-fun arrayRangesEq!277 (array!6543 array!6543 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143122 (= e!95323 (not (arrayRangesEq!277 arr!237 (_2!6701 lt!221963) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143123 () Bool)

(declare-fun res!119511 () Bool)

(declare-fun e!95328 () Bool)

(assert (=> b!143123 (=> (not res!119511) (not e!95328))))

(declare-fun thiss!1634 () BitStream!5180)

(declare-datatypes ((Unit!8922 0))(
  ( (Unit!8923) )
))
(declare-datatypes ((tuple2!12722 0))(
  ( (tuple2!12723 (_1!6702 Unit!8922) (_2!6702 BitStream!5180)) )
))
(declare-fun lt!221953 () tuple2!12722)

(declare-fun isPrefixOf!0 (BitStream!5180 BitStream!5180) Bool)

(assert (=> b!143123 (= res!119511 (isPrefixOf!0 thiss!1634 (_2!6702 lt!221953)))))

(declare-fun b!143124 () Bool)

(declare-fun e!95329 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!143124 (= e!95329 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!12724 0))(
  ( (tuple2!12725 (_1!6703 BitStream!5180) (_2!6703 BitStream!5180)) )
))
(declare-fun lt!221961 () tuple2!12724)

(declare-datatypes ((tuple2!12726 0))(
  ( (tuple2!12727 (_1!6704 BitStream!5180) (_2!6704 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5180) tuple2!12726)

(assert (=> b!143124 (= (_2!6704 (readBytePure!0 (_1!6703 lt!221961))) (select (arr!3684 arr!237) from!447))))

(declare-fun lt!221959 () tuple2!12724)

(declare-fun lt!221960 () tuple2!12722)

(declare-fun reader!0 (BitStream!5180 BitStream!5180) tuple2!12724)

(assert (=> b!143124 (= lt!221959 (reader!0 (_2!6702 lt!221953) (_2!6702 lt!221960)))))

(assert (=> b!143124 (= lt!221961 (reader!0 thiss!1634 (_2!6702 lt!221960)))))

(declare-fun e!95325 () Bool)

(assert (=> b!143124 e!95325))

(declare-fun res!119509 () Bool)

(assert (=> b!143124 (=> (not res!119509) (not e!95325))))

(declare-fun lt!221968 () tuple2!12726)

(declare-fun lt!221956 () tuple2!12726)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143124 (= res!119509 (= (bitIndex!0 (size!2961 (buf!3390 (_1!6704 lt!221968))) (currentByte!6274 (_1!6704 lt!221968)) (currentBit!6269 (_1!6704 lt!221968))) (bitIndex!0 (size!2961 (buf!3390 (_1!6704 lt!221956))) (currentByte!6274 (_1!6704 lt!221956)) (currentBit!6269 (_1!6704 lt!221956)))))))

(declare-fun lt!221957 () Unit!8922)

(declare-fun lt!221955 () BitStream!5180)

(declare-fun readBytePrefixLemma!0 (BitStream!5180 BitStream!5180) Unit!8922)

(assert (=> b!143124 (= lt!221957 (readBytePrefixLemma!0 lt!221955 (_2!6702 lt!221960)))))

(assert (=> b!143124 (= lt!221956 (readBytePure!0 (BitStream!5181 (buf!3390 (_2!6702 lt!221960)) (currentByte!6274 thiss!1634) (currentBit!6269 thiss!1634))))))

(assert (=> b!143124 (= lt!221968 (readBytePure!0 lt!221955))))

(assert (=> b!143124 (= lt!221955 (BitStream!5181 (buf!3390 (_2!6702 lt!221953)) (currentByte!6274 thiss!1634) (currentBit!6269 thiss!1634)))))

(declare-fun e!95322 () Bool)

(assert (=> b!143124 e!95322))

(declare-fun res!119508 () Bool)

(assert (=> b!143124 (=> (not res!119508) (not e!95322))))

(assert (=> b!143124 (= res!119508 (isPrefixOf!0 thiss!1634 (_2!6702 lt!221960)))))

(declare-fun lt!221967 () Unit!8922)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5180 BitStream!5180 BitStream!5180) Unit!8922)

(assert (=> b!143124 (= lt!221967 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6702 lt!221953) (_2!6702 lt!221960)))))

(declare-fun e!95326 () Bool)

(assert (=> b!143124 e!95326))

(declare-fun res!119506 () Bool)

(assert (=> b!143124 (=> (not res!119506) (not e!95326))))

(assert (=> b!143124 (= res!119506 (= (size!2961 (buf!3390 (_2!6702 lt!221953))) (size!2961 (buf!3390 (_2!6702 lt!221960)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5180 array!6543 (_ BitVec 32) (_ BitVec 32)) tuple2!12722)

(assert (=> b!143124 (= lt!221960 (appendByteArrayLoop!0 (_2!6702 lt!221953) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143124 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2961 (buf!3390 (_2!6702 lt!221953)))) ((_ sign_extend 32) (currentByte!6274 (_2!6702 lt!221953))) ((_ sign_extend 32) (currentBit!6269 (_2!6702 lt!221953))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221954 () Unit!8922)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5180 BitStream!5180 (_ BitVec 64) (_ BitVec 32)) Unit!8922)

(assert (=> b!143124 (= lt!221954 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6702 lt!221953) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143124 e!95328))

(declare-fun res!119505 () Bool)

(assert (=> b!143124 (=> (not res!119505) (not e!95328))))

(assert (=> b!143124 (= res!119505 (= (size!2961 (buf!3390 thiss!1634)) (size!2961 (buf!3390 (_2!6702 lt!221953)))))))

(declare-fun appendByte!0 (BitStream!5180 (_ BitVec 8)) tuple2!12722)

(assert (=> b!143124 (= lt!221953 (appendByte!0 thiss!1634 (select (arr!3684 arr!237) from!447)))))

(declare-fun res!119514 () Bool)

(assert (=> start!27786 (=> (not res!119514) (not e!95329))))

(assert (=> start!27786 (= res!119514 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2961 arr!237))))))

(assert (=> start!27786 e!95329))

(assert (=> start!27786 true))

(declare-fun array_inv!2750 (array!6543) Bool)

(assert (=> start!27786 (array_inv!2750 arr!237)))

(declare-fun e!95327 () Bool)

(declare-fun inv!12 (BitStream!5180) Bool)

(assert (=> start!27786 (and (inv!12 thiss!1634) e!95327)))

(declare-fun b!143125 () Bool)

(assert (=> b!143125 (= e!95327 (array_inv!2750 (buf!3390 thiss!1634)))))

(declare-fun b!143126 () Bool)

(declare-fun res!119513 () Bool)

(assert (=> b!143126 (=> (not res!119513) (not e!95329))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143126 (= res!119513 (invariant!0 (currentBit!6269 thiss!1634) (currentByte!6274 thiss!1634) (size!2961 (buf!3390 thiss!1634))))))

(declare-fun b!143127 () Bool)

(declare-fun e!95330 () Bool)

(assert (=> b!143127 (= e!95330 (not e!95323))))

(declare-fun res!119510 () Bool)

(assert (=> b!143127 (=> res!119510 e!95323)))

(declare-fun lt!221965 () tuple2!12724)

(assert (=> b!143127 (= res!119510 (or (not (= (size!2961 (_2!6701 lt!221963)) (size!2961 arr!237))) (not (= (_1!6701 lt!221963) (_2!6703 lt!221965)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5180 array!6543 (_ BitVec 32) (_ BitVec 32)) tuple2!12720)

(assert (=> b!143127 (= lt!221963 (readByteArrayLoopPure!0 (_1!6703 lt!221965) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221958 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143127 (validate_offset_bits!1 ((_ sign_extend 32) (size!2961 (buf!3390 (_2!6702 lt!221960)))) ((_ sign_extend 32) (currentByte!6274 (_2!6702 lt!221953))) ((_ sign_extend 32) (currentBit!6269 (_2!6702 lt!221953))) lt!221958)))

(declare-fun lt!221962 () Unit!8922)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5180 array!6543 (_ BitVec 64)) Unit!8922)

(assert (=> b!143127 (= lt!221962 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6702 lt!221953) (buf!3390 (_2!6702 lt!221960)) lt!221958))))

(assert (=> b!143127 (= lt!221965 (reader!0 (_2!6702 lt!221953) (_2!6702 lt!221960)))))

(declare-fun b!143128 () Bool)

(declare-fun res!119516 () Bool)

(assert (=> b!143128 (=> (not res!119516) (not e!95329))))

(assert (=> b!143128 (= res!119516 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2961 (buf!3390 thiss!1634))) ((_ sign_extend 32) (currentByte!6274 thiss!1634)) ((_ sign_extend 32) (currentBit!6269 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143129 () Bool)

(assert (=> b!143129 (= e!95325 (= (_2!6704 lt!221968) (_2!6704 lt!221956)))))

(declare-fun b!143130 () Bool)

(declare-fun res!119515 () Bool)

(assert (=> b!143130 (=> (not res!119515) (not e!95330))))

(assert (=> b!143130 (= res!119515 (isPrefixOf!0 (_2!6702 lt!221953) (_2!6702 lt!221960)))))

(declare-fun b!143131 () Bool)

(declare-fun res!119512 () Bool)

(assert (=> b!143131 (=> (not res!119512) (not e!95329))))

(assert (=> b!143131 (= res!119512 (bvslt from!447 to!404))))

(declare-fun b!143132 () Bool)

(declare-fun res!119504 () Bool)

(assert (=> b!143132 (=> (not res!119504) (not e!95328))))

(assert (=> b!143132 (= res!119504 (= (bitIndex!0 (size!2961 (buf!3390 (_2!6702 lt!221953))) (currentByte!6274 (_2!6702 lt!221953)) (currentBit!6269 (_2!6702 lt!221953))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2961 (buf!3390 thiss!1634)) (currentByte!6274 thiss!1634) (currentBit!6269 thiss!1634)))))))

(declare-fun b!143133 () Bool)

(assert (=> b!143133 (= e!95326 e!95330)))

(declare-fun res!119507 () Bool)

(assert (=> b!143133 (=> (not res!119507) (not e!95330))))

(assert (=> b!143133 (= res!119507 (= (bitIndex!0 (size!2961 (buf!3390 (_2!6702 lt!221960))) (currentByte!6274 (_2!6702 lt!221960)) (currentBit!6269 (_2!6702 lt!221960))) (bvadd (bitIndex!0 (size!2961 (buf!3390 (_2!6702 lt!221953))) (currentByte!6274 (_2!6702 lt!221953)) (currentBit!6269 (_2!6702 lt!221953))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221958))))))

(assert (=> b!143133 (= lt!221958 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143134 () Bool)

(assert (=> b!143134 (= e!95322 (invariant!0 (currentBit!6269 thiss!1634) (currentByte!6274 thiss!1634) (size!2961 (buf!3390 (_2!6702 lt!221953)))))))

(declare-fun lt!221966 () tuple2!12726)

(declare-fun b!143135 () Bool)

(declare-fun lt!221964 () tuple2!12724)

(assert (=> b!143135 (= e!95328 (and (= (_2!6704 lt!221966) (select (arr!3684 arr!237) from!447)) (= (_1!6704 lt!221966) (_2!6703 lt!221964))))))

(assert (=> b!143135 (= lt!221966 (readBytePure!0 (_1!6703 lt!221964)))))

(assert (=> b!143135 (= lt!221964 (reader!0 thiss!1634 (_2!6702 lt!221953)))))

(assert (= (and start!27786 res!119514) b!143128))

(assert (= (and b!143128 res!119516) b!143131))

(assert (= (and b!143131 res!119512) b!143126))

(assert (= (and b!143126 res!119513) b!143124))

(assert (= (and b!143124 res!119505) b!143132))

(assert (= (and b!143132 res!119504) b!143123))

(assert (= (and b!143123 res!119511) b!143135))

(assert (= (and b!143124 res!119506) b!143133))

(assert (= (and b!143133 res!119507) b!143130))

(assert (= (and b!143130 res!119515) b!143127))

(assert (= (and b!143127 (not res!119510)) b!143122))

(assert (= (and b!143124 res!119508) b!143134))

(assert (= (and b!143124 res!119509) b!143129))

(assert (= start!27786 b!143125))

(declare-fun m!219741 () Bool)

(assert (=> b!143125 m!219741))

(declare-fun m!219743 () Bool)

(assert (=> b!143130 m!219743))

(declare-fun m!219745 () Bool)

(assert (=> b!143124 m!219745))

(declare-fun m!219747 () Bool)

(assert (=> b!143124 m!219747))

(declare-fun m!219749 () Bool)

(assert (=> b!143124 m!219749))

(declare-fun m!219751 () Bool)

(assert (=> b!143124 m!219751))

(declare-fun m!219753 () Bool)

(assert (=> b!143124 m!219753))

(declare-fun m!219755 () Bool)

(assert (=> b!143124 m!219755))

(declare-fun m!219757 () Bool)

(assert (=> b!143124 m!219757))

(assert (=> b!143124 m!219755))

(declare-fun m!219759 () Bool)

(assert (=> b!143124 m!219759))

(declare-fun m!219761 () Bool)

(assert (=> b!143124 m!219761))

(declare-fun m!219763 () Bool)

(assert (=> b!143124 m!219763))

(declare-fun m!219765 () Bool)

(assert (=> b!143124 m!219765))

(declare-fun m!219767 () Bool)

(assert (=> b!143124 m!219767))

(declare-fun m!219769 () Bool)

(assert (=> b!143124 m!219769))

(declare-fun m!219771 () Bool)

(assert (=> b!143124 m!219771))

(declare-fun m!219773 () Bool)

(assert (=> b!143124 m!219773))

(declare-fun m!219775 () Bool)

(assert (=> b!143134 m!219775))

(declare-fun m!219777 () Bool)

(assert (=> b!143123 m!219777))

(declare-fun m!219779 () Bool)

(assert (=> b!143127 m!219779))

(declare-fun m!219781 () Bool)

(assert (=> b!143127 m!219781))

(declare-fun m!219783 () Bool)

(assert (=> b!143127 m!219783))

(assert (=> b!143127 m!219753))

(declare-fun m!219785 () Bool)

(assert (=> b!143122 m!219785))

(assert (=> b!143135 m!219755))

(declare-fun m!219787 () Bool)

(assert (=> b!143135 m!219787))

(declare-fun m!219789 () Bool)

(assert (=> b!143135 m!219789))

(declare-fun m!219791 () Bool)

(assert (=> b!143132 m!219791))

(declare-fun m!219793 () Bool)

(assert (=> b!143132 m!219793))

(declare-fun m!219795 () Bool)

(assert (=> b!143133 m!219795))

(assert (=> b!143133 m!219791))

(declare-fun m!219797 () Bool)

(assert (=> start!27786 m!219797))

(declare-fun m!219799 () Bool)

(assert (=> start!27786 m!219799))

(declare-fun m!219801 () Bool)

(assert (=> b!143128 m!219801))

(declare-fun m!219803 () Bool)

(assert (=> b!143126 m!219803))

(push 1)

(assert (not b!143124))

(assert (not b!143122))

(assert (not b!143135))

(assert (not b!143132))

(assert (not b!143123))

(assert (not b!143126))

(assert (not b!143134))

(assert (not b!143133))

(assert (not b!143125))

(assert (not b!143130))

(assert (not b!143127))

(assert (not start!27786))

(assert (not b!143128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

