; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28006 () Bool)

(assert start!28006)

(declare-fun b!144935 () Bool)

(declare-fun res!121150 () Bool)

(declare-fun e!96609 () Bool)

(assert (=> b!144935 (=> (not res!121150) (not e!96609))))

(declare-datatypes ((array!6598 0))(
  ( (array!6599 (arr!3720 (Array (_ BitVec 32) (_ BitVec 8))) (size!2987 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5232 0))(
  ( (BitStream!5233 (buf!3426 array!6598) (currentByte!6316 (_ BitVec 32)) (currentBit!6311 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9047 0))(
  ( (Unit!9048) )
))
(declare-datatypes ((tuple2!12938 0))(
  ( (tuple2!12939 (_1!6815 Unit!9047) (_2!6815 BitStream!5232)) )
))
(declare-fun lt!224622 () tuple2!12938)

(declare-fun lt!224614 () tuple2!12938)

(declare-fun isPrefixOf!0 (BitStream!5232 BitStream!5232) Bool)

(assert (=> b!144935 (= res!121150 (isPrefixOf!0 (_2!6815 lt!224622) (_2!6815 lt!224614)))))

(declare-fun b!144936 () Bool)

(declare-fun res!121156 () Bool)

(declare-fun e!96606 () Bool)

(assert (=> b!144936 (=> (not res!121156) (not e!96606))))

(declare-fun thiss!1634 () BitStream!5232)

(assert (=> b!144936 (= res!121156 (isPrefixOf!0 thiss!1634 (_2!6815 lt!224622)))))

(declare-fun b!144937 () Bool)

(declare-fun res!121147 () Bool)

(assert (=> b!144937 (=> (not res!121147) (not e!96606))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144937 (= res!121147 (= (bitIndex!0 (size!2987 (buf!3426 (_2!6815 lt!224622))) (currentByte!6316 (_2!6815 lt!224622)) (currentBit!6311 (_2!6815 lt!224622))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2987 (buf!3426 thiss!1634)) (currentByte!6316 thiss!1634) (currentBit!6311 thiss!1634)))))))

(declare-fun res!121144 () Bool)

(declare-fun e!96602 () Bool)

(assert (=> start!28006 (=> (not res!121144) (not e!96602))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6598)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28006 (= res!121144 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2987 arr!237))))))

(assert (=> start!28006 e!96602))

(assert (=> start!28006 true))

(declare-fun array_inv!2776 (array!6598) Bool)

(assert (=> start!28006 (array_inv!2776 arr!237)))

(declare-fun e!96610 () Bool)

(declare-fun inv!12 (BitStream!5232) Bool)

(assert (=> start!28006 (and (inv!12 thiss!1634) e!96610)))

(declare-fun e!96604 () Bool)

(declare-datatypes ((tuple2!12940 0))(
  ( (tuple2!12941 (_1!6816 BitStream!5232) (_2!6816 array!6598)) )
))
(declare-fun lt!224610 () tuple2!12940)

(declare-fun b!144938 () Bool)

(declare-fun arrayRangesEq!303 (array!6598 array!6598 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144938 (= e!96604 (not (arrayRangesEq!303 arr!237 (_2!6816 lt!224610) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144939 () Bool)

(declare-fun e!96603 () Bool)

(declare-datatypes ((tuple2!12942 0))(
  ( (tuple2!12943 (_1!6817 BitStream!5232) (_2!6817 (_ BitVec 8))) )
))
(declare-fun lt!224623 () tuple2!12942)

(declare-fun lt!224609 () tuple2!12942)

(assert (=> b!144939 (= e!96603 (= (_2!6817 lt!224623) (_2!6817 lt!224609)))))

(declare-fun b!144940 () Bool)

(assert (=> b!144940 (= e!96609 (not e!96604))))

(declare-fun res!121148 () Bool)

(assert (=> b!144940 (=> res!121148 e!96604)))

(declare-datatypes ((tuple2!12944 0))(
  ( (tuple2!12945 (_1!6818 BitStream!5232) (_2!6818 BitStream!5232)) )
))
(declare-fun lt!224625 () tuple2!12944)

(assert (=> b!144940 (= res!121148 (or (not (= (size!2987 (_2!6816 lt!224610)) (size!2987 arr!237))) (not (= (_1!6816 lt!224610) (_2!6818 lt!224625)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5232 array!6598 (_ BitVec 32) (_ BitVec 32)) tuple2!12940)

(assert (=> b!144940 (= lt!224610 (readByteArrayLoopPure!0 (_1!6818 lt!224625) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224620 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144940 (validate_offset_bits!1 ((_ sign_extend 32) (size!2987 (buf!3426 (_2!6815 lt!224614)))) ((_ sign_extend 32) (currentByte!6316 (_2!6815 lt!224622))) ((_ sign_extend 32) (currentBit!6311 (_2!6815 lt!224622))) lt!224620)))

(declare-fun lt!224621 () Unit!9047)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5232 array!6598 (_ BitVec 64)) Unit!9047)

(assert (=> b!144940 (= lt!224621 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6815 lt!224622) (buf!3426 (_2!6815 lt!224614)) lt!224620))))

(declare-fun reader!0 (BitStream!5232 BitStream!5232) tuple2!12944)

(assert (=> b!144940 (= lt!224625 (reader!0 (_2!6815 lt!224622) (_2!6815 lt!224614)))))

(declare-fun b!144941 () Bool)

(assert (=> b!144941 (= e!96610 (array_inv!2776 (buf!3426 thiss!1634)))))

(declare-fun b!144942 () Bool)

(assert (=> b!144942 (= e!96602 (not true))))

(declare-fun e!96608 () Bool)

(assert (=> b!144942 e!96608))

(declare-fun res!121143 () Bool)

(assert (=> b!144942 (=> (not res!121143) (not e!96608))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144942 (= res!121143 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2987 (buf!3426 (_2!6815 lt!224614)))) ((_ sign_extend 32) (currentByte!6316 thiss!1634)) ((_ sign_extend 32) (currentBit!6311 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224624 () Unit!9047)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5232 array!6598 (_ BitVec 32)) Unit!9047)

(assert (=> b!144942 (= lt!224624 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3426 (_2!6815 lt!224614)) (bvsub to!404 from!447)))))

(declare-fun lt!224616 () tuple2!12944)

(declare-fun readBytePure!0 (BitStream!5232) tuple2!12942)

(assert (=> b!144942 (= (_2!6817 (readBytePure!0 (_1!6818 lt!224616))) (select (arr!3720 arr!237) from!447))))

(declare-fun lt!224618 () tuple2!12944)

(assert (=> b!144942 (= lt!224618 (reader!0 (_2!6815 lt!224622) (_2!6815 lt!224614)))))

(assert (=> b!144942 (= lt!224616 (reader!0 thiss!1634 (_2!6815 lt!224614)))))

(assert (=> b!144942 e!96603))

(declare-fun res!121154 () Bool)

(assert (=> b!144942 (=> (not res!121154) (not e!96603))))

(assert (=> b!144942 (= res!121154 (= (bitIndex!0 (size!2987 (buf!3426 (_1!6817 lt!224623))) (currentByte!6316 (_1!6817 lt!224623)) (currentBit!6311 (_1!6817 lt!224623))) (bitIndex!0 (size!2987 (buf!3426 (_1!6817 lt!224609))) (currentByte!6316 (_1!6817 lt!224609)) (currentBit!6311 (_1!6817 lt!224609)))))))

(declare-fun lt!224617 () Unit!9047)

(declare-fun lt!224612 () BitStream!5232)

(declare-fun readBytePrefixLemma!0 (BitStream!5232 BitStream!5232) Unit!9047)

(assert (=> b!144942 (= lt!224617 (readBytePrefixLemma!0 lt!224612 (_2!6815 lt!224614)))))

(assert (=> b!144942 (= lt!224609 (readBytePure!0 (BitStream!5233 (buf!3426 (_2!6815 lt!224614)) (currentByte!6316 thiss!1634) (currentBit!6311 thiss!1634))))))

(assert (=> b!144942 (= lt!224623 (readBytePure!0 lt!224612))))

(assert (=> b!144942 (= lt!224612 (BitStream!5233 (buf!3426 (_2!6815 lt!224622)) (currentByte!6316 thiss!1634) (currentBit!6311 thiss!1634)))))

(declare-fun e!96607 () Bool)

(assert (=> b!144942 e!96607))

(declare-fun res!121152 () Bool)

(assert (=> b!144942 (=> (not res!121152) (not e!96607))))

(assert (=> b!144942 (= res!121152 (isPrefixOf!0 thiss!1634 (_2!6815 lt!224614)))))

(declare-fun lt!224613 () Unit!9047)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5232 BitStream!5232 BitStream!5232) Unit!9047)

(assert (=> b!144942 (= lt!224613 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6815 lt!224622) (_2!6815 lt!224614)))))

(declare-fun e!96612 () Bool)

(assert (=> b!144942 e!96612))

(declare-fun res!121149 () Bool)

(assert (=> b!144942 (=> (not res!121149) (not e!96612))))

(assert (=> b!144942 (= res!121149 (= (size!2987 (buf!3426 (_2!6815 lt!224622))) (size!2987 (buf!3426 (_2!6815 lt!224614)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5232 array!6598 (_ BitVec 32) (_ BitVec 32)) tuple2!12938)

(assert (=> b!144942 (= lt!224614 (appendByteArrayLoop!0 (_2!6815 lt!224622) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144942 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2987 (buf!3426 (_2!6815 lt!224622)))) ((_ sign_extend 32) (currentByte!6316 (_2!6815 lt!224622))) ((_ sign_extend 32) (currentBit!6311 (_2!6815 lt!224622))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224619 () Unit!9047)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5232 BitStream!5232 (_ BitVec 64) (_ BitVec 32)) Unit!9047)

(assert (=> b!144942 (= lt!224619 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6815 lt!224622) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144942 e!96606))

(declare-fun res!121146 () Bool)

(assert (=> b!144942 (=> (not res!121146) (not e!96606))))

(assert (=> b!144942 (= res!121146 (= (size!2987 (buf!3426 thiss!1634)) (size!2987 (buf!3426 (_2!6815 lt!224622)))))))

(declare-fun appendByte!0 (BitStream!5232 (_ BitVec 8)) tuple2!12938)

(assert (=> b!144942 (= lt!224622 (appendByte!0 thiss!1634 (select (arr!3720 arr!237) from!447)))))

(declare-fun b!144943 () Bool)

(declare-fun res!121145 () Bool)

(assert (=> b!144943 (=> (not res!121145) (not e!96602))))

(assert (=> b!144943 (= res!121145 (bvslt from!447 to!404))))

(declare-fun b!144944 () Bool)

(declare-fun lt!224615 () tuple2!12944)

(declare-fun lt!224611 () tuple2!12942)

(assert (=> b!144944 (= e!96606 (and (= (_2!6817 lt!224611) (select (arr!3720 arr!237) from!447)) (= (_1!6817 lt!224611) (_2!6818 lt!224615))))))

(assert (=> b!144944 (= lt!224611 (readBytePure!0 (_1!6818 lt!224615)))))

(assert (=> b!144944 (= lt!224615 (reader!0 thiss!1634 (_2!6815 lt!224622)))))

(declare-fun b!144945 () Bool)

(declare-fun res!121153 () Bool)

(assert (=> b!144945 (=> (not res!121153) (not e!96602))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144945 (= res!121153 (invariant!0 (currentBit!6311 thiss!1634) (currentByte!6316 thiss!1634) (size!2987 (buf!3426 thiss!1634))))))

(declare-fun b!144946 () Bool)

(assert (=> b!144946 (= e!96612 e!96609)))

(declare-fun res!121151 () Bool)

(assert (=> b!144946 (=> (not res!121151) (not e!96609))))

(assert (=> b!144946 (= res!121151 (= (bitIndex!0 (size!2987 (buf!3426 (_2!6815 lt!224614))) (currentByte!6316 (_2!6815 lt!224614)) (currentBit!6311 (_2!6815 lt!224614))) (bvadd (bitIndex!0 (size!2987 (buf!3426 (_2!6815 lt!224622))) (currentByte!6316 (_2!6815 lt!224622)) (currentBit!6311 (_2!6815 lt!224622))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224620))))))

(assert (=> b!144946 (= lt!224620 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144947 () Bool)

(assert (=> b!144947 (= e!96608 (= (_1!6816 (readByteArrayLoopPure!0 (_1!6818 lt!224616) arr!237 from!447 to!404)) (_2!6818 lt!224616)))))

(declare-fun b!144948 () Bool)

(declare-fun res!121155 () Bool)

(assert (=> b!144948 (=> (not res!121155) (not e!96602))))

(assert (=> b!144948 (= res!121155 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2987 (buf!3426 thiss!1634))) ((_ sign_extend 32) (currentByte!6316 thiss!1634)) ((_ sign_extend 32) (currentBit!6311 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144949 () Bool)

(assert (=> b!144949 (= e!96607 (invariant!0 (currentBit!6311 thiss!1634) (currentByte!6316 thiss!1634) (size!2987 (buf!3426 (_2!6815 lt!224622)))))))

(assert (= (and start!28006 res!121144) b!144948))

(assert (= (and b!144948 res!121155) b!144943))

(assert (= (and b!144943 res!121145) b!144945))

(assert (= (and b!144945 res!121153) b!144942))

(assert (= (and b!144942 res!121146) b!144937))

(assert (= (and b!144937 res!121147) b!144936))

(assert (= (and b!144936 res!121156) b!144944))

(assert (= (and b!144942 res!121149) b!144946))

(assert (= (and b!144946 res!121151) b!144935))

(assert (= (and b!144935 res!121150) b!144940))

(assert (= (and b!144940 (not res!121148)) b!144938))

(assert (= (and b!144942 res!121152) b!144949))

(assert (= (and b!144942 res!121154) b!144939))

(assert (= (and b!144942 res!121143) b!144947))

(assert (= start!28006 b!144941))

(declare-fun m!222921 () Bool)

(assert (=> b!144948 m!222921))

(declare-fun m!222923 () Bool)

(assert (=> b!144935 m!222923))

(declare-fun m!222925 () Bool)

(assert (=> b!144937 m!222925))

(declare-fun m!222927 () Bool)

(assert (=> b!144937 m!222927))

(declare-fun m!222929 () Bool)

(assert (=> b!144936 m!222929))

(declare-fun m!222931 () Bool)

(assert (=> b!144947 m!222931))

(declare-fun m!222933 () Bool)

(assert (=> b!144942 m!222933))

(declare-fun m!222935 () Bool)

(assert (=> b!144942 m!222935))

(declare-fun m!222937 () Bool)

(assert (=> b!144942 m!222937))

(declare-fun m!222939 () Bool)

(assert (=> b!144942 m!222939))

(declare-fun m!222941 () Bool)

(assert (=> b!144942 m!222941))

(declare-fun m!222943 () Bool)

(assert (=> b!144942 m!222943))

(declare-fun m!222945 () Bool)

(assert (=> b!144942 m!222945))

(declare-fun m!222947 () Bool)

(assert (=> b!144942 m!222947))

(declare-fun m!222949 () Bool)

(assert (=> b!144942 m!222949))

(declare-fun m!222951 () Bool)

(assert (=> b!144942 m!222951))

(declare-fun m!222953 () Bool)

(assert (=> b!144942 m!222953))

(assert (=> b!144942 m!222951))

(declare-fun m!222955 () Bool)

(assert (=> b!144942 m!222955))

(declare-fun m!222957 () Bool)

(assert (=> b!144942 m!222957))

(declare-fun m!222959 () Bool)

(assert (=> b!144942 m!222959))

(declare-fun m!222961 () Bool)

(assert (=> b!144942 m!222961))

(declare-fun m!222963 () Bool)

(assert (=> b!144942 m!222963))

(declare-fun m!222965 () Bool)

(assert (=> b!144942 m!222965))

(declare-fun m!222967 () Bool)

(assert (=> b!144945 m!222967))

(declare-fun m!222969 () Bool)

(assert (=> b!144940 m!222969))

(declare-fun m!222971 () Bool)

(assert (=> b!144940 m!222971))

(declare-fun m!222973 () Bool)

(assert (=> b!144940 m!222973))

(assert (=> b!144940 m!222961))

(declare-fun m!222975 () Bool)

(assert (=> b!144938 m!222975))

(assert (=> b!144944 m!222951))

(declare-fun m!222977 () Bool)

(assert (=> b!144944 m!222977))

(declare-fun m!222979 () Bool)

(assert (=> b!144944 m!222979))

(declare-fun m!222981 () Bool)

(assert (=> b!144941 m!222981))

(declare-fun m!222983 () Bool)

(assert (=> b!144946 m!222983))

(assert (=> b!144946 m!222925))

(declare-fun m!222985 () Bool)

(assert (=> start!28006 m!222985))

(declare-fun m!222987 () Bool)

(assert (=> start!28006 m!222987))

(declare-fun m!222989 () Bool)

(assert (=> b!144949 m!222989))

(check-sat (not b!144949) (not b!144941) (not b!144936) (not b!144940) (not b!144948) (not start!28006) (not b!144945) (not b!144935) (not b!144942) (not b!144944) (not b!144947) (not b!144937) (not b!144946) (not b!144938))
