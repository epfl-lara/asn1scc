; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21746 () Bool)

(assert start!21746)

(declare-fun b!110000 () Bool)

(declare-fun e!72112 () Bool)

(declare-datatypes ((array!5004 0))(
  ( (array!5005 (arr!2870 (Array (_ BitVec 32) (_ BitVec 8))) (size!2277 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4028 0))(
  ( (BitStream!4029 (buf!2671 array!5004) (currentByte!5213 (_ BitVec 32)) (currentBit!5208 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9160 0))(
  ( (tuple2!9161 (_1!4837 BitStream!4028) (_2!4837 Bool)) )
))
(declare-fun lt!166901 () tuple2!9160)

(declare-fun lt!166914 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110000 (= e!72112 (= (bitIndex!0 (size!2277 (buf!2671 (_1!4837 lt!166901))) (currentByte!5213 (_1!4837 lt!166901)) (currentBit!5208 (_1!4837 lt!166901))) lt!166914))))

(declare-fun b!110001 () Bool)

(declare-fun res!90803 () Bool)

(declare-fun e!72107 () Bool)

(assert (=> b!110001 (=> (not res!90803) (not e!72107))))

(declare-fun thiss!1305 () BitStream!4028)

(declare-datatypes ((Unit!6719 0))(
  ( (Unit!6720) )
))
(declare-datatypes ((tuple2!9162 0))(
  ( (tuple2!9163 (_1!4838 Unit!6719) (_2!4838 BitStream!4028)) )
))
(declare-fun lt!166896 () tuple2!9162)

(declare-fun isPrefixOf!0 (BitStream!4028 BitStream!4028) Bool)

(assert (=> b!110001 (= res!90803 (isPrefixOf!0 thiss!1305 (_2!4838 lt!166896)))))

(declare-fun b!110002 () Bool)

(declare-fun e!72106 () Bool)

(declare-fun lt!166906 () tuple2!9160)

(declare-fun lt!166892 () tuple2!9160)

(assert (=> b!110002 (= e!72106 (= (_2!4837 lt!166906) (_2!4837 lt!166892)))))

(declare-fun b!110003 () Bool)

(declare-fun e!72115 () Bool)

(declare-fun array_inv!2079 (array!5004) Bool)

(assert (=> b!110003 (= e!72115 (array_inv!2079 (buf!2671 thiss!1305)))))

(declare-fun e!72104 () Bool)

(declare-fun b!110004 () Bool)

(declare-fun lt!166912 () (_ BitVec 64))

(declare-fun lt!166897 () (_ BitVec 64))

(declare-fun lt!166911 () (_ BitVec 64))

(assert (=> b!110004 (= e!72104 (or (not (= (bvand lt!166912 lt!166897) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166912 lt!166911) lt!166912)))))

(declare-fun b!110005 () Bool)

(declare-fun e!72113 () Bool)

(declare-fun e!72114 () Bool)

(assert (=> b!110005 (= e!72113 (not e!72114))))

(declare-fun res!90800 () Bool)

(assert (=> b!110005 (=> res!90800 e!72114)))

(declare-datatypes ((tuple2!9164 0))(
  ( (tuple2!9165 (_1!4839 BitStream!4028) (_2!4839 (_ BitVec 64))) )
))
(declare-fun lt!166907 () tuple2!9164)

(declare-datatypes ((tuple2!9166 0))(
  ( (tuple2!9167 (_1!4840 BitStream!4028) (_2!4840 BitStream!4028)) )
))
(declare-fun lt!166895 () tuple2!9166)

(assert (=> b!110005 (= res!90800 (not (= (_1!4839 lt!166907) (_2!4840 lt!166895))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!166887 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9164)

(assert (=> b!110005 (= lt!166907 (readNLeastSignificantBitsLoopPure!0 (_1!4840 lt!166895) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166887))))

(declare-fun lt!166902 () tuple2!9162)

(declare-fun lt!166894 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110005 (validate_offset_bits!1 ((_ sign_extend 32) (size!2277 (buf!2671 (_2!4838 lt!166902)))) ((_ sign_extend 32) (currentByte!5213 (_2!4838 lt!166896))) ((_ sign_extend 32) (currentBit!5208 (_2!4838 lt!166896))) lt!166894)))

(declare-fun lt!166915 () Unit!6719)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4028 array!5004 (_ BitVec 64)) Unit!6719)

(assert (=> b!110005 (= lt!166915 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4838 lt!166896) (buf!2671 (_2!4838 lt!166902)) lt!166894))))

(assert (=> b!110005 (= lt!166894 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!166900 () tuple2!9160)

(declare-fun lt!166916 () (_ BitVec 64))

(assert (=> b!110005 (= lt!166887 (bvor lt!166912 (ite (_2!4837 lt!166900) lt!166916 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!166910 () tuple2!9164)

(declare-fun lt!166899 () tuple2!9166)

(assert (=> b!110005 (= lt!166910 (readNLeastSignificantBitsLoopPure!0 (_1!4840 lt!166899) nBits!396 i!615 lt!166912))))

(declare-fun lt!166890 () (_ BitVec 64))

(assert (=> b!110005 (validate_offset_bits!1 ((_ sign_extend 32) (size!2277 (buf!2671 (_2!4838 lt!166902)))) ((_ sign_extend 32) (currentByte!5213 thiss!1305)) ((_ sign_extend 32) (currentBit!5208 thiss!1305)) lt!166890)))

(declare-fun lt!166903 () Unit!6719)

(assert (=> b!110005 (= lt!166903 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2671 (_2!4838 lt!166902)) lt!166890))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!110005 (= lt!166912 (bvand v!199 (bvnot lt!166897)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110005 (= lt!166897 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!166905 () Bool)

(assert (=> b!110005 (= (_2!4837 lt!166900) lt!166905)))

(declare-fun readBitPure!0 (BitStream!4028) tuple2!9160)

(assert (=> b!110005 (= lt!166900 (readBitPure!0 (_1!4840 lt!166899)))))

(declare-fun reader!0 (BitStream!4028 BitStream!4028) tuple2!9166)

(assert (=> b!110005 (= lt!166895 (reader!0 (_2!4838 lt!166896) (_2!4838 lt!166902)))))

(assert (=> b!110005 (= lt!166899 (reader!0 thiss!1305 (_2!4838 lt!166902)))))

(assert (=> b!110005 e!72106))

(declare-fun res!90802 () Bool)

(assert (=> b!110005 (=> (not res!90802) (not e!72106))))

(assert (=> b!110005 (= res!90802 (= (bitIndex!0 (size!2277 (buf!2671 (_1!4837 lt!166906))) (currentByte!5213 (_1!4837 lt!166906)) (currentBit!5208 (_1!4837 lt!166906))) (bitIndex!0 (size!2277 (buf!2671 (_1!4837 lt!166892))) (currentByte!5213 (_1!4837 lt!166892)) (currentBit!5208 (_1!4837 lt!166892)))))))

(declare-fun lt!166908 () Unit!6719)

(declare-fun lt!166893 () BitStream!4028)

(declare-fun readBitPrefixLemma!0 (BitStream!4028 BitStream!4028) Unit!6719)

(assert (=> b!110005 (= lt!166908 (readBitPrefixLemma!0 lt!166893 (_2!4838 lt!166902)))))

(assert (=> b!110005 (= lt!166892 (readBitPure!0 (BitStream!4029 (buf!2671 (_2!4838 lt!166902)) (currentByte!5213 thiss!1305) (currentBit!5208 thiss!1305))))))

(assert (=> b!110005 (= lt!166906 (readBitPure!0 lt!166893))))

(assert (=> b!110005 (= lt!166893 (BitStream!4029 (buf!2671 (_2!4838 lt!166896)) (currentByte!5213 thiss!1305) (currentBit!5208 thiss!1305)))))

(declare-fun e!72105 () Bool)

(assert (=> b!110005 e!72105))

(declare-fun res!90796 () Bool)

(assert (=> b!110005 (=> (not res!90796) (not e!72105))))

(assert (=> b!110005 (= res!90796 (isPrefixOf!0 thiss!1305 (_2!4838 lt!166902)))))

(declare-fun lt!166909 () Unit!6719)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4028 BitStream!4028 BitStream!4028) Unit!6719)

(assert (=> b!110005 (= lt!166909 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4838 lt!166896) (_2!4838 lt!166902)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9162)

(assert (=> b!110005 (= lt!166902 (appendNLeastSignificantBitsLoop!0 (_2!4838 lt!166896) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!72111 () Bool)

(assert (=> b!110005 e!72111))

(declare-fun res!90807 () Bool)

(assert (=> b!110005 (=> (not res!90807) (not e!72111))))

(assert (=> b!110005 (= res!90807 (= (size!2277 (buf!2671 thiss!1305)) (size!2277 (buf!2671 (_2!4838 lt!166896)))))))

(declare-fun appendBit!0 (BitStream!4028 Bool) tuple2!9162)

(assert (=> b!110005 (= lt!166896 (appendBit!0 thiss!1305 lt!166905))))

(assert (=> b!110005 (= lt!166905 (not (= (bvand v!199 lt!166916) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110005 (= lt!166916 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!110006 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110006 (= e!72105 (invariant!0 (currentBit!5208 thiss!1305) (currentByte!5213 thiss!1305) (size!2277 (buf!2671 (_2!4838 lt!166902)))))))

(declare-fun b!110007 () Bool)

(assert (=> b!110007 (= e!72107 e!72112)))

(declare-fun res!90804 () Bool)

(assert (=> b!110007 (=> (not res!90804) (not e!72112))))

(assert (=> b!110007 (= res!90804 (and (= (_2!4837 lt!166901) lt!166905) (= (_1!4837 lt!166901) (_2!4838 lt!166896))))))

(declare-fun readerFrom!0 (BitStream!4028 (_ BitVec 32) (_ BitVec 32)) BitStream!4028)

(assert (=> b!110007 (= lt!166901 (readBitPure!0 (readerFrom!0 (_2!4838 lt!166896) (currentBit!5208 thiss!1305) (currentByte!5213 thiss!1305))))))

(declare-fun res!90798 () Bool)

(declare-fun e!72108 () Bool)

(assert (=> start!21746 (=> (not res!90798) (not e!72108))))

(assert (=> start!21746 (= res!90798 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21746 e!72108))

(assert (=> start!21746 true))

(declare-fun inv!12 (BitStream!4028) Bool)

(assert (=> start!21746 (and (inv!12 thiss!1305) e!72115)))

(declare-fun b!110008 () Bool)

(declare-fun e!72110 () Bool)

(declare-fun lt!166891 () (_ BitVec 64))

(declare-fun lt!166888 () (_ BitVec 64))

(declare-fun lt!166898 () BitStream!4028)

(assert (=> b!110008 (= e!72110 (and (= lt!166891 (bvsub lt!166888 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4840 lt!166895) lt!166898)) (and (= (_2!4839 lt!166910) (_2!4839 lt!166907)) (= (_1!4839 lt!166910) (_2!4840 lt!166899))))))))

(declare-fun b!110009 () Bool)

(declare-fun e!72116 () Bool)

(assert (=> b!110009 (= e!72108 e!72116)))

(declare-fun res!90808 () Bool)

(assert (=> b!110009 (=> (not res!90808) (not e!72116))))

(assert (=> b!110009 (= res!90808 (validate_offset_bits!1 ((_ sign_extend 32) (size!2277 (buf!2671 thiss!1305))) ((_ sign_extend 32) (currentByte!5213 thiss!1305)) ((_ sign_extend 32) (currentBit!5208 thiss!1305)) lt!166890))))

(assert (=> b!110009 (= lt!166890 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110010 () Bool)

(assert (=> b!110010 (= e!72114 e!72104)))

(declare-fun res!90805 () Bool)

(assert (=> b!110010 (=> res!90805 e!72104)))

(declare-fun lt!166889 () (_ BitVec 64))

(assert (=> b!110010 (= res!90805 (or (not (= (_1!4840 lt!166895) lt!166898)) (not (= (size!2277 (buf!2671 thiss!1305)) (size!2277 (buf!2671 (_2!4838 lt!166902))))) (not (= lt!166889 (bvadd lt!166891 lt!166890)))))))

(assert (=> b!110010 e!72110))

(declare-fun res!90806 () Bool)

(assert (=> b!110010 (=> (not res!90806) (not e!72110))))

(declare-fun withMovedBitIndex!0 (BitStream!4028 (_ BitVec 64)) BitStream!4028)

(assert (=> b!110010 (= res!90806 (= (_1!4840 lt!166895) (withMovedBitIndex!0 (_2!4840 lt!166895) (bvsub lt!166888 lt!166889))))))

(assert (=> b!110010 (= lt!166888 (bitIndex!0 (size!2277 (buf!2671 (_2!4838 lt!166896))) (currentByte!5213 (_2!4838 lt!166896)) (currentBit!5208 (_2!4838 lt!166896))))))

(assert (=> b!110010 (= (_1!4840 lt!166899) (withMovedBitIndex!0 (_2!4840 lt!166899) (bvsub lt!166891 lt!166889)))))

(assert (=> b!110010 (= lt!166889 (bitIndex!0 (size!2277 (buf!2671 (_2!4838 lt!166902))) (currentByte!5213 (_2!4838 lt!166902)) (currentBit!5208 (_2!4838 lt!166902))))))

(assert (=> b!110010 (= lt!166891 (bitIndex!0 (size!2277 (buf!2671 thiss!1305)) (currentByte!5213 thiss!1305) (currentBit!5208 thiss!1305)))))

(declare-fun lt!166886 () tuple2!9164)

(assert (=> b!110010 (and (= (_2!4839 lt!166910) (_2!4839 lt!166886)) (= (_1!4839 lt!166910) (_1!4839 lt!166886)))))

(declare-fun lt!166913 () Unit!6719)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6719)

(assert (=> b!110010 (= lt!166913 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4840 lt!166899) nBits!396 i!615 lt!166912))))

(assert (=> b!110010 (= lt!166886 (readNLeastSignificantBitsLoopPure!0 lt!166898 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166887))))

(assert (=> b!110010 (= lt!166898 (withMovedBitIndex!0 (_1!4840 lt!166899) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!110011 () Bool)

(declare-fun res!90795 () Bool)

(assert (=> b!110011 (=> res!90795 e!72104)))

(assert (=> b!110011 (= res!90795 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2277 (buf!2671 (_1!4840 lt!166899)))) ((_ sign_extend 32) (currentByte!5213 (_1!4840 lt!166899))) ((_ sign_extend 32) (currentBit!5208 (_1!4840 lt!166899))) lt!166890)))))

(declare-fun b!110012 () Bool)

(assert (=> b!110012 (= e!72111 e!72107)))

(declare-fun res!90799 () Bool)

(assert (=> b!110012 (=> (not res!90799) (not e!72107))))

(declare-fun lt!166904 () (_ BitVec 64))

(assert (=> b!110012 (= res!90799 (= lt!166914 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!166904)))))

(assert (=> b!110012 (= lt!166914 (bitIndex!0 (size!2277 (buf!2671 (_2!4838 lt!166896))) (currentByte!5213 (_2!4838 lt!166896)) (currentBit!5208 (_2!4838 lt!166896))))))

(assert (=> b!110012 (= lt!166904 (bitIndex!0 (size!2277 (buf!2671 thiss!1305)) (currentByte!5213 thiss!1305) (currentBit!5208 thiss!1305)))))

(declare-fun b!110013 () Bool)

(declare-fun res!90801 () Bool)

(assert (=> b!110013 (=> (not res!90801) (not e!72105))))

(assert (=> b!110013 (= res!90801 (invariant!0 (currentBit!5208 thiss!1305) (currentByte!5213 thiss!1305) (size!2277 (buf!2671 (_2!4838 lt!166896)))))))

(declare-fun b!110014 () Bool)

(assert (=> b!110014 (= e!72116 e!72113)))

(declare-fun res!90797 () Bool)

(assert (=> b!110014 (=> (not res!90797) (not e!72113))))

(assert (=> b!110014 (= res!90797 (and (= (bvand v!199 lt!166911) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!110014 (= lt!166911 (onesLSBLong!0 nBits!396))))

(assert (= (and start!21746 res!90798) b!110009))

(assert (= (and b!110009 res!90808) b!110014))

(assert (= (and b!110014 res!90797) b!110005))

(assert (= (and b!110005 res!90807) b!110012))

(assert (= (and b!110012 res!90799) b!110001))

(assert (= (and b!110001 res!90803) b!110007))

(assert (= (and b!110007 res!90804) b!110000))

(assert (= (and b!110005 res!90796) b!110013))

(assert (= (and b!110013 res!90801) b!110006))

(assert (= (and b!110005 res!90802) b!110002))

(assert (= (and b!110005 (not res!90800)) b!110010))

(assert (= (and b!110010 res!90806) b!110008))

(assert (= (and b!110010 (not res!90805)) b!110011))

(assert (= (and b!110011 (not res!90795)) b!110004))

(assert (= start!21746 b!110003))

(declare-fun m!163555 () Bool)

(assert (=> b!110010 m!163555))

(declare-fun m!163557 () Bool)

(assert (=> b!110010 m!163557))

(declare-fun m!163559 () Bool)

(assert (=> b!110010 m!163559))

(declare-fun m!163561 () Bool)

(assert (=> b!110010 m!163561))

(declare-fun m!163563 () Bool)

(assert (=> b!110010 m!163563))

(declare-fun m!163565 () Bool)

(assert (=> b!110010 m!163565))

(declare-fun m!163567 () Bool)

(assert (=> b!110010 m!163567))

(declare-fun m!163569 () Bool)

(assert (=> b!110010 m!163569))

(declare-fun m!163571 () Bool)

(assert (=> b!110000 m!163571))

(declare-fun m!163573 () Bool)

(assert (=> b!110006 m!163573))

(declare-fun m!163575 () Bool)

(assert (=> b!110003 m!163575))

(declare-fun m!163577 () Bool)

(assert (=> b!110013 m!163577))

(declare-fun m!163579 () Bool)

(assert (=> start!21746 m!163579))

(declare-fun m!163581 () Bool)

(assert (=> b!110001 m!163581))

(declare-fun m!163583 () Bool)

(assert (=> b!110007 m!163583))

(assert (=> b!110007 m!163583))

(declare-fun m!163585 () Bool)

(assert (=> b!110007 m!163585))

(declare-fun m!163587 () Bool)

(assert (=> b!110014 m!163587))

(declare-fun m!163589 () Bool)

(assert (=> b!110009 m!163589))

(declare-fun m!163591 () Bool)

(assert (=> b!110005 m!163591))

(declare-fun m!163593 () Bool)

(assert (=> b!110005 m!163593))

(declare-fun m!163595 () Bool)

(assert (=> b!110005 m!163595))

(declare-fun m!163597 () Bool)

(assert (=> b!110005 m!163597))

(declare-fun m!163599 () Bool)

(assert (=> b!110005 m!163599))

(declare-fun m!163601 () Bool)

(assert (=> b!110005 m!163601))

(declare-fun m!163603 () Bool)

(assert (=> b!110005 m!163603))

(declare-fun m!163605 () Bool)

(assert (=> b!110005 m!163605))

(declare-fun m!163607 () Bool)

(assert (=> b!110005 m!163607))

(declare-fun m!163609 () Bool)

(assert (=> b!110005 m!163609))

(declare-fun m!163611 () Bool)

(assert (=> b!110005 m!163611))

(declare-fun m!163613 () Bool)

(assert (=> b!110005 m!163613))

(declare-fun m!163615 () Bool)

(assert (=> b!110005 m!163615))

(declare-fun m!163617 () Bool)

(assert (=> b!110005 m!163617))

(declare-fun m!163619 () Bool)

(assert (=> b!110005 m!163619))

(declare-fun m!163621 () Bool)

(assert (=> b!110005 m!163621))

(declare-fun m!163623 () Bool)

(assert (=> b!110005 m!163623))

(declare-fun m!163625 () Bool)

(assert (=> b!110005 m!163625))

(declare-fun m!163627 () Bool)

(assert (=> b!110005 m!163627))

(assert (=> b!110012 m!163565))

(assert (=> b!110012 m!163561))

(declare-fun m!163629 () Bool)

(assert (=> b!110011 m!163629))

(push 1)

(assert (not b!110003))

(assert (not b!110007))

(assert (not b!110000))

(assert (not start!21746))

(assert (not b!110011))

(assert (not b!110006))

(assert (not b!110013))

(assert (not b!110014))

(assert (not b!110001))

(assert (not b!110009))

(assert (not b!110010))

(assert (not b!110012))

(assert (not b!110005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

