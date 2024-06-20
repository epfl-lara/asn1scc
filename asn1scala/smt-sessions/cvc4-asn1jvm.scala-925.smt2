; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25952 () Bool)

(assert start!25952)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6122 0))(
  ( (array!6123 (arr!3407 (Array (_ BitVec 32) (_ BitVec 8))) (size!2772 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6122)

(declare-fun e!88104 () Bool)

(declare-datatypes ((BitStream!4808 0))(
  ( (BitStream!4809 (buf!3145 array!6122) (currentByte!5930 (_ BitVec 32)) (currentBit!5925 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11552 0))(
  ( (tuple2!11553 (_1!6082 BitStream!4808) (_2!6082 array!6122)) )
))
(declare-fun lt!205173 () tuple2!11552)

(declare-fun b!132853 () Bool)

(declare-fun arrayRangesEq!175 (array!6122 array!6122 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132853 (= e!88104 (not (arrayRangesEq!175 arr!237 (_2!6082 lt!205173) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132854 () Bool)

(declare-fun e!88108 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11554 0))(
  ( (tuple2!11555 (_1!6083 BitStream!4808) (_2!6083 (_ BitVec 8))) )
))
(declare-fun lt!205166 () tuple2!11554)

(declare-datatypes ((tuple2!11556 0))(
  ( (tuple2!11557 (_1!6084 BitStream!4808) (_2!6084 BitStream!4808)) )
))
(declare-fun lt!205155 () tuple2!11556)

(assert (=> b!132854 (= e!88108 (and (= (_2!6083 lt!205166) (select (arr!3407 arr!237) from!447)) (= (_1!6083 lt!205166) (_2!6084 lt!205155))))))

(declare-fun readBytePure!0 (BitStream!4808) tuple2!11554)

(assert (=> b!132854 (= lt!205166 (readBytePure!0 (_1!6084 lt!205155)))))

(declare-fun thiss!1634 () BitStream!4808)

(declare-datatypes ((Unit!8176 0))(
  ( (Unit!8177) )
))
(declare-datatypes ((tuple2!11558 0))(
  ( (tuple2!11559 (_1!6085 Unit!8176) (_2!6085 BitStream!4808)) )
))
(declare-fun lt!205156 () tuple2!11558)

(declare-fun reader!0 (BitStream!4808 BitStream!4808) tuple2!11556)

(assert (=> b!132854 (= lt!205155 (reader!0 thiss!1634 (_2!6085 lt!205156)))))

(declare-fun b!132855 () Bool)

(declare-fun res!110346 () Bool)

(assert (=> b!132855 (=> (not res!110346) (not e!88108))))

(declare-fun isPrefixOf!0 (BitStream!4808 BitStream!4808) Bool)

(assert (=> b!132855 (= res!110346 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205156)))))

(declare-fun b!132856 () Bool)

(declare-fun e!88103 () Bool)

(declare-fun lt!205153 () tuple2!11552)

(declare-fun lt!205175 () tuple2!11552)

(assert (=> b!132856 (= e!88103 (not (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsle (size!2772 (_2!6082 lt!205153)) (size!2772 (_2!6082 lt!205175))))))))

(declare-fun lt!205151 () tuple2!11552)

(assert (=> b!132856 (arrayRangesEq!175 (_2!6082 lt!205153) (_2!6082 lt!205151) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!205174 () Unit!8176)

(declare-fun lt!205162 () tuple2!11556)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4808 array!6122 (_ BitVec 32) (_ BitVec 32)) Unit!8176)

(assert (=> b!132856 (= lt!205174 (readByteArrayLoopArrayPrefixLemma!0 (_1!6084 lt!205162) arr!237 from!447 to!404))))

(declare-fun lt!205172 () array!6122)

(declare-fun readByteArrayLoopPure!0 (BitStream!4808 array!6122 (_ BitVec 32) (_ BitVec 32)) tuple2!11552)

(declare-fun withMovedByteIndex!0 (BitStream!4808 (_ BitVec 32)) BitStream!4808)

(assert (=> b!132856 (= lt!205151 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205168 () tuple2!11556)

(assert (=> b!132856 (= lt!205175 (readByteArrayLoopPure!0 (_1!6084 lt!205168) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205165 () tuple2!11554)

(assert (=> b!132856 (= lt!205172 (array!6123 (store (arr!3407 arr!237) from!447 (_2!6083 lt!205165)) (size!2772 arr!237)))))

(declare-fun lt!205157 () tuple2!11558)

(declare-fun lt!205163 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132856 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205163)))

(declare-fun lt!205164 () Unit!8176)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4808 array!6122 (_ BitVec 32)) Unit!8176)

(assert (=> b!132856 (= lt!205164 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205163))))

(assert (=> b!132856 (= (_1!6082 lt!205153) (_2!6084 lt!205162))))

(assert (=> b!132856 (= lt!205153 (readByteArrayLoopPure!0 (_1!6084 lt!205162) arr!237 from!447 to!404))))

(assert (=> b!132856 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!205152 () Unit!8176)

(assert (=> b!132856 (= lt!205152 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3145 (_2!6085 lt!205157)) (bvsub to!404 from!447)))))

(assert (=> b!132856 (= (_2!6083 lt!205165) (select (arr!3407 arr!237) from!447))))

(assert (=> b!132856 (= lt!205165 (readBytePure!0 (_1!6084 lt!205162)))))

(assert (=> b!132856 (= lt!205168 (reader!0 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(assert (=> b!132856 (= lt!205162 (reader!0 thiss!1634 (_2!6085 lt!205157)))))

(declare-fun e!88102 () Bool)

(assert (=> b!132856 e!88102))

(declare-fun res!110355 () Bool)

(assert (=> b!132856 (=> (not res!110355) (not e!88102))))

(declare-fun lt!205158 () tuple2!11554)

(declare-fun lt!205154 () tuple2!11554)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132856 (= res!110355 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205158))) (currentByte!5930 (_1!6083 lt!205158)) (currentBit!5925 (_1!6083 lt!205158))) (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205154))) (currentByte!5930 (_1!6083 lt!205154)) (currentBit!5925 (_1!6083 lt!205154)))))))

(declare-fun lt!205167 () Unit!8176)

(declare-fun lt!205171 () BitStream!4808)

(declare-fun readBytePrefixLemma!0 (BitStream!4808 BitStream!4808) Unit!8176)

(assert (=> b!132856 (= lt!205167 (readBytePrefixLemma!0 lt!205171 (_2!6085 lt!205157)))))

(assert (=> b!132856 (= lt!205154 (readBytePure!0 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (=> b!132856 (= lt!205158 (readBytePure!0 lt!205171))))

(assert (=> b!132856 (= lt!205171 (BitStream!4809 (buf!3145 (_2!6085 lt!205156)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(declare-fun e!88105 () Bool)

(assert (=> b!132856 e!88105))

(declare-fun res!110348 () Bool)

(assert (=> b!132856 (=> (not res!110348) (not e!88105))))

(assert (=> b!132856 (= res!110348 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205157)))))

(declare-fun lt!205159 () Unit!8176)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4808 BitStream!4808 BitStream!4808) Unit!8176)

(assert (=> b!132856 (= lt!205159 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(declare-fun e!88100 () Bool)

(assert (=> b!132856 e!88100))

(declare-fun res!110345 () Bool)

(assert (=> b!132856 (=> (not res!110345) (not e!88100))))

(assert (=> b!132856 (= res!110345 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4808 array!6122 (_ BitVec 32) (_ BitVec 32)) tuple2!11558)

(assert (=> b!132856 (= lt!205157 (appendByteArrayLoop!0 (_2!6085 lt!205156) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132856 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205163)))

(assert (=> b!132856 (= lt!205163 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!205161 () Unit!8176)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4808 BitStream!4808 (_ BitVec 64) (_ BitVec 32)) Unit!8176)

(assert (=> b!132856 (= lt!205161 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6085 lt!205156) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132856 e!88108))

(declare-fun res!110352 () Bool)

(assert (=> b!132856 (=> (not res!110352) (not e!88108))))

(assert (=> b!132856 (= res!110352 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(declare-fun appendByte!0 (BitStream!4808 (_ BitVec 8)) tuple2!11558)

(assert (=> b!132856 (= lt!205156 (appendByte!0 thiss!1634 (select (arr!3407 arr!237) from!447)))))

(declare-fun b!132857 () Bool)

(declare-fun res!110354 () Bool)

(assert (=> b!132857 (=> (not res!110354) (not e!88103))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132857 (= res!110354 (invariant!0 (currentBit!5925 thiss!1634) (currentByte!5930 thiss!1634) (size!2772 (buf!3145 thiss!1634))))))

(declare-fun b!132858 () Bool)

(declare-fun res!110356 () Bool)

(assert (=> b!132858 (=> (not res!110356) (not e!88103))))

(assert (=> b!132858 (= res!110356 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132859 () Bool)

(declare-fun e!88107 () Bool)

(assert (=> b!132859 (= e!88100 e!88107)))

(declare-fun res!110347 () Bool)

(assert (=> b!132859 (=> (not res!110347) (not e!88107))))

(declare-fun lt!205160 () (_ BitVec 64))

(assert (=> b!132859 (= res!110347 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157))) (bvadd (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!205160))))))

(assert (=> b!132859 (= lt!205160 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!110351 () Bool)

(assert (=> start!25952 (=> (not res!110351) (not e!88103))))

(assert (=> start!25952 (= res!110351 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2772 arr!237))))))

(assert (=> start!25952 e!88103))

(assert (=> start!25952 true))

(declare-fun array_inv!2561 (array!6122) Bool)

(assert (=> start!25952 (array_inv!2561 arr!237)))

(declare-fun e!88106 () Bool)

(declare-fun inv!12 (BitStream!4808) Bool)

(assert (=> start!25952 (and (inv!12 thiss!1634) e!88106)))

(declare-fun b!132860 () Bool)

(declare-fun res!110344 () Bool)

(assert (=> b!132860 (=> (not res!110344) (not e!88103))))

(assert (=> b!132860 (= res!110344 (bvslt from!447 to!404))))

(declare-fun b!132861 () Bool)

(assert (=> b!132861 (= e!88107 (not e!88104))))

(declare-fun res!110353 () Bool)

(assert (=> b!132861 (=> res!110353 e!88104)))

(declare-fun lt!205169 () tuple2!11556)

(assert (=> b!132861 (= res!110353 (or (not (= (size!2772 (_2!6082 lt!205173)) (size!2772 arr!237))) (not (= (_1!6082 lt!205173) (_2!6084 lt!205169)))))))

(assert (=> b!132861 (= lt!205173 (readByteArrayLoopPure!0 (_1!6084 lt!205169) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132861 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205160)))

(declare-fun lt!205170 () Unit!8176)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4808 array!6122 (_ BitVec 64)) Unit!8176)

(assert (=> b!132861 (= lt!205170 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205160))))

(assert (=> b!132861 (= lt!205169 (reader!0 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(declare-fun b!132862 () Bool)

(assert (=> b!132862 (= e!88102 (= (_2!6083 lt!205158) (_2!6083 lt!205154)))))

(declare-fun b!132863 () Bool)

(declare-fun res!110350 () Bool)

(assert (=> b!132863 (=> (not res!110350) (not e!88108))))

(assert (=> b!132863 (= res!110350 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))))

(declare-fun b!132864 () Bool)

(assert (=> b!132864 (= e!88106 (array_inv!2561 (buf!3145 thiss!1634)))))

(declare-fun b!132865 () Bool)

(declare-fun res!110349 () Bool)

(assert (=> b!132865 (=> (not res!110349) (not e!88107))))

(assert (=> b!132865 (= res!110349 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(declare-fun b!132866 () Bool)

(assert (=> b!132866 (= e!88105 (invariant!0 (currentBit!5925 thiss!1634) (currentByte!5930 thiss!1634) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (= (and start!25952 res!110351) b!132858))

(assert (= (and b!132858 res!110356) b!132860))

(assert (= (and b!132860 res!110344) b!132857))

(assert (= (and b!132857 res!110354) b!132856))

(assert (= (and b!132856 res!110352) b!132863))

(assert (= (and b!132863 res!110350) b!132855))

(assert (= (and b!132855 res!110346) b!132854))

(assert (= (and b!132856 res!110345) b!132859))

(assert (= (and b!132859 res!110347) b!132865))

(assert (= (and b!132865 res!110349) b!132861))

(assert (= (and b!132861 (not res!110353)) b!132853))

(assert (= (and b!132856 res!110348) b!132866))

(assert (= (and b!132856 res!110355) b!132862))

(assert (= start!25952 b!132864))

(declare-fun m!200885 () Bool)

(assert (=> b!132856 m!200885))

(declare-fun m!200887 () Bool)

(assert (=> b!132856 m!200887))

(declare-fun m!200889 () Bool)

(assert (=> b!132856 m!200889))

(declare-fun m!200891 () Bool)

(assert (=> b!132856 m!200891))

(declare-fun m!200893 () Bool)

(assert (=> b!132856 m!200893))

(declare-fun m!200895 () Bool)

(assert (=> b!132856 m!200895))

(declare-fun m!200897 () Bool)

(assert (=> b!132856 m!200897))

(declare-fun m!200899 () Bool)

(assert (=> b!132856 m!200899))

(declare-fun m!200901 () Bool)

(assert (=> b!132856 m!200901))

(declare-fun m!200903 () Bool)

(assert (=> b!132856 m!200903))

(declare-fun m!200905 () Bool)

(assert (=> b!132856 m!200905))

(declare-fun m!200907 () Bool)

(assert (=> b!132856 m!200907))

(declare-fun m!200909 () Bool)

(assert (=> b!132856 m!200909))

(declare-fun m!200911 () Bool)

(assert (=> b!132856 m!200911))

(assert (=> b!132856 m!200885))

(declare-fun m!200913 () Bool)

(assert (=> b!132856 m!200913))

(declare-fun m!200915 () Bool)

(assert (=> b!132856 m!200915))

(declare-fun m!200917 () Bool)

(assert (=> b!132856 m!200917))

(declare-fun m!200919 () Bool)

(assert (=> b!132856 m!200919))

(declare-fun m!200921 () Bool)

(assert (=> b!132856 m!200921))

(declare-fun m!200923 () Bool)

(assert (=> b!132856 m!200923))

(declare-fun m!200925 () Bool)

(assert (=> b!132856 m!200925))

(declare-fun m!200927 () Bool)

(assert (=> b!132856 m!200927))

(declare-fun m!200929 () Bool)

(assert (=> b!132856 m!200929))

(declare-fun m!200931 () Bool)

(assert (=> b!132856 m!200931))

(declare-fun m!200933 () Bool)

(assert (=> b!132856 m!200933))

(assert (=> b!132856 m!200897))

(declare-fun m!200935 () Bool)

(assert (=> b!132856 m!200935))

(declare-fun m!200937 () Bool)

(assert (=> b!132858 m!200937))

(declare-fun m!200939 () Bool)

(assert (=> b!132865 m!200939))

(declare-fun m!200941 () Bool)

(assert (=> b!132855 m!200941))

(declare-fun m!200943 () Bool)

(assert (=> start!25952 m!200943))

(declare-fun m!200945 () Bool)

(assert (=> start!25952 m!200945))

(declare-fun m!200947 () Bool)

(assert (=> b!132861 m!200947))

(declare-fun m!200949 () Bool)

(assert (=> b!132861 m!200949))

(declare-fun m!200951 () Bool)

(assert (=> b!132861 m!200951))

(assert (=> b!132861 m!200891))

(declare-fun m!200953 () Bool)

(assert (=> b!132859 m!200953))

(declare-fun m!200955 () Bool)

(assert (=> b!132859 m!200955))

(declare-fun m!200957 () Bool)

(assert (=> b!132864 m!200957))

(declare-fun m!200959 () Bool)

(assert (=> b!132866 m!200959))

(declare-fun m!200961 () Bool)

(assert (=> b!132857 m!200961))

(assert (=> b!132854 m!200897))

(declare-fun m!200963 () Bool)

(assert (=> b!132854 m!200963))

(declare-fun m!200965 () Bool)

(assert (=> b!132854 m!200965))

(declare-fun m!200967 () Bool)

(assert (=> b!132853 m!200967))

(assert (=> b!132863 m!200955))

(declare-fun m!200969 () Bool)

(assert (=> b!132863 m!200969))

(push 1)

(assert (not b!132854))

(assert (not b!132864))

(assert (not b!132858))

(assert (not b!132863))

(assert (not b!132856))

(assert (not b!132859))

(assert (not b!132855))

(assert (not b!132853))

(assert (not b!132865))

(assert (not b!132861))

(assert (not b!132866))

(assert (not start!25952))

(assert (not b!132857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!42211 () Bool)

(assert (=> d!42211 (= (invariant!0 (currentBit!5925 thiss!1634) (currentByte!5930 thiss!1634) (size!2772 (buf!3145 thiss!1634))) (and (bvsge (currentBit!5925 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5925 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5930 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5930 thiss!1634) (size!2772 (buf!3145 thiss!1634))) (and (= (currentBit!5925 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5930 thiss!1634) (size!2772 (buf!3145 thiss!1634)))))))))

(assert (=> b!132857 d!42211))

(declare-fun d!42213 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42213 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10318 () Bool)

(assert (= bs!10318 d!42213))

(declare-fun m!201037 () Bool)

(assert (=> bs!10318 m!201037))

(assert (=> b!132856 d!42213))

(declare-fun d!42215 () Bool)

(declare-fun e!88146 () Bool)

(assert (=> d!42215 e!88146))

(declare-fun res!110411 () Bool)

(assert (=> d!42215 (=> (not res!110411) (not e!88146))))

(assert (=> d!42215 (= res!110411 (and (or (let ((rhs!3097 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3097 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3097) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42216 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42216 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42216 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3096 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3096 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3096) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205314 () Unit!8176)

(declare-fun choose!57 (BitStream!4808 BitStream!4808 (_ BitVec 64) (_ BitVec 32)) Unit!8176)

(assert (=> d!42215 (= lt!205314 (choose!57 thiss!1634 (_2!6085 lt!205156) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42215 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6085 lt!205156) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!205314)))

(declare-fun lt!205315 () (_ BitVec 32))

(declare-fun b!132927 () Bool)

(assert (=> b!132927 (= e!88146 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) (bvsub (bvsub to!404 from!447) lt!205315)))))

(assert (=> b!132927 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!205315 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!205315) #b10000000000000000000000000000000)))))

(declare-fun lt!205313 () (_ BitVec 64))

(assert (=> b!132927 (= lt!205315 ((_ extract 31 0) lt!205313))))

(assert (=> b!132927 (and (bvslt lt!205313 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!205313 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!132927 (= lt!205313 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42215 res!110411) b!132927))

(declare-fun m!201039 () Bool)

(assert (=> d!42215 m!201039))

(declare-fun m!201041 () Bool)

(assert (=> b!132927 m!201041))

(assert (=> b!132856 d!42215))

(declare-datatypes ((tuple3!504 0))(
  ( (tuple3!505 (_1!6088 Unit!8176) (_2!6088 BitStream!4808) (_3!307 array!6122)) )
))
(declare-fun lt!205318 () tuple3!504)

(declare-fun d!42218 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4808 array!6122 (_ BitVec 32) (_ BitVec 32)) tuple3!504)

(assert (=> d!42218 (= lt!205318 (readByteArrayLoop!0 (_1!6084 lt!205168) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42218 (= (readByteArrayLoopPure!0 (_1!6084 lt!205168) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11553 (_2!6088 lt!205318) (_3!307 lt!205318)))))

(declare-fun bs!10319 () Bool)

(assert (= bs!10319 d!42218))

(declare-fun m!201061 () Bool)

(assert (=> bs!10319 m!201061))

(assert (=> b!132856 d!42218))

(declare-fun b!132952 () Bool)

(declare-fun e!88161 () Unit!8176)

(declare-fun lt!205400 () Unit!8176)

(assert (=> b!132952 (= e!88161 lt!205400)))

(declare-fun lt!205397 () (_ BitVec 64))

(assert (=> b!132952 (= lt!205397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205384 () (_ BitVec 64))

(assert (=> b!132952 (= lt!205384 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6122 array!6122 (_ BitVec 64) (_ BitVec 64)) Unit!8176)

(assert (=> b!132952 (= lt!205400 (arrayBitRangesEqSymmetric!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205157)) lt!205397 lt!205384))))

(declare-fun arrayBitRangesEq!0 (array!6122 array!6122 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132952 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 thiss!1634) lt!205397 lt!205384)))

(declare-fun d!42223 () Bool)

(declare-fun e!88160 () Bool)

(assert (=> d!42223 e!88160))

(declare-fun res!110433 () Bool)

(assert (=> d!42223 (=> (not res!110433) (not e!88160))))

(declare-fun lt!205393 () tuple2!11556)

(assert (=> d!42223 (= res!110433 (isPrefixOf!0 (_1!6084 lt!205393) (_2!6084 lt!205393)))))

(declare-fun lt!205389 () BitStream!4808)

(assert (=> d!42223 (= lt!205393 (tuple2!11557 lt!205389 (_2!6085 lt!205157)))))

(declare-fun lt!205392 () Unit!8176)

(declare-fun lt!205386 () Unit!8176)

(assert (=> d!42223 (= lt!205392 lt!205386)))

(assert (=> d!42223 (isPrefixOf!0 lt!205389 (_2!6085 lt!205157))))

(assert (=> d!42223 (= lt!205386 (lemmaIsPrefixTransitive!0 lt!205389 (_2!6085 lt!205157) (_2!6085 lt!205157)))))

(declare-fun lt!205383 () Unit!8176)

(declare-fun lt!205385 () Unit!8176)

(assert (=> d!42223 (= lt!205383 lt!205385)))

(assert (=> d!42223 (isPrefixOf!0 lt!205389 (_2!6085 lt!205157))))

(assert (=> d!42223 (= lt!205385 (lemmaIsPrefixTransitive!0 lt!205389 thiss!1634 (_2!6085 lt!205157)))))

(declare-fun lt!205381 () Unit!8176)

(assert (=> d!42223 (= lt!205381 e!88161)))

(declare-fun c!7590 () Bool)

(assert (=> d!42223 (= c!7590 (not (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!205398 () Unit!8176)

(declare-fun lt!205395 () Unit!8176)

(assert (=> d!42223 (= lt!205398 lt!205395)))

(assert (=> d!42223 (isPrefixOf!0 (_2!6085 lt!205157) (_2!6085 lt!205157))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4808) Unit!8176)

(assert (=> d!42223 (= lt!205395 (lemmaIsPrefixRefl!0 (_2!6085 lt!205157)))))

(declare-fun lt!205391 () Unit!8176)

(declare-fun lt!205396 () Unit!8176)

(assert (=> d!42223 (= lt!205391 lt!205396)))

(assert (=> d!42223 (= lt!205396 (lemmaIsPrefixRefl!0 (_2!6085 lt!205157)))))

(declare-fun lt!205382 () Unit!8176)

(declare-fun lt!205399 () Unit!8176)

(assert (=> d!42223 (= lt!205382 lt!205399)))

(assert (=> d!42223 (isPrefixOf!0 lt!205389 lt!205389)))

(assert (=> d!42223 (= lt!205399 (lemmaIsPrefixRefl!0 lt!205389))))

(declare-fun lt!205390 () Unit!8176)

(declare-fun lt!205388 () Unit!8176)

(assert (=> d!42223 (= lt!205390 lt!205388)))

(assert (=> d!42223 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42223 (= lt!205388 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42223 (= lt!205389 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(assert (=> d!42223 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205157))))

(assert (=> d!42223 (= (reader!0 thiss!1634 (_2!6085 lt!205157)) lt!205393)))

(declare-fun lt!205394 () (_ BitVec 64))

(declare-fun b!132953 () Bool)

(declare-fun lt!205387 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4808 (_ BitVec 64)) BitStream!4808)

(assert (=> b!132953 (= e!88160 (= (_1!6084 lt!205393) (withMovedBitIndex!0 (_2!6084 lt!205393) (bvsub lt!205394 lt!205387))))))

(assert (=> b!132953 (or (= (bvand lt!205394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205394 lt!205387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132953 (= lt!205387 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157))))))

(assert (=> b!132953 (= lt!205394 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(declare-fun b!132954 () Bool)

(declare-fun res!110434 () Bool)

(assert (=> b!132954 (=> (not res!110434) (not e!88160))))

(assert (=> b!132954 (= res!110434 (isPrefixOf!0 (_1!6084 lt!205393) thiss!1634))))

(declare-fun b!132955 () Bool)

(declare-fun Unit!8181 () Unit!8176)

(assert (=> b!132955 (= e!88161 Unit!8181)))

(declare-fun b!132956 () Bool)

(declare-fun res!110432 () Bool)

(assert (=> b!132956 (=> (not res!110432) (not e!88160))))

(assert (=> b!132956 (= res!110432 (isPrefixOf!0 (_2!6084 lt!205393) (_2!6085 lt!205157)))))

(assert (= (and d!42223 c!7590) b!132952))

(assert (= (and d!42223 (not c!7590)) b!132955))

(assert (= (and d!42223 res!110433) b!132954))

(assert (= (and b!132954 res!110434) b!132956))

(assert (= (and b!132956 res!110432) b!132953))

(declare-fun m!201085 () Bool)

(assert (=> b!132954 m!201085))

(declare-fun m!201091 () Bool)

(assert (=> b!132953 m!201091))

(assert (=> b!132953 m!200953))

(assert (=> b!132953 m!200969))

(assert (=> b!132952 m!200969))

(declare-fun m!201095 () Bool)

(assert (=> b!132952 m!201095))

(declare-fun m!201097 () Bool)

(assert (=> b!132952 m!201097))

(declare-fun m!201099 () Bool)

(assert (=> d!42223 m!201099))

(declare-fun m!201101 () Bool)

(assert (=> d!42223 m!201101))

(declare-fun m!201103 () Bool)

(assert (=> d!42223 m!201103))

(declare-fun m!201105 () Bool)

(assert (=> d!42223 m!201105))

(declare-fun m!201107 () Bool)

(assert (=> d!42223 m!201107))

(declare-fun m!201109 () Bool)

(assert (=> d!42223 m!201109))

(declare-fun m!201111 () Bool)

(assert (=> d!42223 m!201111))

(declare-fun m!201113 () Bool)

(assert (=> d!42223 m!201113))

(assert (=> d!42223 m!200909))

(declare-fun m!201115 () Bool)

(assert (=> d!42223 m!201115))

(declare-fun m!201117 () Bool)

(assert (=> d!42223 m!201117))

(declare-fun m!201119 () Bool)

(assert (=> b!132956 m!201119))

(assert (=> b!132856 d!42223))

(declare-fun d!42237 () Bool)

(declare-datatypes ((tuple2!11562 0))(
  ( (tuple2!11563 (_1!6089 (_ BitVec 8)) (_2!6089 BitStream!4808)) )
))
(declare-fun lt!205436 () tuple2!11562)

(declare-fun readByte!0 (BitStream!4808) tuple2!11562)

(assert (=> d!42237 (= lt!205436 (readByte!0 (_1!6084 lt!205162)))))

(assert (=> d!42237 (= (readBytePure!0 (_1!6084 lt!205162)) (tuple2!11555 (_2!6089 lt!205436) (_1!6089 lt!205436)))))

(declare-fun bs!10325 () Bool)

(assert (= bs!10325 d!42237))

(declare-fun m!201147 () Bool)

(assert (=> bs!10325 m!201147))

(assert (=> b!132856 d!42237))

(declare-fun d!42247 () Bool)

(assert (=> d!42247 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!205445 () Unit!8176)

(declare-fun choose!26 (BitStream!4808 array!6122 (_ BitVec 32) BitStream!4808) Unit!8176)

(assert (=> d!42247 (= lt!205445 (choose!26 thiss!1634 (buf!3145 (_2!6085 lt!205157)) (bvsub to!404 from!447) (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (=> d!42247 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3145 (_2!6085 lt!205157)) (bvsub to!404 from!447)) lt!205445)))

(declare-fun bs!10326 () Bool)

(assert (= bs!10326 d!42247))

(assert (=> bs!10326 m!200895))

(declare-fun m!201161 () Bool)

(assert (=> bs!10326 m!201161))

(assert (=> b!132856 d!42247))

(declare-fun lt!205446 () tuple3!504)

(declare-fun d!42253 () Bool)

(assert (=> d!42253 (= lt!205446 (readByteArrayLoop!0 (_1!6084 lt!205162) arr!237 from!447 to!404))))

(assert (=> d!42253 (= (readByteArrayLoopPure!0 (_1!6084 lt!205162) arr!237 from!447 to!404) (tuple2!11553 (_2!6088 lt!205446) (_3!307 lt!205446)))))

(declare-fun bs!10327 () Bool)

(assert (= bs!10327 d!42253))

(declare-fun m!201163 () Bool)

(assert (=> bs!10327 m!201163))

(assert (=> b!132856 d!42253))

(declare-fun d!42255 () Bool)

(assert (=> d!42255 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205163) (bvsle ((_ sign_extend 32) lt!205163) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10328 () Bool)

(assert (= bs!10328 d!42255))

(declare-fun m!201165 () Bool)

(assert (=> bs!10328 m!201165))

(assert (=> b!132856 d!42255))

(declare-fun d!42257 () Bool)

(declare-fun e!88172 () Bool)

(assert (=> d!42257 e!88172))

(declare-fun res!110452 () Bool)

(assert (=> d!42257 (=> (not res!110452) (not e!88172))))

(declare-fun lt!205475 () (_ BitVec 64))

(declare-fun lt!205476 () (_ BitVec 64))

(declare-fun lt!205474 () (_ BitVec 64))

(assert (=> d!42257 (= res!110452 (= lt!205474 (bvsub lt!205475 lt!205476)))))

(assert (=> d!42257 (or (= (bvand lt!205475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205475 lt!205476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42257 (= lt!205476 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205158)))) ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205158))) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205158)))))))

(declare-fun lt!205473 () (_ BitVec 64))

(declare-fun lt!205472 () (_ BitVec 64))

(assert (=> d!42257 (= lt!205475 (bvmul lt!205473 lt!205472))))

(assert (=> d!42257 (or (= lt!205473 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205472 (bvsdiv (bvmul lt!205473 lt!205472) lt!205473)))))

(assert (=> d!42257 (= lt!205472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42257 (= lt!205473 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205158)))))))

(assert (=> d!42257 (= lt!205474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205158))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205158)))))))

(assert (=> d!42257 (invariant!0 (currentBit!5925 (_1!6083 lt!205158)) (currentByte!5930 (_1!6083 lt!205158)) (size!2772 (buf!3145 (_1!6083 lt!205158))))))

(assert (=> d!42257 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205158))) (currentByte!5930 (_1!6083 lt!205158)) (currentBit!5925 (_1!6083 lt!205158))) lt!205474)))

(declare-fun b!132976 () Bool)

(declare-fun res!110453 () Bool)

(assert (=> b!132976 (=> (not res!110453) (not e!88172))))

(assert (=> b!132976 (= res!110453 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205474))))

(declare-fun b!132977 () Bool)

(declare-fun lt!205471 () (_ BitVec 64))

(assert (=> b!132977 (= e!88172 (bvsle lt!205474 (bvmul lt!205471 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132977 (or (= lt!205471 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205471 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205471)))))

(assert (=> b!132977 (= lt!205471 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205158)))))))

(assert (= (and d!42257 res!110452) b!132976))

(assert (= (and b!132976 res!110453) b!132977))

(declare-fun m!201175 () Bool)

(assert (=> d!42257 m!201175))

(declare-fun m!201177 () Bool)

(assert (=> d!42257 m!201177))

(assert (=> b!132856 d!42257))

(declare-fun d!42263 () Bool)

(assert (=> d!42263 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205163)))

(declare-fun lt!205477 () Unit!8176)

(assert (=> d!42263 (= lt!205477 (choose!26 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205163 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (=> d!42263 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205163) lt!205477)))

(declare-fun bs!10330 () Bool)

(assert (= bs!10330 d!42263))

(assert (=> bs!10330 m!200905))

(declare-fun m!201179 () Bool)

(assert (=> bs!10330 m!201179))

(assert (=> b!132856 d!42263))

(declare-fun d!42265 () Bool)

(declare-fun e!88173 () Bool)

(assert (=> d!42265 e!88173))

(declare-fun res!110454 () Bool)

(assert (=> d!42265 (=> (not res!110454) (not e!88173))))

(declare-fun lt!205483 () (_ BitVec 64))

(declare-fun lt!205482 () (_ BitVec 64))

(declare-fun lt!205481 () (_ BitVec 64))

(assert (=> d!42265 (= res!110454 (= lt!205481 (bvsub lt!205482 lt!205483)))))

(assert (=> d!42265 (or (= (bvand lt!205482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205482 lt!205483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42265 (= lt!205483 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205154)))) ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205154))) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205154)))))))

(declare-fun lt!205480 () (_ BitVec 64))

(declare-fun lt!205479 () (_ BitVec 64))

(assert (=> d!42265 (= lt!205482 (bvmul lt!205480 lt!205479))))

(assert (=> d!42265 (or (= lt!205480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205479 (bvsdiv (bvmul lt!205480 lt!205479) lt!205480)))))

(assert (=> d!42265 (= lt!205479 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42265 (= lt!205480 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205154)))))))

(assert (=> d!42265 (= lt!205481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205154))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205154)))))))

(assert (=> d!42265 (invariant!0 (currentBit!5925 (_1!6083 lt!205154)) (currentByte!5930 (_1!6083 lt!205154)) (size!2772 (buf!3145 (_1!6083 lt!205154))))))

(assert (=> d!42265 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205154))) (currentByte!5930 (_1!6083 lt!205154)) (currentBit!5925 (_1!6083 lt!205154))) lt!205481)))

(declare-fun b!132978 () Bool)

(declare-fun res!110455 () Bool)

(assert (=> b!132978 (=> (not res!110455) (not e!88173))))

(assert (=> b!132978 (= res!110455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205481))))

(declare-fun b!132979 () Bool)

(declare-fun lt!205478 () (_ BitVec 64))

(assert (=> b!132979 (= e!88173 (bvsle lt!205481 (bvmul lt!205478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132979 (or (= lt!205478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205478)))))

(assert (=> b!132979 (= lt!205478 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205154)))))))

(assert (= (and d!42265 res!110454) b!132978))

(assert (= (and b!132978 res!110455) b!132979))

(declare-fun m!201181 () Bool)

(assert (=> d!42265 m!201181))

(declare-fun m!201183 () Bool)

(assert (=> d!42265 m!201183))

(assert (=> b!132856 d!42265))

(declare-fun d!42267 () Bool)

(assert (=> d!42267 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205157))))

(declare-fun lt!205494 () Unit!8176)

(declare-fun choose!30 (BitStream!4808 BitStream!4808 BitStream!4808) Unit!8176)

(assert (=> d!42267 (= lt!205494 (choose!30 thiss!1634 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(assert (=> d!42267 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205156))))

(assert (=> d!42267 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6085 lt!205156) (_2!6085 lt!205157)) lt!205494)))

(declare-fun bs!10332 () Bool)

(assert (= bs!10332 d!42267))

(assert (=> bs!10332 m!200909))

(declare-fun m!201185 () Bool)

(assert (=> bs!10332 m!201185))

(assert (=> bs!10332 m!200941))

(assert (=> b!132856 d!42267))

(declare-fun d!42269 () Bool)

(declare-fun e!88178 () Bool)

(assert (=> d!42269 e!88178))

(declare-fun res!110467 () Bool)

(assert (=> d!42269 (=> (not res!110467) (not e!88178))))

(declare-fun lt!205532 () tuple2!11558)

(assert (=> d!42269 (= res!110467 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 (_2!6085 lt!205532)))))))

(declare-fun choose!6 (BitStream!4808 (_ BitVec 8)) tuple2!11558)

(assert (=> d!42269 (= lt!205532 (choose!6 thiss!1634 (select (arr!3407 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42269 (validate_offset_byte!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)))))

(assert (=> d!42269 (= (appendByte!0 thiss!1634 (select (arr!3407 arr!237) from!447)) lt!205532)))

(declare-fun b!132991 () Bool)

(declare-fun res!110466 () Bool)

(assert (=> b!132991 (=> (not res!110466) (not e!88178))))

(declare-fun lt!205533 () (_ BitVec 64))

(declare-fun lt!205534 () (_ BitVec 64))

(assert (=> b!132991 (= res!110466 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205532))) (currentByte!5930 (_2!6085 lt!205532)) (currentBit!5925 (_2!6085 lt!205532))) (bvadd lt!205534 lt!205533)))))

(assert (=> b!132991 (or (not (= (bvand lt!205534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205533 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205534 lt!205533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132991 (= lt!205533 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!132991 (= lt!205534 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(declare-fun b!132992 () Bool)

(declare-fun res!110465 () Bool)

(assert (=> b!132992 (=> (not res!110465) (not e!88178))))

(assert (=> b!132992 (= res!110465 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205532)))))

(declare-fun b!132993 () Bool)

(declare-fun lt!205535 () tuple2!11556)

(declare-fun lt!205536 () tuple2!11554)

(assert (=> b!132993 (= e!88178 (and (= (_2!6083 lt!205536) (select (arr!3407 arr!237) from!447)) (= (_1!6083 lt!205536) (_2!6084 lt!205535))))))

(assert (=> b!132993 (= lt!205536 (readBytePure!0 (_1!6084 lt!205535)))))

(assert (=> b!132993 (= lt!205535 (reader!0 thiss!1634 (_2!6085 lt!205532)))))

(assert (= (and d!42269 res!110467) b!132991))

(assert (= (and b!132991 res!110466) b!132992))

(assert (= (and b!132992 res!110465) b!132993))

(assert (=> d!42269 m!200897))

(declare-fun m!201223 () Bool)

(assert (=> d!42269 m!201223))

(declare-fun m!201225 () Bool)

(assert (=> d!42269 m!201225))

(declare-fun m!201227 () Bool)

(assert (=> b!132991 m!201227))

(assert (=> b!132991 m!200969))

(declare-fun m!201229 () Bool)

(assert (=> b!132992 m!201229))

(declare-fun m!201231 () Bool)

(assert (=> b!132993 m!201231))

(declare-fun m!201233 () Bool)

(assert (=> b!132993 m!201233))

(assert (=> b!132856 d!42269))

(declare-fun d!42279 () Bool)

(declare-fun res!110475 () Bool)

(declare-fun e!88184 () Bool)

(assert (=> d!42279 (=> (not res!110475) (not e!88184))))

(assert (=> d!42279 (= res!110475 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42279 (= (isPrefixOf!0 thiss!1634 (_2!6085 lt!205157)) e!88184)))

(declare-fun b!133000 () Bool)

(declare-fun res!110474 () Bool)

(assert (=> b!133000 (=> (not res!110474) (not e!88184))))

(assert (=> b!133000 (= res!110474 (bvsle (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133001 () Bool)

(declare-fun e!88183 () Bool)

(assert (=> b!133001 (= e!88184 e!88183)))

(declare-fun res!110476 () Bool)

(assert (=> b!133001 (=> res!110476 e!88183)))

(assert (=> b!133001 (= res!110476 (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133002 () Bool)

(assert (=> b!133002 (= e!88183 (arrayBitRangesEq!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (= (and d!42279 res!110475) b!133000))

(assert (= (and b!133000 res!110474) b!133001))

(assert (= (and b!133001 (not res!110476)) b!133002))

(assert (=> b!133000 m!200969))

(assert (=> b!133000 m!200953))

(assert (=> b!133002 m!200969))

(assert (=> b!133002 m!200969))

(declare-fun m!201235 () Bool)

(assert (=> b!133002 m!201235))

(assert (=> b!132856 d!42279))

(declare-fun d!42281 () Bool)

(declare-fun res!110481 () Bool)

(declare-fun e!88189 () Bool)

(assert (=> d!42281 (=> res!110481 e!88189)))

(assert (=> d!42281 (= res!110481 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42281 (= (arrayRangesEq!175 (_2!6082 lt!205153) (_2!6082 lt!205151) #b00000000000000000000000000000000 to!404) e!88189)))

(declare-fun b!133007 () Bool)

(declare-fun e!88190 () Bool)

(assert (=> b!133007 (= e!88189 e!88190)))

(declare-fun res!110482 () Bool)

(assert (=> b!133007 (=> (not res!110482) (not e!88190))))

(assert (=> b!133007 (= res!110482 (= (select (arr!3407 (_2!6082 lt!205153)) #b00000000000000000000000000000000) (select (arr!3407 (_2!6082 lt!205151)) #b00000000000000000000000000000000)))))

(declare-fun b!133008 () Bool)

(assert (=> b!133008 (= e!88190 (arrayRangesEq!175 (_2!6082 lt!205153) (_2!6082 lt!205151) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42281 (not res!110481)) b!133007))

(assert (= (and b!133007 res!110482) b!133008))

(declare-fun m!201237 () Bool)

(assert (=> b!133007 m!201237))

(declare-fun m!201239 () Bool)

(assert (=> b!133007 m!201239))

(declare-fun m!201241 () Bool)

(assert (=> b!133008 m!201241))

(assert (=> b!132856 d!42281))

(declare-fun d!42283 () Bool)

(declare-fun lt!205537 () tuple2!11562)

(assert (=> d!42283 (= lt!205537 (readByte!0 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (=> d!42283 (= (readBytePure!0 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) (tuple2!11555 (_2!6089 lt!205537) (_1!6089 lt!205537)))))

(declare-fun bs!10337 () Bool)

(assert (= bs!10337 d!42283))

(declare-fun m!201243 () Bool)

(assert (=> bs!10337 m!201243))

(assert (=> b!132856 d!42283))

(declare-fun d!42285 () Bool)

(declare-fun e!88193 () Bool)

(assert (=> d!42285 e!88193))

(declare-fun res!110485 () Bool)

(assert (=> d!42285 (=> (not res!110485) (not e!88193))))

(declare-fun lt!205549 () tuple2!11554)

(declare-fun lt!205546 () tuple2!11554)

(assert (=> d!42285 (= res!110485 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205549))) (currentByte!5930 (_1!6083 lt!205549)) (currentBit!5925 (_1!6083 lt!205549))) (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205546))) (currentByte!5930 (_1!6083 lt!205546)) (currentBit!5925 (_1!6083 lt!205546)))))))

(declare-fun lt!205547 () Unit!8176)

(declare-fun lt!205548 () BitStream!4808)

(declare-fun choose!14 (BitStream!4808 BitStream!4808 BitStream!4808 tuple2!11554 tuple2!11554 BitStream!4808 (_ BitVec 8) tuple2!11554 tuple2!11554 BitStream!4808 (_ BitVec 8)) Unit!8176)

(assert (=> d!42285 (= lt!205547 (choose!14 lt!205171 (_2!6085 lt!205157) lt!205548 lt!205549 (tuple2!11555 (_1!6083 lt!205549) (_2!6083 lt!205549)) (_1!6083 lt!205549) (_2!6083 lt!205549) lt!205546 (tuple2!11555 (_1!6083 lt!205546) (_2!6083 lt!205546)) (_1!6083 lt!205546) (_2!6083 lt!205546)))))

(assert (=> d!42285 (= lt!205546 (readBytePure!0 lt!205548))))

(assert (=> d!42285 (= lt!205549 (readBytePure!0 lt!205171))))

(assert (=> d!42285 (= lt!205548 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 lt!205171) (currentBit!5925 lt!205171)))))

(assert (=> d!42285 (= (readBytePrefixLemma!0 lt!205171 (_2!6085 lt!205157)) lt!205547)))

(declare-fun b!133011 () Bool)

(assert (=> b!133011 (= e!88193 (= (_2!6083 lt!205549) (_2!6083 lt!205546)))))

(assert (= (and d!42285 res!110485) b!133011))

(declare-fun m!201245 () Bool)

(assert (=> d!42285 m!201245))

(declare-fun m!201247 () Bool)

(assert (=> d!42285 m!201247))

(declare-fun m!201249 () Bool)

(assert (=> d!42285 m!201249))

(assert (=> d!42285 m!200921))

(declare-fun m!201251 () Bool)

(assert (=> d!42285 m!201251))

(assert (=> b!132856 d!42285))

(declare-fun d!42287 () Bool)

(declare-fun lt!205550 () tuple3!504)

(assert (=> d!42287 (= lt!205550 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42287 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11553 (_2!6088 lt!205550) (_3!307 lt!205550)))))

(declare-fun bs!10338 () Bool)

(assert (= bs!10338 d!42287))

(assert (=> bs!10338 m!200885))

(declare-fun m!201253 () Bool)

(assert (=> bs!10338 m!201253))

(assert (=> b!132856 d!42287))

(declare-fun b!133022 () Bool)

(declare-fun e!88200 () Bool)

(declare-fun lt!205572 () (_ BitVec 64))

(assert (=> b!133022 (= e!88200 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205572))))

(declare-fun b!133023 () Bool)

(declare-fun res!110499 () Bool)

(declare-fun e!88201 () Bool)

(assert (=> b!133023 (=> (not res!110499) (not e!88201))))

(declare-fun lt!205570 () tuple2!11558)

(assert (=> b!133023 (= res!110499 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205570)))))

(declare-fun b!133024 () Bool)

(declare-fun e!88202 () Bool)

(assert (=> b!133024 (= e!88201 e!88202)))

(declare-fun res!110498 () Bool)

(assert (=> b!133024 (=> (not res!110498) (not e!88202))))

(declare-fun lt!205569 () tuple2!11552)

(declare-fun lt!205576 () tuple2!11556)

(assert (=> b!133024 (= res!110498 (and (= (size!2772 (_2!6082 lt!205569)) (size!2772 arr!237)) (= (_1!6082 lt!205569) (_2!6084 lt!205576))))))

(assert (=> b!133024 (= lt!205569 (readByteArrayLoopPure!0 (_1!6084 lt!205576) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205573 () Unit!8176)

(declare-fun lt!205571 () Unit!8176)

(assert (=> b!133024 (= lt!205573 lt!205571)))

(assert (=> b!133024 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205572)))

(assert (=> b!133024 (= lt!205571 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205570)) lt!205572))))

(assert (=> b!133024 e!88200))

(declare-fun res!110496 () Bool)

(assert (=> b!133024 (=> (not res!110496) (not e!88200))))

(assert (=> b!133024 (= res!110496 (and (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 lt!205570)))) (bvsge lt!205572 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133024 (= lt!205572 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133024 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133024 (= lt!205576 (reader!0 (_2!6085 lt!205156) (_2!6085 lt!205570)))))

(declare-fun b!133025 () Bool)

(assert (=> b!133025 (= e!88202 (arrayRangesEq!175 arr!237 (_2!6082 lt!205569) #b00000000000000000000000000000000 to!404))))

(declare-fun b!133026 () Bool)

(declare-fun res!110497 () Bool)

(assert (=> b!133026 (=> (not res!110497) (not e!88201))))

(declare-fun lt!205574 () (_ BitVec 64))

(declare-fun lt!205577 () (_ BitVec 64))

(assert (=> b!133026 (= res!110497 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205570))) (currentByte!5930 (_2!6085 lt!205570)) (currentBit!5925 (_2!6085 lt!205570))) (bvadd lt!205574 lt!205577)))))

(assert (=> b!133026 (or (not (= (bvand lt!205574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205577 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205574 lt!205577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!205575 () (_ BitVec 64))

(assert (=> b!133026 (= lt!205577 (bvmul lt!205575 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!133026 (or (= lt!205575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205575)))))

(assert (=> b!133026 (= lt!205575 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133026 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133026 (= lt!205574 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(declare-fun d!42289 () Bool)

(assert (=> d!42289 e!88201))

(declare-fun res!110500 () Bool)

(assert (=> d!42289 (=> (not res!110500) (not e!88201))))

(assert (=> d!42289 (= res!110500 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 lt!205570)))))))

(declare-fun choose!64 (BitStream!4808 array!6122 (_ BitVec 32) (_ BitVec 32)) tuple2!11558)

(assert (=> d!42289 (= lt!205570 (choose!64 (_2!6085 lt!205156) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42289 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2772 arr!237)))))

(assert (=> d!42289 (= (appendByteArrayLoop!0 (_2!6085 lt!205156) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!205570)))

(assert (= (and d!42289 res!110500) b!133026))

(assert (= (and b!133026 res!110497) b!133023))

(assert (= (and b!133023 res!110499) b!133024))

(assert (= (and b!133024 res!110496) b!133022))

(assert (= (and b!133024 res!110498) b!133025))

(declare-fun m!201255 () Bool)

(assert (=> b!133024 m!201255))

(declare-fun m!201257 () Bool)

(assert (=> b!133024 m!201257))

(declare-fun m!201259 () Bool)

(assert (=> b!133024 m!201259))

(declare-fun m!201261 () Bool)

(assert (=> b!133024 m!201261))

(declare-fun m!201263 () Bool)

(assert (=> b!133026 m!201263))

(assert (=> b!133026 m!200955))

(declare-fun m!201265 () Bool)

(assert (=> d!42289 m!201265))

(declare-fun m!201267 () Bool)

(assert (=> b!133023 m!201267))

(declare-fun m!201269 () Bool)

(assert (=> b!133025 m!201269))

(declare-fun m!201271 () Bool)

(assert (=> b!133022 m!201271))

(assert (=> b!132856 d!42289))

(declare-fun d!42291 () Bool)

(declare-fun lt!205586 () tuple2!11552)

(declare-fun lt!205588 () tuple2!11552)

(assert (=> d!42291 (arrayRangesEq!175 (_2!6082 lt!205586) (_2!6082 lt!205588) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!205589 () Unit!8176)

(declare-fun lt!205587 () BitStream!4808)

(declare-fun choose!35 (BitStream!4808 array!6122 (_ BitVec 32) (_ BitVec 32) tuple2!11552 array!6122 BitStream!4808 tuple2!11552 array!6122) Unit!8176)

(assert (=> d!42291 (= lt!205589 (choose!35 (_1!6084 lt!205162) arr!237 from!447 to!404 lt!205586 (_2!6082 lt!205586) lt!205587 lt!205588 (_2!6082 lt!205588)))))

(assert (=> d!42291 (= lt!205588 (readByteArrayLoopPure!0 lt!205587 (array!6123 (store (arr!3407 arr!237) from!447 (_2!6083 (readBytePure!0 (_1!6084 lt!205162)))) (size!2772 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42291 (= lt!205587 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001))))

(assert (=> d!42291 (= lt!205586 (readByteArrayLoopPure!0 (_1!6084 lt!205162) arr!237 from!447 to!404))))

(assert (=> d!42291 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6084 lt!205162) arr!237 from!447 to!404) lt!205589)))

(declare-fun bs!10340 () Bool)

(assert (= bs!10340 d!42291))

(assert (=> bs!10340 m!200911))

(declare-fun m!201273 () Bool)

(assert (=> bs!10340 m!201273))

(assert (=> bs!10340 m!200887))

(declare-fun m!201275 () Bool)

(assert (=> bs!10340 m!201275))

(declare-fun m!201277 () Bool)

(assert (=> bs!10340 m!201277))

(assert (=> bs!10340 m!200885))

(declare-fun m!201279 () Bool)

(assert (=> bs!10340 m!201279))

(assert (=> b!132856 d!42291))

(declare-fun b!133027 () Bool)

(declare-fun e!88204 () Unit!8176)

(declare-fun lt!205609 () Unit!8176)

(assert (=> b!133027 (= e!88204 lt!205609)))

(declare-fun lt!205606 () (_ BitVec 64))

(assert (=> b!133027 (= lt!205606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205593 () (_ BitVec 64))

(assert (=> b!133027 (= lt!205593 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(assert (=> b!133027 (= lt!205609 (arrayBitRangesEqSymmetric!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205157)) lt!205606 lt!205593))))

(assert (=> b!133027 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 (_2!6085 lt!205156)) lt!205606 lt!205593)))

(declare-fun d!42293 () Bool)

(declare-fun e!88203 () Bool)

(assert (=> d!42293 e!88203))

(declare-fun res!110502 () Bool)

(assert (=> d!42293 (=> (not res!110502) (not e!88203))))

(declare-fun lt!205602 () tuple2!11556)

(assert (=> d!42293 (= res!110502 (isPrefixOf!0 (_1!6084 lt!205602) (_2!6084 lt!205602)))))

(declare-fun lt!205598 () BitStream!4808)

(assert (=> d!42293 (= lt!205602 (tuple2!11557 lt!205598 (_2!6085 lt!205157)))))

(declare-fun lt!205601 () Unit!8176)

(declare-fun lt!205595 () Unit!8176)

(assert (=> d!42293 (= lt!205601 lt!205595)))

(assert (=> d!42293 (isPrefixOf!0 lt!205598 (_2!6085 lt!205157))))

(assert (=> d!42293 (= lt!205595 (lemmaIsPrefixTransitive!0 lt!205598 (_2!6085 lt!205157) (_2!6085 lt!205157)))))

(declare-fun lt!205592 () Unit!8176)

(declare-fun lt!205594 () Unit!8176)

(assert (=> d!42293 (= lt!205592 lt!205594)))

(assert (=> d!42293 (isPrefixOf!0 lt!205598 (_2!6085 lt!205157))))

(assert (=> d!42293 (= lt!205594 (lemmaIsPrefixTransitive!0 lt!205598 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(declare-fun lt!205590 () Unit!8176)

(assert (=> d!42293 (= lt!205590 e!88204)))

(declare-fun c!7593 () Bool)

(assert (=> d!42293 (= c!7593 (not (= (size!2772 (buf!3145 (_2!6085 lt!205156))) #b00000000000000000000000000000000)))))

(declare-fun lt!205607 () Unit!8176)

(declare-fun lt!205604 () Unit!8176)

(assert (=> d!42293 (= lt!205607 lt!205604)))

(assert (=> d!42293 (isPrefixOf!0 (_2!6085 lt!205157) (_2!6085 lt!205157))))

(assert (=> d!42293 (= lt!205604 (lemmaIsPrefixRefl!0 (_2!6085 lt!205157)))))

(declare-fun lt!205600 () Unit!8176)

(declare-fun lt!205605 () Unit!8176)

(assert (=> d!42293 (= lt!205600 lt!205605)))

(assert (=> d!42293 (= lt!205605 (lemmaIsPrefixRefl!0 (_2!6085 lt!205157)))))

(declare-fun lt!205591 () Unit!8176)

(declare-fun lt!205608 () Unit!8176)

(assert (=> d!42293 (= lt!205591 lt!205608)))

(assert (=> d!42293 (isPrefixOf!0 lt!205598 lt!205598)))

(assert (=> d!42293 (= lt!205608 (lemmaIsPrefixRefl!0 lt!205598))))

(declare-fun lt!205599 () Unit!8176)

(declare-fun lt!205597 () Unit!8176)

(assert (=> d!42293 (= lt!205599 lt!205597)))

(assert (=> d!42293 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205156))))

(assert (=> d!42293 (= lt!205597 (lemmaIsPrefixRefl!0 (_2!6085 lt!205156)))))

(assert (=> d!42293 (= lt!205598 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(assert (=> d!42293 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205157))))

(assert (=> d!42293 (= (reader!0 (_2!6085 lt!205156) (_2!6085 lt!205157)) lt!205602)))

(declare-fun lt!205596 () (_ BitVec 64))

(declare-fun lt!205603 () (_ BitVec 64))

(declare-fun b!133028 () Bool)

(assert (=> b!133028 (= e!88203 (= (_1!6084 lt!205602) (withMovedBitIndex!0 (_2!6084 lt!205602) (bvsub lt!205603 lt!205596))))))

(assert (=> b!133028 (or (= (bvand lt!205603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205603 lt!205596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133028 (= lt!205596 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157))))))

(assert (=> b!133028 (= lt!205603 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(declare-fun b!133029 () Bool)

(declare-fun res!110503 () Bool)

(assert (=> b!133029 (=> (not res!110503) (not e!88203))))

(assert (=> b!133029 (= res!110503 (isPrefixOf!0 (_1!6084 lt!205602) (_2!6085 lt!205156)))))

(declare-fun b!133030 () Bool)

(declare-fun Unit!8182 () Unit!8176)

(assert (=> b!133030 (= e!88204 Unit!8182)))

(declare-fun b!133031 () Bool)

(declare-fun res!110501 () Bool)

(assert (=> b!133031 (=> (not res!110501) (not e!88203))))

(assert (=> b!133031 (= res!110501 (isPrefixOf!0 (_2!6084 lt!205602) (_2!6085 lt!205157)))))

(assert (= (and d!42293 c!7593) b!133027))

(assert (= (and d!42293 (not c!7593)) b!133030))

(assert (= (and d!42293 res!110502) b!133029))

(assert (= (and b!133029 res!110503) b!133031))

(assert (= (and b!133031 res!110501) b!133028))

(declare-fun m!201281 () Bool)

(assert (=> b!133029 m!201281))

(declare-fun m!201283 () Bool)

(assert (=> b!133028 m!201283))

(assert (=> b!133028 m!200953))

(assert (=> b!133028 m!200955))

(assert (=> b!133027 m!200955))

(declare-fun m!201285 () Bool)

(assert (=> b!133027 m!201285))

(declare-fun m!201287 () Bool)

(assert (=> b!133027 m!201287))

(assert (=> d!42293 m!201099))

(declare-fun m!201289 () Bool)

(assert (=> d!42293 m!201289))

(declare-fun m!201291 () Bool)

(assert (=> d!42293 m!201291))

(declare-fun m!201293 () Bool)

(assert (=> d!42293 m!201293))

(declare-fun m!201295 () Bool)

(assert (=> d!42293 m!201295))

(declare-fun m!201297 () Bool)

(assert (=> d!42293 m!201297))

(declare-fun m!201299 () Bool)

(assert (=> d!42293 m!201299))

(declare-fun m!201301 () Bool)

(assert (=> d!42293 m!201301))

(assert (=> d!42293 m!200939))

(assert (=> d!42293 m!201115))

(declare-fun m!201303 () Bool)

(assert (=> d!42293 m!201303))

(declare-fun m!201305 () Bool)

(assert (=> b!133031 m!201305))

(assert (=> b!132856 d!42293))

(declare-fun d!42295 () Bool)

(assert (=> d!42295 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205163) (bvsle ((_ sign_extend 32) lt!205163) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10341 () Bool)

(assert (= bs!10341 d!42295))

(declare-fun m!201307 () Bool)

(assert (=> bs!10341 m!201307))

(assert (=> b!132856 d!42295))

(declare-fun d!42297 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4808 (_ BitVec 32)) tuple2!11558)

(assert (=> d!42297 (= (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) (_2!6085 (moveByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)))))

(declare-fun bs!10342 () Bool)

(assert (= bs!10342 d!42297))

(declare-fun m!201309 () Bool)

(assert (=> bs!10342 m!201309))

(assert (=> b!132856 d!42297))

(declare-fun d!42299 () Bool)

(declare-fun lt!205610 () tuple2!11562)

(assert (=> d!42299 (= lt!205610 (readByte!0 lt!205171))))

(assert (=> d!42299 (= (readBytePure!0 lt!205171) (tuple2!11555 (_2!6089 lt!205610) (_1!6089 lt!205610)))))

(declare-fun bs!10343 () Bool)

(assert (= bs!10343 d!42299))

(declare-fun m!201311 () Bool)

(assert (=> bs!10343 m!201311))

(assert (=> b!132856 d!42299))

(declare-fun d!42301 () Bool)

(assert (=> d!42301 (= (invariant!0 (currentBit!5925 thiss!1634) (currentByte!5930 thiss!1634) (size!2772 (buf!3145 (_2!6085 lt!205156)))) (and (bvsge (currentBit!5925 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5925 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5930 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5930 thiss!1634) (size!2772 (buf!3145 (_2!6085 lt!205156)))) (and (= (currentBit!5925 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5930 thiss!1634) (size!2772 (buf!3145 (_2!6085 lt!205156))))))))))

(assert (=> b!132866 d!42301))

(declare-fun d!42303 () Bool)

(declare-fun res!110505 () Bool)

(declare-fun e!88206 () Bool)

(assert (=> d!42303 (=> (not res!110505) (not e!88206))))

(assert (=> d!42303 (= res!110505 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (=> d!42303 (= (isPrefixOf!0 thiss!1634 (_2!6085 lt!205156)) e!88206)))

(declare-fun b!133032 () Bool)

(declare-fun res!110504 () Bool)

(assert (=> b!133032 (=> (not res!110504) (not e!88206))))

(assert (=> b!133032 (= res!110504 (bvsle (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun b!133033 () Bool)

(declare-fun e!88205 () Bool)

(assert (=> b!133033 (= e!88206 e!88205)))

(declare-fun res!110506 () Bool)

(assert (=> b!133033 (=> res!110506 e!88205)))

(assert (=> b!133033 (= res!110506 (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133034 () Bool)

(assert (=> b!133034 (= e!88205 (arrayBitRangesEq!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (= (and d!42303 res!110505) b!133032))

(assert (= (and b!133032 res!110504) b!133033))

(assert (= (and b!133033 (not res!110506)) b!133034))

(assert (=> b!133032 m!200969))

(assert (=> b!133032 m!200955))

(assert (=> b!133034 m!200969))

(assert (=> b!133034 m!200969))

(declare-fun m!201313 () Bool)

(assert (=> b!133034 m!201313))

(assert (=> b!132855 d!42303))

(declare-fun d!42305 () Bool)

(declare-fun lt!205611 () tuple2!11562)

(assert (=> d!42305 (= lt!205611 (readByte!0 (_1!6084 lt!205155)))))

(assert (=> d!42305 (= (readBytePure!0 (_1!6084 lt!205155)) (tuple2!11555 (_2!6089 lt!205611) (_1!6089 lt!205611)))))

(declare-fun bs!10344 () Bool)

(assert (= bs!10344 d!42305))

(declare-fun m!201315 () Bool)

(assert (=> bs!10344 m!201315))

(assert (=> b!132854 d!42305))

(declare-fun b!133035 () Bool)

(declare-fun e!88208 () Unit!8176)

(declare-fun lt!205631 () Unit!8176)

(assert (=> b!133035 (= e!88208 lt!205631)))

(declare-fun lt!205628 () (_ BitVec 64))

(assert (=> b!133035 (= lt!205628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205615 () (_ BitVec 64))

(assert (=> b!133035 (= lt!205615 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(assert (=> b!133035 (= lt!205631 (arrayBitRangesEqSymmetric!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205156)) lt!205628 lt!205615))))

(assert (=> b!133035 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 thiss!1634) lt!205628 lt!205615)))

(declare-fun d!42307 () Bool)

(declare-fun e!88207 () Bool)

(assert (=> d!42307 e!88207))

(declare-fun res!110508 () Bool)

(assert (=> d!42307 (=> (not res!110508) (not e!88207))))

(declare-fun lt!205624 () tuple2!11556)

(assert (=> d!42307 (= res!110508 (isPrefixOf!0 (_1!6084 lt!205624) (_2!6084 lt!205624)))))

(declare-fun lt!205620 () BitStream!4808)

(assert (=> d!42307 (= lt!205624 (tuple2!11557 lt!205620 (_2!6085 lt!205156)))))

(declare-fun lt!205623 () Unit!8176)

(declare-fun lt!205617 () Unit!8176)

(assert (=> d!42307 (= lt!205623 lt!205617)))

(assert (=> d!42307 (isPrefixOf!0 lt!205620 (_2!6085 lt!205156))))

(assert (=> d!42307 (= lt!205617 (lemmaIsPrefixTransitive!0 lt!205620 (_2!6085 lt!205156) (_2!6085 lt!205156)))))

(declare-fun lt!205614 () Unit!8176)

(declare-fun lt!205616 () Unit!8176)

(assert (=> d!42307 (= lt!205614 lt!205616)))

(assert (=> d!42307 (isPrefixOf!0 lt!205620 (_2!6085 lt!205156))))

(assert (=> d!42307 (= lt!205616 (lemmaIsPrefixTransitive!0 lt!205620 thiss!1634 (_2!6085 lt!205156)))))

(declare-fun lt!205612 () Unit!8176)

(assert (=> d!42307 (= lt!205612 e!88208)))

(declare-fun c!7594 () Bool)

(assert (=> d!42307 (= c!7594 (not (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!205629 () Unit!8176)

(declare-fun lt!205626 () Unit!8176)

(assert (=> d!42307 (= lt!205629 lt!205626)))

(assert (=> d!42307 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205156))))

(assert (=> d!42307 (= lt!205626 (lemmaIsPrefixRefl!0 (_2!6085 lt!205156)))))

(declare-fun lt!205622 () Unit!8176)

(declare-fun lt!205627 () Unit!8176)

(assert (=> d!42307 (= lt!205622 lt!205627)))

(assert (=> d!42307 (= lt!205627 (lemmaIsPrefixRefl!0 (_2!6085 lt!205156)))))

(declare-fun lt!205613 () Unit!8176)

(declare-fun lt!205630 () Unit!8176)

(assert (=> d!42307 (= lt!205613 lt!205630)))

(assert (=> d!42307 (isPrefixOf!0 lt!205620 lt!205620)))

(assert (=> d!42307 (= lt!205630 (lemmaIsPrefixRefl!0 lt!205620))))

(declare-fun lt!205621 () Unit!8176)

(declare-fun lt!205619 () Unit!8176)

(assert (=> d!42307 (= lt!205621 lt!205619)))

(assert (=> d!42307 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42307 (= lt!205619 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42307 (= lt!205620 (BitStream!4809 (buf!3145 (_2!6085 lt!205156)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(assert (=> d!42307 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205156))))

(assert (=> d!42307 (= (reader!0 thiss!1634 (_2!6085 lt!205156)) lt!205624)))

(declare-fun lt!205618 () (_ BitVec 64))

(declare-fun lt!205625 () (_ BitVec 64))

(declare-fun b!133036 () Bool)

(assert (=> b!133036 (= e!88207 (= (_1!6084 lt!205624) (withMovedBitIndex!0 (_2!6084 lt!205624) (bvsub lt!205625 lt!205618))))))

(assert (=> b!133036 (or (= (bvand lt!205625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205625 lt!205618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133036 (= lt!205618 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(assert (=> b!133036 (= lt!205625 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(declare-fun b!133037 () Bool)

(declare-fun res!110509 () Bool)

(assert (=> b!133037 (=> (not res!110509) (not e!88207))))

(assert (=> b!133037 (= res!110509 (isPrefixOf!0 (_1!6084 lt!205624) thiss!1634))))

(declare-fun b!133038 () Bool)

(declare-fun Unit!8183 () Unit!8176)

(assert (=> b!133038 (= e!88208 Unit!8183)))

(declare-fun b!133039 () Bool)

(declare-fun res!110507 () Bool)

(assert (=> b!133039 (=> (not res!110507) (not e!88207))))

(assert (=> b!133039 (= res!110507 (isPrefixOf!0 (_2!6084 lt!205624) (_2!6085 lt!205156)))))

(assert (= (and d!42307 c!7594) b!133035))

(assert (= (and d!42307 (not c!7594)) b!133038))

(assert (= (and d!42307 res!110508) b!133037))

(assert (= (and b!133037 res!110509) b!133039))

(assert (= (and b!133039 res!110507) b!133036))

(declare-fun m!201317 () Bool)

(assert (=> b!133037 m!201317))

(declare-fun m!201319 () Bool)

(assert (=> b!133036 m!201319))

(assert (=> b!133036 m!200955))

(assert (=> b!133036 m!200969))

(assert (=> b!133035 m!200969))

(declare-fun m!201321 () Bool)

(assert (=> b!133035 m!201321))

(declare-fun m!201323 () Bool)

(assert (=> b!133035 m!201323))

(assert (=> d!42307 m!201297))

(declare-fun m!201325 () Bool)

(assert (=> d!42307 m!201325))

(declare-fun m!201327 () Bool)

(assert (=> d!42307 m!201327))

(declare-fun m!201329 () Bool)

(assert (=> d!42307 m!201329))

(declare-fun m!201331 () Bool)

(assert (=> d!42307 m!201331))

(assert (=> d!42307 m!201109))

(declare-fun m!201333 () Bool)

(assert (=> d!42307 m!201333))

(assert (=> d!42307 m!201113))

(assert (=> d!42307 m!200941))

(assert (=> d!42307 m!201301))

(declare-fun m!201335 () Bool)

(assert (=> d!42307 m!201335))

(declare-fun m!201337 () Bool)

(assert (=> b!133039 m!201337))

(assert (=> b!132854 d!42307))

(declare-fun d!42309 () Bool)

(declare-fun res!110511 () Bool)

(declare-fun e!88210 () Bool)

(assert (=> d!42309 (=> (not res!110511) (not e!88210))))

(assert (=> d!42309 (= res!110511 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42309 (= (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205157)) e!88210)))

(declare-fun b!133040 () Bool)

(declare-fun res!110510 () Bool)

(assert (=> b!133040 (=> (not res!110510) (not e!88210))))

(assert (=> b!133040 (= res!110510 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133041 () Bool)

(declare-fun e!88209 () Bool)

(assert (=> b!133041 (= e!88210 e!88209)))

(declare-fun res!110512 () Bool)

(assert (=> b!133041 (=> res!110512 e!88209)))

(assert (=> b!133041 (= res!110512 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) #b00000000000000000000000000000000))))

(declare-fun b!133042 () Bool)

(assert (=> b!133042 (= e!88209 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (= (and d!42309 res!110511) b!133040))

(assert (= (and b!133040 res!110510) b!133041))

(assert (= (and b!133041 (not res!110512)) b!133042))

(assert (=> b!133040 m!200955))

(assert (=> b!133040 m!200953))

(assert (=> b!133042 m!200955))

(assert (=> b!133042 m!200955))

(declare-fun m!201339 () Bool)

(assert (=> b!133042 m!201339))

(assert (=> b!132865 d!42309))

(declare-fun d!42311 () Bool)

(assert (=> d!42311 (= (array_inv!2561 (buf!3145 thiss!1634)) (bvsge (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!132864 d!42311))

(declare-fun d!42313 () Bool)

(declare-fun res!110513 () Bool)

(declare-fun e!88211 () Bool)

(assert (=> d!42313 (=> res!110513 e!88211)))

(assert (=> d!42313 (= res!110513 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42313 (= (arrayRangesEq!175 arr!237 (_2!6082 lt!205173) #b00000000000000000000000000000000 to!404) e!88211)))

(declare-fun b!133043 () Bool)

(declare-fun e!88212 () Bool)

(assert (=> b!133043 (= e!88211 e!88212)))

(declare-fun res!110514 () Bool)

(assert (=> b!133043 (=> (not res!110514) (not e!88212))))

(assert (=> b!133043 (= res!110514 (= (select (arr!3407 arr!237) #b00000000000000000000000000000000) (select (arr!3407 (_2!6082 lt!205173)) #b00000000000000000000000000000000)))))

(declare-fun b!133044 () Bool)

(assert (=> b!133044 (= e!88212 (arrayRangesEq!175 arr!237 (_2!6082 lt!205173) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42313 (not res!110513)) b!133043))

(assert (= (and b!133043 res!110514) b!133044))

(declare-fun m!201341 () Bool)

(assert (=> b!133043 m!201341))

(declare-fun m!201343 () Bool)

(assert (=> b!133043 m!201343))

(declare-fun m!201345 () Bool)

(assert (=> b!133044 m!201345))

(assert (=> b!132853 d!42313))

(declare-fun d!42315 () Bool)

(declare-fun e!88213 () Bool)

(assert (=> d!42315 e!88213))

(declare-fun res!110515 () Bool)

(assert (=> d!42315 (=> (not res!110515) (not e!88213))))

(declare-fun lt!205635 () (_ BitVec 64))

(declare-fun lt!205636 () (_ BitVec 64))

(declare-fun lt!205637 () (_ BitVec 64))

(assert (=> d!42315 (= res!110515 (= lt!205635 (bvsub lt!205636 lt!205637)))))

(assert (=> d!42315 (or (= (bvand lt!205636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205637 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205636 lt!205637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42315 (= lt!205637 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun lt!205634 () (_ BitVec 64))

(declare-fun lt!205633 () (_ BitVec 64))

(assert (=> d!42315 (= lt!205636 (bvmul lt!205634 lt!205633))))

(assert (=> d!42315 (or (= lt!205634 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205633 (bvsdiv (bvmul lt!205634 lt!205633) lt!205634)))))

(assert (=> d!42315 (= lt!205633 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42315 (= lt!205634 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (=> d!42315 (= lt!205635 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (=> d!42315 (invariant!0 (currentBit!5925 (_2!6085 lt!205156)) (currentByte!5930 (_2!6085 lt!205156)) (size!2772 (buf!3145 (_2!6085 lt!205156))))))

(assert (=> d!42315 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) lt!205635)))

(declare-fun b!133045 () Bool)

(declare-fun res!110516 () Bool)

(assert (=> b!133045 (=> (not res!110516) (not e!88213))))

(assert (=> b!133045 (= res!110516 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205635))))

(declare-fun b!133046 () Bool)

(declare-fun lt!205632 () (_ BitVec 64))

(assert (=> b!133046 (= e!88213 (bvsle lt!205635 (bvmul lt!205632 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133046 (or (= lt!205632 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205632 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205632)))))

(assert (=> b!133046 (= lt!205632 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (= (and d!42315 res!110515) b!133045))

(assert (= (and b!133045 res!110516) b!133046))

(assert (=> d!42315 m!201165))

(declare-fun m!201347 () Bool)

(assert (=> d!42315 m!201347))

(assert (=> b!132863 d!42315))

(declare-fun d!42317 () Bool)

(declare-fun e!88214 () Bool)

(assert (=> d!42317 e!88214))

(declare-fun res!110517 () Bool)

(assert (=> d!42317 (=> (not res!110517) (not e!88214))))

(declare-fun lt!205641 () (_ BitVec 64))

(declare-fun lt!205642 () (_ BitVec 64))

(declare-fun lt!205643 () (_ BitVec 64))

(assert (=> d!42317 (= res!110517 (= lt!205641 (bvsub lt!205642 lt!205643)))))

(assert (=> d!42317 (or (= (bvand lt!205642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205643 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205642 lt!205643) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42317 (= lt!205643 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))))))

(declare-fun lt!205640 () (_ BitVec 64))

(declare-fun lt!205639 () (_ BitVec 64))

(assert (=> d!42317 (= lt!205642 (bvmul lt!205640 lt!205639))))

(assert (=> d!42317 (or (= lt!205640 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205639 (bvsdiv (bvmul lt!205640 lt!205639) lt!205640)))))

(assert (=> d!42317 (= lt!205639 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42317 (= lt!205640 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))))))

(assert (=> d!42317 (= lt!205641 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 thiss!1634))))))

(assert (=> d!42317 (invariant!0 (currentBit!5925 thiss!1634) (currentByte!5930 thiss!1634) (size!2772 (buf!3145 thiss!1634)))))

(assert (=> d!42317 (= (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) lt!205641)))

(declare-fun b!133047 () Bool)

(declare-fun res!110518 () Bool)

(assert (=> b!133047 (=> (not res!110518) (not e!88214))))

(assert (=> b!133047 (= res!110518 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205641))))

(declare-fun b!133048 () Bool)

(declare-fun lt!205638 () (_ BitVec 64))

(assert (=> b!133048 (= e!88214 (bvsle lt!205641 (bvmul lt!205638 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133048 (or (= lt!205638 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205638 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205638)))))

(assert (=> b!133048 (= lt!205638 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))))))

(assert (= (and d!42317 res!110517) b!133047))

(assert (= (and b!133047 res!110518) b!133048))

(declare-fun m!201349 () Bool)

(assert (=> d!42317 m!201349))

(assert (=> d!42317 m!200961))

(assert (=> b!132863 d!42317))

(declare-fun lt!205644 () tuple3!504)

(declare-fun d!42319 () Bool)

(assert (=> d!42319 (= lt!205644 (readByteArrayLoop!0 (_1!6084 lt!205169) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42319 (= (readByteArrayLoopPure!0 (_1!6084 lt!205169) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11553 (_2!6088 lt!205644) (_3!307 lt!205644)))))

(declare-fun bs!10345 () Bool)

(assert (= bs!10345 d!42319))

(declare-fun m!201351 () Bool)

(assert (=> bs!10345 m!201351))

(assert (=> b!132861 d!42319))

(declare-fun d!42321 () Bool)

(assert (=> d!42321 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205160) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) lt!205160))))

(declare-fun bs!10346 () Bool)

(assert (= bs!10346 d!42321))

(assert (=> bs!10346 m!201307))

(assert (=> b!132861 d!42321))

(declare-fun d!42323 () Bool)

(assert (=> d!42323 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205160)))

(declare-fun lt!205647 () Unit!8176)

(declare-fun choose!9 (BitStream!4808 array!6122 (_ BitVec 64) BitStream!4808) Unit!8176)

(assert (=> d!42323 (= lt!205647 (choose!9 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205160 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (=> d!42323 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205160) lt!205647)))

(declare-fun bs!10347 () Bool)

(assert (= bs!10347 d!42323))

(assert (=> bs!10347 m!200949))

(declare-fun m!201353 () Bool)

(assert (=> bs!10347 m!201353))

(assert (=> b!132861 d!42323))

(assert (=> b!132861 d!42293))

(declare-fun d!42325 () Bool)

(assert (=> d!42325 (= (array_inv!2561 arr!237) (bvsge (size!2772 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25952 d!42325))

(declare-fun d!42327 () Bool)

(assert (=> d!42327 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5925 thiss!1634) (currentByte!5930 thiss!1634) (size!2772 (buf!3145 thiss!1634))))))

(declare-fun bs!10348 () Bool)

(assert (= bs!10348 d!42327))

(assert (=> bs!10348 m!200961))

(assert (=> start!25952 d!42327))

(declare-fun d!42329 () Bool)

(declare-fun e!88215 () Bool)

(assert (=> d!42329 e!88215))

(declare-fun res!110519 () Bool)

(assert (=> d!42329 (=> (not res!110519) (not e!88215))))

(declare-fun lt!205651 () (_ BitVec 64))

(declare-fun lt!205652 () (_ BitVec 64))

(declare-fun lt!205653 () (_ BitVec 64))

(assert (=> d!42329 (= res!110519 (= lt!205651 (bvsub lt!205652 lt!205653)))))

(assert (=> d!42329 (or (= (bvand lt!205652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205652 lt!205653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42329 (= lt!205653 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205157))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun lt!205650 () (_ BitVec 64))

(declare-fun lt!205649 () (_ BitVec 64))

(assert (=> d!42329 (= lt!205652 (bvmul lt!205650 lt!205649))))

(assert (=> d!42329 (or (= lt!205650 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205649 (bvsdiv (bvmul lt!205650 lt!205649) lt!205650)))))

(assert (=> d!42329 (= lt!205649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42329 (= lt!205650 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42329 (= lt!205651 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205157))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205157)))))))

(assert (=> d!42329 (invariant!0 (currentBit!5925 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205157)) (size!2772 (buf!3145 (_2!6085 lt!205157))))))

(assert (=> d!42329 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157))) lt!205651)))

(declare-fun b!133049 () Bool)

(declare-fun res!110520 () Bool)

(assert (=> b!133049 (=> (not res!110520) (not e!88215))))

(assert (=> b!133049 (= res!110520 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205651))))

(declare-fun b!133050 () Bool)

(declare-fun lt!205648 () (_ BitVec 64))

(assert (=> b!133050 (= e!88215 (bvsle lt!205651 (bvmul lt!205648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133050 (or (= lt!205648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205648)))))

(assert (=> b!133050 (= lt!205648 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (= (and d!42329 res!110519) b!133049))

(assert (= (and b!133049 res!110520) b!133050))

(declare-fun m!201355 () Bool)

(assert (=> d!42329 m!201355))

(declare-fun m!201357 () Bool)

(assert (=> d!42329 m!201357))

(assert (=> b!132859 d!42329))

(assert (=> b!132859 d!42315))

(declare-fun d!42331 () Bool)

(assert (=> d!42331 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10349 () Bool)

(assert (= bs!10349 d!42331))

(assert (=> bs!10349 m!201349))

(assert (=> b!132858 d!42331))

(push 1)

(assert (not b!133031))

(assert (not d!42327))

(assert (not b!132954))

(assert (not d!42291))

(assert (not b!132956))

(assert (not d!42315))

(assert (not d!42247))

(assert (not d!42331))

(assert (not b!133032))

(assert (not d!42297))

(assert (not d!42265))

(assert (not d!42321))

(assert (not b!132953))

(assert (not b!132991))

(assert (not b!133044))

(assert (not d!42213))

(assert (not d!42269))

(assert (not b!133000))

(assert (not b!133040))

(assert (not b!133022))

(assert (not d!42305))

(assert (not b!133037))

(assert (not d!42317))

(assert (not b!133027))

(assert (not b!132992))

(assert (not b!133008))

(assert (not b!133024))

(assert (not d!42223))

(assert (not d!42287))

(assert (not d!42263))

(assert (not d!42218))

(assert (not d!42237))

(assert (not d!42293))

(assert (not b!133042))

(assert (not d!42285))

(assert (not b!133036))

(assert (not b!133023))

(assert (not d!42289))

(assert (not d!42283))

(assert (not d!42299))

(assert (not b!132927))

(assert (not d!42255))

(assert (not d!42215))

(assert (not b!133026))

(assert (not d!42253))

(assert (not d!42267))

(assert (not b!133035))

(assert (not b!132993))

(assert (not b!133039))

(assert (not d!42295))

(assert (not d!42307))

(assert (not d!42257))

(assert (not b!133034))

(assert (not b!132952))

(assert (not b!133029))

(assert (not b!133025))

(assert (not d!42329))

(assert (not b!133002))

(assert (not d!42323))

(assert (not d!42319))

(assert (not b!133028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!133035 d!42317))

(declare-fun d!42600 () Bool)

(assert (=> d!42600 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 thiss!1634) lt!205628 lt!205615)))

(declare-fun lt!206302 () Unit!8176)

(declare-fun choose!8 (array!6122 array!6122 (_ BitVec 64) (_ BitVec 64)) Unit!8176)

(assert (=> d!42600 (= lt!206302 (choose!8 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205156)) lt!205628 lt!205615))))

(assert (=> d!42600 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205628) (bvsle lt!205628 lt!205615))))

(assert (=> d!42600 (= (arrayBitRangesEqSymmetric!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205156)) lt!205628 lt!205615) lt!206302)))

(declare-fun bs!10403 () Bool)

(assert (= bs!10403 d!42600))

(assert (=> bs!10403 m!201323))

(declare-fun m!202111 () Bool)

(assert (=> bs!10403 m!202111))

(assert (=> b!133035 d!42600))

(declare-fun b!133379 () Bool)

(declare-fun e!88448 () Bool)

(declare-fun e!88450 () Bool)

(assert (=> b!133379 (= e!88448 e!88450)))

(declare-fun c!7618 () Bool)

(declare-datatypes ((tuple4!112 0))(
  ( (tuple4!113 (_1!6094 (_ BitVec 32)) (_2!6094 (_ BitVec 32)) (_3!310 (_ BitVec 32)) (_4!56 (_ BitVec 32))) )
))
(declare-fun lt!206309 () tuple4!112)

(assert (=> b!133379 (= c!7618 (= (_3!310 lt!206309) (_4!56 lt!206309)))))

(declare-fun b!133380 () Bool)

(declare-fun e!88449 () Bool)

(assert (=> b!133380 (= e!88450 e!88449)))

(declare-fun res!110801 () Bool)

(declare-fun call!1692 () Bool)

(assert (=> b!133380 (= res!110801 call!1692)))

(assert (=> b!133380 (=> (not res!110801) (not e!88449))))

(declare-fun b!133381 () Bool)

(declare-fun e!88451 () Bool)

(assert (=> b!133381 (= e!88451 e!88448)))

(declare-fun res!110802 () Bool)

(assert (=> b!133381 (=> (not res!110802) (not e!88448))))

(declare-fun e!88447 () Bool)

(assert (=> b!133381 (= res!110802 e!88447)))

(declare-fun res!110799 () Bool)

(assert (=> b!133381 (=> res!110799 e!88447)))

(assert (=> b!133381 (= res!110799 (bvsge (_1!6094 lt!206309) (_2!6094 lt!206309)))))

(declare-fun lt!206311 () (_ BitVec 32))

(assert (=> b!133381 (= lt!206311 ((_ extract 31 0) (bvsrem lt!205615 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206310 () (_ BitVec 32))

(assert (=> b!133381 (= lt!206310 ((_ extract 31 0) (bvsrem lt!205628 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!112)

(assert (=> b!133381 (= lt!206309 (arrayBitIndices!0 lt!205628 lt!205615))))

(declare-fun b!133382 () Bool)

(declare-fun e!88452 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133382 (= e!88452 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_4!56 lt!206309)) (select (arr!3407 (buf!3145 thiss!1634)) (_4!56 lt!206309)) #b00000000000000000000000000000000 lt!206311))))

(declare-fun b!133383 () Bool)

(assert (=> b!133383 (= e!88450 call!1692)))

(declare-fun b!133384 () Bool)

(assert (=> b!133384 (= e!88447 (arrayRangesEq!175 (buf!3145 (_2!6085 lt!205156)) (buf!3145 thiss!1634) (_1!6094 lt!206309) (_2!6094 lt!206309)))))

(declare-fun b!133385 () Bool)

(declare-fun res!110798 () Bool)

(assert (=> b!133385 (= res!110798 (= lt!206311 #b00000000000000000000000000000000))))

(assert (=> b!133385 (=> res!110798 e!88452)))

(assert (=> b!133385 (= e!88449 e!88452)))

(declare-fun d!42602 () Bool)

(declare-fun res!110800 () Bool)

(assert (=> d!42602 (=> res!110800 e!88451)))

(assert (=> d!42602 (= res!110800 (bvsge lt!205628 lt!205615))))

(assert (=> d!42602 (= (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 thiss!1634) lt!205628 lt!205615) e!88451)))

(declare-fun bm!1689 () Bool)

(assert (=> bm!1689 (= call!1692 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_3!310 lt!206309)) (select (arr!3407 (buf!3145 thiss!1634)) (_3!310 lt!206309)) lt!206310 (ite c!7618 lt!206311 #b00000000000000000000000000001000)))))

(assert (= (and d!42602 (not res!110800)) b!133381))

(assert (= (and b!133381 (not res!110799)) b!133384))

(assert (= (and b!133381 res!110802) b!133379))

(assert (= (and b!133379 c!7618) b!133383))

(assert (= (and b!133379 (not c!7618)) b!133380))

(assert (= (and b!133380 res!110801) b!133385))

(assert (= (and b!133385 (not res!110798)) b!133382))

(assert (= (or b!133383 b!133380) bm!1689))

(declare-fun m!202113 () Bool)

(assert (=> b!133381 m!202113))

(declare-fun m!202115 () Bool)

(assert (=> b!133382 m!202115))

(declare-fun m!202117 () Bool)

(assert (=> b!133382 m!202117))

(assert (=> b!133382 m!202115))

(assert (=> b!133382 m!202117))

(declare-fun m!202119 () Bool)

(assert (=> b!133382 m!202119))

(declare-fun m!202121 () Bool)

(assert (=> b!133384 m!202121))

(declare-fun m!202123 () Bool)

(assert (=> bm!1689 m!202123))

(declare-fun m!202125 () Bool)

(assert (=> bm!1689 m!202125))

(assert (=> bm!1689 m!202123))

(assert (=> bm!1689 m!202125))

(declare-fun m!202127 () Bool)

(assert (=> bm!1689 m!202127))

(assert (=> b!133035 d!42602))

(declare-fun bm!1696 () Bool)

(declare-fun call!1699 () (_ BitVec 64))

(assert (=> bm!1696 (= call!1699 (bitIndex!0 (size!2772 (buf!3145 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001))) (currentByte!5930 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)) (currentBit!5925 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001))))))

(declare-fun b!133396 () Bool)

(declare-fun lt!206407 () Unit!8176)

(declare-fun e!88461 () tuple3!504)

(assert (=> b!133396 (= e!88461 (tuple3!505 lt!206407 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) lt!205172))))

(assert (=> b!133396 (= call!1699 call!1699)))

(declare-fun lt!206387 () Unit!8176)

(declare-fun Unit!8234 () Unit!8176)

(assert (=> b!133396 (= lt!206387 Unit!8234)))

(declare-fun lt!206416 () Unit!8176)

(declare-fun arrayRangesEqReflexiveLemma!2 (array!6122) Unit!8176)

(assert (=> b!133396 (= lt!206416 (arrayRangesEqReflexiveLemma!2 lt!205172))))

(declare-fun call!1700 () Bool)

(assert (=> b!133396 call!1700))

(declare-fun lt!206408 () Unit!8176)

(assert (=> b!133396 (= lt!206408 lt!206416)))

(declare-fun lt!206386 () array!6122)

(assert (=> b!133396 (= lt!206386 lt!205172)))

(declare-fun lt!206401 () array!6122)

(assert (=> b!133396 (= lt!206401 lt!205172)))

(declare-fun lt!206399 () (_ BitVec 32))

(assert (=> b!133396 (= lt!206399 #b00000000000000000000000000000000)))

(declare-fun lt!206388 () (_ BitVec 32))

(assert (=> b!133396 (= lt!206388 (size!2772 lt!205172))))

(declare-fun lt!206385 () (_ BitVec 32))

(assert (=> b!133396 (= lt!206385 #b00000000000000000000000000000000)))

(declare-fun lt!206404 () (_ BitVec 32))

(assert (=> b!133396 (= lt!206404 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!2 (array!6122 array!6122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8176)

(assert (=> b!133396 (= lt!206407 (arrayRangesEqSlicedLemma!2 lt!206386 lt!206401 lt!206399 lt!206388 lt!206385 lt!206404))))

(declare-fun call!1701 () Bool)

(assert (=> b!133396 call!1701))

(declare-fun d!42604 () Bool)

(declare-fun e!88460 () Bool)

(assert (=> d!42604 e!88460))

(declare-fun res!110811 () Bool)

(assert (=> d!42604 (=> res!110811 e!88460)))

(assert (=> d!42604 (= res!110811 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206411 () Bool)

(declare-fun e!88459 () Bool)

(assert (=> d!42604 (= lt!206411 e!88459)))

(declare-fun res!110810 () Bool)

(assert (=> d!42604 (=> (not res!110810) (not e!88459))))

(declare-fun lt!206402 () tuple3!504)

(declare-fun lt!206418 () (_ BitVec 64))

(declare-fun lt!206417 () (_ BitVec 64))

(assert (=> d!42604 (= res!110810 (= (bvadd lt!206417 lt!206418) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206402))) (currentByte!5930 (_2!6088 lt!206402)) (currentBit!5925 (_2!6088 lt!206402)))))))

(assert (=> d!42604 (or (not (= (bvand lt!206417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206418 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206417 lt!206418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206393 () (_ BitVec 64))

(assert (=> d!42604 (= lt!206418 (bvmul lt!206393 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42604 (or (= lt!206393 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206393 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206393)))))

(assert (=> d!42604 (= lt!206393 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!42604 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!42604 (= lt!206417 (bitIndex!0 (size!2772 (buf!3145 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001))) (currentByte!5930 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)) (currentBit!5925 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001))))))

(assert (=> d!42604 (= lt!206402 e!88461)))

(declare-fun c!7621 () Bool)

(assert (=> d!42604 (= c!7621 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42604 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2772 lt!205172)))))

(assert (=> d!42604 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!206402)))

(declare-fun b!133397 () Bool)

(declare-fun lt!206392 () Unit!8176)

(declare-fun lt!206406 () tuple3!504)

(assert (=> b!133397 (= e!88461 (tuple3!505 lt!206392 (_2!6088 lt!206406) (_3!307 lt!206406)))))

(declare-fun lt!206410 () tuple2!11562)

(assert (=> b!133397 (= lt!206410 (readByte!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)))))

(declare-fun lt!206389 () array!6122)

(assert (=> b!133397 (= lt!206389 (array!6123 (store (arr!3407 lt!205172) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206410)) (size!2772 lt!205172)))))

(declare-fun lt!206384 () (_ BitVec 64))

(assert (=> b!133397 (= lt!206384 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206394 () (_ BitVec 32))

(assert (=> b!133397 (= lt!206394 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206398 () Unit!8176)

(assert (=> b!133397 (= lt!206398 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) (_2!6089 lt!206410) lt!206384 lt!206394))))

(assert (=> b!133397 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6089 lt!206410)))) ((_ sign_extend 32) (currentByte!5930 (_2!6089 lt!206410))) ((_ sign_extend 32) (currentBit!5925 (_2!6089 lt!206410))) (bvsub lt!206394 ((_ extract 31 0) (bvsdiv (bvadd lt!206384 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206412 () Unit!8176)

(assert (=> b!133397 (= lt!206412 lt!206398)))

(assert (=> b!133397 (= lt!206406 (readByteArrayLoop!0 (_2!6089 lt!206410) lt!206389 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133397 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206410))) (currentByte!5930 (_2!6089 lt!206410)) (currentBit!5925 (_2!6089 lt!206410))) (bvadd call!1699 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206391 () Unit!8176)

(declare-fun Unit!8235 () Unit!8176)

(assert (=> b!133397 (= lt!206391 Unit!8235)))

(assert (=> b!133397 (= (bvadd (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206410))) (currentByte!5930 (_2!6089 lt!206410)) (currentBit!5925 (_2!6089 lt!206410))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206406))) (currentByte!5930 (_2!6088 lt!206406)) (currentBit!5925 (_2!6088 lt!206406))))))

(declare-fun lt!206405 () Unit!8176)

(declare-fun Unit!8236 () Unit!8176)

(assert (=> b!133397 (= lt!206405 Unit!8236)))

(assert (=> b!133397 (= (bvadd call!1699 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206406))) (currentByte!5930 (_2!6088 lt!206406)) (currentBit!5925 (_2!6088 lt!206406))))))

(declare-fun lt!206397 () Unit!8176)

(declare-fun Unit!8237 () Unit!8176)

(assert (=> b!133397 (= lt!206397 Unit!8237)))

(assert (=> b!133397 (and (= (buf!3145 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)) (buf!3145 (_2!6088 lt!206406))) (= (size!2772 lt!205172) (size!2772 (_3!307 lt!206406))))))

(declare-fun lt!206400 () Unit!8176)

(declare-fun Unit!8238 () Unit!8176)

(assert (=> b!133397 (= lt!206400 Unit!8238)))

(declare-fun lt!206395 () Unit!8176)

(declare-fun arrayUpdatedAtPrefixLemma!2 (array!6122 (_ BitVec 32) (_ BitVec 8)) Unit!8176)

(assert (=> b!133397 (= lt!206395 (arrayUpdatedAtPrefixLemma!2 lt!205172 (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206410)))))

(assert (=> b!133397 call!1701))

(declare-fun lt!206390 () Unit!8176)

(assert (=> b!133397 (= lt!206390 lt!206395)))

(declare-fun lt!206414 () (_ BitVec 32))

(assert (=> b!133397 (= lt!206414 #b00000000000000000000000000000000)))

(declare-fun lt!206419 () Unit!8176)

(declare-fun arrayRangesEqTransitive!2 (array!6122 array!6122 array!6122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8176)

(assert (=> b!133397 (= lt!206419 (arrayRangesEqTransitive!2 lt!205172 lt!206389 (_3!307 lt!206406) lt!206414 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133397 call!1700))

(declare-fun lt!206415 () Unit!8176)

(assert (=> b!133397 (= lt!206415 lt!206419)))

(assert (=> b!133397 (arrayRangesEq!175 lt!205172 (_3!307 lt!206406) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!206409 () Unit!8176)

(declare-fun Unit!8239 () Unit!8176)

(assert (=> b!133397 (= lt!206409 Unit!8239)))

(declare-fun lt!206396 () Unit!8176)

(declare-fun arrayRangesEqImpliesEq!2 (array!6122 array!6122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8176)

(assert (=> b!133397 (= lt!206396 (arrayRangesEqImpliesEq!2 lt!206389 (_3!307 lt!206406) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133397 (= (select (store (arr!3407 lt!205172) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206410)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3407 (_3!307 lt!206406)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206403 () Unit!8176)

(assert (=> b!133397 (= lt!206403 lt!206396)))

(declare-fun lt!206413 () Bool)

(assert (=> b!133397 (= lt!206413 (= (select (arr!3407 (_3!307 lt!206406)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6089 lt!206410)))))

(declare-fun Unit!8240 () Unit!8176)

(assert (=> b!133397 (= lt!206392 Unit!8240)))

(assert (=> b!133397 lt!206413))

(declare-fun bm!1697 () Bool)

(assert (=> bm!1697 (= call!1700 (arrayRangesEq!175 lt!205172 (ite c!7621 (_3!307 lt!206406) lt!205172) (ite c!7621 lt!206414 #b00000000000000000000000000000000) (ite c!7621 (bvadd #b00000000000000000000000000000001 from!447) (size!2772 lt!205172))))))

(declare-fun b!133398 () Bool)

(assert (=> b!133398 (= e!88460 (= (select (arr!3407 (_3!307 lt!206402)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6083 (readBytePure!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)))))))

(assert (=> b!133398 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2772 (_3!307 lt!206402))))))

(declare-fun bm!1698 () Bool)

(assert (=> bm!1698 (= call!1701 (arrayRangesEq!175 (ite c!7621 lt!205172 lt!206386) (ite c!7621 (array!6123 (store (arr!3407 lt!205172) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206410)) (size!2772 lt!205172)) lt!206401) (ite c!7621 #b00000000000000000000000000000000 lt!206385) (ite c!7621 (bvadd #b00000000000000000000000000000001 from!447) lt!206404)))))

(declare-fun b!133399 () Bool)

(declare-fun res!110809 () Bool)

(assert (=> b!133399 (=> (not res!110809) (not e!88459))))

(assert (=> b!133399 (= res!110809 (and (= (buf!3145 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001)) (buf!3145 (_2!6088 lt!206402))) (= (size!2772 lt!205172) (size!2772 (_3!307 lt!206402)))))))

(declare-fun b!133400 () Bool)

(assert (=> b!133400 (= e!88459 (arrayRangesEq!175 lt!205172 (_3!307 lt!206402) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (= (and d!42604 c!7621) b!133397))

(assert (= (and d!42604 (not c!7621)) b!133396))

(assert (= (or b!133397 b!133396) bm!1698))

(assert (= (or b!133397 b!133396) bm!1697))

(assert (= (or b!133397 b!133396) bm!1696))

(assert (= (and d!42604 res!110810) b!133399))

(assert (= (and b!133399 res!110809) b!133400))

(assert (= (and d!42604 (not res!110811)) b!133398))

(declare-fun m!202129 () Bool)

(assert (=> bm!1697 m!202129))

(declare-fun m!202131 () Bool)

(assert (=> b!133397 m!202131))

(declare-fun m!202133 () Bool)

(assert (=> b!133397 m!202133))

(declare-fun m!202135 () Bool)

(assert (=> b!133397 m!202135))

(declare-fun m!202137 () Bool)

(assert (=> b!133397 m!202137))

(assert (=> b!133397 m!200885))

(declare-fun m!202139 () Bool)

(assert (=> b!133397 m!202139))

(declare-fun m!202141 () Bool)

(assert (=> b!133397 m!202141))

(assert (=> b!133397 m!200885))

(declare-fun m!202143 () Bool)

(assert (=> b!133397 m!202143))

(declare-fun m!202145 () Bool)

(assert (=> b!133397 m!202145))

(declare-fun m!202147 () Bool)

(assert (=> b!133397 m!202147))

(declare-fun m!202149 () Bool)

(assert (=> b!133397 m!202149))

(declare-fun m!202151 () Bool)

(assert (=> b!133397 m!202151))

(declare-fun m!202153 () Bool)

(assert (=> b!133397 m!202153))

(declare-fun m!202155 () Bool)

(assert (=> b!133397 m!202155))

(declare-fun m!202157 () Bool)

(assert (=> b!133398 m!202157))

(assert (=> b!133398 m!200885))

(declare-fun m!202159 () Bool)

(assert (=> b!133398 m!202159))

(declare-fun m!202161 () Bool)

(assert (=> b!133400 m!202161))

(declare-fun m!202163 () Bool)

(assert (=> bm!1696 m!202163))

(declare-fun m!202165 () Bool)

(assert (=> b!133396 m!202165))

(declare-fun m!202167 () Bool)

(assert (=> b!133396 m!202167))

(assert (=> bm!1698 m!202149))

(declare-fun m!202169 () Bool)

(assert (=> bm!1698 m!202169))

(declare-fun m!202171 () Bool)

(assert (=> d!42604 m!202171))

(assert (=> d!42604 m!202163))

(assert (=> d!42287 d!42604))

(declare-fun lt!206438 () (_ BitVec 8))

(declare-fun lt!206437 () (_ BitVec 8))

(declare-fun d!42606 () Bool)

(assert (=> d!42606 (= lt!206437 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))) ((_ sign_extend 24) lt!206438))))))

(assert (=> d!42606 (= lt!206438 ((_ extract 7 0) (currentBit!5925 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))))

(declare-fun e!88466 () Bool)

(assert (=> d!42606 e!88466))

(declare-fun res!110817 () Bool)

(assert (=> d!42606 (=> (not res!110817) (not e!88466))))

(assert (=> d!42606 (= res!110817 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))) ((_ sign_extend 32) (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) ((_ sign_extend 32) (currentBit!5925 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!11568 0))(
  ( (tuple2!11569 (_1!6095 Unit!8176) (_2!6095 (_ BitVec 8))) )
))
(declare-fun Unit!8241 () Unit!8176)

(declare-fun Unit!8242 () Unit!8176)

(assert (=> d!42606 (= (readByte!0 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206438) #b00000000000000000000000000000000) (tuple2!11569 Unit!8241 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206437) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) (bvadd (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206438)))))))) (tuple2!11569 Unit!8242 lt!206437))) (BitStream!4809 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) (bvadd (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5925 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))))

(declare-fun b!133405 () Bool)

(declare-fun e!88467 () Bool)

(assert (=> b!133405 (= e!88466 e!88467)))

(declare-fun res!110818 () Bool)

(assert (=> b!133405 (=> (not res!110818) (not e!88467))))

(declare-fun lt!206439 () tuple2!11562)

(assert (=> b!133405 (= res!110818 (= (buf!3145 (_2!6089 lt!206439)) (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))))

(declare-fun lt!206436 () (_ BitVec 8))

(declare-fun lt!206434 () (_ BitVec 8))

(declare-fun Unit!8243 () Unit!8176)

(declare-fun Unit!8244 () Unit!8176)

(assert (=> b!133405 (= lt!206439 (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206434) #b00000000000000000000000000000000) (tuple2!11569 Unit!8243 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206436) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) (bvadd (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206434)))))))) (tuple2!11569 Unit!8244 lt!206436))) (BitStream!4809 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) (bvadd (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5925 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))))

(assert (=> b!133405 (= lt!206436 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))) ((_ sign_extend 24) lt!206434))))))

(assert (=> b!133405 (= lt!206434 ((_ extract 7 0) (currentBit!5925 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))))

(declare-fun lt!206440 () (_ BitVec 64))

(declare-fun lt!206435 () (_ BitVec 64))

(declare-fun b!133406 () Bool)

(assert (=> b!133406 (= e!88467 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206439))) (currentByte!5930 (_2!6089 lt!206439)) (currentBit!5925 (_2!6089 lt!206439))) (bvadd lt!206435 lt!206440)))))

(assert (=> b!133406 (or (not (= (bvand lt!206435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206440 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206435 lt!206440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133406 (= lt!206440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133406 (= lt!206435 (bitIndex!0 (size!2772 (buf!3145 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))) (currentByte!5930 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) (currentBit!5925 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))))

(assert (= (and d!42606 res!110817) b!133405))

(assert (= (and b!133405 res!110818) b!133406))

(declare-fun m!202173 () Bool)

(assert (=> d!42606 m!202173))

(declare-fun m!202175 () Bool)

(assert (=> d!42606 m!202175))

(declare-fun m!202177 () Bool)

(assert (=> d!42606 m!202177))

(assert (=> b!133405 m!202177))

(assert (=> b!133405 m!202173))

(declare-fun m!202179 () Bool)

(assert (=> b!133406 m!202179))

(declare-fun m!202181 () Bool)

(assert (=> b!133406 m!202181))

(assert (=> d!42283 d!42606))

(declare-fun d!42608 () Bool)

(assert (=> d!42608 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))))))))

(assert (=> d!42315 d!42608))

(declare-fun d!42610 () Bool)

(assert (=> d!42610 (= (invariant!0 (currentBit!5925 (_2!6085 lt!205156)) (currentByte!5930 (_2!6085 lt!205156)) (size!2772 (buf!3145 (_2!6085 lt!205156)))) (and (bvsge (currentBit!5925 (_2!6085 lt!205156)) #b00000000000000000000000000000000) (bvslt (currentBit!5925 (_2!6085 lt!205156)) #b00000000000000000000000000001000) (bvsge (currentByte!5930 (_2!6085 lt!205156)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5930 (_2!6085 lt!205156)) (size!2772 (buf!3145 (_2!6085 lt!205156)))) (and (= (currentBit!5925 (_2!6085 lt!205156)) #b00000000000000000000000000000000) (= (currentByte!5930 (_2!6085 lt!205156)) (size!2772 (buf!3145 (_2!6085 lt!205156))))))))))

(assert (=> d!42315 d!42610))

(declare-fun d!42612 () Bool)

(declare-fun lt!206441 () tuple2!11562)

(assert (=> d!42612 (= lt!206441 (readByte!0 lt!205548))))

(assert (=> d!42612 (= (readBytePure!0 lt!205548) (tuple2!11555 (_2!6089 lt!206441) (_1!6089 lt!206441)))))

(declare-fun bs!10404 () Bool)

(assert (= bs!10404 d!42612))

(declare-fun m!202183 () Bool)

(assert (=> bs!10404 m!202183))

(assert (=> d!42285 d!42612))

(declare-fun d!42614 () Bool)

(declare-fun e!88468 () Bool)

(assert (=> d!42614 e!88468))

(declare-fun res!110819 () Bool)

(assert (=> d!42614 (=> (not res!110819) (not e!88468))))

(declare-fun lt!206445 () (_ BitVec 64))

(declare-fun lt!206447 () (_ BitVec 64))

(declare-fun lt!206446 () (_ BitVec 64))

(assert (=> d!42614 (= res!110819 (= lt!206445 (bvsub lt!206446 lt!206447)))))

(assert (=> d!42614 (or (= (bvand lt!206446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206446 lt!206447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42614 (= lt!206447 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205546)))) ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205546))) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205546)))))))

(declare-fun lt!206444 () (_ BitVec 64))

(declare-fun lt!206443 () (_ BitVec 64))

(assert (=> d!42614 (= lt!206446 (bvmul lt!206444 lt!206443))))

(assert (=> d!42614 (or (= lt!206444 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!206443 (bvsdiv (bvmul lt!206444 lt!206443) lt!206444)))))

(assert (=> d!42614 (= lt!206443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42614 (= lt!206444 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205546)))))))

(assert (=> d!42614 (= lt!206445 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205546))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205546)))))))

(assert (=> d!42614 (invariant!0 (currentBit!5925 (_1!6083 lt!205546)) (currentByte!5930 (_1!6083 lt!205546)) (size!2772 (buf!3145 (_1!6083 lt!205546))))))

(assert (=> d!42614 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205546))) (currentByte!5930 (_1!6083 lt!205546)) (currentBit!5925 (_1!6083 lt!205546))) lt!206445)))

(declare-fun b!133407 () Bool)

(declare-fun res!110820 () Bool)

(assert (=> b!133407 (=> (not res!110820) (not e!88468))))

(assert (=> b!133407 (= res!110820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!206445))))

(declare-fun b!133408 () Bool)

(declare-fun lt!206442 () (_ BitVec 64))

(assert (=> b!133408 (= e!88468 (bvsle lt!206445 (bvmul lt!206442 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133408 (or (= lt!206442 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206442 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206442)))))

(assert (=> b!133408 (= lt!206442 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205546)))))))

(assert (= (and d!42614 res!110819) b!133407))

(assert (= (and b!133407 res!110820) b!133408))

(declare-fun m!202185 () Bool)

(assert (=> d!42614 m!202185))

(declare-fun m!202187 () Bool)

(assert (=> d!42614 m!202187))

(assert (=> d!42285 d!42614))

(declare-fun d!42616 () Bool)

(declare-fun e!88471 () Bool)

(assert (=> d!42616 e!88471))

(declare-fun res!110823 () Bool)

(assert (=> d!42616 (=> (not res!110823) (not e!88471))))

(declare-fun lt!206452 () tuple2!11554)

(declare-fun lt!206453 () tuple2!11554)

(assert (=> d!42616 (= res!110823 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!206452))) (currentByte!5930 (_1!6083 lt!206452)) (currentBit!5925 (_1!6083 lt!206452))) (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!206453))) (currentByte!5930 (_1!6083 lt!206453)) (currentBit!5925 (_1!6083 lt!206453)))))))

(assert (=> d!42616 (= lt!206453 (readBytePure!0 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 lt!205171) (currentBit!5925 lt!205171))))))

(assert (=> d!42616 (= lt!206452 (readBytePure!0 lt!205171))))

(assert (=> d!42616 true))

(declare-fun _$8!57 () Unit!8176)

(assert (=> d!42616 (= (choose!14 lt!205171 (_2!6085 lt!205157) lt!205548 lt!205549 (tuple2!11555 (_1!6083 lt!205549) (_2!6083 lt!205549)) (_1!6083 lt!205549) (_2!6083 lt!205549) lt!205546 (tuple2!11555 (_1!6083 lt!205546) (_2!6083 lt!205546)) (_1!6083 lt!205546) (_2!6083 lt!205546)) _$8!57)))

(declare-fun b!133411 () Bool)

(assert (=> b!133411 (= e!88471 (= (_2!6083 lt!206452) (_2!6083 lt!206453)))))

(assert (= (and d!42616 res!110823) b!133411))

(declare-fun m!202189 () Bool)

(assert (=> d!42616 m!202189))

(declare-fun m!202191 () Bool)

(assert (=> d!42616 m!202191))

(declare-fun m!202193 () Bool)

(assert (=> d!42616 m!202193))

(assert (=> d!42616 m!200921))

(assert (=> d!42285 d!42616))

(declare-fun d!42618 () Bool)

(declare-fun e!88472 () Bool)

(assert (=> d!42618 e!88472))

(declare-fun res!110824 () Bool)

(assert (=> d!42618 (=> (not res!110824) (not e!88472))))

(declare-fun lt!206457 () (_ BitVec 64))

(declare-fun lt!206459 () (_ BitVec 64))

(declare-fun lt!206458 () (_ BitVec 64))

(assert (=> d!42618 (= res!110824 (= lt!206457 (bvsub lt!206458 lt!206459)))))

(assert (=> d!42618 (or (= (bvand lt!206458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206458 lt!206459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42618 (= lt!206459 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205549)))) ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205549))) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205549)))))))

(declare-fun lt!206456 () (_ BitVec 64))

(declare-fun lt!206455 () (_ BitVec 64))

(assert (=> d!42618 (= lt!206458 (bvmul lt!206456 lt!206455))))

(assert (=> d!42618 (or (= lt!206456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!206455 (bvsdiv (bvmul lt!206456 lt!206455) lt!206456)))))

(assert (=> d!42618 (= lt!206455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42618 (= lt!206456 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205549)))))))

(assert (=> d!42618 (= lt!206457 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205549)))))))

(assert (=> d!42618 (invariant!0 (currentBit!5925 (_1!6083 lt!205549)) (currentByte!5930 (_1!6083 lt!205549)) (size!2772 (buf!3145 (_1!6083 lt!205549))))))

(assert (=> d!42618 (= (bitIndex!0 (size!2772 (buf!3145 (_1!6083 lt!205549))) (currentByte!5930 (_1!6083 lt!205549)) (currentBit!5925 (_1!6083 lt!205549))) lt!206457)))

(declare-fun b!133412 () Bool)

(declare-fun res!110825 () Bool)

(assert (=> b!133412 (=> (not res!110825) (not e!88472))))

(assert (=> b!133412 (= res!110825 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!206457))))

(declare-fun b!133413 () Bool)

(declare-fun lt!206454 () (_ BitVec 64))

(assert (=> b!133413 (= e!88472 (bvsle lt!206457 (bvmul lt!206454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133413 (or (= lt!206454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206454)))))

(assert (=> b!133413 (= lt!206454 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205549)))))))

(assert (= (and d!42618 res!110824) b!133412))

(assert (= (and b!133412 res!110825) b!133413))

(declare-fun m!202195 () Bool)

(assert (=> d!42618 m!202195))

(declare-fun m!202197 () Bool)

(assert (=> d!42618 m!202197))

(assert (=> d!42285 d!42618))

(assert (=> d!42285 d!42299))

(declare-fun b!133414 () Bool)

(declare-fun e!88474 () Bool)

(declare-fun e!88476 () Bool)

(assert (=> b!133414 (= e!88474 e!88476)))

(declare-fun c!7622 () Bool)

(declare-fun lt!206460 () tuple4!112)

(assert (=> b!133414 (= c!7622 (= (_3!310 lt!206460) (_4!56 lt!206460)))))

(declare-fun b!133415 () Bool)

(declare-fun e!88475 () Bool)

(assert (=> b!133415 (= e!88476 e!88475)))

(declare-fun res!110829 () Bool)

(declare-fun call!1702 () Bool)

(assert (=> b!133415 (= res!110829 call!1702)))

(assert (=> b!133415 (=> (not res!110829) (not e!88475))))

(declare-fun b!133416 () Bool)

(declare-fun e!88477 () Bool)

(assert (=> b!133416 (= e!88477 e!88474)))

(declare-fun res!110830 () Bool)

(assert (=> b!133416 (=> (not res!110830) (not e!88474))))

(declare-fun e!88473 () Bool)

(assert (=> b!133416 (= res!110830 e!88473)))

(declare-fun res!110827 () Bool)

(assert (=> b!133416 (=> res!110827 e!88473)))

(assert (=> b!133416 (= res!110827 (bvsge (_1!6094 lt!206460) (_2!6094 lt!206460)))))

(declare-fun lt!206462 () (_ BitVec 32))

(assert (=> b!133416 (= lt!206462 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206461 () (_ BitVec 32))

(assert (=> b!133416 (= lt!206461 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133416 (= lt!206460 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(declare-fun b!133417 () Bool)

(declare-fun e!88478 () Bool)

(assert (=> b!133417 (= e!88478 (byteRangesEq!0 (select (arr!3407 (buf!3145 thiss!1634)) (_4!56 lt!206460)) (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_4!56 lt!206460)) #b00000000000000000000000000000000 lt!206462))))

(declare-fun b!133418 () Bool)

(assert (=> b!133418 (= e!88476 call!1702)))

(declare-fun b!133419 () Bool)

(assert (=> b!133419 (= e!88473 (arrayRangesEq!175 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205157)) (_1!6094 lt!206460) (_2!6094 lt!206460)))))

(declare-fun b!133420 () Bool)

(declare-fun res!110826 () Bool)

(assert (=> b!133420 (= res!110826 (= lt!206462 #b00000000000000000000000000000000))))

(assert (=> b!133420 (=> res!110826 e!88478)))

(assert (=> b!133420 (= e!88475 e!88478)))

(declare-fun d!42620 () Bool)

(declare-fun res!110828 () Bool)

(assert (=> d!42620 (=> res!110828 e!88477)))

(assert (=> d!42620 (= res!110828 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (=> d!42620 (= (arrayBitRangesEq!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) e!88477)))

(declare-fun bm!1699 () Bool)

(assert (=> bm!1699 (= call!1702 (byteRangesEq!0 (select (arr!3407 (buf!3145 thiss!1634)) (_3!310 lt!206460)) (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_3!310 lt!206460)) lt!206461 (ite c!7622 lt!206462 #b00000000000000000000000000001000)))))

(assert (= (and d!42620 (not res!110828)) b!133416))

(assert (= (and b!133416 (not res!110827)) b!133419))

(assert (= (and b!133416 res!110830) b!133414))

(assert (= (and b!133414 c!7622) b!133418))

(assert (= (and b!133414 (not c!7622)) b!133415))

(assert (= (and b!133415 res!110829) b!133420))

(assert (= (and b!133420 (not res!110826)) b!133417))

(assert (= (or b!133418 b!133415) bm!1699))

(assert (=> b!133416 m!200969))

(declare-fun m!202199 () Bool)

(assert (=> b!133416 m!202199))

(declare-fun m!202201 () Bool)

(assert (=> b!133417 m!202201))

(declare-fun m!202203 () Bool)

(assert (=> b!133417 m!202203))

(assert (=> b!133417 m!202201))

(assert (=> b!133417 m!202203))

(declare-fun m!202205 () Bool)

(assert (=> b!133417 m!202205))

(declare-fun m!202207 () Bool)

(assert (=> b!133419 m!202207))

(declare-fun m!202209 () Bool)

(assert (=> bm!1699 m!202209))

(declare-fun m!202211 () Bool)

(assert (=> bm!1699 m!202211))

(assert (=> bm!1699 m!202209))

(assert (=> bm!1699 m!202211))

(declare-fun m!202213 () Bool)

(assert (=> bm!1699 m!202213))

(assert (=> b!133002 d!42620))

(assert (=> b!133002 d!42317))

(assert (=> b!133000 d!42317))

(assert (=> b!133000 d!42329))

(declare-fun d!42622 () Bool)

(declare-fun e!88479 () Bool)

(assert (=> d!42622 e!88479))

(declare-fun res!110831 () Bool)

(assert (=> d!42622 (=> (not res!110831) (not e!88479))))

(declare-fun lt!206467 () (_ BitVec 64))

(declare-fun lt!206468 () (_ BitVec 64))

(declare-fun lt!206466 () (_ BitVec 64))

(assert (=> d!42622 (= res!110831 (= lt!206466 (bvsub lt!206467 lt!206468)))))

(assert (=> d!42622 (or (= (bvand lt!206467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206467 lt!206468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42622 (= lt!206468 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205532)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205532))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205532)))))))

(declare-fun lt!206465 () (_ BitVec 64))

(declare-fun lt!206464 () (_ BitVec 64))

(assert (=> d!42622 (= lt!206467 (bvmul lt!206465 lt!206464))))

(assert (=> d!42622 (or (= lt!206465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!206464 (bvsdiv (bvmul lt!206465 lt!206464) lt!206465)))))

(assert (=> d!42622 (= lt!206464 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42622 (= lt!206465 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205532)))))))

(assert (=> d!42622 (= lt!206466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205532)))))))

(assert (=> d!42622 (invariant!0 (currentBit!5925 (_2!6085 lt!205532)) (currentByte!5930 (_2!6085 lt!205532)) (size!2772 (buf!3145 (_2!6085 lt!205532))))))

(assert (=> d!42622 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205532))) (currentByte!5930 (_2!6085 lt!205532)) (currentBit!5925 (_2!6085 lt!205532))) lt!206466)))

(declare-fun b!133421 () Bool)

(declare-fun res!110832 () Bool)

(assert (=> b!133421 (=> (not res!110832) (not e!88479))))

(assert (=> b!133421 (= res!110832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!206466))))

(declare-fun b!133422 () Bool)

(declare-fun lt!206463 () (_ BitVec 64))

(assert (=> b!133422 (= e!88479 (bvsle lt!206466 (bvmul lt!206463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133422 (or (= lt!206463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206463)))))

(assert (=> b!133422 (= lt!206463 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205532)))))))

(assert (= (and d!42622 res!110831) b!133421))

(assert (= (and b!133421 res!110832) b!133422))

(declare-fun m!202215 () Bool)

(assert (=> d!42622 m!202215))

(declare-fun m!202217 () Bool)

(assert (=> d!42622 m!202217))

(assert (=> b!132991 d!42622))

(assert (=> b!132991 d!42317))

(declare-fun d!42624 () Bool)

(declare-fun res!110834 () Bool)

(declare-fun e!88481 () Bool)

(assert (=> d!42624 (=> (not res!110834) (not e!88481))))

(assert (=> d!42624 (= res!110834 (= (size!2772 (buf!3145 (_2!6084 lt!205624))) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (=> d!42624 (= (isPrefixOf!0 (_2!6084 lt!205624) (_2!6085 lt!205156)) e!88481)))

(declare-fun b!133423 () Bool)

(declare-fun res!110833 () Bool)

(assert (=> b!133423 (=> (not res!110833) (not e!88481))))

(assert (=> b!133423 (= res!110833 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205624))) (currentByte!5930 (_2!6084 lt!205624)) (currentBit!5925 (_2!6084 lt!205624))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun b!133424 () Bool)

(declare-fun e!88480 () Bool)

(assert (=> b!133424 (= e!88481 e!88480)))

(declare-fun res!110835 () Bool)

(assert (=> b!133424 (=> res!110835 e!88480)))

(assert (=> b!133424 (= res!110835 (= (size!2772 (buf!3145 (_2!6084 lt!205624))) #b00000000000000000000000000000000))))

(declare-fun b!133425 () Bool)

(assert (=> b!133425 (= e!88480 (arrayBitRangesEq!0 (buf!3145 (_2!6084 lt!205624)) (buf!3145 (_2!6085 lt!205156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205624))) (currentByte!5930 (_2!6084 lt!205624)) (currentBit!5925 (_2!6084 lt!205624)))))))

(assert (= (and d!42624 res!110834) b!133423))

(assert (= (and b!133423 res!110833) b!133424))

(assert (= (and b!133424 (not res!110835)) b!133425))

(declare-fun m!202219 () Bool)

(assert (=> b!133423 m!202219))

(assert (=> b!133423 m!200955))

(assert (=> b!133425 m!202219))

(assert (=> b!133425 m!202219))

(declare-fun m!202221 () Bool)

(assert (=> b!133425 m!202221))

(assert (=> b!133039 d!42624))

(declare-fun b!133436 () Bool)

(declare-fun res!110847 () Bool)

(declare-fun e!88492 () Bool)

(assert (=> b!133436 (=> (not res!110847) (not e!88492))))

(declare-fun _$39!18 () tuple2!11558)

(assert (=> b!133436 (= res!110847 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 _$39!18))) (currentByte!5930 (_2!6085 _$39!18)) (currentBit!5925 (_2!6085 _$39!18))) (bvadd (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!133437 () Bool)

(declare-fun res!110844 () Bool)

(assert (=> b!133437 (=> (not res!110844) (not e!88492))))

(assert (=> b!133437 (= res!110844 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 _$39!18)))))

(declare-fun b!133438 () Bool)

(declare-fun e!88490 () Bool)

(assert (=> b!133438 (= e!88492 e!88490)))

(declare-fun res!110846 () Bool)

(assert (=> b!133438 (=> (not res!110846) (not e!88490))))

(declare-fun lt!206483 () tuple2!11552)

(declare-fun lt!206482 () tuple2!11556)

(assert (=> b!133438 (= res!110846 (and (= (size!2772 (_2!6082 lt!206483)) (size!2772 arr!237)) (= (_1!6082 lt!206483) (_2!6084 lt!206482))))))

(assert (=> b!133438 (= lt!206483 (readByteArrayLoopPure!0 (_1!6084 lt!206482) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206480 () Unit!8176)

(declare-fun lt!206479 () Unit!8176)

(assert (=> b!133438 (= lt!206480 lt!206479)))

(declare-fun lt!206481 () (_ BitVec 64))

(assert (=> b!133438 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 _$39!18)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!206481)))

(assert (=> b!133438 (= lt!206479 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 _$39!18)) lt!206481))))

(assert (=> b!133438 (= lt!206481 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133438 (= lt!206482 (reader!0 (_2!6085 lt!205156) (_2!6085 _$39!18)))))

(declare-fun b!133439 () Bool)

(assert (=> b!133439 (= e!88490 (arrayRangesEq!175 arr!237 (_2!6082 lt!206483) #b00000000000000000000000000000000 to!404))))

(declare-fun b!133440 () Bool)

(declare-fun e!88493 () Bool)

(assert (=> b!133440 (= e!88493 (array_inv!2561 (buf!3145 (_2!6085 _$39!18))))))

(declare-fun d!42626 () Bool)

(assert (=> d!42626 e!88492))

(declare-fun res!110845 () Bool)

(assert (=> d!42626 (=> (not res!110845) (not e!88492))))

(assert (=> d!42626 (= res!110845 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 _$39!18)))))))

(assert (=> d!42626 (and (inv!12 (_2!6085 _$39!18)) e!88493)))

(assert (=> d!42626 (= (choose!64 (_2!6085 lt!205156) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!18)))

(assert (= d!42626 b!133440))

(assert (= (and d!42626 res!110845) b!133436))

(assert (= (and b!133436 res!110847) b!133437))

(assert (= (and b!133437 res!110844) b!133438))

(assert (= (and b!133438 res!110846) b!133439))

(declare-fun m!202223 () Bool)

(assert (=> b!133438 m!202223))

(declare-fun m!202225 () Bool)

(assert (=> b!133438 m!202225))

(declare-fun m!202227 () Bool)

(assert (=> b!133438 m!202227))

(declare-fun m!202229 () Bool)

(assert (=> b!133438 m!202229))

(declare-fun m!202231 () Bool)

(assert (=> d!42626 m!202231))

(declare-fun m!202233 () Bool)

(assert (=> b!133437 m!202233))

(declare-fun m!202235 () Bool)

(assert (=> b!133440 m!202235))

(declare-fun m!202237 () Bool)

(assert (=> b!133439 m!202237))

(declare-fun m!202239 () Bool)

(assert (=> b!133436 m!202239))

(assert (=> b!133436 m!200955))

(assert (=> d!42289 d!42626))

(declare-fun d!42628 () Bool)

(declare-fun res!110849 () Bool)

(declare-fun e!88495 () Bool)

(assert (=> d!42628 (=> (not res!110849) (not e!88495))))

(assert (=> d!42628 (= res!110849 (= (size!2772 (buf!3145 (_1!6084 lt!205624))) (size!2772 (buf!3145 thiss!1634))))))

(assert (=> d!42628 (= (isPrefixOf!0 (_1!6084 lt!205624) thiss!1634) e!88495)))

(declare-fun b!133441 () Bool)

(declare-fun res!110848 () Bool)

(assert (=> b!133441 (=> (not res!110848) (not e!88495))))

(assert (=> b!133441 (= res!110848 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205624))) (currentByte!5930 (_1!6084 lt!205624)) (currentBit!5925 (_1!6084 lt!205624))) (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(declare-fun b!133442 () Bool)

(declare-fun e!88494 () Bool)

(assert (=> b!133442 (= e!88495 e!88494)))

(declare-fun res!110850 () Bool)

(assert (=> b!133442 (=> res!110850 e!88494)))

(assert (=> b!133442 (= res!110850 (= (size!2772 (buf!3145 (_1!6084 lt!205624))) #b00000000000000000000000000000000))))

(declare-fun b!133443 () Bool)

(assert (=> b!133443 (= e!88494 (arrayBitRangesEq!0 (buf!3145 (_1!6084 lt!205624)) (buf!3145 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205624))) (currentByte!5930 (_1!6084 lt!205624)) (currentBit!5925 (_1!6084 lt!205624)))))))

(assert (= (and d!42628 res!110849) b!133441))

(assert (= (and b!133441 res!110848) b!133442))

(assert (= (and b!133442 (not res!110850)) b!133443))

(declare-fun m!202241 () Bool)

(assert (=> b!133441 m!202241))

(assert (=> b!133441 m!200969))

(assert (=> b!133443 m!202241))

(assert (=> b!133443 m!202241))

(declare-fun m!202243 () Bool)

(assert (=> b!133443 m!202243))

(assert (=> b!133037 d!42628))

(declare-fun d!42630 () Bool)

(assert (=> d!42630 (isPrefixOf!0 lt!205389 (_2!6085 lt!205157))))

(declare-fun lt!206484 () Unit!8176)

(assert (=> d!42630 (= lt!206484 (choose!30 lt!205389 thiss!1634 (_2!6085 lt!205157)))))

(assert (=> d!42630 (isPrefixOf!0 lt!205389 thiss!1634)))

(assert (=> d!42630 (= (lemmaIsPrefixTransitive!0 lt!205389 thiss!1634 (_2!6085 lt!205157)) lt!206484)))

(declare-fun bs!10405 () Bool)

(assert (= bs!10405 d!42630))

(assert (=> bs!10405 m!201105))

(declare-fun m!202245 () Bool)

(assert (=> bs!10405 m!202245))

(declare-fun m!202247 () Bool)

(assert (=> bs!10405 m!202247))

(assert (=> d!42223 d!42630))

(declare-fun d!42632 () Bool)

(assert (=> d!42632 (isPrefixOf!0 lt!205389 (_2!6085 lt!205157))))

(declare-fun lt!206485 () Unit!8176)

(assert (=> d!42632 (= lt!206485 (choose!30 lt!205389 (_2!6085 lt!205157) (_2!6085 lt!205157)))))

(assert (=> d!42632 (isPrefixOf!0 lt!205389 (_2!6085 lt!205157))))

(assert (=> d!42632 (= (lemmaIsPrefixTransitive!0 lt!205389 (_2!6085 lt!205157) (_2!6085 lt!205157)) lt!206485)))

(declare-fun bs!10406 () Bool)

(assert (= bs!10406 d!42632))

(assert (=> bs!10406 m!201105))

(declare-fun m!202249 () Bool)

(assert (=> bs!10406 m!202249))

(assert (=> bs!10406 m!201105))

(assert (=> d!42223 d!42632))

(declare-fun d!42634 () Bool)

(declare-fun res!110852 () Bool)

(declare-fun e!88497 () Bool)

(assert (=> d!42634 (=> (not res!110852) (not e!88497))))

(assert (=> d!42634 (= res!110852 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 thiss!1634))))))

(assert (=> d!42634 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!88497)))

(declare-fun b!133444 () Bool)

(declare-fun res!110851 () Bool)

(assert (=> b!133444 (=> (not res!110851) (not e!88497))))

(assert (=> b!133444 (= res!110851 (bvsle (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(declare-fun b!133445 () Bool)

(declare-fun e!88496 () Bool)

(assert (=> b!133445 (= e!88497 e!88496)))

(declare-fun res!110853 () Bool)

(assert (=> b!133445 (=> res!110853 e!88496)))

(assert (=> b!133445 (= res!110853 (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133446 () Bool)

(assert (=> b!133446 (= e!88496 (arrayBitRangesEq!0 (buf!3145 thiss!1634) (buf!3145 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (= (and d!42634 res!110852) b!133444))

(assert (= (and b!133444 res!110851) b!133445))

(assert (= (and b!133445 (not res!110853)) b!133446))

(assert (=> b!133444 m!200969))

(assert (=> b!133444 m!200969))

(assert (=> b!133446 m!200969))

(assert (=> b!133446 m!200969))

(declare-fun m!202251 () Bool)

(assert (=> b!133446 m!202251))

(assert (=> d!42223 d!42634))

(declare-fun d!42636 () Bool)

(assert (=> d!42636 (isPrefixOf!0 lt!205389 lt!205389)))

(declare-fun lt!206488 () Unit!8176)

(declare-fun choose!11 (BitStream!4808) Unit!8176)

(assert (=> d!42636 (= lt!206488 (choose!11 lt!205389))))

(assert (=> d!42636 (= (lemmaIsPrefixRefl!0 lt!205389) lt!206488)))

(declare-fun bs!10408 () Bool)

(assert (= bs!10408 d!42636))

(assert (=> bs!10408 m!201111))

(declare-fun m!202253 () Bool)

(assert (=> bs!10408 m!202253))

(assert (=> d!42223 d!42636))

(assert (=> d!42223 d!42279))

(declare-fun d!42638 () Bool)

(declare-fun res!110855 () Bool)

(declare-fun e!88499 () Bool)

(assert (=> d!42638 (=> (not res!110855) (not e!88499))))

(assert (=> d!42638 (= res!110855 (= (size!2772 (buf!3145 (_2!6085 lt!205157))) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42638 (= (isPrefixOf!0 (_2!6085 lt!205157) (_2!6085 lt!205157)) e!88499)))

(declare-fun b!133447 () Bool)

(declare-fun res!110854 () Bool)

(assert (=> b!133447 (=> (not res!110854) (not e!88499))))

(assert (=> b!133447 (= res!110854 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133448 () Bool)

(declare-fun e!88498 () Bool)

(assert (=> b!133448 (= e!88499 e!88498)))

(declare-fun res!110856 () Bool)

(assert (=> b!133448 (=> res!110856 e!88498)))

(assert (=> b!133448 (= res!110856 (= (size!2772 (buf!3145 (_2!6085 lt!205157))) #b00000000000000000000000000000000))))

(declare-fun b!133449 () Bool)

(assert (=> b!133449 (= e!88498 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(assert (= (and d!42638 res!110855) b!133447))

(assert (= (and b!133447 res!110854) b!133448))

(assert (= (and b!133448 (not res!110856)) b!133449))

(assert (=> b!133447 m!200953))

(assert (=> b!133447 m!200953))

(assert (=> b!133449 m!200953))

(assert (=> b!133449 m!200953))

(declare-fun m!202255 () Bool)

(assert (=> b!133449 m!202255))

(assert (=> d!42223 d!42638))

(declare-fun d!42640 () Bool)

(assert (=> d!42640 (isPrefixOf!0 (_2!6085 lt!205157) (_2!6085 lt!205157))))

(declare-fun lt!206489 () Unit!8176)

(assert (=> d!42640 (= lt!206489 (choose!11 (_2!6085 lt!205157)))))

(assert (=> d!42640 (= (lemmaIsPrefixRefl!0 (_2!6085 lt!205157)) lt!206489)))

(declare-fun bs!10409 () Bool)

(assert (= bs!10409 d!42640))

(assert (=> bs!10409 m!201099))

(declare-fun m!202257 () Bool)

(assert (=> bs!10409 m!202257))

(assert (=> d!42223 d!42640))

(declare-fun d!42642 () Bool)

(declare-fun res!110858 () Bool)

(declare-fun e!88501 () Bool)

(assert (=> d!42642 (=> (not res!110858) (not e!88501))))

(assert (=> d!42642 (= res!110858 (= (size!2772 (buf!3145 (_1!6084 lt!205393))) (size!2772 (buf!3145 (_2!6084 lt!205393)))))))

(assert (=> d!42642 (= (isPrefixOf!0 (_1!6084 lt!205393) (_2!6084 lt!205393)) e!88501)))

(declare-fun b!133450 () Bool)

(declare-fun res!110857 () Bool)

(assert (=> b!133450 (=> (not res!110857) (not e!88501))))

(assert (=> b!133450 (= res!110857 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205393))) (currentByte!5930 (_1!6084 lt!205393)) (currentBit!5925 (_1!6084 lt!205393))) (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205393))) (currentByte!5930 (_2!6084 lt!205393)) (currentBit!5925 (_2!6084 lt!205393)))))))

(declare-fun b!133451 () Bool)

(declare-fun e!88500 () Bool)

(assert (=> b!133451 (= e!88501 e!88500)))

(declare-fun res!110859 () Bool)

(assert (=> b!133451 (=> res!110859 e!88500)))

(assert (=> b!133451 (= res!110859 (= (size!2772 (buf!3145 (_1!6084 lt!205393))) #b00000000000000000000000000000000))))

(declare-fun b!133452 () Bool)

(assert (=> b!133452 (= e!88500 (arrayBitRangesEq!0 (buf!3145 (_1!6084 lt!205393)) (buf!3145 (_2!6084 lt!205393)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205393))) (currentByte!5930 (_1!6084 lt!205393)) (currentBit!5925 (_1!6084 lt!205393)))))))

(assert (= (and d!42642 res!110858) b!133450))

(assert (= (and b!133450 res!110857) b!133451))

(assert (= (and b!133451 (not res!110859)) b!133452))

(declare-fun m!202259 () Bool)

(assert (=> b!133450 m!202259))

(declare-fun m!202261 () Bool)

(assert (=> b!133450 m!202261))

(assert (=> b!133452 m!202259))

(assert (=> b!133452 m!202259))

(declare-fun m!202263 () Bool)

(assert (=> b!133452 m!202263))

(assert (=> d!42223 d!42642))

(declare-fun d!42644 () Bool)

(declare-fun res!110861 () Bool)

(declare-fun e!88503 () Bool)

(assert (=> d!42644 (=> (not res!110861) (not e!88503))))

(assert (=> d!42644 (= res!110861 (= (size!2772 (buf!3145 lt!205389)) (size!2772 (buf!3145 lt!205389))))))

(assert (=> d!42644 (= (isPrefixOf!0 lt!205389 lt!205389) e!88503)))

(declare-fun b!133453 () Bool)

(declare-fun res!110860 () Bool)

(assert (=> b!133453 (=> (not res!110860) (not e!88503))))

(assert (=> b!133453 (= res!110860 (bvsle (bitIndex!0 (size!2772 (buf!3145 lt!205389)) (currentByte!5930 lt!205389) (currentBit!5925 lt!205389)) (bitIndex!0 (size!2772 (buf!3145 lt!205389)) (currentByte!5930 lt!205389) (currentBit!5925 lt!205389))))))

(declare-fun b!133454 () Bool)

(declare-fun e!88502 () Bool)

(assert (=> b!133454 (= e!88503 e!88502)))

(declare-fun res!110862 () Bool)

(assert (=> b!133454 (=> res!110862 e!88502)))

(assert (=> b!133454 (= res!110862 (= (size!2772 (buf!3145 lt!205389)) #b00000000000000000000000000000000))))

(declare-fun b!133455 () Bool)

(assert (=> b!133455 (= e!88502 (arrayBitRangesEq!0 (buf!3145 lt!205389) (buf!3145 lt!205389) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 lt!205389)) (currentByte!5930 lt!205389) (currentBit!5925 lt!205389))))))

(assert (= (and d!42644 res!110861) b!133453))

(assert (= (and b!133453 res!110860) b!133454))

(assert (= (and b!133454 (not res!110862)) b!133455))

(declare-fun m!202265 () Bool)

(assert (=> b!133453 m!202265))

(assert (=> b!133453 m!202265))

(assert (=> b!133455 m!202265))

(assert (=> b!133455 m!202265))

(declare-fun m!202267 () Bool)

(assert (=> b!133455 m!202267))

(assert (=> d!42223 d!42644))

(declare-fun d!42646 () Bool)

(declare-fun res!110864 () Bool)

(declare-fun e!88505 () Bool)

(assert (=> d!42646 (=> (not res!110864) (not e!88505))))

(assert (=> d!42646 (= res!110864 (= (size!2772 (buf!3145 lt!205389)) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42646 (= (isPrefixOf!0 lt!205389 (_2!6085 lt!205157)) e!88505)))

(declare-fun b!133456 () Bool)

(declare-fun res!110863 () Bool)

(assert (=> b!133456 (=> (not res!110863) (not e!88505))))

(assert (=> b!133456 (= res!110863 (bvsle (bitIndex!0 (size!2772 (buf!3145 lt!205389)) (currentByte!5930 lt!205389) (currentBit!5925 lt!205389)) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133457 () Bool)

(declare-fun e!88504 () Bool)

(assert (=> b!133457 (= e!88505 e!88504)))

(declare-fun res!110865 () Bool)

(assert (=> b!133457 (=> res!110865 e!88504)))

(assert (=> b!133457 (= res!110865 (= (size!2772 (buf!3145 lt!205389)) #b00000000000000000000000000000000))))

(declare-fun b!133458 () Bool)

(assert (=> b!133458 (= e!88504 (arrayBitRangesEq!0 (buf!3145 lt!205389) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 lt!205389)) (currentByte!5930 lt!205389) (currentBit!5925 lt!205389))))))

(assert (= (and d!42646 res!110864) b!133456))

(assert (= (and b!133456 res!110863) b!133457))

(assert (= (and b!133457 (not res!110865)) b!133458))

(assert (=> b!133456 m!202265))

(assert (=> b!133456 m!200953))

(assert (=> b!133458 m!202265))

(assert (=> b!133458 m!202265))

(declare-fun m!202269 () Bool)

(assert (=> b!133458 m!202269))

(assert (=> d!42223 d!42646))

(declare-fun d!42648 () Bool)

(assert (=> d!42648 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!206490 () Unit!8176)

(assert (=> d!42648 (= lt!206490 (choose!11 thiss!1634))))

(assert (=> d!42648 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!206490)))

(declare-fun bs!10410 () Bool)

(assert (= bs!10410 d!42648))

(assert (=> bs!10410 m!201109))

(declare-fun m!202271 () Bool)

(assert (=> bs!10410 m!202271))

(assert (=> d!42223 d!42648))

(declare-fun d!42650 () Bool)

(declare-fun e!88508 () Bool)

(assert (=> d!42650 e!88508))

(declare-fun res!110868 () Bool)

(assert (=> d!42650 (=> (not res!110868) (not e!88508))))

(declare-fun moveByteIndexPrecond!0 (BitStream!4808 (_ BitVec 32)) Bool)

(assert (=> d!42650 (= res!110868 (moveByteIndexPrecond!0 (_1!6084 lt!205162) #b00000000000000000000000000000001))))

(declare-fun Unit!8245 () Unit!8176)

(assert (=> d!42650 (= (moveByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) (tuple2!11559 Unit!8245 (BitStream!4809 (buf!3145 (_1!6084 lt!205162)) (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001) (currentBit!5925 (_1!6084 lt!205162)))))))

(declare-fun b!133461 () Bool)

(assert (=> b!133461 (= e!88508 (and (or (not (= (bvand (currentByte!5930 (_1!6084 lt!205162)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!5930 (_1!6084 lt!205162)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001) (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001))))))

(assert (= (and d!42650 res!110868) b!133461))

(declare-fun m!202273 () Bool)

(assert (=> d!42650 m!202273))

(assert (=> d!42297 d!42650))

(declare-fun d!42652 () Bool)

(declare-fun res!110870 () Bool)

(declare-fun e!88510 () Bool)

(assert (=> d!42652 (=> (not res!110870) (not e!88510))))

(assert (=> d!42652 (= res!110870 (= (size!2772 (buf!3145 (_1!6084 lt!205393))) (size!2772 (buf!3145 thiss!1634))))))

(assert (=> d!42652 (= (isPrefixOf!0 (_1!6084 lt!205393) thiss!1634) e!88510)))

(declare-fun b!133462 () Bool)

(declare-fun res!110869 () Bool)

(assert (=> b!133462 (=> (not res!110869) (not e!88510))))

(assert (=> b!133462 (= res!110869 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205393))) (currentByte!5930 (_1!6084 lt!205393)) (currentBit!5925 (_1!6084 lt!205393))) (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(declare-fun b!133463 () Bool)

(declare-fun e!88509 () Bool)

(assert (=> b!133463 (= e!88510 e!88509)))

(declare-fun res!110871 () Bool)

(assert (=> b!133463 (=> res!110871 e!88509)))

(assert (=> b!133463 (= res!110871 (= (size!2772 (buf!3145 (_1!6084 lt!205393))) #b00000000000000000000000000000000))))

(declare-fun b!133464 () Bool)

(assert (=> b!133464 (= e!88509 (arrayBitRangesEq!0 (buf!3145 (_1!6084 lt!205393)) (buf!3145 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205393))) (currentByte!5930 (_1!6084 lt!205393)) (currentBit!5925 (_1!6084 lt!205393)))))))

(assert (= (and d!42652 res!110870) b!133462))

(assert (= (and b!133462 res!110869) b!133463))

(assert (= (and b!133463 (not res!110871)) b!133464))

(assert (=> b!133462 m!202259))

(assert (=> b!133462 m!200969))

(assert (=> b!133464 m!202259))

(assert (=> b!133464 m!202259))

(declare-fun m!202275 () Bool)

(assert (=> b!133464 m!202275))

(assert (=> b!132954 d!42652))

(assert (=> b!132952 d!42317))

(declare-fun d!42654 () Bool)

(assert (=> d!42654 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 thiss!1634) lt!205397 lt!205384)))

(declare-fun lt!206491 () Unit!8176)

(assert (=> d!42654 (= lt!206491 (choose!8 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205157)) lt!205397 lt!205384))))

(assert (=> d!42654 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205397) (bvsle lt!205397 lt!205384))))

(assert (=> d!42654 (= (arrayBitRangesEqSymmetric!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205157)) lt!205397 lt!205384) lt!206491)))

(declare-fun bs!10411 () Bool)

(assert (= bs!10411 d!42654))

(assert (=> bs!10411 m!201097))

(declare-fun m!202277 () Bool)

(assert (=> bs!10411 m!202277))

(assert (=> b!132952 d!42654))

(declare-fun b!133465 () Bool)

(declare-fun e!88512 () Bool)

(declare-fun e!88514 () Bool)

(assert (=> b!133465 (= e!88512 e!88514)))

(declare-fun c!7623 () Bool)

(declare-fun lt!206492 () tuple4!112)

(assert (=> b!133465 (= c!7623 (= (_3!310 lt!206492) (_4!56 lt!206492)))))

(declare-fun b!133466 () Bool)

(declare-fun e!88513 () Bool)

(assert (=> b!133466 (= e!88514 e!88513)))

(declare-fun res!110875 () Bool)

(declare-fun call!1703 () Bool)

(assert (=> b!133466 (= res!110875 call!1703)))

(assert (=> b!133466 (=> (not res!110875) (not e!88513))))

(declare-fun b!133467 () Bool)

(declare-fun e!88515 () Bool)

(assert (=> b!133467 (= e!88515 e!88512)))

(declare-fun res!110876 () Bool)

(assert (=> b!133467 (=> (not res!110876) (not e!88512))))

(declare-fun e!88511 () Bool)

(assert (=> b!133467 (= res!110876 e!88511)))

(declare-fun res!110873 () Bool)

(assert (=> b!133467 (=> res!110873 e!88511)))

(assert (=> b!133467 (= res!110873 (bvsge (_1!6094 lt!206492) (_2!6094 lt!206492)))))

(declare-fun lt!206494 () (_ BitVec 32))

(assert (=> b!133467 (= lt!206494 ((_ extract 31 0) (bvsrem lt!205384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206493 () (_ BitVec 32))

(assert (=> b!133467 (= lt!206493 ((_ extract 31 0) (bvsrem lt!205397 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133467 (= lt!206492 (arrayBitIndices!0 lt!205397 lt!205384))))

(declare-fun b!133468 () Bool)

(declare-fun e!88516 () Bool)

(assert (=> b!133468 (= e!88516 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_4!56 lt!206492)) (select (arr!3407 (buf!3145 thiss!1634)) (_4!56 lt!206492)) #b00000000000000000000000000000000 lt!206494))))

(declare-fun b!133469 () Bool)

(assert (=> b!133469 (= e!88514 call!1703)))

(declare-fun b!133470 () Bool)

(assert (=> b!133470 (= e!88511 (arrayRangesEq!175 (buf!3145 (_2!6085 lt!205157)) (buf!3145 thiss!1634) (_1!6094 lt!206492) (_2!6094 lt!206492)))))

(declare-fun b!133471 () Bool)

(declare-fun res!110872 () Bool)

(assert (=> b!133471 (= res!110872 (= lt!206494 #b00000000000000000000000000000000))))

(assert (=> b!133471 (=> res!110872 e!88516)))

(assert (=> b!133471 (= e!88513 e!88516)))

(declare-fun d!42656 () Bool)

(declare-fun res!110874 () Bool)

(assert (=> d!42656 (=> res!110874 e!88515)))

(assert (=> d!42656 (= res!110874 (bvsge lt!205397 lt!205384))))

(assert (=> d!42656 (= (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 thiss!1634) lt!205397 lt!205384) e!88515)))

(declare-fun bm!1700 () Bool)

(assert (=> bm!1700 (= call!1703 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_3!310 lt!206492)) (select (arr!3407 (buf!3145 thiss!1634)) (_3!310 lt!206492)) lt!206493 (ite c!7623 lt!206494 #b00000000000000000000000000001000)))))

(assert (= (and d!42656 (not res!110874)) b!133467))

(assert (= (and b!133467 (not res!110873)) b!133470))

(assert (= (and b!133467 res!110876) b!133465))

(assert (= (and b!133465 c!7623) b!133469))

(assert (= (and b!133465 (not c!7623)) b!133466))

(assert (= (and b!133466 res!110875) b!133471))

(assert (= (and b!133471 (not res!110872)) b!133468))

(assert (= (or b!133469 b!133466) bm!1700))

(declare-fun m!202279 () Bool)

(assert (=> b!133467 m!202279))

(declare-fun m!202281 () Bool)

(assert (=> b!133468 m!202281))

(declare-fun m!202283 () Bool)

(assert (=> b!133468 m!202283))

(assert (=> b!133468 m!202281))

(assert (=> b!133468 m!202283))

(declare-fun m!202285 () Bool)

(assert (=> b!133468 m!202285))

(declare-fun m!202287 () Bool)

(assert (=> b!133470 m!202287))

(declare-fun m!202289 () Bool)

(assert (=> bm!1700 m!202289))

(declare-fun m!202291 () Bool)

(assert (=> bm!1700 m!202291))

(assert (=> bm!1700 m!202289))

(assert (=> bm!1700 m!202291))

(declare-fun m!202293 () Bool)

(assert (=> bm!1700 m!202293))

(assert (=> b!132952 d!42656))

(declare-fun d!42658 () Bool)

(declare-fun e!88519 () Bool)

(assert (=> d!42658 e!88519))

(declare-fun res!110879 () Bool)

(assert (=> d!42658 (=> (not res!110879) (not e!88519))))

(declare-fun lt!206500 () (_ BitVec 64))

(declare-fun lt!206499 () BitStream!4808)

(assert (=> d!42658 (= res!110879 (= (bvadd lt!206500 (bvsub lt!205603 lt!205596)) (bitIndex!0 (size!2772 (buf!3145 lt!206499)) (currentByte!5930 lt!206499) (currentBit!5925 lt!206499))))))

(assert (=> d!42658 (or (not (= (bvand lt!206500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205603 lt!205596) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206500 (bvsub lt!205603 lt!205596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42658 (= lt!206500 (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205602))) (currentByte!5930 (_2!6084 lt!205602)) (currentBit!5925 (_2!6084 lt!205602))))))

(declare-fun moveBitIndex!0 (BitStream!4808 (_ BitVec 64)) tuple2!11558)

(assert (=> d!42658 (= lt!206499 (_2!6085 (moveBitIndex!0 (_2!6084 lt!205602) (bvsub lt!205603 lt!205596))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4808 (_ BitVec 64)) Bool)

(assert (=> d!42658 (moveBitIndexPrecond!0 (_2!6084 lt!205602) (bvsub lt!205603 lt!205596))))

(assert (=> d!42658 (= (withMovedBitIndex!0 (_2!6084 lt!205602) (bvsub lt!205603 lt!205596)) lt!206499)))

(declare-fun b!133474 () Bool)

(assert (=> b!133474 (= e!88519 (= (size!2772 (buf!3145 (_2!6084 lt!205602))) (size!2772 (buf!3145 lt!206499))))))

(assert (= (and d!42658 res!110879) b!133474))

(declare-fun m!202295 () Bool)

(assert (=> d!42658 m!202295))

(declare-fun m!202297 () Bool)

(assert (=> d!42658 m!202297))

(declare-fun m!202299 () Bool)

(assert (=> d!42658 m!202299))

(declare-fun m!202301 () Bool)

(assert (=> d!42658 m!202301))

(assert (=> b!133028 d!42658))

(assert (=> b!133028 d!42329))

(assert (=> b!133028 d!42315))

(declare-fun d!42660 () Bool)

(declare-fun lt!206501 () tuple2!11562)

(assert (=> d!42660 (= lt!206501 (readByte!0 (_1!6084 lt!205535)))))

(assert (=> d!42660 (= (readBytePure!0 (_1!6084 lt!205535)) (tuple2!11555 (_2!6089 lt!206501) (_1!6089 lt!206501)))))

(declare-fun bs!10412 () Bool)

(assert (= bs!10412 d!42660))

(declare-fun m!202303 () Bool)

(assert (=> bs!10412 m!202303))

(assert (=> b!132993 d!42660))

(declare-fun b!133475 () Bool)

(declare-fun e!88521 () Unit!8176)

(declare-fun lt!206521 () Unit!8176)

(assert (=> b!133475 (= e!88521 lt!206521)))

(declare-fun lt!206518 () (_ BitVec 64))

(assert (=> b!133475 (= lt!206518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!206505 () (_ BitVec 64))

(assert (=> b!133475 (= lt!206505 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(assert (=> b!133475 (= lt!206521 (arrayBitRangesEqSymmetric!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205532)) lt!206518 lt!206505))))

(assert (=> b!133475 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205532)) (buf!3145 thiss!1634) lt!206518 lt!206505)))

(declare-fun d!42662 () Bool)

(declare-fun e!88520 () Bool)

(assert (=> d!42662 e!88520))

(declare-fun res!110881 () Bool)

(assert (=> d!42662 (=> (not res!110881) (not e!88520))))

(declare-fun lt!206514 () tuple2!11556)

(assert (=> d!42662 (= res!110881 (isPrefixOf!0 (_1!6084 lt!206514) (_2!6084 lt!206514)))))

(declare-fun lt!206510 () BitStream!4808)

(assert (=> d!42662 (= lt!206514 (tuple2!11557 lt!206510 (_2!6085 lt!205532)))))

(declare-fun lt!206513 () Unit!8176)

(declare-fun lt!206507 () Unit!8176)

(assert (=> d!42662 (= lt!206513 lt!206507)))

(assert (=> d!42662 (isPrefixOf!0 lt!206510 (_2!6085 lt!205532))))

(assert (=> d!42662 (= lt!206507 (lemmaIsPrefixTransitive!0 lt!206510 (_2!6085 lt!205532) (_2!6085 lt!205532)))))

(declare-fun lt!206504 () Unit!8176)

(declare-fun lt!206506 () Unit!8176)

(assert (=> d!42662 (= lt!206504 lt!206506)))

(assert (=> d!42662 (isPrefixOf!0 lt!206510 (_2!6085 lt!205532))))

(assert (=> d!42662 (= lt!206506 (lemmaIsPrefixTransitive!0 lt!206510 thiss!1634 (_2!6085 lt!205532)))))

(declare-fun lt!206502 () Unit!8176)

(assert (=> d!42662 (= lt!206502 e!88521)))

(declare-fun c!7624 () Bool)

(assert (=> d!42662 (= c!7624 (not (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!206519 () Unit!8176)

(declare-fun lt!206516 () Unit!8176)

(assert (=> d!42662 (= lt!206519 lt!206516)))

(assert (=> d!42662 (isPrefixOf!0 (_2!6085 lt!205532) (_2!6085 lt!205532))))

(assert (=> d!42662 (= lt!206516 (lemmaIsPrefixRefl!0 (_2!6085 lt!205532)))))

(declare-fun lt!206512 () Unit!8176)

(declare-fun lt!206517 () Unit!8176)

(assert (=> d!42662 (= lt!206512 lt!206517)))

(assert (=> d!42662 (= lt!206517 (lemmaIsPrefixRefl!0 (_2!6085 lt!205532)))))

(declare-fun lt!206503 () Unit!8176)

(declare-fun lt!206520 () Unit!8176)

(assert (=> d!42662 (= lt!206503 lt!206520)))

(assert (=> d!42662 (isPrefixOf!0 lt!206510 lt!206510)))

(assert (=> d!42662 (= lt!206520 (lemmaIsPrefixRefl!0 lt!206510))))

(declare-fun lt!206511 () Unit!8176)

(declare-fun lt!206509 () Unit!8176)

(assert (=> d!42662 (= lt!206511 lt!206509)))

(assert (=> d!42662 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42662 (= lt!206509 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42662 (= lt!206510 (BitStream!4809 (buf!3145 (_2!6085 lt!205532)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(assert (=> d!42662 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205532))))

(assert (=> d!42662 (= (reader!0 thiss!1634 (_2!6085 lt!205532)) lt!206514)))

(declare-fun lt!206508 () (_ BitVec 64))

(declare-fun lt!206515 () (_ BitVec 64))

(declare-fun b!133476 () Bool)

(assert (=> b!133476 (= e!88520 (= (_1!6084 lt!206514) (withMovedBitIndex!0 (_2!6084 lt!206514) (bvsub lt!206515 lt!206508))))))

(assert (=> b!133476 (or (= (bvand lt!206515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206508 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206515 lt!206508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133476 (= lt!206508 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205532))) (currentByte!5930 (_2!6085 lt!205532)) (currentBit!5925 (_2!6085 lt!205532))))))

(assert (=> b!133476 (= lt!206515 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)))))

(declare-fun b!133477 () Bool)

(declare-fun res!110882 () Bool)

(assert (=> b!133477 (=> (not res!110882) (not e!88520))))

(assert (=> b!133477 (= res!110882 (isPrefixOf!0 (_1!6084 lt!206514) thiss!1634))))

(declare-fun b!133478 () Bool)

(declare-fun Unit!8246 () Unit!8176)

(assert (=> b!133478 (= e!88521 Unit!8246)))

(declare-fun b!133479 () Bool)

(declare-fun res!110880 () Bool)

(assert (=> b!133479 (=> (not res!110880) (not e!88520))))

(assert (=> b!133479 (= res!110880 (isPrefixOf!0 (_2!6084 lt!206514) (_2!6085 lt!205532)))))

(assert (= (and d!42662 c!7624) b!133475))

(assert (= (and d!42662 (not c!7624)) b!133478))

(assert (= (and d!42662 res!110881) b!133477))

(assert (= (and b!133477 res!110882) b!133479))

(assert (= (and b!133479 res!110880) b!133476))

(declare-fun m!202305 () Bool)

(assert (=> b!133477 m!202305))

(declare-fun m!202307 () Bool)

(assert (=> b!133476 m!202307))

(assert (=> b!133476 m!201227))

(assert (=> b!133476 m!200969))

(assert (=> b!133475 m!200969))

(declare-fun m!202309 () Bool)

(assert (=> b!133475 m!202309))

(declare-fun m!202311 () Bool)

(assert (=> b!133475 m!202311))

(declare-fun m!202313 () Bool)

(assert (=> d!42662 m!202313))

(declare-fun m!202315 () Bool)

(assert (=> d!42662 m!202315))

(declare-fun m!202317 () Bool)

(assert (=> d!42662 m!202317))

(declare-fun m!202319 () Bool)

(assert (=> d!42662 m!202319))

(declare-fun m!202321 () Bool)

(assert (=> d!42662 m!202321))

(assert (=> d!42662 m!201109))

(declare-fun m!202323 () Bool)

(assert (=> d!42662 m!202323))

(assert (=> d!42662 m!201113))

(assert (=> d!42662 m!201229))

(declare-fun m!202325 () Bool)

(assert (=> d!42662 m!202325))

(declare-fun m!202327 () Bool)

(assert (=> d!42662 m!202327))

(declare-fun m!202329 () Bool)

(assert (=> b!133479 m!202329))

(assert (=> b!132993 d!42662))

(declare-fun d!42664 () Bool)

(declare-fun res!110883 () Bool)

(declare-fun e!88522 () Bool)

(assert (=> d!42664 (=> res!110883 e!88522)))

(assert (=> d!42664 (= res!110883 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42664 (= (arrayRangesEq!175 arr!237 (_2!6082 lt!205569) #b00000000000000000000000000000000 to!404) e!88522)))

(declare-fun b!133480 () Bool)

(declare-fun e!88523 () Bool)

(assert (=> b!133480 (= e!88522 e!88523)))

(declare-fun res!110884 () Bool)

(assert (=> b!133480 (=> (not res!110884) (not e!88523))))

(assert (=> b!133480 (= res!110884 (= (select (arr!3407 arr!237) #b00000000000000000000000000000000) (select (arr!3407 (_2!6082 lt!205569)) #b00000000000000000000000000000000)))))

(declare-fun b!133481 () Bool)

(assert (=> b!133481 (= e!88523 (arrayRangesEq!175 arr!237 (_2!6082 lt!205569) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42664 (not res!110883)) b!133480))

(assert (= (and b!133480 res!110884) b!133481))

(assert (=> b!133480 m!201341))

(declare-fun m!202331 () Bool)

(assert (=> b!133480 m!202331))

(declare-fun m!202333 () Bool)

(assert (=> b!133481 m!202333))

(assert (=> b!133025 d!42664))

(declare-fun d!42666 () Bool)

(assert (=> d!42666 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 thiss!1634)))))))

(assert (=> d!42331 d!42666))

(declare-fun d!42668 () Bool)

(declare-fun res!110885 () Bool)

(declare-fun e!88524 () Bool)

(assert (=> d!42668 (=> res!110885 e!88524)))

(assert (=> d!42668 (= res!110885 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42668 (= (arrayRangesEq!175 (_2!6082 lt!205586) (_2!6082 lt!205588) #b00000000000000000000000000000000 to!404) e!88524)))

(declare-fun b!133482 () Bool)

(declare-fun e!88525 () Bool)

(assert (=> b!133482 (= e!88524 e!88525)))

(declare-fun res!110886 () Bool)

(assert (=> b!133482 (=> (not res!110886) (not e!88525))))

(assert (=> b!133482 (= res!110886 (= (select (arr!3407 (_2!6082 lt!205586)) #b00000000000000000000000000000000) (select (arr!3407 (_2!6082 lt!205588)) #b00000000000000000000000000000000)))))

(declare-fun b!133483 () Bool)

(assert (=> b!133483 (= e!88525 (arrayRangesEq!175 (_2!6082 lt!205586) (_2!6082 lt!205588) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42668 (not res!110885)) b!133482))

(assert (= (and b!133482 res!110886) b!133483))

(declare-fun m!202335 () Bool)

(assert (=> b!133482 m!202335))

(declare-fun m!202337 () Bool)

(assert (=> b!133482 m!202337))

(declare-fun m!202339 () Bool)

(assert (=> b!133483 m!202339))

(assert (=> d!42291 d!42668))

(assert (=> d!42291 d!42237))

(assert (=> d!42291 d!42253))

(declare-fun d!42670 () Bool)

(assert (=> d!42670 (arrayRangesEq!175 (_2!6082 (readByteArrayLoopPure!0 (_1!6084 lt!205162) arr!237 from!447 to!404)) (_2!6082 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6084 lt!205162) #b00000000000000000000000000000001) (array!6123 (store (arr!3407 arr!237) from!447 (_2!6083 (readBytePure!0 (_1!6084 lt!205162)))) (size!2772 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!42670 true))

(declare-fun _$13!37 () Unit!8176)

(assert (=> d!42670 (= (choose!35 (_1!6084 lt!205162) arr!237 from!447 to!404 lt!205586 (_2!6082 lt!205586) lt!205587 lt!205588 (_2!6082 lt!205588)) _$13!37)))

(declare-fun bs!10414 () Bool)

(assert (= bs!10414 d!42670))

(assert (=> bs!10414 m!200885))

(assert (=> bs!10414 m!201277))

(assert (=> bs!10414 m!200887))

(declare-fun m!202341 () Bool)

(assert (=> bs!10414 m!202341))

(assert (=> bs!10414 m!200911))

(assert (=> bs!10414 m!200885))

(declare-fun m!202343 () Bool)

(assert (=> bs!10414 m!202343))

(assert (=> d!42291 d!42670))

(declare-fun d!42672 () Bool)

(declare-fun lt!206522 () tuple3!504)

(assert (=> d!42672 (= lt!206522 (readByteArrayLoop!0 lt!205587 (array!6123 (store (arr!3407 arr!237) from!447 (_2!6083 (readBytePure!0 (_1!6084 lt!205162)))) (size!2772 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42672 (= (readByteArrayLoopPure!0 lt!205587 (array!6123 (store (arr!3407 arr!237) from!447 (_2!6083 (readBytePure!0 (_1!6084 lt!205162)))) (size!2772 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!11553 (_2!6088 lt!206522) (_3!307 lt!206522)))))

(declare-fun bs!10415 () Bool)

(assert (= bs!10415 d!42672))

(declare-fun m!202345 () Bool)

(assert (=> bs!10415 m!202345))

(assert (=> d!42291 d!42672))

(assert (=> d!42291 d!42297))

(assert (=> d!42327 d!42211))

(declare-fun d!42674 () Bool)

(declare-fun res!110888 () Bool)

(declare-fun e!88527 () Bool)

(assert (=> d!42674 (=> (not res!110888) (not e!88527))))

(assert (=> d!42674 (= res!110888 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 lt!205570)))))))

(assert (=> d!42674 (= (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205570)) e!88527)))

(declare-fun b!133484 () Bool)

(declare-fun res!110887 () Bool)

(assert (=> b!133484 (=> (not res!110887) (not e!88527))))

(assert (=> b!133484 (= res!110887 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205570))) (currentByte!5930 (_2!6085 lt!205570)) (currentBit!5925 (_2!6085 lt!205570)))))))

(declare-fun b!133485 () Bool)

(declare-fun e!88526 () Bool)

(assert (=> b!133485 (= e!88527 e!88526)))

(declare-fun res!110889 () Bool)

(assert (=> b!133485 (=> res!110889 e!88526)))

(assert (=> b!133485 (= res!110889 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) #b00000000000000000000000000000000))))

(declare-fun b!133486 () Bool)

(assert (=> b!133486 (= e!88526 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205570)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (= (and d!42674 res!110888) b!133484))

(assert (= (and b!133484 res!110887) b!133485))

(assert (= (and b!133485 (not res!110889)) b!133486))

(assert (=> b!133484 m!200955))

(assert (=> b!133484 m!201263))

(assert (=> b!133486 m!200955))

(assert (=> b!133486 m!200955))

(declare-fun m!202347 () Bool)

(assert (=> b!133486 m!202347))

(assert (=> b!133023 d!42674))

(declare-fun d!42676 () Bool)

(declare-fun res!110891 () Bool)

(declare-fun e!88529 () Bool)

(assert (=> d!42676 (=> (not res!110891) (not e!88529))))

(assert (=> d!42676 (= res!110891 (= (size!2772 (buf!3145 (_2!6084 lt!205393))) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42676 (= (isPrefixOf!0 (_2!6084 lt!205393) (_2!6085 lt!205157)) e!88529)))

(declare-fun b!133487 () Bool)

(declare-fun res!110890 () Bool)

(assert (=> b!133487 (=> (not res!110890) (not e!88529))))

(assert (=> b!133487 (= res!110890 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205393))) (currentByte!5930 (_2!6084 lt!205393)) (currentBit!5925 (_2!6084 lt!205393))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133488 () Bool)

(declare-fun e!88528 () Bool)

(assert (=> b!133488 (= e!88529 e!88528)))

(declare-fun res!110892 () Bool)

(assert (=> b!133488 (=> res!110892 e!88528)))

(assert (=> b!133488 (= res!110892 (= (size!2772 (buf!3145 (_2!6084 lt!205393))) #b00000000000000000000000000000000))))

(declare-fun b!133489 () Bool)

(assert (=> b!133489 (= e!88528 (arrayBitRangesEq!0 (buf!3145 (_2!6084 lt!205393)) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205393))) (currentByte!5930 (_2!6084 lt!205393)) (currentBit!5925 (_2!6084 lt!205393)))))))

(assert (= (and d!42676 res!110891) b!133487))

(assert (= (and b!133487 res!110890) b!133488))

(assert (= (and b!133488 (not res!110892)) b!133489))

(assert (=> b!133487 m!202261))

(assert (=> b!133487 m!200953))

(assert (=> b!133489 m!202261))

(assert (=> b!133489 m!202261))

(declare-fun m!202349 () Bool)

(assert (=> b!133489 m!202349))

(assert (=> b!132956 d!42676))

(declare-fun d!42678 () Bool)

(declare-fun lt!206526 () (_ BitVec 8))

(declare-fun lt!206527 () (_ BitVec 8))

(assert (=> d!42678 (= lt!206526 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 lt!205171)) (currentByte!5930 lt!205171))) ((_ sign_extend 24) lt!206527))))))

(assert (=> d!42678 (= lt!206527 ((_ extract 7 0) (currentBit!5925 lt!205171)))))

(declare-fun e!88530 () Bool)

(assert (=> d!42678 e!88530))

(declare-fun res!110893 () Bool)

(assert (=> d!42678 (=> (not res!110893) (not e!88530))))

(assert (=> d!42678 (= res!110893 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 lt!205171))) ((_ sign_extend 32) (currentByte!5930 lt!205171)) ((_ sign_extend 32) (currentBit!5925 lt!205171)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8247 () Unit!8176)

(declare-fun Unit!8248 () Unit!8176)

(assert (=> d!42678 (= (readByte!0 lt!205171) (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206527) #b00000000000000000000000000000000) (tuple2!11569 Unit!8247 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206526) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 lt!205171)) (bvadd (currentByte!5930 lt!205171) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206527)))))))) (tuple2!11569 Unit!8248 lt!206526))) (BitStream!4809 (buf!3145 lt!205171) (bvadd (currentByte!5930 lt!205171) #b00000000000000000000000000000001) (currentBit!5925 lt!205171))))))

(declare-fun b!133490 () Bool)

(declare-fun e!88531 () Bool)

(assert (=> b!133490 (= e!88530 e!88531)))

(declare-fun res!110894 () Bool)

(assert (=> b!133490 (=> (not res!110894) (not e!88531))))

(declare-fun lt!206528 () tuple2!11562)

(assert (=> b!133490 (= res!110894 (= (buf!3145 (_2!6089 lt!206528)) (buf!3145 lt!205171)))))

(declare-fun lt!206525 () (_ BitVec 8))

(declare-fun lt!206523 () (_ BitVec 8))

(declare-fun Unit!8249 () Unit!8176)

(declare-fun Unit!8250 () Unit!8176)

(assert (=> b!133490 (= lt!206528 (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206523) #b00000000000000000000000000000000) (tuple2!11569 Unit!8249 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206525) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 lt!205171)) (bvadd (currentByte!5930 lt!205171) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206523)))))))) (tuple2!11569 Unit!8250 lt!206525))) (BitStream!4809 (buf!3145 lt!205171) (bvadd (currentByte!5930 lt!205171) #b00000000000000000000000000000001) (currentBit!5925 lt!205171))))))

(assert (=> b!133490 (= lt!206525 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 lt!205171)) (currentByte!5930 lt!205171))) ((_ sign_extend 24) lt!206523))))))

(assert (=> b!133490 (= lt!206523 ((_ extract 7 0) (currentBit!5925 lt!205171)))))

(declare-fun lt!206529 () (_ BitVec 64))

(declare-fun lt!206524 () (_ BitVec 64))

(declare-fun b!133491 () Bool)

(assert (=> b!133491 (= e!88531 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206528))) (currentByte!5930 (_2!6089 lt!206528)) (currentBit!5925 (_2!6089 lt!206528))) (bvadd lt!206524 lt!206529)))))

(assert (=> b!133491 (or (not (= (bvand lt!206524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206529 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206524 lt!206529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133491 (= lt!206529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133491 (= lt!206524 (bitIndex!0 (size!2772 (buf!3145 lt!205171)) (currentByte!5930 lt!205171) (currentBit!5925 lt!205171)))))

(assert (= (and d!42678 res!110893) b!133490))

(assert (= (and b!133490 res!110894) b!133491))

(declare-fun m!202351 () Bool)

(assert (=> d!42678 m!202351))

(declare-fun m!202353 () Bool)

(assert (=> d!42678 m!202353))

(declare-fun m!202355 () Bool)

(assert (=> d!42678 m!202355))

(assert (=> b!133490 m!202355))

(assert (=> b!133490 m!202351))

(declare-fun m!202357 () Bool)

(assert (=> b!133491 m!202357))

(declare-fun m!202359 () Bool)

(assert (=> b!133491 m!202359))

(assert (=> d!42299 d!42678))

(declare-fun d!42680 () Bool)

(assert (=> d!42680 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205158)))) ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205158))) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205158)))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205158)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205158))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205158))))))))

(assert (=> d!42257 d!42680))

(declare-fun d!42682 () Bool)

(assert (=> d!42682 (= (invariant!0 (currentBit!5925 (_1!6083 lt!205158)) (currentByte!5930 (_1!6083 lt!205158)) (size!2772 (buf!3145 (_1!6083 lt!205158)))) (and (bvsge (currentBit!5925 (_1!6083 lt!205158)) #b00000000000000000000000000000000) (bvslt (currentBit!5925 (_1!6083 lt!205158)) #b00000000000000000000000000001000) (bvsge (currentByte!5930 (_1!6083 lt!205158)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5930 (_1!6083 lt!205158)) (size!2772 (buf!3145 (_1!6083 lt!205158)))) (and (= (currentBit!5925 (_1!6083 lt!205158)) #b00000000000000000000000000000000) (= (currentByte!5930 (_1!6083 lt!205158)) (size!2772 (buf!3145 (_1!6083 lt!205158))))))))))

(assert (=> d!42257 d!42682))

(declare-fun d!42684 () Bool)

(assert (=> d!42684 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) (bvsub (bvsub to!404 from!447) lt!205315)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!205315)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10416 () Bool)

(assert (= bs!10416 d!42684))

(assert (=> bs!10416 m!201165))

(assert (=> b!132927 d!42684))

(assert (=> d!42267 d!42279))

(declare-fun d!42686 () Bool)

(assert (=> d!42686 (isPrefixOf!0 thiss!1634 (_2!6085 lt!205157))))

(assert (=> d!42686 true))

(declare-fun _$15!204 () Unit!8176)

(assert (=> d!42686 (= (choose!30 thiss!1634 (_2!6085 lt!205156) (_2!6085 lt!205157)) _$15!204)))

(declare-fun bs!10417 () Bool)

(assert (= bs!10417 d!42686))

(assert (=> bs!10417 m!200909))

(assert (=> d!42267 d!42686))

(assert (=> d!42267 d!42303))

(declare-fun d!42688 () Bool)

(assert (=> d!42688 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205157))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205157)))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205157))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205157))))))))

(assert (=> d!42329 d!42688))

(declare-fun d!42690 () Bool)

(assert (=> d!42690 (= (invariant!0 (currentBit!5925 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205157)) (size!2772 (buf!3145 (_2!6085 lt!205157)))) (and (bvsge (currentBit!5925 (_2!6085 lt!205157)) #b00000000000000000000000000000000) (bvslt (currentBit!5925 (_2!6085 lt!205157)) #b00000000000000000000000000001000) (bvsge (currentByte!5930 (_2!6085 lt!205157)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5930 (_2!6085 lt!205157)) (size!2772 (buf!3145 (_2!6085 lt!205157)))) (and (= (currentBit!5925 (_2!6085 lt!205157)) #b00000000000000000000000000000000) (= (currentByte!5930 (_2!6085 lt!205157)) (size!2772 (buf!3145 (_2!6085 lt!205157))))))))))

(assert (=> d!42329 d!42690))

(assert (=> d!42323 d!42321))

(declare-fun d!42692 () Bool)

(assert (=> d!42692 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205160)))

(assert (=> d!42692 true))

(declare-fun _$6!277 () Unit!8176)

(assert (=> d!42692 (= (choose!9 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205160 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))) _$6!277)))

(declare-fun bs!10418 () Bool)

(assert (= bs!10418 d!42692))

(assert (=> bs!10418 m!200949))

(assert (=> d!42323 d!42692))

(declare-fun d!42694 () Bool)

(declare-fun lt!206533 () (_ BitVec 8))

(declare-fun lt!206534 () (_ BitVec 8))

(assert (=> d!42694 (= lt!206533 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205162))) (currentByte!5930 (_1!6084 lt!205162)))) ((_ sign_extend 24) lt!206534))))))

(assert (=> d!42694 (= lt!206534 ((_ extract 7 0) (currentBit!5925 (_1!6084 lt!205162))))))

(declare-fun e!88532 () Bool)

(assert (=> d!42694 e!88532))

(declare-fun res!110895 () Bool)

(assert (=> d!42694 (=> (not res!110895) (not e!88532))))

(assert (=> d!42694 (= res!110895 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6084 lt!205162)))) ((_ sign_extend 32) (currentByte!5930 (_1!6084 lt!205162))) ((_ sign_extend 32) (currentBit!5925 (_1!6084 lt!205162))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8251 () Unit!8176)

(declare-fun Unit!8252 () Unit!8176)

(assert (=> d!42694 (= (readByte!0 (_1!6084 lt!205162)) (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206534) #b00000000000000000000000000000000) (tuple2!11569 Unit!8251 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206533) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205162))) (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206534)))))))) (tuple2!11569 Unit!8252 lt!206533))) (BitStream!4809 (buf!3145 (_1!6084 lt!205162)) (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001) (currentBit!5925 (_1!6084 lt!205162)))))))

(declare-fun b!133492 () Bool)

(declare-fun e!88533 () Bool)

(assert (=> b!133492 (= e!88532 e!88533)))

(declare-fun res!110896 () Bool)

(assert (=> b!133492 (=> (not res!110896) (not e!88533))))

(declare-fun lt!206535 () tuple2!11562)

(assert (=> b!133492 (= res!110896 (= (buf!3145 (_2!6089 lt!206535)) (buf!3145 (_1!6084 lt!205162))))))

(declare-fun lt!206530 () (_ BitVec 8))

(declare-fun lt!206532 () (_ BitVec 8))

(declare-fun Unit!8253 () Unit!8176)

(declare-fun Unit!8254 () Unit!8176)

(assert (=> b!133492 (= lt!206535 (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206530) #b00000000000000000000000000000000) (tuple2!11569 Unit!8253 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206532) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205162))) (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206530)))))))) (tuple2!11569 Unit!8254 lt!206532))) (BitStream!4809 (buf!3145 (_1!6084 lt!205162)) (bvadd (currentByte!5930 (_1!6084 lt!205162)) #b00000000000000000000000000000001) (currentBit!5925 (_1!6084 lt!205162)))))))

(assert (=> b!133492 (= lt!206532 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205162))) (currentByte!5930 (_1!6084 lt!205162)))) ((_ sign_extend 24) lt!206530))))))

(assert (=> b!133492 (= lt!206530 ((_ extract 7 0) (currentBit!5925 (_1!6084 lt!205162))))))

(declare-fun lt!206536 () (_ BitVec 64))

(declare-fun b!133493 () Bool)

(declare-fun lt!206531 () (_ BitVec 64))

(assert (=> b!133493 (= e!88533 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206535))) (currentByte!5930 (_2!6089 lt!206535)) (currentBit!5925 (_2!6089 lt!206535))) (bvadd lt!206531 lt!206536)))))

(assert (=> b!133493 (or (not (= (bvand lt!206531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206536 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206531 lt!206536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133493 (= lt!206536 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133493 (= lt!206531 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205162))) (currentByte!5930 (_1!6084 lt!205162)) (currentBit!5925 (_1!6084 lt!205162))))))

(assert (= (and d!42694 res!110895) b!133492))

(assert (= (and b!133492 res!110896) b!133493))

(declare-fun m!202361 () Bool)

(assert (=> d!42694 m!202361))

(declare-fun m!202363 () Bool)

(assert (=> d!42694 m!202363))

(declare-fun m!202365 () Bool)

(assert (=> d!42694 m!202365))

(assert (=> b!133492 m!202365))

(assert (=> b!133492 m!202361))

(declare-fun m!202367 () Bool)

(assert (=> b!133493 m!202367))

(declare-fun m!202369 () Bool)

(assert (=> b!133493 m!202369))

(assert (=> d!42237 d!42694))

(assert (=> d!42263 d!42295))

(declare-fun d!42696 () Bool)

(assert (=> d!42696 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205163)))

(assert (=> d!42696 true))

(declare-fun _$5!32 () Unit!8176)

(assert (=> d!42696 (= (choose!26 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205157)) lt!205163 (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))) _$5!32)))

(declare-fun bs!10419 () Bool)

(assert (= bs!10419 d!42696))

(assert (=> bs!10419 m!200905))

(assert (=> d!42263 d!42696))

(declare-fun d!42698 () Bool)

(assert (=> d!42698 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))))))))

(assert (=> d!42295 d!42698))

(declare-fun d!42700 () Bool)

(declare-fun res!110898 () Bool)

(declare-fun e!88535 () Bool)

(assert (=> d!42700 (=> (not res!110898) (not e!88535))))

(assert (=> d!42700 (= res!110898 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 (_2!6085 lt!205532)))))))

(assert (=> d!42700 (= (isPrefixOf!0 thiss!1634 (_2!6085 lt!205532)) e!88535)))

(declare-fun b!133494 () Bool)

(declare-fun res!110897 () Bool)

(assert (=> b!133494 (=> (not res!110897) (not e!88535))))

(assert (=> b!133494 (= res!110897 (bvsle (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205532))) (currentByte!5930 (_2!6085 lt!205532)) (currentBit!5925 (_2!6085 lt!205532)))))))

(declare-fun b!133495 () Bool)

(declare-fun e!88534 () Bool)

(assert (=> b!133495 (= e!88535 e!88534)))

(declare-fun res!110899 () Bool)

(assert (=> b!133495 (=> res!110899 e!88534)))

(assert (=> b!133495 (= res!110899 (= (size!2772 (buf!3145 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133496 () Bool)

(assert (=> b!133496 (= e!88534 (arrayBitRangesEq!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205532)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (= (and d!42700 res!110898) b!133494))

(assert (= (and b!133494 res!110897) b!133495))

(assert (= (and b!133495 (not res!110899)) b!133496))

(assert (=> b!133494 m!200969))

(assert (=> b!133494 m!201227))

(assert (=> b!133496 m!200969))

(assert (=> b!133496 m!200969))

(declare-fun m!202371 () Bool)

(assert (=> b!133496 m!202371))

(assert (=> b!132992 d!42700))

(declare-fun b!133506 () Bool)

(declare-fun res!110907 () Bool)

(declare-fun e!88542 () Bool)

(assert (=> b!133506 (=> (not res!110907) (not e!88542))))

(declare-fun _$37!14 () tuple2!11558)

(assert (=> b!133506 (= res!110907 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 _$37!14))) (currentByte!5930 (_2!6085 _$37!14)) (currentBit!5925 (_2!6085 _$37!14))) (bvadd (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!133507 () Bool)

(declare-fun res!110908 () Bool)

(assert (=> b!133507 (=> (not res!110908) (not e!88542))))

(assert (=> b!133507 (= res!110908 (isPrefixOf!0 thiss!1634 (_2!6085 _$37!14)))))

(declare-fun lt!206542 () tuple2!11556)

(declare-fun lt!206541 () tuple2!11554)

(declare-fun b!133508 () Bool)

(assert (=> b!133508 (= e!88542 (and (= (_2!6083 lt!206541) (select (arr!3407 arr!237) from!447)) (= (_1!6083 lt!206541) (_2!6084 lt!206542))))))

(assert (=> b!133508 (= lt!206541 (readBytePure!0 (_1!6084 lt!206542)))))

(assert (=> b!133508 (= lt!206542 (reader!0 thiss!1634 (_2!6085 _$37!14)))))

(declare-fun d!42702 () Bool)

(assert (=> d!42702 e!88542))

(declare-fun res!110906 () Bool)

(assert (=> d!42702 (=> (not res!110906) (not e!88542))))

(assert (=> d!42702 (= res!110906 (= (size!2772 (buf!3145 thiss!1634)) (size!2772 (buf!3145 (_2!6085 _$37!14)))))))

(declare-fun e!88544 () Bool)

(assert (=> d!42702 (and (inv!12 (_2!6085 _$37!14)) e!88544)))

(assert (=> d!42702 (= (choose!6 thiss!1634 (select (arr!3407 arr!237) from!447)) _$37!14)))

(declare-fun b!133505 () Bool)

(assert (=> b!133505 (= e!88544 (array_inv!2561 (buf!3145 (_2!6085 _$37!14))))))

(assert (= d!42702 b!133505))

(assert (= (and d!42702 res!110906) b!133506))

(assert (= (and b!133506 res!110907) b!133507))

(assert (= (and b!133507 res!110908) b!133508))

(declare-fun m!202373 () Bool)

(assert (=> b!133505 m!202373))

(declare-fun m!202375 () Bool)

(assert (=> d!42702 m!202375))

(declare-fun m!202377 () Bool)

(assert (=> b!133508 m!202377))

(declare-fun m!202379 () Bool)

(assert (=> b!133508 m!202379))

(declare-fun m!202381 () Bool)

(assert (=> b!133506 m!202381))

(assert (=> b!133506 m!200969))

(declare-fun m!202383 () Bool)

(assert (=> b!133507 m!202383))

(assert (=> d!42269 d!42702))

(declare-fun d!42704 () Bool)

(assert (=> d!42704 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 thiss!1634))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10420 () Bool)

(assert (= bs!10420 d!42704))

(assert (=> bs!10420 m!201349))

(assert (=> d!42269 d!42704))

(declare-fun bm!1701 () Bool)

(declare-fun call!1704 () (_ BitVec 64))

(assert (=> bm!1701 (= call!1704 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205168))) (currentByte!5930 (_1!6084 lt!205168)) (currentBit!5925 (_1!6084 lt!205168))))))

(declare-fun b!133509 () Bool)

(declare-fun e!88547 () tuple3!504)

(declare-fun lt!206566 () Unit!8176)

(assert (=> b!133509 (= e!88547 (tuple3!505 lt!206566 (_1!6084 lt!205168) lt!205172))))

(assert (=> b!133509 (= call!1704 call!1704)))

(declare-fun lt!206546 () Unit!8176)

(declare-fun Unit!8255 () Unit!8176)

(assert (=> b!133509 (= lt!206546 Unit!8255)))

(declare-fun lt!206575 () Unit!8176)

(assert (=> b!133509 (= lt!206575 (arrayRangesEqReflexiveLemma!2 lt!205172))))

(declare-fun call!1705 () Bool)

(assert (=> b!133509 call!1705))

(declare-fun lt!206567 () Unit!8176)

(assert (=> b!133509 (= lt!206567 lt!206575)))

(declare-fun lt!206545 () array!6122)

(assert (=> b!133509 (= lt!206545 lt!205172)))

(declare-fun lt!206560 () array!6122)

(assert (=> b!133509 (= lt!206560 lt!205172)))

(declare-fun lt!206558 () (_ BitVec 32))

(assert (=> b!133509 (= lt!206558 #b00000000000000000000000000000000)))

(declare-fun lt!206547 () (_ BitVec 32))

(assert (=> b!133509 (= lt!206547 (size!2772 lt!205172))))

(declare-fun lt!206544 () (_ BitVec 32))

(assert (=> b!133509 (= lt!206544 #b00000000000000000000000000000000)))

(declare-fun lt!206563 () (_ BitVec 32))

(assert (=> b!133509 (= lt!206563 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!133509 (= lt!206566 (arrayRangesEqSlicedLemma!2 lt!206545 lt!206560 lt!206558 lt!206547 lt!206544 lt!206563))))

(declare-fun call!1706 () Bool)

(assert (=> b!133509 call!1706))

(declare-fun d!42706 () Bool)

(declare-fun e!88546 () Bool)

(assert (=> d!42706 e!88546))

(declare-fun res!110911 () Bool)

(assert (=> d!42706 (=> res!110911 e!88546)))

(assert (=> d!42706 (= res!110911 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206570 () Bool)

(declare-fun e!88545 () Bool)

(assert (=> d!42706 (= lt!206570 e!88545)))

(declare-fun res!110910 () Bool)

(assert (=> d!42706 (=> (not res!110910) (not e!88545))))

(declare-fun lt!206576 () (_ BitVec 64))

(declare-fun lt!206577 () (_ BitVec 64))

(declare-fun lt!206561 () tuple3!504)

(assert (=> d!42706 (= res!110910 (= (bvadd lt!206576 lt!206577) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206561))) (currentByte!5930 (_2!6088 lt!206561)) (currentBit!5925 (_2!6088 lt!206561)))))))

(assert (=> d!42706 (or (not (= (bvand lt!206576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206577 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206576 lt!206577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206552 () (_ BitVec 64))

(assert (=> d!42706 (= lt!206577 (bvmul lt!206552 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42706 (or (= lt!206552 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206552 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206552)))))

(assert (=> d!42706 (= lt!206552 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!42706 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!42706 (= lt!206576 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205168))) (currentByte!5930 (_1!6084 lt!205168)) (currentBit!5925 (_1!6084 lt!205168))))))

(assert (=> d!42706 (= lt!206561 e!88547)))

(declare-fun c!7625 () Bool)

(assert (=> d!42706 (= c!7625 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42706 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2772 lt!205172)))))

(assert (=> d!42706 (= (readByteArrayLoop!0 (_1!6084 lt!205168) lt!205172 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!206561)))

(declare-fun b!133510 () Bool)

(declare-fun lt!206551 () Unit!8176)

(declare-fun lt!206565 () tuple3!504)

(assert (=> b!133510 (= e!88547 (tuple3!505 lt!206551 (_2!6088 lt!206565) (_3!307 lt!206565)))))

(declare-fun lt!206569 () tuple2!11562)

(assert (=> b!133510 (= lt!206569 (readByte!0 (_1!6084 lt!205168)))))

(declare-fun lt!206548 () array!6122)

(assert (=> b!133510 (= lt!206548 (array!6123 (store (arr!3407 lt!205172) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206569)) (size!2772 lt!205172)))))

(declare-fun lt!206543 () (_ BitVec 64))

(assert (=> b!133510 (= lt!206543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206553 () (_ BitVec 32))

(assert (=> b!133510 (= lt!206553 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206557 () Unit!8176)

(assert (=> b!133510 (= lt!206557 (validateOffsetBytesFromBitIndexLemma!0 (_1!6084 lt!205168) (_2!6089 lt!206569) lt!206543 lt!206553))))

(assert (=> b!133510 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6089 lt!206569)))) ((_ sign_extend 32) (currentByte!5930 (_2!6089 lt!206569))) ((_ sign_extend 32) (currentBit!5925 (_2!6089 lt!206569))) (bvsub lt!206553 ((_ extract 31 0) (bvsdiv (bvadd lt!206543 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206571 () Unit!8176)

(assert (=> b!133510 (= lt!206571 lt!206557)))

(assert (=> b!133510 (= lt!206565 (readByteArrayLoop!0 (_2!6089 lt!206569) lt!206548 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133510 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206569))) (currentByte!5930 (_2!6089 lt!206569)) (currentBit!5925 (_2!6089 lt!206569))) (bvadd call!1704 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206550 () Unit!8176)

(declare-fun Unit!8256 () Unit!8176)

(assert (=> b!133510 (= lt!206550 Unit!8256)))

(assert (=> b!133510 (= (bvadd (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206569))) (currentByte!5930 (_2!6089 lt!206569)) (currentBit!5925 (_2!6089 lt!206569))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206565))) (currentByte!5930 (_2!6088 lt!206565)) (currentBit!5925 (_2!6088 lt!206565))))))

(declare-fun lt!206564 () Unit!8176)

(declare-fun Unit!8257 () Unit!8176)

(assert (=> b!133510 (= lt!206564 Unit!8257)))

(assert (=> b!133510 (= (bvadd call!1704 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206565))) (currentByte!5930 (_2!6088 lt!206565)) (currentBit!5925 (_2!6088 lt!206565))))))

(declare-fun lt!206556 () Unit!8176)

(declare-fun Unit!8258 () Unit!8176)

(assert (=> b!133510 (= lt!206556 Unit!8258)))

(assert (=> b!133510 (and (= (buf!3145 (_1!6084 lt!205168)) (buf!3145 (_2!6088 lt!206565))) (= (size!2772 lt!205172) (size!2772 (_3!307 lt!206565))))))

(declare-fun lt!206559 () Unit!8176)

(declare-fun Unit!8259 () Unit!8176)

(assert (=> b!133510 (= lt!206559 Unit!8259)))

(declare-fun lt!206554 () Unit!8176)

(assert (=> b!133510 (= lt!206554 (arrayUpdatedAtPrefixLemma!2 lt!205172 (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206569)))))

(assert (=> b!133510 call!1706))

(declare-fun lt!206549 () Unit!8176)

(assert (=> b!133510 (= lt!206549 lt!206554)))

(declare-fun lt!206573 () (_ BitVec 32))

(assert (=> b!133510 (= lt!206573 #b00000000000000000000000000000000)))

(declare-fun lt!206578 () Unit!8176)

(assert (=> b!133510 (= lt!206578 (arrayRangesEqTransitive!2 lt!205172 lt!206548 (_3!307 lt!206565) lt!206573 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133510 call!1705))

(declare-fun lt!206574 () Unit!8176)

(assert (=> b!133510 (= lt!206574 lt!206578)))

(assert (=> b!133510 (arrayRangesEq!175 lt!205172 (_3!307 lt!206565) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!206568 () Unit!8176)

(declare-fun Unit!8260 () Unit!8176)

(assert (=> b!133510 (= lt!206568 Unit!8260)))

(declare-fun lt!206555 () Unit!8176)

(assert (=> b!133510 (= lt!206555 (arrayRangesEqImpliesEq!2 lt!206548 (_3!307 lt!206565) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133510 (= (select (store (arr!3407 lt!205172) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206569)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3407 (_3!307 lt!206565)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206562 () Unit!8176)

(assert (=> b!133510 (= lt!206562 lt!206555)))

(declare-fun lt!206572 () Bool)

(assert (=> b!133510 (= lt!206572 (= (select (arr!3407 (_3!307 lt!206565)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6089 lt!206569)))))

(declare-fun Unit!8261 () Unit!8176)

(assert (=> b!133510 (= lt!206551 Unit!8261)))

(assert (=> b!133510 lt!206572))

(declare-fun bm!1702 () Bool)

(assert (=> bm!1702 (= call!1705 (arrayRangesEq!175 lt!205172 (ite c!7625 (_3!307 lt!206565) lt!205172) (ite c!7625 lt!206573 #b00000000000000000000000000000000) (ite c!7625 (bvadd #b00000000000000000000000000000001 from!447) (size!2772 lt!205172))))))

(declare-fun b!133511 () Bool)

(assert (=> b!133511 (= e!88546 (= (select (arr!3407 (_3!307 lt!206561)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6083 (readBytePure!0 (_1!6084 lt!205168)))))))

(assert (=> b!133511 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2772 (_3!307 lt!206561))))))

(declare-fun bm!1703 () Bool)

(assert (=> bm!1703 (= call!1706 (arrayRangesEq!175 (ite c!7625 lt!205172 lt!206545) (ite c!7625 (array!6123 (store (arr!3407 lt!205172) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206569)) (size!2772 lt!205172)) lt!206560) (ite c!7625 #b00000000000000000000000000000000 lt!206544) (ite c!7625 (bvadd #b00000000000000000000000000000001 from!447) lt!206563)))))

(declare-fun b!133512 () Bool)

(declare-fun res!110909 () Bool)

(assert (=> b!133512 (=> (not res!110909) (not e!88545))))

(assert (=> b!133512 (= res!110909 (and (= (buf!3145 (_1!6084 lt!205168)) (buf!3145 (_2!6088 lt!206561))) (= (size!2772 lt!205172) (size!2772 (_3!307 lt!206561)))))))

(declare-fun b!133513 () Bool)

(assert (=> b!133513 (= e!88545 (arrayRangesEq!175 lt!205172 (_3!307 lt!206561) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (= (and d!42706 c!7625) b!133510))

(assert (= (and d!42706 (not c!7625)) b!133509))

(assert (= (or b!133510 b!133509) bm!1703))

(assert (= (or b!133510 b!133509) bm!1702))

(assert (= (or b!133510 b!133509) bm!1701))

(assert (= (and d!42706 res!110910) b!133512))

(assert (= (and b!133512 res!110909) b!133513))

(assert (= (and d!42706 (not res!110911)) b!133511))

(declare-fun m!202385 () Bool)

(assert (=> bm!1702 m!202385))

(declare-fun m!202387 () Bool)

(assert (=> b!133510 m!202387))

(declare-fun m!202389 () Bool)

(assert (=> b!133510 m!202389))

(declare-fun m!202391 () Bool)

(assert (=> b!133510 m!202391))

(declare-fun m!202393 () Bool)

(assert (=> b!133510 m!202393))

(declare-fun m!202395 () Bool)

(assert (=> b!133510 m!202395))

(declare-fun m!202397 () Bool)

(assert (=> b!133510 m!202397))

(declare-fun m!202399 () Bool)

(assert (=> b!133510 m!202399))

(declare-fun m!202401 () Bool)

(assert (=> b!133510 m!202401))

(declare-fun m!202403 () Bool)

(assert (=> b!133510 m!202403))

(declare-fun m!202405 () Bool)

(assert (=> b!133510 m!202405))

(declare-fun m!202407 () Bool)

(assert (=> b!133510 m!202407))

(declare-fun m!202409 () Bool)

(assert (=> b!133510 m!202409))

(declare-fun m!202411 () Bool)

(assert (=> b!133510 m!202411))

(declare-fun m!202413 () Bool)

(assert (=> b!133511 m!202413))

(declare-fun m!202415 () Bool)

(assert (=> b!133511 m!202415))

(declare-fun m!202417 () Bool)

(assert (=> b!133513 m!202417))

(declare-fun m!202419 () Bool)

(assert (=> bm!1701 m!202419))

(assert (=> b!133509 m!202165))

(declare-fun m!202421 () Bool)

(assert (=> b!133509 m!202421))

(assert (=> bm!1703 m!202405))

(declare-fun m!202423 () Bool)

(assert (=> bm!1703 m!202423))

(declare-fun m!202425 () Bool)

(assert (=> d!42706 m!202425))

(assert (=> d!42706 m!202419))

(assert (=> d!42218 d!42706))

(declare-fun bm!1704 () Bool)

(declare-fun call!1707 () (_ BitVec 64))

(assert (=> bm!1704 (= call!1707 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205169))) (currentByte!5930 (_1!6084 lt!205169)) (currentBit!5925 (_1!6084 lt!205169))))))

(declare-fun b!133514 () Bool)

(declare-fun e!88550 () tuple3!504)

(declare-fun lt!206602 () Unit!8176)

(assert (=> b!133514 (= e!88550 (tuple3!505 lt!206602 (_1!6084 lt!205169) arr!237))))

(assert (=> b!133514 (= call!1707 call!1707)))

(declare-fun lt!206582 () Unit!8176)

(declare-fun Unit!8262 () Unit!8176)

(assert (=> b!133514 (= lt!206582 Unit!8262)))

(declare-fun lt!206611 () Unit!8176)

(assert (=> b!133514 (= lt!206611 (arrayRangesEqReflexiveLemma!2 arr!237))))

(declare-fun call!1708 () Bool)

(assert (=> b!133514 call!1708))

(declare-fun lt!206603 () Unit!8176)

(assert (=> b!133514 (= lt!206603 lt!206611)))

(declare-fun lt!206581 () array!6122)

(assert (=> b!133514 (= lt!206581 arr!237)))

(declare-fun lt!206596 () array!6122)

(assert (=> b!133514 (= lt!206596 arr!237)))

(declare-fun lt!206594 () (_ BitVec 32))

(assert (=> b!133514 (= lt!206594 #b00000000000000000000000000000000)))

(declare-fun lt!206583 () (_ BitVec 32))

(assert (=> b!133514 (= lt!206583 (size!2772 arr!237))))

(declare-fun lt!206580 () (_ BitVec 32))

(assert (=> b!133514 (= lt!206580 #b00000000000000000000000000000000)))

(declare-fun lt!206599 () (_ BitVec 32))

(assert (=> b!133514 (= lt!206599 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!133514 (= lt!206602 (arrayRangesEqSlicedLemma!2 lt!206581 lt!206596 lt!206594 lt!206583 lt!206580 lt!206599))))

(declare-fun call!1709 () Bool)

(assert (=> b!133514 call!1709))

(declare-fun d!42708 () Bool)

(declare-fun e!88549 () Bool)

(assert (=> d!42708 e!88549))

(declare-fun res!110914 () Bool)

(assert (=> d!42708 (=> res!110914 e!88549)))

(assert (=> d!42708 (= res!110914 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206606 () Bool)

(declare-fun e!88548 () Bool)

(assert (=> d!42708 (= lt!206606 e!88548)))

(declare-fun res!110913 () Bool)

(assert (=> d!42708 (=> (not res!110913) (not e!88548))))

(declare-fun lt!206612 () (_ BitVec 64))

(declare-fun lt!206597 () tuple3!504)

(declare-fun lt!206613 () (_ BitVec 64))

(assert (=> d!42708 (= res!110913 (= (bvadd lt!206612 lt!206613) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206597))) (currentByte!5930 (_2!6088 lt!206597)) (currentBit!5925 (_2!6088 lt!206597)))))))

(assert (=> d!42708 (or (not (= (bvand lt!206612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206613 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206612 lt!206613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206588 () (_ BitVec 64))

(assert (=> d!42708 (= lt!206613 (bvmul lt!206588 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42708 (or (= lt!206588 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206588 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206588)))))

(assert (=> d!42708 (= lt!206588 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!42708 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!42708 (= lt!206612 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205169))) (currentByte!5930 (_1!6084 lt!205169)) (currentBit!5925 (_1!6084 lt!205169))))))

(assert (=> d!42708 (= lt!206597 e!88550)))

(declare-fun c!7626 () Bool)

(assert (=> d!42708 (= c!7626 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42708 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2772 arr!237)))))

(assert (=> d!42708 (= (readByteArrayLoop!0 (_1!6084 lt!205169) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!206597)))

(declare-fun b!133515 () Bool)

(declare-fun lt!206587 () Unit!8176)

(declare-fun lt!206601 () tuple3!504)

(assert (=> b!133515 (= e!88550 (tuple3!505 lt!206587 (_2!6088 lt!206601) (_3!307 lt!206601)))))

(declare-fun lt!206605 () tuple2!11562)

(assert (=> b!133515 (= lt!206605 (readByte!0 (_1!6084 lt!205169)))))

(declare-fun lt!206584 () array!6122)

(assert (=> b!133515 (= lt!206584 (array!6123 (store (arr!3407 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206605)) (size!2772 arr!237)))))

(declare-fun lt!206579 () (_ BitVec 64))

(assert (=> b!133515 (= lt!206579 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206589 () (_ BitVec 32))

(assert (=> b!133515 (= lt!206589 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206593 () Unit!8176)

(assert (=> b!133515 (= lt!206593 (validateOffsetBytesFromBitIndexLemma!0 (_1!6084 lt!205169) (_2!6089 lt!206605) lt!206579 lt!206589))))

(assert (=> b!133515 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6089 lt!206605)))) ((_ sign_extend 32) (currentByte!5930 (_2!6089 lt!206605))) ((_ sign_extend 32) (currentBit!5925 (_2!6089 lt!206605))) (bvsub lt!206589 ((_ extract 31 0) (bvsdiv (bvadd lt!206579 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206607 () Unit!8176)

(assert (=> b!133515 (= lt!206607 lt!206593)))

(assert (=> b!133515 (= lt!206601 (readByteArrayLoop!0 (_2!6089 lt!206605) lt!206584 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133515 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206605))) (currentByte!5930 (_2!6089 lt!206605)) (currentBit!5925 (_2!6089 lt!206605))) (bvadd call!1707 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206586 () Unit!8176)

(declare-fun Unit!8263 () Unit!8176)

(assert (=> b!133515 (= lt!206586 Unit!8263)))

(assert (=> b!133515 (= (bvadd (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206605))) (currentByte!5930 (_2!6089 lt!206605)) (currentBit!5925 (_2!6089 lt!206605))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206601))) (currentByte!5930 (_2!6088 lt!206601)) (currentBit!5925 (_2!6088 lt!206601))))))

(declare-fun lt!206600 () Unit!8176)

(declare-fun Unit!8264 () Unit!8176)

(assert (=> b!133515 (= lt!206600 Unit!8264)))

(assert (=> b!133515 (= (bvadd call!1707 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206601))) (currentByte!5930 (_2!6088 lt!206601)) (currentBit!5925 (_2!6088 lt!206601))))))

(declare-fun lt!206592 () Unit!8176)

(declare-fun Unit!8265 () Unit!8176)

(assert (=> b!133515 (= lt!206592 Unit!8265)))

(assert (=> b!133515 (and (= (buf!3145 (_1!6084 lt!205169)) (buf!3145 (_2!6088 lt!206601))) (= (size!2772 arr!237) (size!2772 (_3!307 lt!206601))))))

(declare-fun lt!206595 () Unit!8176)

(declare-fun Unit!8266 () Unit!8176)

(assert (=> b!133515 (= lt!206595 Unit!8266)))

(declare-fun lt!206590 () Unit!8176)

(assert (=> b!133515 (= lt!206590 (arrayUpdatedAtPrefixLemma!2 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206605)))))

(assert (=> b!133515 call!1709))

(declare-fun lt!206585 () Unit!8176)

(assert (=> b!133515 (= lt!206585 lt!206590)))

(declare-fun lt!206609 () (_ BitVec 32))

(assert (=> b!133515 (= lt!206609 #b00000000000000000000000000000000)))

(declare-fun lt!206614 () Unit!8176)

(assert (=> b!133515 (= lt!206614 (arrayRangesEqTransitive!2 arr!237 lt!206584 (_3!307 lt!206601) lt!206609 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133515 call!1708))

(declare-fun lt!206610 () Unit!8176)

(assert (=> b!133515 (= lt!206610 lt!206614)))

(assert (=> b!133515 (arrayRangesEq!175 arr!237 (_3!307 lt!206601) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!206604 () Unit!8176)

(declare-fun Unit!8267 () Unit!8176)

(assert (=> b!133515 (= lt!206604 Unit!8267)))

(declare-fun lt!206591 () Unit!8176)

(assert (=> b!133515 (= lt!206591 (arrayRangesEqImpliesEq!2 lt!206584 (_3!307 lt!206601) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133515 (= (select (store (arr!3407 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206605)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3407 (_3!307 lt!206601)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206598 () Unit!8176)

(assert (=> b!133515 (= lt!206598 lt!206591)))

(declare-fun lt!206608 () Bool)

(assert (=> b!133515 (= lt!206608 (= (select (arr!3407 (_3!307 lt!206601)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6089 lt!206605)))))

(declare-fun Unit!8268 () Unit!8176)

(assert (=> b!133515 (= lt!206587 Unit!8268)))

(assert (=> b!133515 lt!206608))

(declare-fun bm!1705 () Bool)

(assert (=> bm!1705 (= call!1708 (arrayRangesEq!175 arr!237 (ite c!7626 (_3!307 lt!206601) arr!237) (ite c!7626 lt!206609 #b00000000000000000000000000000000) (ite c!7626 (bvadd #b00000000000000000000000000000001 from!447) (size!2772 arr!237))))))

(declare-fun b!133516 () Bool)

(assert (=> b!133516 (= e!88549 (= (select (arr!3407 (_3!307 lt!206597)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6083 (readBytePure!0 (_1!6084 lt!205169)))))))

(assert (=> b!133516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2772 (_3!307 lt!206597))))))

(declare-fun bm!1706 () Bool)

(assert (=> bm!1706 (= call!1709 (arrayRangesEq!175 (ite c!7626 arr!237 lt!206581) (ite c!7626 (array!6123 (store (arr!3407 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6089 lt!206605)) (size!2772 arr!237)) lt!206596) (ite c!7626 #b00000000000000000000000000000000 lt!206580) (ite c!7626 (bvadd #b00000000000000000000000000000001 from!447) lt!206599)))))

(declare-fun b!133517 () Bool)

(declare-fun res!110912 () Bool)

(assert (=> b!133517 (=> (not res!110912) (not e!88548))))

(assert (=> b!133517 (= res!110912 (and (= (buf!3145 (_1!6084 lt!205169)) (buf!3145 (_2!6088 lt!206597))) (= (size!2772 arr!237) (size!2772 (_3!307 lt!206597)))))))

(declare-fun b!133518 () Bool)

(assert (=> b!133518 (= e!88548 (arrayRangesEq!175 arr!237 (_3!307 lt!206597) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (= (and d!42708 c!7626) b!133515))

(assert (= (and d!42708 (not c!7626)) b!133514))

(assert (= (or b!133515 b!133514) bm!1706))

(assert (= (or b!133515 b!133514) bm!1705))

(assert (= (or b!133515 b!133514) bm!1704))

(assert (= (and d!42708 res!110913) b!133517))

(assert (= (and b!133517 res!110912) b!133518))

(assert (= (and d!42708 (not res!110914)) b!133516))

(declare-fun m!202427 () Bool)

(assert (=> bm!1705 m!202427))

(declare-fun m!202429 () Bool)

(assert (=> b!133515 m!202429))

(declare-fun m!202431 () Bool)

(assert (=> b!133515 m!202431))

(declare-fun m!202433 () Bool)

(assert (=> b!133515 m!202433))

(declare-fun m!202435 () Bool)

(assert (=> b!133515 m!202435))

(declare-fun m!202437 () Bool)

(assert (=> b!133515 m!202437))

(declare-fun m!202439 () Bool)

(assert (=> b!133515 m!202439))

(declare-fun m!202441 () Bool)

(assert (=> b!133515 m!202441))

(declare-fun m!202443 () Bool)

(assert (=> b!133515 m!202443))

(declare-fun m!202445 () Bool)

(assert (=> b!133515 m!202445))

(declare-fun m!202447 () Bool)

(assert (=> b!133515 m!202447))

(declare-fun m!202449 () Bool)

(assert (=> b!133515 m!202449))

(declare-fun m!202451 () Bool)

(assert (=> b!133515 m!202451))

(declare-fun m!202453 () Bool)

(assert (=> b!133515 m!202453))

(declare-fun m!202455 () Bool)

(assert (=> b!133516 m!202455))

(declare-fun m!202457 () Bool)

(assert (=> b!133516 m!202457))

(declare-fun m!202459 () Bool)

(assert (=> b!133518 m!202459))

(declare-fun m!202461 () Bool)

(assert (=> bm!1704 m!202461))

(declare-fun m!202463 () Bool)

(assert (=> b!133514 m!202463))

(declare-fun m!202465 () Bool)

(assert (=> b!133514 m!202465))

(assert (=> bm!1706 m!202447))

(declare-fun m!202467 () Bool)

(assert (=> bm!1706 m!202467))

(declare-fun m!202469 () Bool)

(assert (=> d!42708 m!202469))

(assert (=> d!42708 m!202461))

(assert (=> d!42319 d!42708))

(assert (=> b!133032 d!42317))

(assert (=> b!133032 d!42315))

(declare-fun d!42710 () Bool)

(assert (=> d!42710 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!42710 true))

(declare-fun _$7!49 () Unit!8176)

(assert (=> d!42710 (= (choose!57 thiss!1634 (_2!6085 lt!205156) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!49)))

(declare-fun bs!10421 () Bool)

(assert (= bs!10421 d!42710))

(declare-fun m!202471 () Bool)

(assert (=> bs!10421 m!202471))

(assert (=> d!42215 d!42710))

(declare-fun d!42712 () Bool)

(assert (=> d!42712 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205154)))) ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205154))) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205154)))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6083 lt!205154)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_1!6083 lt!205154))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_1!6083 lt!205154))))))))

(assert (=> d!42265 d!42712))

(declare-fun d!42714 () Bool)

(assert (=> d!42714 (= (invariant!0 (currentBit!5925 (_1!6083 lt!205154)) (currentByte!5930 (_1!6083 lt!205154)) (size!2772 (buf!3145 (_1!6083 lt!205154)))) (and (bvsge (currentBit!5925 (_1!6083 lt!205154)) #b00000000000000000000000000000000) (bvslt (currentBit!5925 (_1!6083 lt!205154)) #b00000000000000000000000000001000) (bvsge (currentByte!5930 (_1!6083 lt!205154)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5930 (_1!6083 lt!205154)) (size!2772 (buf!3145 (_1!6083 lt!205154)))) (and (= (currentBit!5925 (_1!6083 lt!205154)) #b00000000000000000000000000000000) (= (currentByte!5930 (_1!6083 lt!205154)) (size!2772 (buf!3145 (_1!6083 lt!205154))))))))))

(assert (=> d!42265 d!42714))

(declare-fun d!42716 () Bool)

(declare-fun e!88551 () Bool)

(assert (=> d!42716 e!88551))

(declare-fun res!110915 () Bool)

(assert (=> d!42716 (=> (not res!110915) (not e!88551))))

(declare-fun lt!206615 () BitStream!4808)

(declare-fun lt!206616 () (_ BitVec 64))

(assert (=> d!42716 (= res!110915 (= (bvadd lt!206616 (bvsub lt!205625 lt!205618)) (bitIndex!0 (size!2772 (buf!3145 lt!206615)) (currentByte!5930 lt!206615) (currentBit!5925 lt!206615))))))

(assert (=> d!42716 (or (not (= (bvand lt!206616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205625 lt!205618) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206616 (bvsub lt!205625 lt!205618)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42716 (= lt!206616 (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205624))) (currentByte!5930 (_2!6084 lt!205624)) (currentBit!5925 (_2!6084 lt!205624))))))

(assert (=> d!42716 (= lt!206615 (_2!6085 (moveBitIndex!0 (_2!6084 lt!205624) (bvsub lt!205625 lt!205618))))))

(assert (=> d!42716 (moveBitIndexPrecond!0 (_2!6084 lt!205624) (bvsub lt!205625 lt!205618))))

(assert (=> d!42716 (= (withMovedBitIndex!0 (_2!6084 lt!205624) (bvsub lt!205625 lt!205618)) lt!206615)))

(declare-fun b!133519 () Bool)

(assert (=> b!133519 (= e!88551 (= (size!2772 (buf!3145 (_2!6084 lt!205624))) (size!2772 (buf!3145 lt!206615))))))

(assert (= (and d!42716 res!110915) b!133519))

(declare-fun m!202473 () Bool)

(assert (=> d!42716 m!202473))

(assert (=> d!42716 m!202219))

(declare-fun m!202475 () Bool)

(assert (=> d!42716 m!202475))

(declare-fun m!202477 () Bool)

(assert (=> d!42716 m!202477))

(assert (=> b!133036 d!42716))

(assert (=> b!133036 d!42315))

(assert (=> b!133036 d!42317))

(declare-fun d!42718 () Bool)

(assert (=> d!42718 (isPrefixOf!0 lt!205598 (_2!6085 lt!205157))))

(declare-fun lt!206617 () Unit!8176)

(assert (=> d!42718 (= lt!206617 (choose!30 lt!205598 (_2!6085 lt!205156) (_2!6085 lt!205157)))))

(assert (=> d!42718 (isPrefixOf!0 lt!205598 (_2!6085 lt!205156))))

(assert (=> d!42718 (= (lemmaIsPrefixTransitive!0 lt!205598 (_2!6085 lt!205156) (_2!6085 lt!205157)) lt!206617)))

(declare-fun bs!10422 () Bool)

(assert (= bs!10422 d!42718))

(assert (=> bs!10422 m!201293))

(declare-fun m!202479 () Bool)

(assert (=> bs!10422 m!202479))

(declare-fun m!202481 () Bool)

(assert (=> bs!10422 m!202481))

(assert (=> d!42293 d!42718))

(declare-fun d!42720 () Bool)

(declare-fun res!110917 () Bool)

(declare-fun e!88553 () Bool)

(assert (=> d!42720 (=> (not res!110917) (not e!88553))))

(assert (=> d!42720 (= res!110917 (= (size!2772 (buf!3145 lt!205598)) (size!2772 (buf!3145 lt!205598))))))

(assert (=> d!42720 (= (isPrefixOf!0 lt!205598 lt!205598) e!88553)))

(declare-fun b!133520 () Bool)

(declare-fun res!110916 () Bool)

(assert (=> b!133520 (=> (not res!110916) (not e!88553))))

(assert (=> b!133520 (= res!110916 (bvsle (bitIndex!0 (size!2772 (buf!3145 lt!205598)) (currentByte!5930 lt!205598) (currentBit!5925 lt!205598)) (bitIndex!0 (size!2772 (buf!3145 lt!205598)) (currentByte!5930 lt!205598) (currentBit!5925 lt!205598))))))

(declare-fun b!133521 () Bool)

(declare-fun e!88552 () Bool)

(assert (=> b!133521 (= e!88553 e!88552)))

(declare-fun res!110918 () Bool)

(assert (=> b!133521 (=> res!110918 e!88552)))

(assert (=> b!133521 (= res!110918 (= (size!2772 (buf!3145 lt!205598)) #b00000000000000000000000000000000))))

(declare-fun b!133522 () Bool)

(assert (=> b!133522 (= e!88552 (arrayBitRangesEq!0 (buf!3145 lt!205598) (buf!3145 lt!205598) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 lt!205598)) (currentByte!5930 lt!205598) (currentBit!5925 lt!205598))))))

(assert (= (and d!42720 res!110917) b!133520))

(assert (= (and b!133520 res!110916) b!133521))

(assert (= (and b!133521 (not res!110918)) b!133522))

(declare-fun m!202483 () Bool)

(assert (=> b!133520 m!202483))

(assert (=> b!133520 m!202483))

(assert (=> b!133522 m!202483))

(assert (=> b!133522 m!202483))

(declare-fun m!202485 () Bool)

(assert (=> b!133522 m!202485))

(assert (=> d!42293 d!42720))

(declare-fun d!42722 () Bool)

(declare-fun res!110920 () Bool)

(declare-fun e!88555 () Bool)

(assert (=> d!42722 (=> (not res!110920) (not e!88555))))

(assert (=> d!42722 (= res!110920 (= (size!2772 (buf!3145 lt!205598)) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42722 (= (isPrefixOf!0 lt!205598 (_2!6085 lt!205157)) e!88555)))

(declare-fun b!133523 () Bool)

(declare-fun res!110919 () Bool)

(assert (=> b!133523 (=> (not res!110919) (not e!88555))))

(assert (=> b!133523 (= res!110919 (bvsle (bitIndex!0 (size!2772 (buf!3145 lt!205598)) (currentByte!5930 lt!205598) (currentBit!5925 lt!205598)) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133524 () Bool)

(declare-fun e!88554 () Bool)

(assert (=> b!133524 (= e!88555 e!88554)))

(declare-fun res!110921 () Bool)

(assert (=> b!133524 (=> res!110921 e!88554)))

(assert (=> b!133524 (= res!110921 (= (size!2772 (buf!3145 lt!205598)) #b00000000000000000000000000000000))))

(declare-fun b!133525 () Bool)

(assert (=> b!133525 (= e!88554 (arrayBitRangesEq!0 (buf!3145 lt!205598) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 lt!205598)) (currentByte!5930 lt!205598) (currentBit!5925 lt!205598))))))

(assert (= (and d!42722 res!110920) b!133523))

(assert (= (and b!133523 res!110919) b!133524))

(assert (= (and b!133524 (not res!110921)) b!133525))

(assert (=> b!133523 m!202483))

(assert (=> b!133523 m!200953))

(assert (=> b!133525 m!202483))

(assert (=> b!133525 m!202483))

(declare-fun m!202487 () Bool)

(assert (=> b!133525 m!202487))

(assert (=> d!42293 d!42722))

(declare-fun d!42724 () Bool)

(declare-fun res!110923 () Bool)

(declare-fun e!88557 () Bool)

(assert (=> d!42724 (=> (not res!110923) (not e!88557))))

(assert (=> d!42724 (= res!110923 (= (size!2772 (buf!3145 (_1!6084 lt!205602))) (size!2772 (buf!3145 (_2!6084 lt!205602)))))))

(assert (=> d!42724 (= (isPrefixOf!0 (_1!6084 lt!205602) (_2!6084 lt!205602)) e!88557)))

(declare-fun b!133526 () Bool)

(declare-fun res!110922 () Bool)

(assert (=> b!133526 (=> (not res!110922) (not e!88557))))

(assert (=> b!133526 (= res!110922 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205602))) (currentByte!5930 (_1!6084 lt!205602)) (currentBit!5925 (_1!6084 lt!205602))) (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205602))) (currentByte!5930 (_2!6084 lt!205602)) (currentBit!5925 (_2!6084 lt!205602)))))))

(declare-fun b!133527 () Bool)

(declare-fun e!88556 () Bool)

(assert (=> b!133527 (= e!88557 e!88556)))

(declare-fun res!110924 () Bool)

(assert (=> b!133527 (=> res!110924 e!88556)))

(assert (=> b!133527 (= res!110924 (= (size!2772 (buf!3145 (_1!6084 lt!205602))) #b00000000000000000000000000000000))))

(declare-fun b!133528 () Bool)

(assert (=> b!133528 (= e!88556 (arrayBitRangesEq!0 (buf!3145 (_1!6084 lt!205602)) (buf!3145 (_2!6084 lt!205602)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205602))) (currentByte!5930 (_1!6084 lt!205602)) (currentBit!5925 (_1!6084 lt!205602)))))))

(assert (= (and d!42724 res!110923) b!133526))

(assert (= (and b!133526 res!110922) b!133527))

(assert (= (and b!133527 (not res!110924)) b!133528))

(declare-fun m!202489 () Bool)

(assert (=> b!133526 m!202489))

(assert (=> b!133526 m!202297))

(assert (=> b!133528 m!202489))

(assert (=> b!133528 m!202489))

(declare-fun m!202491 () Bool)

(assert (=> b!133528 m!202491))

(assert (=> d!42293 d!42724))

(declare-fun d!42726 () Bool)

(assert (=> d!42726 (isPrefixOf!0 lt!205598 (_2!6085 lt!205157))))

(declare-fun lt!206618 () Unit!8176)

(assert (=> d!42726 (= lt!206618 (choose!30 lt!205598 (_2!6085 lt!205157) (_2!6085 lt!205157)))))

(assert (=> d!42726 (isPrefixOf!0 lt!205598 (_2!6085 lt!205157))))

(assert (=> d!42726 (= (lemmaIsPrefixTransitive!0 lt!205598 (_2!6085 lt!205157) (_2!6085 lt!205157)) lt!206618)))

(declare-fun bs!10423 () Bool)

(assert (= bs!10423 d!42726))

(assert (=> bs!10423 m!201293))

(declare-fun m!202493 () Bool)

(assert (=> bs!10423 m!202493))

(assert (=> bs!10423 m!201293))

(assert (=> d!42293 d!42726))

(declare-fun d!42728 () Bool)

(assert (=> d!42728 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205156))))

(declare-fun lt!206619 () Unit!8176)

(assert (=> d!42728 (= lt!206619 (choose!11 (_2!6085 lt!205156)))))

(assert (=> d!42728 (= (lemmaIsPrefixRefl!0 (_2!6085 lt!205156)) lt!206619)))

(declare-fun bs!10424 () Bool)

(assert (= bs!10424 d!42728))

(assert (=> bs!10424 m!201297))

(declare-fun m!202495 () Bool)

(assert (=> bs!10424 m!202495))

(assert (=> d!42293 d!42728))

(declare-fun d!42730 () Bool)

(assert (=> d!42730 (isPrefixOf!0 lt!205598 lt!205598)))

(declare-fun lt!206620 () Unit!8176)

(assert (=> d!42730 (= lt!206620 (choose!11 lt!205598))))

(assert (=> d!42730 (= (lemmaIsPrefixRefl!0 lt!205598) lt!206620)))

(declare-fun bs!10425 () Bool)

(assert (= bs!10425 d!42730))

(assert (=> bs!10425 m!201299))

(declare-fun m!202497 () Bool)

(assert (=> bs!10425 m!202497))

(assert (=> d!42293 d!42730))

(assert (=> d!42293 d!42638))

(assert (=> d!42293 d!42640))

(assert (=> d!42293 d!42309))

(declare-fun d!42732 () Bool)

(declare-fun res!110926 () Bool)

(declare-fun e!88559 () Bool)

(assert (=> d!42732 (=> (not res!110926) (not e!88559))))

(assert (=> d!42732 (= res!110926 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (=> d!42732 (= (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205156)) e!88559)))

(declare-fun b!133529 () Bool)

(declare-fun res!110925 () Bool)

(assert (=> b!133529 (=> (not res!110925) (not e!88559))))

(assert (=> b!133529 (= res!110925 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun b!133530 () Bool)

(declare-fun e!88558 () Bool)

(assert (=> b!133530 (= e!88559 e!88558)))

(declare-fun res!110927 () Bool)

(assert (=> b!133530 (=> res!110927 e!88558)))

(assert (=> b!133530 (= res!110927 (= (size!2772 (buf!3145 (_2!6085 lt!205156))) #b00000000000000000000000000000000))))

(declare-fun b!133531 () Bool)

(assert (=> b!133531 (= e!88558 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (= (and d!42732 res!110926) b!133529))

(assert (= (and b!133529 res!110925) b!133530))

(assert (= (and b!133530 (not res!110927)) b!133531))

(assert (=> b!133529 m!200955))

(assert (=> b!133529 m!200955))

(assert (=> b!133531 m!200955))

(assert (=> b!133531 m!200955))

(declare-fun m!202499 () Bool)

(assert (=> b!133531 m!202499))

(assert (=> d!42293 d!42732))

(assert (=> d!42321 d!42698))

(declare-fun d!42734 () Bool)

(declare-fun lt!206624 () (_ BitVec 8))

(declare-fun lt!206625 () (_ BitVec 8))

(assert (=> d!42734 (= lt!206624 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205155))) (currentByte!5930 (_1!6084 lt!205155)))) ((_ sign_extend 24) lt!206625))))))

(assert (=> d!42734 (= lt!206625 ((_ extract 7 0) (currentBit!5925 (_1!6084 lt!205155))))))

(declare-fun e!88560 () Bool)

(assert (=> d!42734 e!88560))

(declare-fun res!110928 () Bool)

(assert (=> d!42734 (=> (not res!110928) (not e!88560))))

(assert (=> d!42734 (= res!110928 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_1!6084 lt!205155)))) ((_ sign_extend 32) (currentByte!5930 (_1!6084 lt!205155))) ((_ sign_extend 32) (currentBit!5925 (_1!6084 lt!205155))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8269 () Unit!8176)

(declare-fun Unit!8270 () Unit!8176)

(assert (=> d!42734 (= (readByte!0 (_1!6084 lt!205155)) (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206625) #b00000000000000000000000000000000) (tuple2!11569 Unit!8269 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206624) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205155))) (bvadd (currentByte!5930 (_1!6084 lt!205155)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206625)))))))) (tuple2!11569 Unit!8270 lt!206624))) (BitStream!4809 (buf!3145 (_1!6084 lt!205155)) (bvadd (currentByte!5930 (_1!6084 lt!205155)) #b00000000000000000000000000000001) (currentBit!5925 (_1!6084 lt!205155)))))))

(declare-fun b!133532 () Bool)

(declare-fun e!88561 () Bool)

(assert (=> b!133532 (= e!88560 e!88561)))

(declare-fun res!110929 () Bool)

(assert (=> b!133532 (=> (not res!110929) (not e!88561))))

(declare-fun lt!206626 () tuple2!11562)

(assert (=> b!133532 (= res!110929 (= (buf!3145 (_2!6089 lt!206626)) (buf!3145 (_1!6084 lt!205155))))))

(declare-fun lt!206621 () (_ BitVec 8))

(declare-fun lt!206623 () (_ BitVec 8))

(declare-fun Unit!8271 () Unit!8176)

(declare-fun Unit!8272 () Unit!8176)

(assert (=> b!133532 (= lt!206626 (tuple2!11563 (_2!6095 (ite (bvsgt ((_ sign_extend 24) lt!206621) #b00000000000000000000000000000000) (tuple2!11569 Unit!8271 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206623) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205155))) (bvadd (currentByte!5930 (_1!6084 lt!205155)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206621)))))))) (tuple2!11569 Unit!8272 lt!206623))) (BitStream!4809 (buf!3145 (_1!6084 lt!205155)) (bvadd (currentByte!5930 (_1!6084 lt!205155)) #b00000000000000000000000000000001) (currentBit!5925 (_1!6084 lt!205155)))))))

(assert (=> b!133532 (= lt!206623 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3407 (buf!3145 (_1!6084 lt!205155))) (currentByte!5930 (_1!6084 lt!205155)))) ((_ sign_extend 24) lt!206621))))))

(assert (=> b!133532 (= lt!206621 ((_ extract 7 0) (currentBit!5925 (_1!6084 lt!205155))))))

(declare-fun b!133533 () Bool)

(declare-fun lt!206622 () (_ BitVec 64))

(declare-fun lt!206627 () (_ BitVec 64))

(assert (=> b!133533 (= e!88561 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206626))) (currentByte!5930 (_2!6089 lt!206626)) (currentBit!5925 (_2!6089 lt!206626))) (bvadd lt!206622 lt!206627)))))

(assert (=> b!133533 (or (not (= (bvand lt!206622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206627 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206622 lt!206627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133533 (= lt!206627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133533 (= lt!206622 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205155))) (currentByte!5930 (_1!6084 lt!205155)) (currentBit!5925 (_1!6084 lt!205155))))))

(assert (= (and d!42734 res!110928) b!133532))

(assert (= (and b!133532 res!110929) b!133533))

(declare-fun m!202501 () Bool)

(assert (=> d!42734 m!202501))

(declare-fun m!202503 () Bool)

(assert (=> d!42734 m!202503))

(declare-fun m!202505 () Bool)

(assert (=> d!42734 m!202505))

(assert (=> b!133532 m!202505))

(assert (=> b!133532 m!202501))

(declare-fun m!202507 () Bool)

(assert (=> b!133533 m!202507))

(declare-fun m!202509 () Bool)

(assert (=> b!133533 m!202509))

(assert (=> d!42305 d!42734))

(assert (=> d!42317 d!42666))

(assert (=> d!42317 d!42211))

(declare-fun d!42736 () Bool)

(declare-fun res!110931 () Bool)

(declare-fun e!88563 () Bool)

(assert (=> d!42736 (=> (not res!110931) (not e!88563))))

(assert (=> d!42736 (= res!110931 (= (size!2772 (buf!3145 (_2!6084 lt!205602))) (size!2772 (buf!3145 (_2!6085 lt!205157)))))))

(assert (=> d!42736 (= (isPrefixOf!0 (_2!6084 lt!205602) (_2!6085 lt!205157)) e!88563)))

(declare-fun b!133534 () Bool)

(declare-fun res!110930 () Bool)

(assert (=> b!133534 (=> (not res!110930) (not e!88563))))

(assert (=> b!133534 (= res!110930 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205602))) (currentByte!5930 (_2!6084 lt!205602)) (currentBit!5925 (_2!6084 lt!205602))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205157))) (currentByte!5930 (_2!6085 lt!205157)) (currentBit!5925 (_2!6085 lt!205157)))))))

(declare-fun b!133535 () Bool)

(declare-fun e!88562 () Bool)

(assert (=> b!133535 (= e!88563 e!88562)))

(declare-fun res!110932 () Bool)

(assert (=> b!133535 (=> res!110932 e!88562)))

(assert (=> b!133535 (= res!110932 (= (size!2772 (buf!3145 (_2!6084 lt!205602))) #b00000000000000000000000000000000))))

(declare-fun b!133536 () Bool)

(assert (=> b!133536 (= e!88562 (arrayBitRangesEq!0 (buf!3145 (_2!6084 lt!205602)) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205602))) (currentByte!5930 (_2!6084 lt!205602)) (currentBit!5925 (_2!6084 lt!205602)))))))

(assert (= (and d!42736 res!110931) b!133534))

(assert (= (and b!133534 res!110930) b!133535))

(assert (= (and b!133535 (not res!110932)) b!133536))

(assert (=> b!133534 m!202297))

(assert (=> b!133534 m!200953))

(assert (=> b!133536 m!202297))

(assert (=> b!133536 m!202297))

(declare-fun m!202511 () Bool)

(assert (=> b!133536 m!202511))

(assert (=> b!133031 d!42736))

(declare-fun d!42738 () Bool)

(declare-fun res!110933 () Bool)

(declare-fun e!88564 () Bool)

(assert (=> d!42738 (=> res!110933 e!88564)))

(assert (=> d!42738 (= res!110933 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42738 (= (arrayRangesEq!175 arr!237 (_2!6082 lt!205173) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!88564)))

(declare-fun b!133537 () Bool)

(declare-fun e!88565 () Bool)

(assert (=> b!133537 (= e!88564 e!88565)))

(declare-fun res!110934 () Bool)

(assert (=> b!133537 (=> (not res!110934) (not e!88565))))

(assert (=> b!133537 (= res!110934 (= (select (arr!3407 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3407 (_2!6082 lt!205173)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!133538 () Bool)

(assert (=> b!133538 (= e!88565 (arrayRangesEq!175 arr!237 (_2!6082 lt!205173) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42738 (not res!110933)) b!133537))

(assert (= (and b!133537 res!110934) b!133538))

(declare-fun m!202513 () Bool)

(assert (=> b!133537 m!202513))

(declare-fun m!202515 () Bool)

(assert (=> b!133537 m!202515))

(declare-fun m!202517 () Bool)

(assert (=> b!133538 m!202517))

(assert (=> b!133044 d!42738))

(declare-fun d!42740 () Bool)

(declare-fun e!88566 () Bool)

(assert (=> d!42740 e!88566))

(declare-fun res!110935 () Bool)

(assert (=> d!42740 (=> (not res!110935) (not e!88566))))

(declare-fun lt!206629 () (_ BitVec 64))

(declare-fun lt!206628 () BitStream!4808)

(assert (=> d!42740 (= res!110935 (= (bvadd lt!206629 (bvsub lt!205394 lt!205387)) (bitIndex!0 (size!2772 (buf!3145 lt!206628)) (currentByte!5930 lt!206628) (currentBit!5925 lt!206628))))))

(assert (=> d!42740 (or (not (= (bvand lt!206629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205394 lt!205387) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206629 (bvsub lt!205394 lt!205387)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42740 (= lt!206629 (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205393))) (currentByte!5930 (_2!6084 lt!205393)) (currentBit!5925 (_2!6084 lt!205393))))))

(assert (=> d!42740 (= lt!206628 (_2!6085 (moveBitIndex!0 (_2!6084 lt!205393) (bvsub lt!205394 lt!205387))))))

(assert (=> d!42740 (moveBitIndexPrecond!0 (_2!6084 lt!205393) (bvsub lt!205394 lt!205387))))

(assert (=> d!42740 (= (withMovedBitIndex!0 (_2!6084 lt!205393) (bvsub lt!205394 lt!205387)) lt!206628)))

(declare-fun b!133539 () Bool)

(assert (=> b!133539 (= e!88566 (= (size!2772 (buf!3145 (_2!6084 lt!205393))) (size!2772 (buf!3145 lt!206628))))))

(assert (= (and d!42740 res!110935) b!133539))

(declare-fun m!202519 () Bool)

(assert (=> d!42740 m!202519))

(assert (=> d!42740 m!202261))

(declare-fun m!202521 () Bool)

(assert (=> d!42740 m!202521))

(declare-fun m!202523 () Bool)

(assert (=> d!42740 m!202523))

(assert (=> b!132953 d!42740))

(assert (=> b!132953 d!42329))

(assert (=> b!132953 d!42317))

(declare-fun d!42742 () Bool)

(declare-fun res!110937 () Bool)

(declare-fun e!88568 () Bool)

(assert (=> d!42742 (=> (not res!110937) (not e!88568))))

(assert (=> d!42742 (= res!110937 (= (size!2772 (buf!3145 (_1!6084 lt!205602))) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (=> d!42742 (= (isPrefixOf!0 (_1!6084 lt!205602) (_2!6085 lt!205156)) e!88568)))

(declare-fun b!133540 () Bool)

(declare-fun res!110936 () Bool)

(assert (=> b!133540 (=> (not res!110936) (not e!88568))))

(assert (=> b!133540 (= res!110936 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205602))) (currentByte!5930 (_1!6084 lt!205602)) (currentBit!5925 (_1!6084 lt!205602))) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun b!133541 () Bool)

(declare-fun e!88567 () Bool)

(assert (=> b!133541 (= e!88568 e!88567)))

(declare-fun res!110938 () Bool)

(assert (=> b!133541 (=> res!110938 e!88567)))

(assert (=> b!133541 (= res!110938 (= (size!2772 (buf!3145 (_1!6084 lt!205602))) #b00000000000000000000000000000000))))

(declare-fun b!133542 () Bool)

(assert (=> b!133542 (= e!88567 (arrayBitRangesEq!0 (buf!3145 (_1!6084 lt!205602)) (buf!3145 (_2!6085 lt!205156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205602))) (currentByte!5930 (_1!6084 lt!205602)) (currentBit!5925 (_1!6084 lt!205602)))))))

(assert (= (and d!42742 res!110937) b!133540))

(assert (= (and b!133540 res!110936) b!133541))

(assert (= (and b!133541 (not res!110938)) b!133542))

(assert (=> b!133540 m!202489))

(assert (=> b!133540 m!200955))

(assert (=> b!133542 m!202489))

(assert (=> b!133542 m!202489))

(declare-fun m!202525 () Bool)

(assert (=> b!133542 m!202525))

(assert (=> b!133029 d!42742))

(declare-fun bm!1707 () Bool)

(declare-fun call!1710 () (_ BitVec 64))

(assert (=> bm!1707 (= call!1710 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205162))) (currentByte!5930 (_1!6084 lt!205162)) (currentBit!5925 (_1!6084 lt!205162))))))

(declare-fun b!133543 () Bool)

(declare-fun lt!206653 () Unit!8176)

(declare-fun e!88571 () tuple3!504)

(assert (=> b!133543 (= e!88571 (tuple3!505 lt!206653 (_1!6084 lt!205162) arr!237))))

(assert (=> b!133543 (= call!1710 call!1710)))

(declare-fun lt!206633 () Unit!8176)

(declare-fun Unit!8273 () Unit!8176)

(assert (=> b!133543 (= lt!206633 Unit!8273)))

(declare-fun lt!206662 () Unit!8176)

(assert (=> b!133543 (= lt!206662 (arrayRangesEqReflexiveLemma!2 arr!237))))

(declare-fun call!1711 () Bool)

(assert (=> b!133543 call!1711))

(declare-fun lt!206654 () Unit!8176)

(assert (=> b!133543 (= lt!206654 lt!206662)))

(declare-fun lt!206632 () array!6122)

(assert (=> b!133543 (= lt!206632 arr!237)))

(declare-fun lt!206647 () array!6122)

(assert (=> b!133543 (= lt!206647 arr!237)))

(declare-fun lt!206645 () (_ BitVec 32))

(assert (=> b!133543 (= lt!206645 #b00000000000000000000000000000000)))

(declare-fun lt!206634 () (_ BitVec 32))

(assert (=> b!133543 (= lt!206634 (size!2772 arr!237))))

(declare-fun lt!206631 () (_ BitVec 32))

(assert (=> b!133543 (= lt!206631 #b00000000000000000000000000000000)))

(declare-fun lt!206650 () (_ BitVec 32))

(assert (=> b!133543 (= lt!206650 from!447)))

(assert (=> b!133543 (= lt!206653 (arrayRangesEqSlicedLemma!2 lt!206632 lt!206647 lt!206645 lt!206634 lt!206631 lt!206650))))

(declare-fun call!1712 () Bool)

(assert (=> b!133543 call!1712))

(declare-fun d!42744 () Bool)

(declare-fun e!88570 () Bool)

(assert (=> d!42744 e!88570))

(declare-fun res!110941 () Bool)

(assert (=> d!42744 (=> res!110941 e!88570)))

(assert (=> d!42744 (= res!110941 (bvsge from!447 to!404))))

(declare-fun lt!206657 () Bool)

(declare-fun e!88569 () Bool)

(assert (=> d!42744 (= lt!206657 e!88569)))

(declare-fun res!110940 () Bool)

(assert (=> d!42744 (=> (not res!110940) (not e!88569))))

(declare-fun lt!206663 () (_ BitVec 64))

(declare-fun lt!206664 () (_ BitVec 64))

(declare-fun lt!206648 () tuple3!504)

(assert (=> d!42744 (= res!110940 (= (bvadd lt!206663 lt!206664) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206648))) (currentByte!5930 (_2!6088 lt!206648)) (currentBit!5925 (_2!6088 lt!206648)))))))

(assert (=> d!42744 (or (not (= (bvand lt!206663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206664 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206663 lt!206664) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206639 () (_ BitVec 64))

(assert (=> d!42744 (= lt!206664 (bvmul lt!206639 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42744 (or (= lt!206639 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206639 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206639)))))

(assert (=> d!42744 (= lt!206639 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!42744 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!42744 (= lt!206663 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205162))) (currentByte!5930 (_1!6084 lt!205162)) (currentBit!5925 (_1!6084 lt!205162))))))

(assert (=> d!42744 (= lt!206648 e!88571)))

(declare-fun c!7627 () Bool)

(assert (=> d!42744 (= c!7627 (bvslt from!447 to!404))))

(assert (=> d!42744 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2772 arr!237)))))

(assert (=> d!42744 (= (readByteArrayLoop!0 (_1!6084 lt!205162) arr!237 from!447 to!404) lt!206648)))

(declare-fun b!133544 () Bool)

(declare-fun lt!206638 () Unit!8176)

(declare-fun lt!206652 () tuple3!504)

(assert (=> b!133544 (= e!88571 (tuple3!505 lt!206638 (_2!6088 lt!206652) (_3!307 lt!206652)))))

(declare-fun lt!206656 () tuple2!11562)

(assert (=> b!133544 (= lt!206656 (readByte!0 (_1!6084 lt!205162)))))

(declare-fun lt!206635 () array!6122)

(assert (=> b!133544 (= lt!206635 (array!6123 (store (arr!3407 arr!237) from!447 (_1!6089 lt!206656)) (size!2772 arr!237)))))

(declare-fun lt!206630 () (_ BitVec 64))

(assert (=> b!133544 (= lt!206630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206640 () (_ BitVec 32))

(assert (=> b!133544 (= lt!206640 (bvsub to!404 from!447))))

(declare-fun lt!206644 () Unit!8176)

(assert (=> b!133544 (= lt!206644 (validateOffsetBytesFromBitIndexLemma!0 (_1!6084 lt!205162) (_2!6089 lt!206656) lt!206630 lt!206640))))

(assert (=> b!133544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6089 lt!206656)))) ((_ sign_extend 32) (currentByte!5930 (_2!6089 lt!206656))) ((_ sign_extend 32) (currentBit!5925 (_2!6089 lt!206656))) (bvsub lt!206640 ((_ extract 31 0) (bvsdiv (bvadd lt!206630 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206658 () Unit!8176)

(assert (=> b!133544 (= lt!206658 lt!206644)))

(assert (=> b!133544 (= lt!206652 (readByteArrayLoop!0 (_2!6089 lt!206656) lt!206635 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133544 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206656))) (currentByte!5930 (_2!6089 lt!206656)) (currentBit!5925 (_2!6089 lt!206656))) (bvadd call!1710 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206637 () Unit!8176)

(declare-fun Unit!8274 () Unit!8176)

(assert (=> b!133544 (= lt!206637 Unit!8274)))

(assert (=> b!133544 (= (bvadd (bitIndex!0 (size!2772 (buf!3145 (_2!6089 lt!206656))) (currentByte!5930 (_2!6089 lt!206656)) (currentBit!5925 (_2!6089 lt!206656))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206652))) (currentByte!5930 (_2!6088 lt!206652)) (currentBit!5925 (_2!6088 lt!206652))))))

(declare-fun lt!206651 () Unit!8176)

(declare-fun Unit!8275 () Unit!8176)

(assert (=> b!133544 (= lt!206651 Unit!8275)))

(assert (=> b!133544 (= (bvadd call!1710 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2772 (buf!3145 (_2!6088 lt!206652))) (currentByte!5930 (_2!6088 lt!206652)) (currentBit!5925 (_2!6088 lt!206652))))))

(declare-fun lt!206643 () Unit!8176)

(declare-fun Unit!8276 () Unit!8176)

(assert (=> b!133544 (= lt!206643 Unit!8276)))

(assert (=> b!133544 (and (= (buf!3145 (_1!6084 lt!205162)) (buf!3145 (_2!6088 lt!206652))) (= (size!2772 arr!237) (size!2772 (_3!307 lt!206652))))))

(declare-fun lt!206646 () Unit!8176)

(declare-fun Unit!8277 () Unit!8176)

(assert (=> b!133544 (= lt!206646 Unit!8277)))

(declare-fun lt!206641 () Unit!8176)

(assert (=> b!133544 (= lt!206641 (arrayUpdatedAtPrefixLemma!2 arr!237 from!447 (_1!6089 lt!206656)))))

(assert (=> b!133544 call!1712))

(declare-fun lt!206636 () Unit!8176)

(assert (=> b!133544 (= lt!206636 lt!206641)))

(declare-fun lt!206660 () (_ BitVec 32))

(assert (=> b!133544 (= lt!206660 #b00000000000000000000000000000000)))

(declare-fun lt!206665 () Unit!8176)

(assert (=> b!133544 (= lt!206665 (arrayRangesEqTransitive!2 arr!237 lt!206635 (_3!307 lt!206652) lt!206660 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133544 call!1711))

(declare-fun lt!206661 () Unit!8176)

(assert (=> b!133544 (= lt!206661 lt!206665)))

(assert (=> b!133544 (arrayRangesEq!175 arr!237 (_3!307 lt!206652) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!206655 () Unit!8176)

(declare-fun Unit!8278 () Unit!8176)

(assert (=> b!133544 (= lt!206655 Unit!8278)))

(declare-fun lt!206642 () Unit!8176)

(assert (=> b!133544 (= lt!206642 (arrayRangesEqImpliesEq!2 lt!206635 (_3!307 lt!206652) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133544 (= (select (store (arr!3407 arr!237) from!447 (_1!6089 lt!206656)) from!447) (select (arr!3407 (_3!307 lt!206652)) from!447))))

(declare-fun lt!206649 () Unit!8176)

(assert (=> b!133544 (= lt!206649 lt!206642)))

(declare-fun lt!206659 () Bool)

(assert (=> b!133544 (= lt!206659 (= (select (arr!3407 (_3!307 lt!206652)) from!447) (_1!6089 lt!206656)))))

(declare-fun Unit!8279 () Unit!8176)

(assert (=> b!133544 (= lt!206638 Unit!8279)))

(assert (=> b!133544 lt!206659))

(declare-fun bm!1708 () Bool)

(assert (=> bm!1708 (= call!1711 (arrayRangesEq!175 arr!237 (ite c!7627 (_3!307 lt!206652) arr!237) (ite c!7627 lt!206660 #b00000000000000000000000000000000) (ite c!7627 from!447 (size!2772 arr!237))))))

(declare-fun b!133545 () Bool)

(assert (=> b!133545 (= e!88570 (= (select (arr!3407 (_3!307 lt!206648)) from!447) (_2!6083 (readBytePure!0 (_1!6084 lt!205162)))))))

(assert (=> b!133545 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2772 (_3!307 lt!206648))))))

(declare-fun bm!1709 () Bool)

(assert (=> bm!1709 (= call!1712 (arrayRangesEq!175 (ite c!7627 arr!237 lt!206632) (ite c!7627 (array!6123 (store (arr!3407 arr!237) from!447 (_1!6089 lt!206656)) (size!2772 arr!237)) lt!206647) (ite c!7627 #b00000000000000000000000000000000 lt!206631) (ite c!7627 from!447 lt!206650)))))

(declare-fun b!133546 () Bool)

(declare-fun res!110939 () Bool)

(assert (=> b!133546 (=> (not res!110939) (not e!88569))))

(assert (=> b!133546 (= res!110939 (and (= (buf!3145 (_1!6084 lt!205162)) (buf!3145 (_2!6088 lt!206648))) (= (size!2772 arr!237) (size!2772 (_3!307 lt!206648)))))))

(declare-fun b!133547 () Bool)

(assert (=> b!133547 (= e!88569 (arrayRangesEq!175 arr!237 (_3!307 lt!206648) #b00000000000000000000000000000000 from!447))))

(assert (= (and d!42744 c!7627) b!133544))

(assert (= (and d!42744 (not c!7627)) b!133543))

(assert (= (or b!133544 b!133543) bm!1709))

(assert (= (or b!133544 b!133543) bm!1708))

(assert (= (or b!133544 b!133543) bm!1707))

(assert (= (and d!42744 res!110940) b!133546))

(assert (= (and b!133546 res!110939) b!133547))

(assert (= (and d!42744 (not res!110941)) b!133545))

(declare-fun m!202527 () Bool)

(assert (=> bm!1708 m!202527))

(declare-fun m!202529 () Bool)

(assert (=> b!133544 m!202529))

(declare-fun m!202531 () Bool)

(assert (=> b!133544 m!202531))

(declare-fun m!202533 () Bool)

(assert (=> b!133544 m!202533))

(declare-fun m!202535 () Bool)

(assert (=> b!133544 m!202535))

(declare-fun m!202537 () Bool)

(assert (=> b!133544 m!202537))

(declare-fun m!202539 () Bool)

(assert (=> b!133544 m!202539))

(assert (=> b!133544 m!201147))

(declare-fun m!202541 () Bool)

(assert (=> b!133544 m!202541))

(declare-fun m!202543 () Bool)

(assert (=> b!133544 m!202543))

(declare-fun m!202545 () Bool)

(assert (=> b!133544 m!202545))

(declare-fun m!202547 () Bool)

(assert (=> b!133544 m!202547))

(declare-fun m!202549 () Bool)

(assert (=> b!133544 m!202549))

(declare-fun m!202551 () Bool)

(assert (=> b!133544 m!202551))

(declare-fun m!202553 () Bool)

(assert (=> b!133545 m!202553))

(assert (=> b!133545 m!200887))

(declare-fun m!202555 () Bool)

(assert (=> b!133547 m!202555))

(assert (=> bm!1707 m!202369))

(assert (=> b!133543 m!202463))

(declare-fun m!202557 () Bool)

(assert (=> b!133543 m!202557))

(assert (=> bm!1709 m!202545))

(declare-fun m!202559 () Bool)

(assert (=> bm!1709 m!202559))

(declare-fun m!202561 () Bool)

(assert (=> d!42744 m!202561))

(assert (=> d!42744 m!202369))

(assert (=> d!42253 d!42744))

(declare-fun b!133548 () Bool)

(declare-fun e!88573 () Bool)

(declare-fun e!88575 () Bool)

(assert (=> b!133548 (= e!88573 e!88575)))

(declare-fun c!7628 () Bool)

(declare-fun lt!206666 () tuple4!112)

(assert (=> b!133548 (= c!7628 (= (_3!310 lt!206666) (_4!56 lt!206666)))))

(declare-fun b!133549 () Bool)

(declare-fun e!88574 () Bool)

(assert (=> b!133549 (= e!88575 e!88574)))

(declare-fun res!110945 () Bool)

(declare-fun call!1713 () Bool)

(assert (=> b!133549 (= res!110945 call!1713)))

(assert (=> b!133549 (=> (not res!110945) (not e!88574))))

(declare-fun b!133550 () Bool)

(declare-fun e!88576 () Bool)

(assert (=> b!133550 (= e!88576 e!88573)))

(declare-fun res!110946 () Bool)

(assert (=> b!133550 (=> (not res!110946) (not e!88573))))

(declare-fun e!88572 () Bool)

(assert (=> b!133550 (= res!110946 e!88572)))

(declare-fun res!110943 () Bool)

(assert (=> b!133550 (=> res!110943 e!88572)))

(assert (=> b!133550 (= res!110943 (bvsge (_1!6094 lt!206666) (_2!6094 lt!206666)))))

(declare-fun lt!206668 () (_ BitVec 32))

(assert (=> b!133550 (= lt!206668 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206667 () (_ BitVec 32))

(assert (=> b!133550 (= lt!206667 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133550 (= lt!206666 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(declare-fun b!133551 () Bool)

(declare-fun e!88577 () Bool)

(assert (=> b!133551 (= e!88577 (byteRangesEq!0 (select (arr!3407 (buf!3145 thiss!1634)) (_4!56 lt!206666)) (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_4!56 lt!206666)) #b00000000000000000000000000000000 lt!206668))))

(declare-fun b!133552 () Bool)

(assert (=> b!133552 (= e!88575 call!1713)))

(declare-fun b!133553 () Bool)

(assert (=> b!133553 (= e!88572 (arrayRangesEq!175 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205156)) (_1!6094 lt!206666) (_2!6094 lt!206666)))))

(declare-fun b!133554 () Bool)

(declare-fun res!110942 () Bool)

(assert (=> b!133554 (= res!110942 (= lt!206668 #b00000000000000000000000000000000))))

(assert (=> b!133554 (=> res!110942 e!88577)))

(assert (=> b!133554 (= e!88574 e!88577)))

(declare-fun d!42746 () Bool)

(declare-fun res!110944 () Bool)

(assert (=> d!42746 (=> res!110944 e!88576)))

(assert (=> d!42746 (= res!110944 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))))))

(assert (=> d!42746 (= (arrayBitRangesEq!0 (buf!3145 thiss!1634) (buf!3145 (_2!6085 lt!205156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 thiss!1634)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) e!88576)))

(declare-fun bm!1710 () Bool)

(assert (=> bm!1710 (= call!1713 (byteRangesEq!0 (select (arr!3407 (buf!3145 thiss!1634)) (_3!310 lt!206666)) (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_3!310 lt!206666)) lt!206667 (ite c!7628 lt!206668 #b00000000000000000000000000001000)))))

(assert (= (and d!42746 (not res!110944)) b!133550))

(assert (= (and b!133550 (not res!110943)) b!133553))

(assert (= (and b!133550 res!110946) b!133548))

(assert (= (and b!133548 c!7628) b!133552))

(assert (= (and b!133548 (not c!7628)) b!133549))

(assert (= (and b!133549 res!110945) b!133554))

(assert (= (and b!133554 (not res!110942)) b!133551))

(assert (= (or b!133552 b!133549) bm!1710))

(assert (=> b!133550 m!200969))

(assert (=> b!133550 m!202199))

(declare-fun m!202563 () Bool)

(assert (=> b!133551 m!202563))

(declare-fun m!202565 () Bool)

(assert (=> b!133551 m!202565))

(assert (=> b!133551 m!202563))

(assert (=> b!133551 m!202565))

(declare-fun m!202567 () Bool)

(assert (=> b!133551 m!202567))

(declare-fun m!202569 () Bool)

(assert (=> b!133553 m!202569))

(declare-fun m!202571 () Bool)

(assert (=> bm!1710 m!202571))

(declare-fun m!202573 () Bool)

(assert (=> bm!1710 m!202573))

(assert (=> bm!1710 m!202571))

(assert (=> bm!1710 m!202573))

(declare-fun m!202575 () Bool)

(assert (=> bm!1710 m!202575))

(assert (=> b!133034 d!42746))

(assert (=> b!133034 d!42317))

(assert (=> b!133027 d!42315))

(declare-fun d!42748 () Bool)

(assert (=> d!42748 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 (_2!6085 lt!205156)) lt!205606 lt!205593)))

(declare-fun lt!206669 () Unit!8176)

(assert (=> d!42748 (= lt!206669 (choose!8 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205157)) lt!205606 lt!205593))))

(assert (=> d!42748 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205606) (bvsle lt!205606 lt!205593))))

(assert (=> d!42748 (= (arrayBitRangesEqSymmetric!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205157)) lt!205606 lt!205593) lt!206669)))

(declare-fun bs!10426 () Bool)

(assert (= bs!10426 d!42748))

(assert (=> bs!10426 m!201287))

(declare-fun m!202577 () Bool)

(assert (=> bs!10426 m!202577))

(assert (=> b!133027 d!42748))

(declare-fun b!133555 () Bool)

(declare-fun e!88579 () Bool)

(declare-fun e!88581 () Bool)

(assert (=> b!133555 (= e!88579 e!88581)))

(declare-fun c!7629 () Bool)

(declare-fun lt!206670 () tuple4!112)

(assert (=> b!133555 (= c!7629 (= (_3!310 lt!206670) (_4!56 lt!206670)))))

(declare-fun b!133556 () Bool)

(declare-fun e!88580 () Bool)

(assert (=> b!133556 (= e!88581 e!88580)))

(declare-fun res!110950 () Bool)

(declare-fun call!1714 () Bool)

(assert (=> b!133556 (= res!110950 call!1714)))

(assert (=> b!133556 (=> (not res!110950) (not e!88580))))

(declare-fun b!133557 () Bool)

(declare-fun e!88582 () Bool)

(assert (=> b!133557 (= e!88582 e!88579)))

(declare-fun res!110951 () Bool)

(assert (=> b!133557 (=> (not res!110951) (not e!88579))))

(declare-fun e!88578 () Bool)

(assert (=> b!133557 (= res!110951 e!88578)))

(declare-fun res!110948 () Bool)

(assert (=> b!133557 (=> res!110948 e!88578)))

(assert (=> b!133557 (= res!110948 (bvsge (_1!6094 lt!206670) (_2!6094 lt!206670)))))

(declare-fun lt!206672 () (_ BitVec 32))

(assert (=> b!133557 (= lt!206672 ((_ extract 31 0) (bvsrem lt!205593 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206671 () (_ BitVec 32))

(assert (=> b!133557 (= lt!206671 ((_ extract 31 0) (bvsrem lt!205606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133557 (= lt!206670 (arrayBitIndices!0 lt!205606 lt!205593))))

(declare-fun e!88583 () Bool)

(declare-fun b!133558 () Bool)

(assert (=> b!133558 (= e!88583 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_4!56 lt!206670)) (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_4!56 lt!206670)) #b00000000000000000000000000000000 lt!206672))))

(declare-fun b!133559 () Bool)

(assert (=> b!133559 (= e!88581 call!1714)))

(declare-fun b!133560 () Bool)

(assert (=> b!133560 (= e!88578 (arrayRangesEq!175 (buf!3145 (_2!6085 lt!205157)) (buf!3145 (_2!6085 lt!205156)) (_1!6094 lt!206670) (_2!6094 lt!206670)))))

(declare-fun b!133561 () Bool)

(declare-fun res!110947 () Bool)

(assert (=> b!133561 (= res!110947 (= lt!206672 #b00000000000000000000000000000000))))

(assert (=> b!133561 (=> res!110947 e!88583)))

(assert (=> b!133561 (= e!88580 e!88583)))

(declare-fun d!42750 () Bool)

(declare-fun res!110949 () Bool)

(assert (=> d!42750 (=> res!110949 e!88582)))

(assert (=> d!42750 (= res!110949 (bvsge lt!205606 lt!205593))))

(assert (=> d!42750 (= (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205157)) (buf!3145 (_2!6085 lt!205156)) lt!205606 lt!205593) e!88582)))

(declare-fun bm!1711 () Bool)

(assert (=> bm!1711 (= call!1714 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_3!310 lt!206670)) (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_3!310 lt!206670)) lt!206671 (ite c!7629 lt!206672 #b00000000000000000000000000001000)))))

(assert (= (and d!42750 (not res!110949)) b!133557))

(assert (= (and b!133557 (not res!110948)) b!133560))

(assert (= (and b!133557 res!110951) b!133555))

(assert (= (and b!133555 c!7629) b!133559))

(assert (= (and b!133555 (not c!7629)) b!133556))

(assert (= (and b!133556 res!110950) b!133561))

(assert (= (and b!133561 (not res!110947)) b!133558))

(assert (= (or b!133559 b!133556) bm!1711))

(declare-fun m!202579 () Bool)

(assert (=> b!133557 m!202579))

(declare-fun m!202581 () Bool)

(assert (=> b!133558 m!202581))

(declare-fun m!202583 () Bool)

(assert (=> b!133558 m!202583))

(assert (=> b!133558 m!202581))

(assert (=> b!133558 m!202583))

(declare-fun m!202585 () Bool)

(assert (=> b!133558 m!202585))

(declare-fun m!202587 () Bool)

(assert (=> b!133560 m!202587))

(declare-fun m!202589 () Bool)

(assert (=> bm!1711 m!202589))

(declare-fun m!202591 () Bool)

(assert (=> bm!1711 m!202591))

(assert (=> bm!1711 m!202589))

(assert (=> bm!1711 m!202591))

(declare-fun m!202593 () Bool)

(assert (=> bm!1711 m!202593))

(assert (=> b!133027 d!42750))

(assert (=> d!42255 d!42608))

(assert (=> d!42307 d!42732))

(declare-fun d!42752 () Bool)

(assert (=> d!42752 (isPrefixOf!0 lt!205620 (_2!6085 lt!205156))))

(declare-fun lt!206673 () Unit!8176)

(assert (=> d!42752 (= lt!206673 (choose!30 lt!205620 (_2!6085 lt!205156) (_2!6085 lt!205156)))))

(assert (=> d!42752 (isPrefixOf!0 lt!205620 (_2!6085 lt!205156))))

(assert (=> d!42752 (= (lemmaIsPrefixTransitive!0 lt!205620 (_2!6085 lt!205156) (_2!6085 lt!205156)) lt!206673)))

(declare-fun bs!10427 () Bool)

(assert (= bs!10427 d!42752))

(assert (=> bs!10427 m!201329))

(declare-fun m!202595 () Bool)

(assert (=> bs!10427 m!202595))

(assert (=> bs!10427 m!201329))

(assert (=> d!42307 d!42752))

(declare-fun d!42754 () Bool)

(assert (=> d!42754 (isPrefixOf!0 lt!205620 (_2!6085 lt!205156))))

(declare-fun lt!206674 () Unit!8176)

(assert (=> d!42754 (= lt!206674 (choose!30 lt!205620 thiss!1634 (_2!6085 lt!205156)))))

(assert (=> d!42754 (isPrefixOf!0 lt!205620 thiss!1634)))

(assert (=> d!42754 (= (lemmaIsPrefixTransitive!0 lt!205620 thiss!1634 (_2!6085 lt!205156)) lt!206674)))

(declare-fun bs!10428 () Bool)

(assert (= bs!10428 d!42754))

(assert (=> bs!10428 m!201329))

(declare-fun m!202597 () Bool)

(assert (=> bs!10428 m!202597))

(declare-fun m!202599 () Bool)

(assert (=> bs!10428 m!202599))

(assert (=> d!42307 d!42754))

(declare-fun d!42756 () Bool)

(declare-fun res!110953 () Bool)

(declare-fun e!88585 () Bool)

(assert (=> d!42756 (=> (not res!110953) (not e!88585))))

(assert (=> d!42756 (= res!110953 (= (size!2772 (buf!3145 (_1!6084 lt!205624))) (size!2772 (buf!3145 (_2!6084 lt!205624)))))))

(assert (=> d!42756 (= (isPrefixOf!0 (_1!6084 lt!205624) (_2!6084 lt!205624)) e!88585)))

(declare-fun b!133562 () Bool)

(declare-fun res!110952 () Bool)

(assert (=> b!133562 (=> (not res!110952) (not e!88585))))

(assert (=> b!133562 (= res!110952 (bvsle (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205624))) (currentByte!5930 (_1!6084 lt!205624)) (currentBit!5925 (_1!6084 lt!205624))) (bitIndex!0 (size!2772 (buf!3145 (_2!6084 lt!205624))) (currentByte!5930 (_2!6084 lt!205624)) (currentBit!5925 (_2!6084 lt!205624)))))))

(declare-fun b!133563 () Bool)

(declare-fun e!88584 () Bool)

(assert (=> b!133563 (= e!88585 e!88584)))

(declare-fun res!110954 () Bool)

(assert (=> b!133563 (=> res!110954 e!88584)))

(assert (=> b!133563 (= res!110954 (= (size!2772 (buf!3145 (_1!6084 lt!205624))) #b00000000000000000000000000000000))))

(declare-fun b!133564 () Bool)

(assert (=> b!133564 (= e!88584 (arrayBitRangesEq!0 (buf!3145 (_1!6084 lt!205624)) (buf!3145 (_2!6084 lt!205624)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_1!6084 lt!205624))) (currentByte!5930 (_1!6084 lt!205624)) (currentBit!5925 (_1!6084 lt!205624)))))))

(assert (= (and d!42756 res!110953) b!133562))

(assert (= (and b!133562 res!110952) b!133563))

(assert (= (and b!133563 (not res!110954)) b!133564))

(assert (=> b!133562 m!202241))

(assert (=> b!133562 m!202219))

(assert (=> b!133564 m!202241))

(assert (=> b!133564 m!202241))

(declare-fun m!202601 () Bool)

(assert (=> b!133564 m!202601))

(assert (=> d!42307 d!42756))

(assert (=> d!42307 d!42634))

(assert (=> d!42307 d!42303))

(declare-fun d!42758 () Bool)

(declare-fun res!110956 () Bool)

(declare-fun e!88587 () Bool)

(assert (=> d!42758 (=> (not res!110956) (not e!88587))))

(assert (=> d!42758 (= res!110956 (= (size!2772 (buf!3145 lt!205620)) (size!2772 (buf!3145 (_2!6085 lt!205156)))))))

(assert (=> d!42758 (= (isPrefixOf!0 lt!205620 (_2!6085 lt!205156)) e!88587)))

(declare-fun b!133565 () Bool)

(declare-fun res!110955 () Bool)

(assert (=> b!133565 (=> (not res!110955) (not e!88587))))

(assert (=> b!133565 (= res!110955 (bvsle (bitIndex!0 (size!2772 (buf!3145 lt!205620)) (currentByte!5930 lt!205620) (currentBit!5925 lt!205620)) (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun b!133566 () Bool)

(declare-fun e!88586 () Bool)

(assert (=> b!133566 (= e!88587 e!88586)))

(declare-fun res!110957 () Bool)

(assert (=> b!133566 (=> res!110957 e!88586)))

(assert (=> b!133566 (= res!110957 (= (size!2772 (buf!3145 lt!205620)) #b00000000000000000000000000000000))))

(declare-fun b!133567 () Bool)

(assert (=> b!133567 (= e!88586 (arrayBitRangesEq!0 (buf!3145 lt!205620) (buf!3145 (_2!6085 lt!205156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 lt!205620)) (currentByte!5930 lt!205620) (currentBit!5925 lt!205620))))))

(assert (= (and d!42758 res!110956) b!133565))

(assert (= (and b!133565 res!110955) b!133566))

(assert (= (and b!133566 (not res!110957)) b!133567))

(declare-fun m!202603 () Bool)

(assert (=> b!133565 m!202603))

(assert (=> b!133565 m!200955))

(assert (=> b!133567 m!202603))

(assert (=> b!133567 m!202603))

(declare-fun m!202605 () Bool)

(assert (=> b!133567 m!202605))

(assert (=> d!42307 d!42758))

(declare-fun d!42760 () Bool)

(assert (=> d!42760 (isPrefixOf!0 lt!205620 lt!205620)))

(declare-fun lt!206675 () Unit!8176)

(assert (=> d!42760 (= lt!206675 (choose!11 lt!205620))))

(assert (=> d!42760 (= (lemmaIsPrefixRefl!0 lt!205620) lt!206675)))

(declare-fun bs!10429 () Bool)

(assert (= bs!10429 d!42760))

(assert (=> bs!10429 m!201333))

(declare-fun m!202607 () Bool)

(assert (=> bs!10429 m!202607))

(assert (=> d!42307 d!42760))

(assert (=> d!42307 d!42648))

(assert (=> d!42307 d!42728))

(declare-fun d!42762 () Bool)

(declare-fun res!110959 () Bool)

(declare-fun e!88589 () Bool)

(assert (=> d!42762 (=> (not res!110959) (not e!88589))))

(assert (=> d!42762 (= res!110959 (= (size!2772 (buf!3145 lt!205620)) (size!2772 (buf!3145 lt!205620))))))

(assert (=> d!42762 (= (isPrefixOf!0 lt!205620 lt!205620) e!88589)))

(declare-fun b!133568 () Bool)

(declare-fun res!110958 () Bool)

(assert (=> b!133568 (=> (not res!110958) (not e!88589))))

(assert (=> b!133568 (= res!110958 (bvsle (bitIndex!0 (size!2772 (buf!3145 lt!205620)) (currentByte!5930 lt!205620) (currentBit!5925 lt!205620)) (bitIndex!0 (size!2772 (buf!3145 lt!205620)) (currentByte!5930 lt!205620) (currentBit!5925 lt!205620))))))

(declare-fun b!133569 () Bool)

(declare-fun e!88588 () Bool)

(assert (=> b!133569 (= e!88589 e!88588)))

(declare-fun res!110960 () Bool)

(assert (=> b!133569 (=> res!110960 e!88588)))

(assert (=> b!133569 (= res!110960 (= (size!2772 (buf!3145 lt!205620)) #b00000000000000000000000000000000))))

(declare-fun b!133570 () Bool)

(assert (=> b!133570 (= e!88588 (arrayBitRangesEq!0 (buf!3145 lt!205620) (buf!3145 lt!205620) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 lt!205620)) (currentByte!5930 lt!205620) (currentBit!5925 lt!205620))))))

(assert (= (and d!42762 res!110959) b!133568))

(assert (= (and b!133568 res!110958) b!133569))

(assert (= (and b!133569 (not res!110960)) b!133570))

(assert (=> b!133568 m!202603))

(assert (=> b!133568 m!202603))

(assert (=> b!133570 m!202603))

(assert (=> b!133570 m!202603))

(declare-fun m!202609 () Bool)

(assert (=> b!133570 m!202609))

(assert (=> d!42307 d!42762))

(declare-fun d!42764 () Bool)

(declare-fun e!88590 () Bool)

(assert (=> d!42764 e!88590))

(declare-fun res!110961 () Bool)

(assert (=> d!42764 (=> (not res!110961) (not e!88590))))

(declare-fun lt!206681 () (_ BitVec 64))

(declare-fun lt!206679 () (_ BitVec 64))

(declare-fun lt!206680 () (_ BitVec 64))

(assert (=> d!42764 (= res!110961 (= lt!206679 (bvsub lt!206680 lt!206681)))))

(assert (=> d!42764 (or (= (bvand lt!206680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206681 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206680 lt!206681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42764 (= lt!206681 (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205570))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205570)))))))

(declare-fun lt!206678 () (_ BitVec 64))

(declare-fun lt!206677 () (_ BitVec 64))

(assert (=> d!42764 (= lt!206680 (bvmul lt!206678 lt!206677))))

(assert (=> d!42764 (or (= lt!206678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!206677 (bvsdiv (bvmul lt!206678 lt!206677) lt!206678)))))

(assert (=> d!42764 (= lt!206677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42764 (= lt!206678 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))))))

(assert (=> d!42764 (= lt!206679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205570))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205570)))))))

(assert (=> d!42764 (invariant!0 (currentBit!5925 (_2!6085 lt!205570)) (currentByte!5930 (_2!6085 lt!205570)) (size!2772 (buf!3145 (_2!6085 lt!205570))))))

(assert (=> d!42764 (= (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205570))) (currentByte!5930 (_2!6085 lt!205570)) (currentBit!5925 (_2!6085 lt!205570))) lt!206679)))

(declare-fun b!133571 () Bool)

(declare-fun res!110962 () Bool)

(assert (=> b!133571 (=> (not res!110962) (not e!88590))))

(assert (=> b!133571 (= res!110962 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!206679))))

(declare-fun b!133572 () Bool)

(declare-fun lt!206676 () (_ BitVec 64))

(assert (=> b!133572 (= e!88590 (bvsle lt!206679 (bvmul lt!206676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133572 (or (= lt!206676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206676)))))

(assert (=> b!133572 (= lt!206676 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))))))

(assert (= (and d!42764 res!110961) b!133571))

(assert (= (and b!133571 res!110962) b!133572))

(declare-fun m!202611 () Bool)

(assert (=> d!42764 m!202611))

(declare-fun m!202613 () Bool)

(assert (=> d!42764 m!202613))

(assert (=> b!133026 d!42764))

(assert (=> b!133026 d!42315))

(assert (=> d!42247 d!42213))

(declare-fun d!42766 () Bool)

(assert (=> d!42766 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!42766 true))

(declare-fun _$5!33 () Unit!8176)

(assert (=> d!42766 (= (choose!26 thiss!1634 (buf!3145 (_2!6085 lt!205157)) (bvsub to!404 from!447) (BitStream!4809 (buf!3145 (_2!6085 lt!205157)) (currentByte!5930 thiss!1634) (currentBit!5925 thiss!1634))) _$5!33)))

(declare-fun bs!10430 () Bool)

(assert (= bs!10430 d!42766))

(assert (=> bs!10430 m!200895))

(assert (=> d!42247 d!42766))

(declare-fun d!42768 () Bool)

(assert (=> d!42768 (= (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) ((_ sign_extend 32) (currentByte!5930 thiss!1634)) ((_ sign_extend 32) (currentBit!5925 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205157)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5930 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5925 thiss!1634)))))))

(assert (=> d!42213 d!42768))

(declare-fun lt!206682 () tuple3!504)

(declare-fun d!42770 () Bool)

(assert (=> d!42770 (= lt!206682 (readByteArrayLoop!0 (_1!6084 lt!205576) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42770 (= (readByteArrayLoopPure!0 (_1!6084 lt!205576) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11553 (_2!6088 lt!206682) (_3!307 lt!206682)))))

(declare-fun bs!10431 () Bool)

(assert (= bs!10431 d!42770))

(declare-fun m!202615 () Bool)

(assert (=> bs!10431 m!202615))

(assert (=> b!133024 d!42770))

(declare-fun d!42772 () Bool)

(assert (=> d!42772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205572) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) lt!205572))))

(declare-fun bs!10432 () Bool)

(assert (= bs!10432 d!42772))

(declare-fun m!202617 () Bool)

(assert (=> bs!10432 m!202617))

(assert (=> b!133024 d!42772))

(declare-fun d!42774 () Bool)

(assert (=> d!42774 (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205570)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205572)))

(declare-fun lt!206683 () Unit!8176)

(assert (=> d!42774 (= lt!206683 (choose!9 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205570)) lt!205572 (BitStream!4809 (buf!3145 (_2!6085 lt!205570)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (=> d!42774 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6085 lt!205156) (buf!3145 (_2!6085 lt!205570)) lt!205572) lt!206683)))

(declare-fun bs!10433 () Bool)

(assert (= bs!10433 d!42774))

(assert (=> bs!10433 m!201257))

(declare-fun m!202619 () Bool)

(assert (=> bs!10433 m!202619))

(assert (=> b!133024 d!42774))

(declare-fun b!133573 () Bool)

(declare-fun e!88592 () Unit!8176)

(declare-fun lt!206703 () Unit!8176)

(assert (=> b!133573 (= e!88592 lt!206703)))

(declare-fun lt!206700 () (_ BitVec 64))

(assert (=> b!133573 (= lt!206700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!206687 () (_ BitVec 64))

(assert (=> b!133573 (= lt!206687 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(assert (=> b!133573 (= lt!206703 (arrayBitRangesEqSymmetric!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205570)) lt!206700 lt!206687))))

(assert (=> b!133573 (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205570)) (buf!3145 (_2!6085 lt!205156)) lt!206700 lt!206687)))

(declare-fun d!42776 () Bool)

(declare-fun e!88591 () Bool)

(assert (=> d!42776 e!88591))

(declare-fun res!110964 () Bool)

(assert (=> d!42776 (=> (not res!110964) (not e!88591))))

(declare-fun lt!206696 () tuple2!11556)

(assert (=> d!42776 (= res!110964 (isPrefixOf!0 (_1!6084 lt!206696) (_2!6084 lt!206696)))))

(declare-fun lt!206692 () BitStream!4808)

(assert (=> d!42776 (= lt!206696 (tuple2!11557 lt!206692 (_2!6085 lt!205570)))))

(declare-fun lt!206695 () Unit!8176)

(declare-fun lt!206689 () Unit!8176)

(assert (=> d!42776 (= lt!206695 lt!206689)))

(assert (=> d!42776 (isPrefixOf!0 lt!206692 (_2!6085 lt!205570))))

(assert (=> d!42776 (= lt!206689 (lemmaIsPrefixTransitive!0 lt!206692 (_2!6085 lt!205570) (_2!6085 lt!205570)))))

(declare-fun lt!206686 () Unit!8176)

(declare-fun lt!206688 () Unit!8176)

(assert (=> d!42776 (= lt!206686 lt!206688)))

(assert (=> d!42776 (isPrefixOf!0 lt!206692 (_2!6085 lt!205570))))

(assert (=> d!42776 (= lt!206688 (lemmaIsPrefixTransitive!0 lt!206692 (_2!6085 lt!205156) (_2!6085 lt!205570)))))

(declare-fun lt!206684 () Unit!8176)

(assert (=> d!42776 (= lt!206684 e!88592)))

(declare-fun c!7630 () Bool)

(assert (=> d!42776 (= c!7630 (not (= (size!2772 (buf!3145 (_2!6085 lt!205156))) #b00000000000000000000000000000000)))))

(declare-fun lt!206701 () Unit!8176)

(declare-fun lt!206698 () Unit!8176)

(assert (=> d!42776 (= lt!206701 lt!206698)))

(assert (=> d!42776 (isPrefixOf!0 (_2!6085 lt!205570) (_2!6085 lt!205570))))

(assert (=> d!42776 (= lt!206698 (lemmaIsPrefixRefl!0 (_2!6085 lt!205570)))))

(declare-fun lt!206694 () Unit!8176)

(declare-fun lt!206699 () Unit!8176)

(assert (=> d!42776 (= lt!206694 lt!206699)))

(assert (=> d!42776 (= lt!206699 (lemmaIsPrefixRefl!0 (_2!6085 lt!205570)))))

(declare-fun lt!206685 () Unit!8176)

(declare-fun lt!206702 () Unit!8176)

(assert (=> d!42776 (= lt!206685 lt!206702)))

(assert (=> d!42776 (isPrefixOf!0 lt!206692 lt!206692)))

(assert (=> d!42776 (= lt!206702 (lemmaIsPrefixRefl!0 lt!206692))))

(declare-fun lt!206693 () Unit!8176)

(declare-fun lt!206691 () Unit!8176)

(assert (=> d!42776 (= lt!206693 lt!206691)))

(assert (=> d!42776 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205156))))

(assert (=> d!42776 (= lt!206691 (lemmaIsPrefixRefl!0 (_2!6085 lt!205156)))))

(assert (=> d!42776 (= lt!206692 (BitStream!4809 (buf!3145 (_2!6085 lt!205570)) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(assert (=> d!42776 (isPrefixOf!0 (_2!6085 lt!205156) (_2!6085 lt!205570))))

(assert (=> d!42776 (= (reader!0 (_2!6085 lt!205156) (_2!6085 lt!205570)) lt!206696)))

(declare-fun b!133574 () Bool)

(declare-fun lt!206690 () (_ BitVec 64))

(declare-fun lt!206697 () (_ BitVec 64))

(assert (=> b!133574 (= e!88591 (= (_1!6084 lt!206696) (withMovedBitIndex!0 (_2!6084 lt!206696) (bvsub lt!206697 lt!206690))))))

(assert (=> b!133574 (or (= (bvand lt!206697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206697 lt!206690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133574 (= lt!206690 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205570))) (currentByte!5930 (_2!6085 lt!205570)) (currentBit!5925 (_2!6085 lt!205570))))))

(assert (=> b!133574 (= lt!206697 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))))))

(declare-fun b!133575 () Bool)

(declare-fun res!110965 () Bool)

(assert (=> b!133575 (=> (not res!110965) (not e!88591))))

(assert (=> b!133575 (= res!110965 (isPrefixOf!0 (_1!6084 lt!206696) (_2!6085 lt!205156)))))

(declare-fun b!133576 () Bool)

(declare-fun Unit!8280 () Unit!8176)

(assert (=> b!133576 (= e!88592 Unit!8280)))

(declare-fun b!133577 () Bool)

(declare-fun res!110963 () Bool)

(assert (=> b!133577 (=> (not res!110963) (not e!88591))))

(assert (=> b!133577 (= res!110963 (isPrefixOf!0 (_2!6084 lt!206696) (_2!6085 lt!205570)))))

(assert (= (and d!42776 c!7630) b!133573))

(assert (= (and d!42776 (not c!7630)) b!133576))

(assert (= (and d!42776 res!110964) b!133575))

(assert (= (and b!133575 res!110965) b!133577))

(assert (= (and b!133577 res!110963) b!133574))

(declare-fun m!202621 () Bool)

(assert (=> b!133575 m!202621))

(declare-fun m!202623 () Bool)

(assert (=> b!133574 m!202623))

(assert (=> b!133574 m!201263))

(assert (=> b!133574 m!200955))

(assert (=> b!133573 m!200955))

(declare-fun m!202625 () Bool)

(assert (=> b!133573 m!202625))

(declare-fun m!202627 () Bool)

(assert (=> b!133573 m!202627))

(declare-fun m!202629 () Bool)

(assert (=> d!42776 m!202629))

(declare-fun m!202631 () Bool)

(assert (=> d!42776 m!202631))

(declare-fun m!202633 () Bool)

(assert (=> d!42776 m!202633))

(declare-fun m!202635 () Bool)

(assert (=> d!42776 m!202635))

(declare-fun m!202637 () Bool)

(assert (=> d!42776 m!202637))

(assert (=> d!42776 m!201297))

(declare-fun m!202639 () Bool)

(assert (=> d!42776 m!202639))

(assert (=> d!42776 m!201301))

(assert (=> d!42776 m!201267))

(declare-fun m!202641 () Bool)

(assert (=> d!42776 m!202641))

(declare-fun m!202643 () Bool)

(assert (=> d!42776 m!202643))

(declare-fun m!202645 () Bool)

(assert (=> b!133577 m!202645))

(assert (=> b!133024 d!42776))

(declare-fun b!133578 () Bool)

(declare-fun e!88594 () Bool)

(declare-fun e!88596 () Bool)

(assert (=> b!133578 (= e!88594 e!88596)))

(declare-fun c!7631 () Bool)

(declare-fun lt!206704 () tuple4!112)

(assert (=> b!133578 (= c!7631 (= (_3!310 lt!206704) (_4!56 lt!206704)))))

(declare-fun b!133579 () Bool)

(declare-fun e!88595 () Bool)

(assert (=> b!133579 (= e!88596 e!88595)))

(declare-fun res!110969 () Bool)

(declare-fun call!1715 () Bool)

(assert (=> b!133579 (= res!110969 call!1715)))

(assert (=> b!133579 (=> (not res!110969) (not e!88595))))

(declare-fun b!133580 () Bool)

(declare-fun e!88597 () Bool)

(assert (=> b!133580 (= e!88597 e!88594)))

(declare-fun res!110970 () Bool)

(assert (=> b!133580 (=> (not res!110970) (not e!88594))))

(declare-fun e!88593 () Bool)

(assert (=> b!133580 (= res!110970 e!88593)))

(declare-fun res!110967 () Bool)

(assert (=> b!133580 (=> res!110967 e!88593)))

(assert (=> b!133580 (= res!110967 (bvsge (_1!6094 lt!206704) (_2!6094 lt!206704)))))

(declare-fun lt!206706 () (_ BitVec 32))

(assert (=> b!133580 (= lt!206706 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206705 () (_ BitVec 32))

(assert (=> b!133580 (= lt!206705 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133580 (= lt!206704 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(declare-fun e!88598 () Bool)

(declare-fun b!133581 () Bool)

(assert (=> b!133581 (= e!88598 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_4!56 lt!206704)) (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_4!56 lt!206704)) #b00000000000000000000000000000000 lt!206706))))

(declare-fun b!133582 () Bool)

(assert (=> b!133582 (= e!88596 call!1715)))

(declare-fun b!133583 () Bool)

(assert (=> b!133583 (= e!88593 (arrayRangesEq!175 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205157)) (_1!6094 lt!206704) (_2!6094 lt!206704)))))

(declare-fun b!133584 () Bool)

(declare-fun res!110966 () Bool)

(assert (=> b!133584 (= res!110966 (= lt!206706 #b00000000000000000000000000000000))))

(assert (=> b!133584 (=> res!110966 e!88598)))

(assert (=> b!133584 (= e!88595 e!88598)))

(declare-fun d!42778 () Bool)

(declare-fun res!110968 () Bool)

(assert (=> d!42778 (=> res!110968 e!88597)))

(assert (=> d!42778 (= res!110968 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))))))

(assert (=> d!42778 (= (arrayBitRangesEq!0 (buf!3145 (_2!6085 lt!205156)) (buf!3145 (_2!6085 lt!205157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2772 (buf!3145 (_2!6085 lt!205156))) (currentByte!5930 (_2!6085 lt!205156)) (currentBit!5925 (_2!6085 lt!205156)))) e!88597)))

(declare-fun bm!1712 () Bool)

(assert (=> bm!1712 (= call!1715 (byteRangesEq!0 (select (arr!3407 (buf!3145 (_2!6085 lt!205156))) (_3!310 lt!206704)) (select (arr!3407 (buf!3145 (_2!6085 lt!205157))) (_3!310 lt!206704)) lt!206705 (ite c!7631 lt!206706 #b00000000000000000000000000001000)))))

(assert (= (and d!42778 (not res!110968)) b!133580))

(assert (= (and b!133580 (not res!110967)) b!133583))

(assert (= (and b!133580 res!110970) b!133578))

(assert (= (and b!133578 c!7631) b!133582))

(assert (= (and b!133578 (not c!7631)) b!133579))

(assert (= (and b!133579 res!110969) b!133584))

(assert (= (and b!133584 (not res!110966)) b!133581))

(assert (= (or b!133582 b!133579) bm!1712))

(assert (=> b!133580 m!200955))

(declare-fun m!202647 () Bool)

(assert (=> b!133580 m!202647))

(declare-fun m!202649 () Bool)

(assert (=> b!133581 m!202649))

(declare-fun m!202651 () Bool)

(assert (=> b!133581 m!202651))

(assert (=> b!133581 m!202649))

(assert (=> b!133581 m!202651))

(declare-fun m!202653 () Bool)

(assert (=> b!133581 m!202653))

(declare-fun m!202655 () Bool)

(assert (=> b!133583 m!202655))

(declare-fun m!202657 () Bool)

(assert (=> bm!1712 m!202657))

(declare-fun m!202659 () Bool)

(assert (=> bm!1712 m!202659))

(assert (=> bm!1712 m!202657))

(assert (=> bm!1712 m!202659))

(declare-fun m!202661 () Bool)

(assert (=> bm!1712 m!202661))

(assert (=> b!133042 d!42778))

(assert (=> b!133042 d!42315))

(assert (=> b!133040 d!42315))

(assert (=> b!133040 d!42329))

(declare-fun d!42780 () Bool)

(declare-fun res!110971 () Bool)

(declare-fun e!88599 () Bool)

(assert (=> d!42780 (=> res!110971 e!88599)))

(assert (=> d!42780 (= res!110971 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42780 (= (arrayRangesEq!175 (_2!6082 lt!205153) (_2!6082 lt!205151) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!88599)))

(declare-fun b!133585 () Bool)

(declare-fun e!88600 () Bool)

(assert (=> b!133585 (= e!88599 e!88600)))

(declare-fun res!110972 () Bool)

(assert (=> b!133585 (=> (not res!110972) (not e!88600))))

(assert (=> b!133585 (= res!110972 (= (select (arr!3407 (_2!6082 lt!205153)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3407 (_2!6082 lt!205151)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!133586 () Bool)

(assert (=> b!133586 (= e!88600 (arrayRangesEq!175 (_2!6082 lt!205153) (_2!6082 lt!205151) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42780 (not res!110971)) b!133585))

(assert (= (and b!133585 res!110972) b!133586))

(declare-fun m!202663 () Bool)

(assert (=> b!133585 m!202663))

(declare-fun m!202665 () Bool)

(assert (=> b!133585 m!202665))

(declare-fun m!202667 () Bool)

(assert (=> b!133586 m!202667))

(assert (=> b!133008 d!42780))

(declare-fun d!42782 () Bool)

(assert (=> d!42782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156))) lt!205572) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2772 (buf!3145 (_2!6085 lt!205156)))) ((_ sign_extend 32) (currentByte!5930 (_2!6085 lt!205156))) ((_ sign_extend 32) (currentBit!5925 (_2!6085 lt!205156)))) lt!205572))))

(declare-fun bs!10434 () Bool)

(assert (= bs!10434 d!42782))

(assert (=> bs!10434 m!201165))

(assert (=> b!133022 d!42782))

(push 1)

(assert (not b!133531))

(assert (not d!42774))

(assert (not d!42692))

(assert (not d!42658))

(assert (not b!133511))

(assert (not b!133574))

(assert (not b!133505))

(assert (not d!42684))

(assert (not b!133449))

(assert (not b!133384))

(assert (not b!133581))

(assert (not b!133443))

(assert (not b!133450))

(assert (not b!133529))

(assert (not bm!1703))

(assert (not b!133558))

(assert (not d!42770))

(assert (not b!133425))

(assert (not b!133486))

(assert (not d!42612))

(assert (not b!133438))

(assert (not d!42626))

(assert (not d!42760))

(assert (not b!133560))

(assert (not d!42618))

(assert (not b!133575))

(assert (not b!133467))

(assert (not b!133577))

(assert (not d!42704))

(assert (not b!133513))

(assert (not d!42670))

(assert (not d!42650))

(assert (not b!133436))

(assert (not d!42708))

(assert (not b!133528))

(assert (not d!42636))

(assert (not d!42730))

(assert (not b!133515))

(assert (not bm!1702))

(assert (not b!133400))

(assert (not d!42600))

(assert (not b!133543))

(assert (not b!133540))

(assert (not b!133468))

(assert (not d!42672))

(assert (not b!133491))

(assert (not bm!1689))

(assert (not b!133481))

(assert (not d!42718))

(assert (not d!42604))

(assert (not b!133526))

(assert (not d!42764))

(assert (not b!133564))

(assert (not b!133545))

(assert (not b!133553))

(assert (not bm!1699))

(assert (not bm!1707))

(assert (not b!133464))

(assert (not d!42660))

(assert (not b!133547))

(assert (not b!133479))

(assert (not b!133525))

(assert (not d!42696))

(assert (not b!133494))

(assert (not d!42662))

(assert (not b!133489))

(assert (not b!133447))

(assert (not b!133557))

(assert (not b!133476))

(assert (not d!42632))

(assert (not b!133550))

(assert (not b!133567))

(assert (not bm!1708))

(assert (not d!42748))

(assert (not b!133544))

(assert (not d!42766))

(assert (not bm!1701))

(assert (not b!133381))

(assert (not b!133508))

(assert (not b!133441))

(assert (not bm!1711))

(assert (not d!42614))

(assert (not d!42622))

(assert (not b!133538))

(assert (not d!42648))

(assert (not d!42754))

(assert (not b!133456))

(assert (not bm!1696))

(assert (not b!133437))

(assert (not d!42694))

(assert (not b!133452))

(assert (not b!133496))

(assert (not b!133516))

(assert (not b!133551))

(assert (not d!42776))

(assert (not bm!1710))

(assert (not b!133536))

(assert (not b!133419))

(assert (not d!42726))

(assert (not b!133455))

(assert (not b!133583))

(assert (not b!133580))

(assert (not b!133440))

(assert (not b!133470))

(assert (not bm!1706))

(assert (not b!133518))

(assert (not b!133510))

(assert (not d!42728))

(assert (not b!133382))

(assert (not b!133477))

(assert (not b!133573))

(assert (not bm!1712))

(assert (not b!133458))

(assert (not b!133398))

(assert (not b!133523))

(assert (not b!133444))

(assert (not d!42744))

(assert (not bm!1705))

(assert (not b!133534))

(assert (not b!133570))

(assert (not d!42782))

(assert (not b!133416))

(assert (not b!133507))

(assert (not b!133562))

(assert (not b!133439))

(assert (not bm!1697))

(assert (not b!133396))

(assert (not d!42640))

(assert (not d!42706))

(assert (not d!42702))

(assert (not d!42740))

(assert (not b!133462))

(assert (not b!133509))

(assert (not d!42606))

(assert (not b!133397))

(assert (not b!133493))

(assert (not b!133487))

(assert (not b!133417))

(assert (not b!133484))

(assert (not b!133475))

(assert (not d!42630))

(assert (not b!133520))

(assert (not bm!1709))

(assert (not d!42716))

(assert (not b!133483))

(assert (not b!133542))

(assert (not d!42772))

(assert (not b!133533))

(assert (not b!133406))

(assert (not b!133423))

(assert (not d!42734))

(assert (not b!133586))

(assert (not b!133446))

(assert (not d!42678))

(assert (not bm!1698))

(assert (not b!133506))

(assert (not bm!1704))

(assert (not b!133568))

(assert (not d!42616))

(assert (not b!133453))

(assert (not b!133514))

(assert (not d!42686))

(assert (not b!133565))

(assert (not d!42654))

(assert (not d!42710))

(assert (not bm!1700))

(assert (not b!133522))

(assert (not d!42752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

