; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7914 () Bool)

(assert start!7914)

(declare-fun b!38834 () Bool)

(declare-fun e!25530 () Bool)

(declare-fun e!25518 () Bool)

(assert (=> b!38834 (= e!25530 e!25518)))

(declare-fun res!32984 () Bool)

(assert (=> b!38834 (=> res!32984 e!25518)))

(declare-fun lt!59156 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1965 0))(
  ( (array!1966 (arr!1381 (Array (_ BitVec 32) (_ BitVec 8))) (size!885 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1520 0))(
  ( (BitStream!1521 (buf!1213 array!1965) (currentByte!2625 (_ BitVec 32)) (currentBit!2620 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2791 0))(
  ( (Unit!2792) )
))
(declare-datatypes ((tuple2!3754 0))(
  ( (tuple2!3755 (_1!1964 Unit!2791) (_2!1964 BitStream!1520)) )
))
(declare-fun lt!59142 () tuple2!3754)

(declare-fun srcBuffer!2 () array!1965)

(declare-datatypes ((List!461 0))(
  ( (Nil!458) (Cons!457 (h!576 Bool) (t!1211 List!461)) )
))
(declare-fun head!298 (List!461) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1520 array!1965 (_ BitVec 64) (_ BitVec 64)) List!461)

(assert (=> b!38834 (= res!32984 (not (= (head!298 (byteArrayBitContentToList!0 (_2!1964 lt!59142) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59156)))))

(declare-fun bitAt!0 (array!1965 (_ BitVec 64)) Bool)

(assert (=> b!38834 (= lt!59156 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!38835 () Bool)

(declare-fun res!32977 () Bool)

(declare-fun e!25519 () Bool)

(assert (=> b!38835 (=> res!32977 e!25519)))

(declare-fun lt!59161 () List!461)

(declare-fun length!187 (List!461) Int)

(assert (=> b!38835 (= res!32977 (<= (length!187 lt!59161) 0))))

(declare-fun b!38836 () Bool)

(declare-fun res!32986 () Bool)

(declare-fun e!25528 () Bool)

(assert (=> b!38836 (=> (not res!32986) (not e!25528))))

(declare-fun thiss!1379 () BitStream!1520)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38836 (= res!32986 (validate_offset_bits!1 ((_ sign_extend 32) (size!885 (buf!1213 thiss!1379))) ((_ sign_extend 32) (currentByte!2625 thiss!1379)) ((_ sign_extend 32) (currentBit!2620 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38837 () Bool)

(declare-fun e!25522 () Bool)

(declare-fun e!25517 () Bool)

(assert (=> b!38837 (= e!25522 e!25517)))

(declare-fun res!32974 () Bool)

(assert (=> b!38837 (=> res!32974 e!25517)))

(declare-fun lt!59158 () tuple2!3754)

(assert (=> b!38837 (= res!32974 (not (= (size!885 (buf!1213 (_2!1964 lt!59158))) (size!885 (buf!1213 (_2!1964 lt!59142))))))))

(declare-fun lt!59160 () (_ BitVec 64))

(declare-fun lt!59141 () (_ BitVec 64))

(assert (=> b!38837 (= lt!59160 (bvsub (bvsub (bvadd lt!59141 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38837 (= lt!59141 (bitIndex!0 (size!885 (buf!1213 (_2!1964 lt!59158))) (currentByte!2625 (_2!1964 lt!59158)) (currentBit!2620 (_2!1964 lt!59158))))))

(assert (=> b!38837 (= (size!885 (buf!1213 (_2!1964 lt!59142))) (size!885 (buf!1213 thiss!1379)))))

(declare-fun b!38838 () Bool)

(declare-fun e!25521 () Bool)

(declare-fun array_inv!813 (array!1965) Bool)

(assert (=> b!38838 (= e!25521 (array_inv!813 (buf!1213 thiss!1379)))))

(declare-fun e!25516 () Bool)

(declare-fun b!38839 () Bool)

(declare-datatypes ((tuple2!3756 0))(
  ( (tuple2!3757 (_1!1965 BitStream!1520) (_2!1965 BitStream!1520)) )
))
(declare-fun lt!59153 () tuple2!3756)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1520 BitStream!1520 (_ BitVec 64)) List!461)

(assert (=> b!38839 (= e!25516 (= (head!298 (byteArrayBitContentToList!0 (_2!1964 lt!59158) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!298 (bitStreamReadBitsIntoList!0 (_2!1964 lt!59158) (_1!1965 lt!59153) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38840 () Bool)

(declare-fun res!32979 () Bool)

(assert (=> b!38840 (=> res!32979 e!25517)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38840 (= res!32979 (not (invariant!0 (currentBit!2620 (_2!1964 lt!59158)) (currentByte!2625 (_2!1964 lt!59158)) (size!885 (buf!1213 (_2!1964 lt!59158))))))))

(declare-fun b!38841 () Bool)

(declare-fun res!32983 () Bool)

(assert (=> b!38841 (=> res!32983 e!25522)))

(assert (=> b!38841 (= res!32983 (not (invariant!0 (currentBit!2620 (_2!1964 lt!59142)) (currentByte!2625 (_2!1964 lt!59142)) (size!885 (buf!1213 (_2!1964 lt!59142))))))))

(declare-fun b!38842 () Bool)

(declare-fun e!25526 () Bool)

(declare-fun e!25527 () Bool)

(assert (=> b!38842 (= e!25526 e!25527)))

(declare-fun res!32987 () Bool)

(assert (=> b!38842 (=> res!32987 e!25527)))

(declare-fun isPrefixOf!0 (BitStream!1520 BitStream!1520) Bool)

(assert (=> b!38842 (= res!32987 (not (isPrefixOf!0 (_2!1964 lt!59158) (_2!1964 lt!59142))))))

(assert (=> b!38842 (isPrefixOf!0 thiss!1379 (_2!1964 lt!59142))))

(declare-fun lt!59151 () Unit!2791)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1520 BitStream!1520 BitStream!1520) Unit!2791)

(assert (=> b!38842 (= lt!59151 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1964 lt!59158) (_2!1964 lt!59142)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1520 array!1965 (_ BitVec 64) (_ BitVec 64)) tuple2!3754)

(assert (=> b!38842 (= lt!59142 (appendBitsMSBFirstLoop!0 (_2!1964 lt!59158) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38842 e!25516))

(declare-fun res!32988 () Bool)

(assert (=> b!38842 (=> (not res!32988) (not e!25516))))

(assert (=> b!38842 (= res!32988 (validate_offset_bits!1 ((_ sign_extend 32) (size!885 (buf!1213 (_2!1964 lt!59158)))) ((_ sign_extend 32) (currentByte!2625 thiss!1379)) ((_ sign_extend 32) (currentBit!2620 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59144 () Unit!2791)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1520 array!1965 (_ BitVec 64)) Unit!2791)

(assert (=> b!38842 (= lt!59144 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1213 (_2!1964 lt!59158)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1520 BitStream!1520) tuple2!3756)

(assert (=> b!38842 (= lt!59153 (reader!0 thiss!1379 (_2!1964 lt!59158)))))

(declare-fun b!38843 () Bool)

(declare-fun e!25520 () Bool)

(assert (=> b!38843 (= e!25520 e!25526)))

(declare-fun res!32975 () Bool)

(assert (=> b!38843 (=> res!32975 e!25526)))

(assert (=> b!38843 (= res!32975 (not (isPrefixOf!0 thiss!1379 (_2!1964 lt!59158))))))

(declare-fun lt!59159 () (_ BitVec 64))

(assert (=> b!38843 (validate_offset_bits!1 ((_ sign_extend 32) (size!885 (buf!1213 (_2!1964 lt!59158)))) ((_ sign_extend 32) (currentByte!2625 (_2!1964 lt!59158))) ((_ sign_extend 32) (currentBit!2620 (_2!1964 lt!59158))) lt!59159)))

(assert (=> b!38843 (= lt!59159 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59137 () Unit!2791)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1520 BitStream!1520 (_ BitVec 64) (_ BitVec 64)) Unit!2791)

(assert (=> b!38843 (= lt!59137 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1964 lt!59158) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1520 (_ BitVec 8) (_ BitVec 32)) tuple2!3754)

(assert (=> b!38843 (= lt!59158 (appendBitFromByte!0 thiss!1379 (select (arr!1381 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38844 () Bool)

(assert (=> b!38844 (= e!25527 e!25522)))

(declare-fun res!32976 () Bool)

(assert (=> b!38844 (=> res!32976 e!25522)))

(declare-fun lt!59157 () (_ BitVec 64))

(assert (=> b!38844 (= res!32976 (not (= lt!59160 (bvsub (bvadd lt!59157 to!314) i!635))))))

(assert (=> b!38844 (= lt!59160 (bitIndex!0 (size!885 (buf!1213 (_2!1964 lt!59142))) (currentByte!2625 (_2!1964 lt!59142)) (currentBit!2620 (_2!1964 lt!59142))))))

(declare-fun b!38845 () Bool)

(declare-fun e!25529 () Bool)

(assert (=> b!38845 (= e!25529 true)))

(declare-datatypes ((tuple2!3758 0))(
  ( (tuple2!3759 (_1!1966 BitStream!1520) (_2!1966 Bool)) )
))
(declare-fun lt!59146 () tuple2!3758)

(declare-fun lt!59143 () tuple2!3756)

(declare-fun readBitPure!0 (BitStream!1520) tuple2!3758)

(assert (=> b!38845 (= lt!59146 (readBitPure!0 (_1!1965 lt!59143)))))

(declare-fun b!38846 () Bool)

(assert (=> b!38846 (= e!25528 (not e!25520))))

(declare-fun res!32985 () Bool)

(assert (=> b!38846 (=> res!32985 e!25520)))

(assert (=> b!38846 (= res!32985 (bvsge i!635 to!314))))

(assert (=> b!38846 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59154 () Unit!2791)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1520) Unit!2791)

(assert (=> b!38846 (= lt!59154 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!38846 (= lt!59157 (bitIndex!0 (size!885 (buf!1213 thiss!1379)) (currentByte!2625 thiss!1379) (currentBit!2620 thiss!1379)))))

(declare-fun res!32978 () Bool)

(assert (=> start!7914 (=> (not res!32978) (not e!25528))))

(assert (=> start!7914 (= res!32978 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!885 srcBuffer!2))))))))

(assert (=> start!7914 e!25528))

(assert (=> start!7914 true))

(assert (=> start!7914 (array_inv!813 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1520) Bool)

(assert (=> start!7914 (and (inv!12 thiss!1379) e!25521)))

(declare-fun b!38847 () Bool)

(declare-fun res!32981 () Bool)

(assert (=> b!38847 (=> res!32981 e!25522)))

(assert (=> b!38847 (= res!32981 (not (= (size!885 (buf!1213 thiss!1379)) (size!885 (buf!1213 (_2!1964 lt!59142))))))))

(declare-fun b!38848 () Bool)

(declare-fun e!25523 () Bool)

(assert (=> b!38848 (= e!25523 e!25530)))

(declare-fun res!32982 () Bool)

(assert (=> b!38848 (=> res!32982 e!25530)))

(declare-fun lt!59152 () tuple2!3756)

(declare-fun lt!59145 () Bool)

(assert (=> b!38848 (= res!32982 (not (= lt!59145 (bitAt!0 (buf!1213 (_1!1965 lt!59152)) lt!59157))))))

(assert (=> b!38848 (= lt!59145 (bitAt!0 (buf!1213 (_1!1965 lt!59143)) lt!59157))))

(declare-fun b!38849 () Bool)

(declare-fun e!25524 () Bool)

(assert (=> b!38849 (= e!25518 e!25524)))

(declare-fun res!32970 () Bool)

(assert (=> b!38849 (=> res!32970 e!25524)))

(declare-fun lt!59148 () Bool)

(assert (=> b!38849 (= res!32970 (not (= lt!59148 lt!59156)))))

(assert (=> b!38849 (= lt!59148 (bitAt!0 (buf!1213 (_2!1964 lt!59158)) lt!59157))))

(declare-fun b!38850 () Bool)

(assert (=> b!38850 (= e!25519 e!25523)))

(declare-fun res!32971 () Bool)

(assert (=> b!38850 (=> res!32971 e!25523)))

(declare-fun lt!59149 () List!461)

(declare-fun lt!59138 () List!461)

(assert (=> b!38850 (= res!32971 (not (= lt!59149 lt!59138)))))

(assert (=> b!38850 (= lt!59138 lt!59149)))

(declare-fun tail!178 (List!461) List!461)

(assert (=> b!38850 (= lt!59149 (tail!178 lt!59161))))

(declare-fun lt!59140 () Unit!2791)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1520 BitStream!1520 BitStream!1520 BitStream!1520 (_ BitVec 64) List!461) Unit!2791)

(assert (=> b!38850 (= lt!59140 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1964 lt!59142) (_2!1964 lt!59142) (_1!1965 lt!59143) (_1!1965 lt!59152) (bvsub to!314 i!635) lt!59161))))

(declare-fun b!38851 () Bool)

(declare-fun res!32972 () Bool)

(assert (=> b!38851 (=> res!32972 e!25517)))

(assert (=> b!38851 (= res!32972 (not (invariant!0 (currentBit!2620 (_2!1964 lt!59158)) (currentByte!2625 (_2!1964 lt!59158)) (size!885 (buf!1213 (_2!1964 lt!59142))))))))

(declare-fun b!38852 () Bool)

(assert (=> b!38852 (= e!25524 e!25529)))

(declare-fun res!32980 () Bool)

(assert (=> b!38852 (=> res!32980 e!25529)))

(declare-fun lt!59147 () Bool)

(assert (=> b!38852 (= res!32980 (not (= lt!59147 lt!59156)))))

(assert (=> b!38852 (= lt!59148 lt!59147)))

(assert (=> b!38852 (= lt!59147 (bitAt!0 (buf!1213 (_2!1964 lt!59142)) lt!59157))))

(declare-fun lt!59139 () Unit!2791)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1965 array!1965 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2791)

(assert (=> b!38852 (= lt!59139 (arrayBitRangesEqImpliesEq!0 (buf!1213 (_2!1964 lt!59158)) (buf!1213 (_2!1964 lt!59142)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59157 lt!59141))))

(declare-fun b!38853 () Bool)

(assert (=> b!38853 (= e!25517 e!25519)))

(declare-fun res!32969 () Bool)

(assert (=> b!38853 (=> res!32969 e!25519)))

(assert (=> b!38853 (= res!32969 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38853 (= lt!59138 (bitStreamReadBitsIntoList!0 (_2!1964 lt!59142) (_1!1965 lt!59152) lt!59159))))

(assert (=> b!38853 (= lt!59161 (bitStreamReadBitsIntoList!0 (_2!1964 lt!59142) (_1!1965 lt!59143) (bvsub to!314 i!635)))))

(assert (=> b!38853 (validate_offset_bits!1 ((_ sign_extend 32) (size!885 (buf!1213 (_2!1964 lt!59142)))) ((_ sign_extend 32) (currentByte!2625 (_2!1964 lt!59158))) ((_ sign_extend 32) (currentBit!2620 (_2!1964 lt!59158))) lt!59159)))

(declare-fun lt!59155 () Unit!2791)

(assert (=> b!38853 (= lt!59155 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1964 lt!59158) (buf!1213 (_2!1964 lt!59142)) lt!59159))))

(assert (=> b!38853 (= lt!59152 (reader!0 (_2!1964 lt!59158) (_2!1964 lt!59142)))))

(assert (=> b!38853 (validate_offset_bits!1 ((_ sign_extend 32) (size!885 (buf!1213 (_2!1964 lt!59142)))) ((_ sign_extend 32) (currentByte!2625 thiss!1379)) ((_ sign_extend 32) (currentBit!2620 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59150 () Unit!2791)

(assert (=> b!38853 (= lt!59150 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1213 (_2!1964 lt!59142)) (bvsub to!314 i!635)))))

(assert (=> b!38853 (= lt!59143 (reader!0 thiss!1379 (_2!1964 lt!59142)))))

(declare-fun b!38854 () Bool)

(declare-fun res!32973 () Bool)

(assert (=> b!38854 (=> res!32973 e!25530)))

(assert (=> b!38854 (= res!32973 (not (= (head!298 lt!59161) lt!59145)))))

(assert (= (and start!7914 res!32978) b!38836))

(assert (= (and b!38836 res!32986) b!38846))

(assert (= (and b!38846 (not res!32985)) b!38843))

(assert (= (and b!38843 (not res!32975)) b!38842))

(assert (= (and b!38842 res!32988) b!38839))

(assert (= (and b!38842 (not res!32987)) b!38844))

(assert (= (and b!38844 (not res!32976)) b!38841))

(assert (= (and b!38841 (not res!32983)) b!38847))

(assert (= (and b!38847 (not res!32981)) b!38837))

(assert (= (and b!38837 (not res!32974)) b!38840))

(assert (= (and b!38840 (not res!32979)) b!38851))

(assert (= (and b!38851 (not res!32972)) b!38853))

(assert (= (and b!38853 (not res!32969)) b!38835))

(assert (= (and b!38835 (not res!32977)) b!38850))

(assert (= (and b!38850 (not res!32971)) b!38848))

(assert (= (and b!38848 (not res!32982)) b!38854))

(assert (= (and b!38854 (not res!32973)) b!38834))

(assert (= (and b!38834 (not res!32984)) b!38849))

(assert (= (and b!38849 (not res!32970)) b!38852))

(assert (= (and b!38852 (not res!32980)) b!38845))

(assert (= start!7914 b!38838))

(declare-fun m!59185 () Bool)

(assert (=> b!38836 m!59185))

(declare-fun m!59187 () Bool)

(assert (=> b!38844 m!59187))

(declare-fun m!59189 () Bool)

(assert (=> b!38837 m!59189))

(declare-fun m!59191 () Bool)

(assert (=> b!38849 m!59191))

(declare-fun m!59193 () Bool)

(assert (=> b!38846 m!59193))

(declare-fun m!59195 () Bool)

(assert (=> b!38846 m!59195))

(declare-fun m!59197 () Bool)

(assert (=> b!38846 m!59197))

(declare-fun m!59199 () Bool)

(assert (=> b!38852 m!59199))

(declare-fun m!59201 () Bool)

(assert (=> b!38852 m!59201))

(declare-fun m!59203 () Bool)

(assert (=> b!38843 m!59203))

(declare-fun m!59205 () Bool)

(assert (=> b!38843 m!59205))

(declare-fun m!59207 () Bool)

(assert (=> b!38843 m!59207))

(assert (=> b!38843 m!59203))

(declare-fun m!59209 () Bool)

(assert (=> b!38843 m!59209))

(declare-fun m!59211 () Bool)

(assert (=> b!38843 m!59211))

(declare-fun m!59213 () Bool)

(assert (=> b!38840 m!59213))

(declare-fun m!59215 () Bool)

(assert (=> b!38835 m!59215))

(declare-fun m!59217 () Bool)

(assert (=> b!38851 m!59217))

(declare-fun m!59219 () Bool)

(assert (=> b!38854 m!59219))

(declare-fun m!59221 () Bool)

(assert (=> b!38834 m!59221))

(assert (=> b!38834 m!59221))

(declare-fun m!59223 () Bool)

(assert (=> b!38834 m!59223))

(declare-fun m!59225 () Bool)

(assert (=> b!38834 m!59225))

(declare-fun m!59227 () Bool)

(assert (=> b!38845 m!59227))

(declare-fun m!59229 () Bool)

(assert (=> b!38839 m!59229))

(assert (=> b!38839 m!59229))

(declare-fun m!59231 () Bool)

(assert (=> b!38839 m!59231))

(declare-fun m!59233 () Bool)

(assert (=> b!38839 m!59233))

(assert (=> b!38839 m!59233))

(declare-fun m!59235 () Bool)

(assert (=> b!38839 m!59235))

(declare-fun m!59237 () Bool)

(assert (=> b!38842 m!59237))

(declare-fun m!59239 () Bool)

(assert (=> b!38842 m!59239))

(declare-fun m!59241 () Bool)

(assert (=> b!38842 m!59241))

(declare-fun m!59243 () Bool)

(assert (=> b!38842 m!59243))

(declare-fun m!59245 () Bool)

(assert (=> b!38842 m!59245))

(declare-fun m!59247 () Bool)

(assert (=> b!38842 m!59247))

(declare-fun m!59249 () Bool)

(assert (=> b!38842 m!59249))

(declare-fun m!59251 () Bool)

(assert (=> b!38848 m!59251))

(declare-fun m!59253 () Bool)

(assert (=> b!38848 m!59253))

(declare-fun m!59255 () Bool)

(assert (=> b!38853 m!59255))

(declare-fun m!59257 () Bool)

(assert (=> b!38853 m!59257))

(declare-fun m!59259 () Bool)

(assert (=> b!38853 m!59259))

(declare-fun m!59261 () Bool)

(assert (=> b!38853 m!59261))

(declare-fun m!59263 () Bool)

(assert (=> b!38853 m!59263))

(declare-fun m!59265 () Bool)

(assert (=> b!38853 m!59265))

(declare-fun m!59267 () Bool)

(assert (=> b!38853 m!59267))

(declare-fun m!59269 () Bool)

(assert (=> b!38853 m!59269))

(declare-fun m!59271 () Bool)

(assert (=> b!38841 m!59271))

(declare-fun m!59273 () Bool)

(assert (=> start!7914 m!59273))

(declare-fun m!59275 () Bool)

(assert (=> start!7914 m!59275))

(declare-fun m!59277 () Bool)

(assert (=> b!38850 m!59277))

(declare-fun m!59279 () Bool)

(assert (=> b!38850 m!59279))

(declare-fun m!59281 () Bool)

(assert (=> b!38838 m!59281))

(push 1)

(assert (not b!38844))

(assert (not b!38841))

(assert (not b!38850))

(assert (not b!38846))

(assert (not b!38837))

(assert (not b!38849))

(assert (not b!38836))

(assert (not b!38852))

(assert (not b!38839))

(assert (not b!38851))

(assert (not b!38854))

(assert (not b!38842))

(assert (not b!38840))

(assert (not b!38848))

(assert (not b!38853))

(assert (not start!7914))

(assert (not b!38843))

(assert (not b!38835))

(assert (not b!38845))

(assert (not b!38838))

(assert (not b!38834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

