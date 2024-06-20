; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9998 () Bool)

(assert start!9998)

(declare-fun b!50158 () Bool)

(declare-fun res!41959 () Bool)

(declare-fun e!33099 () Bool)

(assert (=> b!50158 (=> res!41959 e!33099)))

(declare-datatypes ((array!2320 0))(
  ( (array!2321 (arr!1583 (Array (_ BitVec 32) (_ BitVec 8))) (size!1054 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1822 0))(
  ( (BitStream!1823 (buf!1409 array!2320) (currentByte!2932 (_ BitVec 32)) (currentBit!2927 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3483 0))(
  ( (Unit!3484) )
))
(declare-datatypes ((tuple2!4632 0))(
  ( (tuple2!4633 (_1!2421 Unit!3483) (_2!2421 BitStream!1822)) )
))
(declare-fun lt!77945 () tuple2!4632)

(declare-fun lt!77946 () tuple2!4632)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50158 (= res!41959 (not (invariant!0 (currentBit!2927 (_2!2421 lt!77945)) (currentByte!2932 (_2!2421 lt!77945)) (size!1054 (buf!1409 (_2!2421 lt!77946))))))))

(declare-fun srcBuffer!2 () array!2320)

(declare-fun b!50159 () Bool)

(declare-fun e!33105 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!4634 0))(
  ( (tuple2!4635 (_1!2422 BitStream!1822) (_2!2422 BitStream!1822)) )
))
(declare-fun lt!77936 () tuple2!4634)

(declare-datatypes ((List!552 0))(
  ( (Nil!549) (Cons!548 (h!667 Bool) (t!1302 List!552)) )
))
(declare-fun head!371 (List!552) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1822 array!2320 (_ BitVec 64) (_ BitVec 64)) List!552)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1822 BitStream!1822 (_ BitVec 64)) List!552)

(assert (=> b!50159 (= e!33105 (= (head!371 (byteArrayBitContentToList!0 (_2!2421 lt!77945) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!371 (bitStreamReadBitsIntoList!0 (_2!2421 lt!77945) (_1!2422 lt!77936) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50160 () Bool)

(declare-fun res!41958 () Bool)

(declare-fun e!33104 () Bool)

(assert (=> b!50160 (=> res!41958 e!33104)))

(declare-fun lt!77941 () List!552)

(declare-fun length!247 (List!552) Int)

(assert (=> b!50160 (= res!41958 (<= (length!247 lt!77941) 0))))

(declare-fun b!50161 () Bool)

(declare-fun e!33106 () Bool)

(assert (=> b!50161 (= e!33106 e!33099)))

(declare-fun res!41957 () Bool)

(assert (=> b!50161 (=> res!41957 e!33099)))

(assert (=> b!50161 (= res!41957 (not (= (size!1054 (buf!1409 (_2!2421 lt!77945))) (size!1054 (buf!1409 (_2!2421 lt!77946))))))))

(declare-fun e!33096 () Bool)

(assert (=> b!50161 e!33096))

(declare-fun res!41950 () Bool)

(assert (=> b!50161 (=> (not res!41950) (not e!33096))))

(declare-fun thiss!1379 () BitStream!1822)

(assert (=> b!50161 (= res!41950 (= (size!1054 (buf!1409 (_2!2421 lt!77946))) (size!1054 (buf!1409 thiss!1379))))))

(declare-fun b!50162 () Bool)

(declare-fun e!33102 () Bool)

(declare-fun e!33098 () Bool)

(assert (=> b!50162 (= e!33102 (not e!33098))))

(declare-fun res!41961 () Bool)

(assert (=> b!50162 (=> res!41961 e!33098)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!50162 (= res!41961 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1822 BitStream!1822) Bool)

(assert (=> b!50162 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!77940 () Unit!3483)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1822) Unit!3483)

(assert (=> b!50162 (= lt!77940 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!77949 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50162 (= lt!77949 (bitIndex!0 (size!1054 (buf!1409 thiss!1379)) (currentByte!2932 thiss!1379) (currentBit!2927 thiss!1379)))))

(declare-fun b!50163 () Bool)

(declare-fun e!33097 () Bool)

(assert (=> b!50163 (= e!33098 e!33097)))

(declare-fun res!41953 () Bool)

(assert (=> b!50163 (=> res!41953 e!33097)))

(assert (=> b!50163 (= res!41953 (not (isPrefixOf!0 thiss!1379 (_2!2421 lt!77945))))))

(declare-fun lt!77948 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50163 (validate_offset_bits!1 ((_ sign_extend 32) (size!1054 (buf!1409 (_2!2421 lt!77945)))) ((_ sign_extend 32) (currentByte!2932 (_2!2421 lt!77945))) ((_ sign_extend 32) (currentBit!2927 (_2!2421 lt!77945))) lt!77948)))

(assert (=> b!50163 (= lt!77948 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77935 () Unit!3483)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1822 BitStream!1822 (_ BitVec 64) (_ BitVec 64)) Unit!3483)

(assert (=> b!50163 (= lt!77935 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2421 lt!77945) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1822 (_ BitVec 8) (_ BitVec 32)) tuple2!4632)

(assert (=> b!50163 (= lt!77945 (appendBitFromByte!0 thiss!1379 (select (arr!1583 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50164 () Bool)

(declare-fun e!33103 () Bool)

(assert (=> b!50164 (= e!33103 e!33106)))

(declare-fun res!41951 () Bool)

(assert (=> b!50164 (=> res!41951 e!33106)))

(declare-fun lt!77947 () (_ BitVec 64))

(assert (=> b!50164 (= res!41951 (not (= lt!77947 (bvsub (bvadd lt!77949 to!314) i!635))))))

(assert (=> b!50164 (= lt!77947 (bitIndex!0 (size!1054 (buf!1409 (_2!2421 lt!77946))) (currentByte!2932 (_2!2421 lt!77946)) (currentBit!2927 (_2!2421 lt!77946))))))

(declare-fun b!50165 () Bool)

(assert (=> b!50165 (= e!33096 (= lt!77947 (bvsub (bvsub (bvadd (bitIndex!0 (size!1054 (buf!1409 (_2!2421 lt!77945))) (currentByte!2932 (_2!2421 lt!77945)) (currentBit!2927 (_2!2421 lt!77945))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!50166 () Bool)

(assert (=> b!50166 (= e!33104 true)))

(declare-fun lt!77938 () List!552)

(declare-fun tail!238 (List!552) List!552)

(assert (=> b!50166 (= lt!77938 (tail!238 lt!77941))))

(declare-fun lt!77939 () Unit!3483)

(declare-fun lt!77934 () tuple2!4634)

(declare-fun lt!77944 () tuple2!4634)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1822 BitStream!1822 BitStream!1822 BitStream!1822 (_ BitVec 64) List!552) Unit!3483)

(assert (=> b!50166 (= lt!77939 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2421 lt!77946) (_2!2421 lt!77946) (_1!2422 lt!77944) (_1!2422 lt!77934) (bvsub to!314 i!635) lt!77941))))

(declare-fun b!50167 () Bool)

(declare-fun res!41948 () Bool)

(assert (=> b!50167 (=> res!41948 e!33099)))

(assert (=> b!50167 (= res!41948 (not (invariant!0 (currentBit!2927 (_2!2421 lt!77945)) (currentByte!2932 (_2!2421 lt!77945)) (size!1054 (buf!1409 (_2!2421 lt!77945))))))))

(declare-fun b!50169 () Bool)

(assert (=> b!50169 (= e!33097 e!33103)))

(declare-fun res!41956 () Bool)

(assert (=> b!50169 (=> res!41956 e!33103)))

(assert (=> b!50169 (= res!41956 (not (isPrefixOf!0 (_2!2421 lt!77945) (_2!2421 lt!77946))))))

(assert (=> b!50169 (isPrefixOf!0 thiss!1379 (_2!2421 lt!77946))))

(declare-fun lt!77937 () Unit!3483)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1822 BitStream!1822 BitStream!1822) Unit!3483)

(assert (=> b!50169 (= lt!77937 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2421 lt!77945) (_2!2421 lt!77946)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1822 array!2320 (_ BitVec 64) (_ BitVec 64)) tuple2!4632)

(assert (=> b!50169 (= lt!77946 (appendBitsMSBFirstLoop!0 (_2!2421 lt!77945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50169 e!33105))

(declare-fun res!41955 () Bool)

(assert (=> b!50169 (=> (not res!41955) (not e!33105))))

(assert (=> b!50169 (= res!41955 (validate_offset_bits!1 ((_ sign_extend 32) (size!1054 (buf!1409 (_2!2421 lt!77945)))) ((_ sign_extend 32) (currentByte!2932 thiss!1379)) ((_ sign_extend 32) (currentBit!2927 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77950 () Unit!3483)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1822 array!2320 (_ BitVec 64)) Unit!3483)

(assert (=> b!50169 (= lt!77950 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1409 (_2!2421 lt!77945)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1822 BitStream!1822) tuple2!4634)

(assert (=> b!50169 (= lt!77936 (reader!0 thiss!1379 (_2!2421 lt!77945)))))

(declare-fun b!50170 () Bool)

(declare-fun res!41949 () Bool)

(assert (=> b!50170 (=> (not res!41949) (not e!33102))))

(assert (=> b!50170 (= res!41949 (validate_offset_bits!1 ((_ sign_extend 32) (size!1054 (buf!1409 thiss!1379))) ((_ sign_extend 32) (currentByte!2932 thiss!1379)) ((_ sign_extend 32) (currentBit!2927 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50171 () Bool)

(declare-fun e!33100 () Bool)

(declare-fun array_inv!964 (array!2320) Bool)

(assert (=> b!50171 (= e!33100 (array_inv!964 (buf!1409 thiss!1379)))))

(declare-fun b!50172 () Bool)

(declare-fun res!41954 () Bool)

(assert (=> b!50172 (=> res!41954 e!33106)))

(assert (=> b!50172 (= res!41954 (not (= (size!1054 (buf!1409 thiss!1379)) (size!1054 (buf!1409 (_2!2421 lt!77946))))))))

(declare-fun b!50173 () Bool)

(declare-fun res!41960 () Bool)

(assert (=> b!50173 (=> res!41960 e!33106)))

(assert (=> b!50173 (= res!41960 (not (invariant!0 (currentBit!2927 (_2!2421 lt!77946)) (currentByte!2932 (_2!2421 lt!77946)) (size!1054 (buf!1409 (_2!2421 lt!77946))))))))

(declare-fun res!41947 () Bool)

(assert (=> start!9998 (=> (not res!41947) (not e!33102))))

(assert (=> start!9998 (= res!41947 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1054 srcBuffer!2))))))))

(assert (=> start!9998 e!33102))

(assert (=> start!9998 true))

(assert (=> start!9998 (array_inv!964 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1822) Bool)

(assert (=> start!9998 (and (inv!12 thiss!1379) e!33100)))

(declare-fun b!50168 () Bool)

(assert (=> b!50168 (= e!33099 e!33104)))

(declare-fun res!41952 () Bool)

(assert (=> b!50168 (=> res!41952 e!33104)))

(assert (=> b!50168 (= res!41952 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50168 (= lt!77938 (bitStreamReadBitsIntoList!0 (_2!2421 lt!77946) (_1!2422 lt!77934) lt!77948))))

(assert (=> b!50168 (= lt!77941 (bitStreamReadBitsIntoList!0 (_2!2421 lt!77946) (_1!2422 lt!77944) (bvsub to!314 i!635)))))

(assert (=> b!50168 (validate_offset_bits!1 ((_ sign_extend 32) (size!1054 (buf!1409 (_2!2421 lt!77946)))) ((_ sign_extend 32) (currentByte!2932 (_2!2421 lt!77945))) ((_ sign_extend 32) (currentBit!2927 (_2!2421 lt!77945))) lt!77948)))

(declare-fun lt!77943 () Unit!3483)

(assert (=> b!50168 (= lt!77943 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2421 lt!77945) (buf!1409 (_2!2421 lt!77946)) lt!77948))))

(assert (=> b!50168 (= lt!77934 (reader!0 (_2!2421 lt!77945) (_2!2421 lt!77946)))))

(assert (=> b!50168 (validate_offset_bits!1 ((_ sign_extend 32) (size!1054 (buf!1409 (_2!2421 lt!77946)))) ((_ sign_extend 32) (currentByte!2932 thiss!1379)) ((_ sign_extend 32) (currentBit!2927 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!77942 () Unit!3483)

(assert (=> b!50168 (= lt!77942 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1409 (_2!2421 lt!77946)) (bvsub to!314 i!635)))))

(assert (=> b!50168 (= lt!77944 (reader!0 thiss!1379 (_2!2421 lt!77946)))))

(assert (= (and start!9998 res!41947) b!50170))

(assert (= (and b!50170 res!41949) b!50162))

(assert (= (and b!50162 (not res!41961)) b!50163))

(assert (= (and b!50163 (not res!41953)) b!50169))

(assert (= (and b!50169 res!41955) b!50159))

(assert (= (and b!50169 (not res!41956)) b!50164))

(assert (= (and b!50164 (not res!41951)) b!50173))

(assert (= (and b!50173 (not res!41960)) b!50172))

(assert (= (and b!50172 (not res!41954)) b!50161))

(assert (= (and b!50161 res!41950) b!50165))

(assert (= (and b!50161 (not res!41957)) b!50167))

(assert (= (and b!50167 (not res!41948)) b!50158))

(assert (= (and b!50158 (not res!41959)) b!50168))

(assert (= (and b!50168 (not res!41952)) b!50160))

(assert (= (and b!50160 (not res!41958)) b!50166))

(assert (= start!9998 b!50171))

(declare-fun m!78903 () Bool)

(assert (=> b!50162 m!78903))

(declare-fun m!78905 () Bool)

(assert (=> b!50162 m!78905))

(declare-fun m!78907 () Bool)

(assert (=> b!50162 m!78907))

(declare-fun m!78909 () Bool)

(assert (=> b!50163 m!78909))

(declare-fun m!78911 () Bool)

(assert (=> b!50163 m!78911))

(declare-fun m!78913 () Bool)

(assert (=> b!50163 m!78913))

(declare-fun m!78915 () Bool)

(assert (=> b!50163 m!78915))

(declare-fun m!78917 () Bool)

(assert (=> b!50163 m!78917))

(assert (=> b!50163 m!78913))

(declare-fun m!78919 () Bool)

(assert (=> b!50170 m!78919))

(declare-fun m!78921 () Bool)

(assert (=> b!50159 m!78921))

(assert (=> b!50159 m!78921))

(declare-fun m!78923 () Bool)

(assert (=> b!50159 m!78923))

(declare-fun m!78925 () Bool)

(assert (=> b!50159 m!78925))

(assert (=> b!50159 m!78925))

(declare-fun m!78927 () Bool)

(assert (=> b!50159 m!78927))

(declare-fun m!78929 () Bool)

(assert (=> b!50169 m!78929))

(declare-fun m!78931 () Bool)

(assert (=> b!50169 m!78931))

(declare-fun m!78933 () Bool)

(assert (=> b!50169 m!78933))

(declare-fun m!78935 () Bool)

(assert (=> b!50169 m!78935))

(declare-fun m!78937 () Bool)

(assert (=> b!50169 m!78937))

(declare-fun m!78939 () Bool)

(assert (=> b!50169 m!78939))

(declare-fun m!78941 () Bool)

(assert (=> b!50169 m!78941))

(declare-fun m!78943 () Bool)

(assert (=> b!50168 m!78943))

(declare-fun m!78945 () Bool)

(assert (=> b!50168 m!78945))

(declare-fun m!78947 () Bool)

(assert (=> b!50168 m!78947))

(declare-fun m!78949 () Bool)

(assert (=> b!50168 m!78949))

(declare-fun m!78951 () Bool)

(assert (=> b!50168 m!78951))

(declare-fun m!78953 () Bool)

(assert (=> b!50168 m!78953))

(declare-fun m!78955 () Bool)

(assert (=> b!50168 m!78955))

(declare-fun m!78957 () Bool)

(assert (=> b!50168 m!78957))

(declare-fun m!78959 () Bool)

(assert (=> b!50166 m!78959))

(declare-fun m!78961 () Bool)

(assert (=> b!50166 m!78961))

(declare-fun m!78963 () Bool)

(assert (=> b!50171 m!78963))

(declare-fun m!78965 () Bool)

(assert (=> b!50158 m!78965))

(declare-fun m!78967 () Bool)

(assert (=> b!50167 m!78967))

(declare-fun m!78969 () Bool)

(assert (=> b!50164 m!78969))

(declare-fun m!78971 () Bool)

(assert (=> b!50173 m!78971))

(declare-fun m!78973 () Bool)

(assert (=> b!50165 m!78973))

(declare-fun m!78975 () Bool)

(assert (=> b!50160 m!78975))

(declare-fun m!78977 () Bool)

(assert (=> start!9998 m!78977))

(declare-fun m!78979 () Bool)

(assert (=> start!9998 m!78979))

(push 1)

