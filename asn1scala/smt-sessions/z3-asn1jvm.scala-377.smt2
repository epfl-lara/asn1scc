; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9052 () Bool)

(assert start!9052)

(declare-fun b!44834 () Bool)

(declare-fun e!29857 () Bool)

(declare-fun e!29865 () Bool)

(assert (=> b!44834 (= e!29857 e!29865)))

(declare-fun res!37939 () Bool)

(assert (=> b!44834 (=> res!37939 e!29865)))

(declare-datatypes ((array!2250 0))(
  ( (array!2251 (arr!1527 (Array (_ BitVec 32) (_ BitVec 8))) (size!1013 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1770 0))(
  ( (BitStream!1771 (buf!1359 array!2250) (currentByte!2846 (_ BitVec 32)) (currentBit!2841 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3192 0))(
  ( (Unit!3193) )
))
(declare-datatypes ((tuple2!4386 0))(
  ( (tuple2!4387 (_1!2286 Unit!3192) (_2!2286 BitStream!1770)) )
))
(declare-fun lt!68683 () tuple2!4386)

(declare-fun lt!68684 () tuple2!4386)

(assert (=> b!44834 (= res!37939 (not (= (size!1013 (buf!1359 (_2!2286 lt!68683))) (size!1013 (buf!1359 (_2!2286 lt!68684))))))))

(declare-fun e!29864 () Bool)

(assert (=> b!44834 e!29864))

(declare-fun res!37947 () Bool)

(assert (=> b!44834 (=> (not res!37947) (not e!29864))))

(declare-fun thiss!1379 () BitStream!1770)

(assert (=> b!44834 (= res!37947 (= (size!1013 (buf!1359 (_2!2286 lt!68684))) (size!1013 (buf!1359 thiss!1379))))))

(declare-fun b!44835 () Bool)

(declare-fun e!29859 () Bool)

(declare-fun e!29866 () Bool)

(assert (=> b!44835 (= e!29859 e!29866)))

(declare-fun res!37940 () Bool)

(assert (=> b!44835 (=> res!37940 e!29866)))

(declare-fun isPrefixOf!0 (BitStream!1770 BitStream!1770) Bool)

(assert (=> b!44835 (= res!37940 (not (isPrefixOf!0 thiss!1379 (_2!2286 lt!68683))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44835 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68688 () Unit!3192)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1770 BitStream!1770 (_ BitVec 64) (_ BitVec 64)) Unit!3192)

(assert (=> b!44835 (= lt!68688 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2286 lt!68683) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2250)

(declare-fun appendBitFromByte!0 (BitStream!1770 (_ BitVec 8) (_ BitVec 32)) tuple2!4386)

(assert (=> b!44835 (= lt!68683 (appendBitFromByte!0 thiss!1379 (select (arr!1527 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44836 () Bool)

(declare-fun e!29867 () Bool)

(assert (=> b!44836 (= e!29867 (not e!29859))))

(declare-fun res!37942 () Bool)

(assert (=> b!44836 (=> res!37942 e!29859)))

(assert (=> b!44836 (= res!37942 (bvsge i!635 to!314))))

(assert (=> b!44836 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!68685 () Unit!3192)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1770) Unit!3192)

(assert (=> b!44836 (= lt!68685 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!68682 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44836 (= lt!68682 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)))))

(declare-fun b!44837 () Bool)

(declare-fun res!37944 () Bool)

(assert (=> b!44837 (=> res!37944 e!29857)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!44837 (= res!37944 (not (invariant!0 (currentBit!2841 (_2!2286 lt!68684)) (currentByte!2846 (_2!2286 lt!68684)) (size!1013 (buf!1359 (_2!2286 lt!68684))))))))

(declare-fun b!44838 () Bool)

(declare-fun e!29861 () Bool)

(declare-fun array_inv!938 (array!2250) Bool)

(assert (=> b!44838 (= e!29861 (array_inv!938 (buf!1359 thiss!1379)))))

(declare-fun b!44839 () Bool)

(assert (=> b!44839 (= e!29865 (invariant!0 (currentBit!2841 (_2!2286 lt!68683)) (currentByte!2846 (_2!2286 lt!68683)) (size!1013 (buf!1359 (_2!2286 lt!68683)))))))

(declare-fun b!44840 () Bool)

(declare-fun res!37938 () Bool)

(assert (=> b!44840 (=> (not res!37938) (not e!29867))))

(assert (=> b!44840 (= res!37938 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 thiss!1379))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44841 () Bool)

(declare-fun e!29862 () Bool)

(assert (=> b!44841 (= e!29866 e!29862)))

(declare-fun res!37937 () Bool)

(assert (=> b!44841 (=> res!37937 e!29862)))

(assert (=> b!44841 (= res!37937 (not (isPrefixOf!0 (_2!2286 lt!68683) (_2!2286 lt!68684))))))

(assert (=> b!44841 (isPrefixOf!0 thiss!1379 (_2!2286 lt!68684))))

(declare-fun lt!68681 () Unit!3192)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1770 BitStream!1770 BitStream!1770) Unit!3192)

(assert (=> b!44841 (= lt!68681 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2286 lt!68683) (_2!2286 lt!68684)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1770 array!2250 (_ BitVec 64) (_ BitVec 64)) tuple2!4386)

(assert (=> b!44841 (= lt!68684 (appendBitsMSBFirstLoop!0 (_2!2286 lt!68683) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29863 () Bool)

(assert (=> b!44841 e!29863))

(declare-fun res!37946 () Bool)

(assert (=> b!44841 (=> (not res!37946) (not e!29863))))

(assert (=> b!44841 (= res!37946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68686 () Unit!3192)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1770 array!2250 (_ BitVec 64)) Unit!3192)

(assert (=> b!44841 (= lt!68686 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1359 (_2!2286 lt!68683)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4388 0))(
  ( (tuple2!4389 (_1!2287 BitStream!1770) (_2!2287 BitStream!1770)) )
))
(declare-fun lt!68687 () tuple2!4388)

(declare-fun reader!0 (BitStream!1770 BitStream!1770) tuple2!4388)

(assert (=> b!44841 (= lt!68687 (reader!0 thiss!1379 (_2!2286 lt!68683)))))

(declare-fun res!37943 () Bool)

(assert (=> start!9052 (=> (not res!37943) (not e!29867))))

(assert (=> start!9052 (= res!37943 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1013 srcBuffer!2))))))))

(assert (=> start!9052 e!29867))

(assert (=> start!9052 true))

(assert (=> start!9052 (array_inv!938 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1770) Bool)

(assert (=> start!9052 (and (inv!12 thiss!1379) e!29861)))

(declare-fun b!44842 () Bool)

(assert (=> b!44842 (= e!29862 e!29857)))

(declare-fun res!37945 () Bool)

(assert (=> b!44842 (=> res!37945 e!29857)))

(declare-fun lt!68689 () (_ BitVec 64))

(assert (=> b!44842 (= res!37945 (not (= lt!68689 (bvsub (bvadd lt!68682 to!314) i!635))))))

(assert (=> b!44842 (= lt!68689 (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68684))) (currentByte!2846 (_2!2286 lt!68684)) (currentBit!2841 (_2!2286 lt!68684))))))

(declare-fun b!44843 () Bool)

(declare-fun res!37941 () Bool)

(assert (=> b!44843 (=> res!37941 e!29857)))

(assert (=> b!44843 (= res!37941 (not (= (size!1013 (buf!1359 thiss!1379)) (size!1013 (buf!1359 (_2!2286 lt!68684))))))))

(declare-fun b!44844 () Bool)

(declare-datatypes ((List!526 0))(
  ( (Nil!523) (Cons!522 (h!641 Bool) (t!1276 List!526)) )
))
(declare-fun head!345 (List!526) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1770 array!2250 (_ BitVec 64) (_ BitVec 64)) List!526)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1770 BitStream!1770 (_ BitVec 64)) List!526)

(assert (=> b!44844 (= e!29863 (= (head!345 (byteArrayBitContentToList!0 (_2!2286 lt!68683) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!345 (bitStreamReadBitsIntoList!0 (_2!2286 lt!68683) (_1!2287 lt!68687) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44845 () Bool)

(assert (=> b!44845 (= e!29864 (= lt!68689 (bvsub (bvsub (bvadd (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!9052 res!37943) b!44840))

(assert (= (and b!44840 res!37938) b!44836))

(assert (= (and b!44836 (not res!37942)) b!44835))

(assert (= (and b!44835 (not res!37940)) b!44841))

(assert (= (and b!44841 res!37946) b!44844))

(assert (= (and b!44841 (not res!37937)) b!44842))

(assert (= (and b!44842 (not res!37945)) b!44837))

(assert (= (and b!44837 (not res!37944)) b!44843))

(assert (= (and b!44843 (not res!37941)) b!44834))

(assert (= (and b!44834 res!37947) b!44845))

(assert (= (and b!44834 (not res!37939)) b!44839))

(assert (= start!9052 b!44838))

(declare-fun m!68395 () Bool)

(assert (=> b!44837 m!68395))

(declare-fun m!68397 () Bool)

(assert (=> b!44841 m!68397))

(declare-fun m!68399 () Bool)

(assert (=> b!44841 m!68399))

(declare-fun m!68401 () Bool)

(assert (=> b!44841 m!68401))

(declare-fun m!68403 () Bool)

(assert (=> b!44841 m!68403))

(declare-fun m!68405 () Bool)

(assert (=> b!44841 m!68405))

(declare-fun m!68407 () Bool)

(assert (=> b!44841 m!68407))

(declare-fun m!68409 () Bool)

(assert (=> b!44841 m!68409))

(declare-fun m!68411 () Bool)

(assert (=> b!44842 m!68411))

(declare-fun m!68413 () Bool)

(assert (=> b!44840 m!68413))

(declare-fun m!68415 () Bool)

(assert (=> b!44845 m!68415))

(declare-fun m!68417 () Bool)

(assert (=> b!44835 m!68417))

(declare-fun m!68419 () Bool)

(assert (=> b!44835 m!68419))

(declare-fun m!68421 () Bool)

(assert (=> b!44835 m!68421))

(assert (=> b!44835 m!68419))

(declare-fun m!68423 () Bool)

(assert (=> b!44835 m!68423))

(declare-fun m!68425 () Bool)

(assert (=> b!44835 m!68425))

(declare-fun m!68427 () Bool)

(assert (=> b!44839 m!68427))

(declare-fun m!68429 () Bool)

(assert (=> b!44836 m!68429))

(declare-fun m!68431 () Bool)

(assert (=> b!44836 m!68431))

(declare-fun m!68433 () Bool)

(assert (=> b!44836 m!68433))

(declare-fun m!68435 () Bool)

(assert (=> start!9052 m!68435))

(declare-fun m!68437 () Bool)

(assert (=> start!9052 m!68437))

(declare-fun m!68439 () Bool)

(assert (=> b!44844 m!68439))

(assert (=> b!44844 m!68439))

(declare-fun m!68441 () Bool)

(assert (=> b!44844 m!68441))

(declare-fun m!68443 () Bool)

(assert (=> b!44844 m!68443))

(assert (=> b!44844 m!68443))

(declare-fun m!68445 () Bool)

(assert (=> b!44844 m!68445))

(declare-fun m!68447 () Bool)

(assert (=> b!44838 m!68447))

(check-sat (not b!44837) (not b!44839) (not b!44845) (not b!44844) (not b!44836) (not b!44840) (not b!44841) (not b!44835) (not start!9052) (not b!44842) (not b!44838))
(check-sat)
(get-model)

(declare-fun d!13050 () Bool)

(assert (=> d!13050 (= (invariant!0 (currentBit!2841 (_2!2286 lt!68683)) (currentByte!2846 (_2!2286 lt!68683)) (size!1013 (buf!1359 (_2!2286 lt!68683)))) (and (bvsge (currentBit!2841 (_2!2286 lt!68683)) #b00000000000000000000000000000000) (bvslt (currentBit!2841 (_2!2286 lt!68683)) #b00000000000000000000000000001000) (bvsge (currentByte!2846 (_2!2286 lt!68683)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2846 (_2!2286 lt!68683)) (size!1013 (buf!1359 (_2!2286 lt!68683)))) (and (= (currentBit!2841 (_2!2286 lt!68683)) #b00000000000000000000000000000000) (= (currentByte!2846 (_2!2286 lt!68683)) (size!1013 (buf!1359 (_2!2286 lt!68683))))))))))

(assert (=> b!44839 d!13050))

(declare-fun d!13052 () Bool)

(assert (=> d!13052 (= (head!345 (byteArrayBitContentToList!0 (_2!2286 lt!68683) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!641 (byteArrayBitContentToList!0 (_2!2286 lt!68683) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44844 d!13052))

(declare-fun d!13054 () Bool)

(declare-fun c!3006 () Bool)

(assert (=> d!13054 (= c!3006 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29903 () List!526)

(assert (=> d!13054 (= (byteArrayBitContentToList!0 (_2!2286 lt!68683) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29903)))

(declare-fun b!44886 () Bool)

(assert (=> b!44886 (= e!29903 Nil!523)))

(declare-fun b!44887 () Bool)

(assert (=> b!44887 (= e!29903 (Cons!522 (not (= (bvand ((_ sign_extend 24) (select (arr!1527 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2286 lt!68683) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13054 c!3006) b!44886))

(assert (= (and d!13054 (not c!3006)) b!44887))

(assert (=> b!44887 m!68419))

(declare-fun m!68503 () Bool)

(assert (=> b!44887 m!68503))

(declare-fun m!68505 () Bool)

(assert (=> b!44887 m!68505))

(assert (=> b!44844 d!13054))

(declare-fun d!13056 () Bool)

(assert (=> d!13056 (= (head!345 (bitStreamReadBitsIntoList!0 (_2!2286 lt!68683) (_1!2287 lt!68687) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!641 (bitStreamReadBitsIntoList!0 (_2!2286 lt!68683) (_1!2287 lt!68687) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44844 d!13056))

(declare-fun b!44896 () Bool)

(declare-datatypes ((tuple2!4394 0))(
  ( (tuple2!4395 (_1!2290 List!526) (_2!2290 BitStream!1770)) )
))
(declare-fun e!29908 () tuple2!4394)

(assert (=> b!44896 (= e!29908 (tuple2!4395 Nil!523 (_1!2287 lt!68687)))))

(declare-fun b!44898 () Bool)

(declare-fun e!29909 () Bool)

(declare-fun lt!68724 () List!526)

(declare-fun isEmpty!128 (List!526) Bool)

(assert (=> b!44898 (= e!29909 (isEmpty!128 lt!68724))))

(declare-fun d!13058 () Bool)

(assert (=> d!13058 e!29909))

(declare-fun c!3011 () Bool)

(assert (=> d!13058 (= c!3011 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13058 (= lt!68724 (_1!2290 e!29908))))

(declare-fun c!3012 () Bool)

(assert (=> d!13058 (= c!3012 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13058 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13058 (= (bitStreamReadBitsIntoList!0 (_2!2286 lt!68683) (_1!2287 lt!68687) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68724)))

(declare-fun b!44897 () Bool)

(declare-datatypes ((tuple2!4396 0))(
  ( (tuple2!4397 (_1!2291 Bool) (_2!2291 BitStream!1770)) )
))
(declare-fun lt!68723 () tuple2!4396)

(declare-fun lt!68725 () (_ BitVec 64))

(assert (=> b!44897 (= e!29908 (tuple2!4395 (Cons!522 (_1!2291 lt!68723) (bitStreamReadBitsIntoList!0 (_2!2286 lt!68683) (_2!2291 lt!68723) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!68725))) (_2!2291 lt!68723)))))

(declare-fun readBit!0 (BitStream!1770) tuple2!4396)

(assert (=> b!44897 (= lt!68723 (readBit!0 (_1!2287 lt!68687)))))

(assert (=> b!44897 (= lt!68725 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!44899 () Bool)

(declare-fun length!226 (List!526) Int)

(assert (=> b!44899 (= e!29909 (> (length!226 lt!68724) 0))))

(assert (= (and d!13058 c!3012) b!44896))

(assert (= (and d!13058 (not c!3012)) b!44897))

(assert (= (and d!13058 c!3011) b!44898))

(assert (= (and d!13058 (not c!3011)) b!44899))

(declare-fun m!68507 () Bool)

(assert (=> b!44898 m!68507))

(declare-fun m!68509 () Bool)

(assert (=> b!44897 m!68509))

(declare-fun m!68511 () Bool)

(assert (=> b!44897 m!68511))

(declare-fun m!68513 () Bool)

(assert (=> b!44899 m!68513))

(assert (=> b!44844 d!13058))

(declare-fun d!13060 () Bool)

(assert (=> d!13060 (= (array_inv!938 srcBuffer!2) (bvsge (size!1013 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9052 d!13060))

(declare-fun d!13062 () Bool)

(assert (=> d!13062 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2841 thiss!1379) (currentByte!2846 thiss!1379) (size!1013 (buf!1359 thiss!1379))))))

(declare-fun bs!3472 () Bool)

(assert (= bs!3472 d!13062))

(declare-fun m!68515 () Bool)

(assert (=> bs!3472 m!68515))

(assert (=> start!9052 d!13062))

(declare-fun d!13064 () Bool)

(declare-fun res!37987 () Bool)

(declare-fun e!29915 () Bool)

(assert (=> d!13064 (=> (not res!37987) (not e!29915))))

(assert (=> d!13064 (= res!37987 (= (size!1013 (buf!1359 thiss!1379)) (size!1013 (buf!1359 (_2!2286 lt!68683)))))))

(assert (=> d!13064 (= (isPrefixOf!0 thiss!1379 (_2!2286 lt!68683)) e!29915)))

(declare-fun b!44906 () Bool)

(declare-fun res!37988 () Bool)

(assert (=> b!44906 (=> (not res!37988) (not e!29915))))

(assert (=> b!44906 (= res!37988 (bvsle (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)) (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683)))))))

(declare-fun b!44907 () Bool)

(declare-fun e!29914 () Bool)

(assert (=> b!44907 (= e!29915 e!29914)))

(declare-fun res!37989 () Bool)

(assert (=> b!44907 (=> res!37989 e!29914)))

(assert (=> b!44907 (= res!37989 (= (size!1013 (buf!1359 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44908 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2250 array!2250 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44908 (= e!29914 (arrayBitRangesEq!0 (buf!1359 thiss!1379) (buf!1359 (_2!2286 lt!68683)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379))))))

(assert (= (and d!13064 res!37987) b!44906))

(assert (= (and b!44906 res!37988) b!44907))

(assert (= (and b!44907 (not res!37989)) b!44908))

(assert (=> b!44906 m!68433))

(assert (=> b!44906 m!68415))

(assert (=> b!44908 m!68433))

(assert (=> b!44908 m!68433))

(declare-fun m!68517 () Bool)

(assert (=> b!44908 m!68517))

(assert (=> b!44835 d!13064))

(declare-fun d!13066 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3473 () Bool)

(assert (= bs!3473 d!13066))

(declare-fun m!68519 () Bool)

(assert (=> bs!3473 m!68519))

(assert (=> b!44835 d!13066))

(declare-fun d!13068 () Bool)

(declare-fun e!29918 () Bool)

(assert (=> d!13068 e!29918))

(declare-fun res!37992 () Bool)

(assert (=> d!13068 (=> (not res!37992) (not e!29918))))

(assert (=> d!13068 (= res!37992 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!68728 () Unit!3192)

(declare-fun choose!27 (BitStream!1770 BitStream!1770 (_ BitVec 64) (_ BitVec 64)) Unit!3192)

(assert (=> d!13068 (= lt!68728 (choose!27 thiss!1379 (_2!2286 lt!68683) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13068 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2286 lt!68683) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68728)))

(declare-fun b!44911 () Bool)

(assert (=> b!44911 (= e!29918 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13068 res!37992) b!44911))

(declare-fun m!68521 () Bool)

(assert (=> d!13068 m!68521))

(assert (=> b!44911 m!68425))

(assert (=> b!44835 d!13068))

(declare-fun b!44947 () Bool)

(declare-fun e!29939 () Bool)

(declare-datatypes ((tuple2!4398 0))(
  ( (tuple2!4399 (_1!2292 BitStream!1770) (_2!2292 Bool)) )
))
(declare-fun lt!68781 () tuple2!4398)

(declare-fun lt!68790 () tuple2!4386)

(assert (=> b!44947 (= e!29939 (= (bitIndex!0 (size!1013 (buf!1359 (_1!2292 lt!68781))) (currentByte!2846 (_1!2292 lt!68781)) (currentBit!2841 (_1!2292 lt!68781))) (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68790))) (currentByte!2846 (_2!2286 lt!68790)) (currentBit!2841 (_2!2286 lt!68790)))))))

(declare-fun b!44948 () Bool)

(declare-fun res!38031 () Bool)

(declare-fun e!29941 () Bool)

(assert (=> b!44948 (=> (not res!38031) (not e!29941))))

(declare-fun lt!68788 () tuple2!4386)

(assert (=> b!44948 (= res!38031 (isPrefixOf!0 thiss!1379 (_2!2286 lt!68788)))))

(declare-fun d!13070 () Bool)

(assert (=> d!13070 e!29941))

(declare-fun res!38030 () Bool)

(assert (=> d!13070 (=> (not res!38030) (not e!29941))))

(assert (=> d!13070 (= res!38030 (= (size!1013 (buf!1359 (_2!2286 lt!68788))) (size!1013 (buf!1359 thiss!1379))))))

(declare-fun lt!68785 () (_ BitVec 8))

(declare-fun lt!68784 () array!2250)

(assert (=> d!13070 (= lt!68785 (select (arr!1527 lt!68784) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13070 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1013 lt!68784)))))

(assert (=> d!13070 (= lt!68784 (array!2251 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!68787 () tuple2!4386)

(assert (=> d!13070 (= lt!68788 (tuple2!4387 (_1!2286 lt!68787) (_2!2286 lt!68787)))))

(assert (=> d!13070 (= lt!68787 lt!68790)))

(declare-fun e!29942 () Bool)

(assert (=> d!13070 e!29942))

(declare-fun res!38032 () Bool)

(assert (=> d!13070 (=> (not res!38032) (not e!29942))))

(assert (=> d!13070 (= res!38032 (= (size!1013 (buf!1359 thiss!1379)) (size!1013 (buf!1359 (_2!2286 lt!68790)))))))

(declare-fun lt!68780 () Bool)

(declare-fun appendBit!0 (BitStream!1770 Bool) tuple2!4386)

(assert (=> d!13070 (= lt!68790 (appendBit!0 thiss!1379 lt!68780))))

(assert (=> d!13070 (= lt!68780 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1527 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13070 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13070 (= (appendBitFromByte!0 thiss!1379 (select (arr!1527 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!68788)))

(declare-fun b!44949 () Bool)

(declare-fun e!29940 () Bool)

(declare-fun lt!68786 () tuple2!4398)

(assert (=> b!44949 (= e!29940 (= (bitIndex!0 (size!1013 (buf!1359 (_1!2292 lt!68786))) (currentByte!2846 (_1!2292 lt!68786)) (currentBit!2841 (_1!2292 lt!68786))) (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68788))) (currentByte!2846 (_2!2286 lt!68788)) (currentBit!2841 (_2!2286 lt!68788)))))))

(declare-fun b!44950 () Bool)

(declare-fun res!38033 () Bool)

(assert (=> b!44950 (=> (not res!38033) (not e!29941))))

(declare-fun lt!68791 () (_ BitVec 64))

(declare-fun lt!68782 () (_ BitVec 64))

(assert (=> b!44950 (= res!38033 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68788))) (currentByte!2846 (_2!2286 lt!68788)) (currentBit!2841 (_2!2286 lt!68788))) (bvadd lt!68791 lt!68782)))))

(assert (=> b!44950 (or (not (= (bvand lt!68791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68782 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68791 lt!68782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44950 (= lt!68782 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44950 (= lt!68791 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)))))

(declare-fun b!44951 () Bool)

(assert (=> b!44951 (= e!29941 e!29940)))

(declare-fun res!38027 () Bool)

(assert (=> b!44951 (=> (not res!38027) (not e!29940))))

(assert (=> b!44951 (= res!38027 (and (= (_2!2292 lt!68786) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1527 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!68785)) #b00000000000000000000000000000000))) (= (_1!2292 lt!68786) (_2!2286 lt!68788))))))

(declare-datatypes ((tuple2!4400 0))(
  ( (tuple2!4401 (_1!2293 array!2250) (_2!2293 BitStream!1770)) )
))
(declare-fun lt!68789 () tuple2!4400)

(declare-fun lt!68783 () BitStream!1770)

(declare-fun readBits!0 (BitStream!1770 (_ BitVec 64)) tuple2!4400)

(assert (=> b!44951 (= lt!68789 (readBits!0 lt!68783 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1770) tuple2!4398)

(assert (=> b!44951 (= lt!68786 (readBitPure!0 lt!68783))))

(declare-fun readerFrom!0 (BitStream!1770 (_ BitVec 32) (_ BitVec 32)) BitStream!1770)

(assert (=> b!44951 (= lt!68783 (readerFrom!0 (_2!2286 lt!68788) (currentBit!2841 thiss!1379) (currentByte!2846 thiss!1379)))))

(declare-fun b!44952 () Bool)

(declare-fun res!38034 () Bool)

(assert (=> b!44952 (=> (not res!38034) (not e!29942))))

(assert (=> b!44952 (= res!38034 (isPrefixOf!0 thiss!1379 (_2!2286 lt!68790)))))

(declare-fun b!44953 () Bool)

(assert (=> b!44953 (= e!29942 e!29939)))

(declare-fun res!38029 () Bool)

(assert (=> b!44953 (=> (not res!38029) (not e!29939))))

(assert (=> b!44953 (= res!38029 (and (= (_2!2292 lt!68781) lt!68780) (= (_1!2292 lt!68781) (_2!2286 lt!68790))))))

(assert (=> b!44953 (= lt!68781 (readBitPure!0 (readerFrom!0 (_2!2286 lt!68790) (currentBit!2841 thiss!1379) (currentByte!2846 thiss!1379))))))

(declare-fun b!44954 () Bool)

(declare-fun res!38028 () Bool)

(assert (=> b!44954 (=> (not res!38028) (not e!29942))))

(assert (=> b!44954 (= res!38028 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68790))) (currentByte!2846 (_2!2286 lt!68790)) (currentBit!2841 (_2!2286 lt!68790))) (bvadd (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13070 res!38032) b!44954))

(assert (= (and b!44954 res!38028) b!44952))

(assert (= (and b!44952 res!38034) b!44953))

(assert (= (and b!44953 res!38029) b!44947))

(assert (= (and d!13070 res!38030) b!44950))

(assert (= (and b!44950 res!38033) b!44948))

(assert (= (and b!44948 res!38031) b!44951))

(assert (= (and b!44951 res!38027) b!44949))

(declare-fun m!68533 () Bool)

(assert (=> b!44952 m!68533))

(declare-fun m!68535 () Bool)

(assert (=> b!44947 m!68535))

(declare-fun m!68537 () Bool)

(assert (=> b!44947 m!68537))

(assert (=> b!44954 m!68537))

(assert (=> b!44954 m!68433))

(declare-fun m!68539 () Bool)

(assert (=> b!44951 m!68539))

(declare-fun m!68541 () Bool)

(assert (=> b!44951 m!68541))

(declare-fun m!68543 () Bool)

(assert (=> b!44951 m!68543))

(declare-fun m!68545 () Bool)

(assert (=> b!44948 m!68545))

(declare-fun m!68547 () Bool)

(assert (=> d!13070 m!68547))

(declare-fun m!68549 () Bool)

(assert (=> d!13070 m!68549))

(assert (=> d!13070 m!68503))

(declare-fun m!68551 () Bool)

(assert (=> b!44953 m!68551))

(assert (=> b!44953 m!68551))

(declare-fun m!68553 () Bool)

(assert (=> b!44953 m!68553))

(declare-fun m!68555 () Bool)

(assert (=> b!44950 m!68555))

(assert (=> b!44950 m!68433))

(declare-fun m!68557 () Bool)

(assert (=> b!44949 m!68557))

(assert (=> b!44949 m!68555))

(assert (=> b!44835 d!13070))

(declare-fun d!13090 () Bool)

(assert (=> d!13090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 thiss!1379))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1013 (buf!1359 thiss!1379))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3477 () Bool)

(assert (= bs!3477 d!13090))

(declare-fun m!68559 () Bool)

(assert (=> bs!3477 m!68559))

(assert (=> b!44840 d!13090))

(declare-fun d!13092 () Bool)

(declare-fun e!29945 () Bool)

(assert (=> d!13092 e!29945))

(declare-fun res!38039 () Bool)

(assert (=> d!13092 (=> (not res!38039) (not e!29945))))

(declare-fun lt!68804 () (_ BitVec 64))

(declare-fun lt!68807 () (_ BitVec 64))

(declare-fun lt!68805 () (_ BitVec 64))

(assert (=> d!13092 (= res!38039 (= lt!68804 (bvsub lt!68805 lt!68807)))))

(assert (=> d!13092 (or (= (bvand lt!68805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68805 lt!68807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13092 (= lt!68807 (remainingBits!0 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683)))))))

(declare-fun lt!68806 () (_ BitVec 64))

(declare-fun lt!68808 () (_ BitVec 64))

(assert (=> d!13092 (= lt!68805 (bvmul lt!68806 lt!68808))))

(assert (=> d!13092 (or (= lt!68806 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68808 (bvsdiv (bvmul lt!68806 lt!68808) lt!68806)))))

(assert (=> d!13092 (= lt!68808 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13092 (= lt!68806 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))))))

(assert (=> d!13092 (= lt!68804 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683)))))))

(assert (=> d!13092 (invariant!0 (currentBit!2841 (_2!2286 lt!68683)) (currentByte!2846 (_2!2286 lt!68683)) (size!1013 (buf!1359 (_2!2286 lt!68683))))))

(assert (=> d!13092 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))) lt!68804)))

(declare-fun b!44959 () Bool)

(declare-fun res!38040 () Bool)

(assert (=> b!44959 (=> (not res!38040) (not e!29945))))

(assert (=> b!44959 (= res!38040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68804))))

(declare-fun b!44960 () Bool)

(declare-fun lt!68809 () (_ BitVec 64))

(assert (=> b!44960 (= e!29945 (bvsle lt!68804 (bvmul lt!68809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44960 (or (= lt!68809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68809)))))

(assert (=> b!44960 (= lt!68809 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))))))

(assert (= (and d!13092 res!38039) b!44959))

(assert (= (and b!44959 res!38040) b!44960))

(assert (=> d!13092 m!68519))

(assert (=> d!13092 m!68427))

(assert (=> b!44845 d!13092))

(declare-fun d!13094 () Bool)

(declare-fun e!29946 () Bool)

(assert (=> d!13094 e!29946))

(declare-fun res!38041 () Bool)

(assert (=> d!13094 (=> (not res!38041) (not e!29946))))

(declare-fun lt!68811 () (_ BitVec 64))

(declare-fun lt!68813 () (_ BitVec 64))

(declare-fun lt!68810 () (_ BitVec 64))

(assert (=> d!13094 (= res!38041 (= lt!68810 (bvsub lt!68811 lt!68813)))))

(assert (=> d!13094 (or (= (bvand lt!68811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68813 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68811 lt!68813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13094 (= lt!68813 (remainingBits!0 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68684)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68684))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68684)))))))

(declare-fun lt!68812 () (_ BitVec 64))

(declare-fun lt!68814 () (_ BitVec 64))

(assert (=> d!13094 (= lt!68811 (bvmul lt!68812 lt!68814))))

(assert (=> d!13094 (or (= lt!68812 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68814 (bvsdiv (bvmul lt!68812 lt!68814) lt!68812)))))

(assert (=> d!13094 (= lt!68814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13094 (= lt!68812 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68684)))))))

(assert (=> d!13094 (= lt!68810 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68684))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68684)))))))

(assert (=> d!13094 (invariant!0 (currentBit!2841 (_2!2286 lt!68684)) (currentByte!2846 (_2!2286 lt!68684)) (size!1013 (buf!1359 (_2!2286 lt!68684))))))

(assert (=> d!13094 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68684))) (currentByte!2846 (_2!2286 lt!68684)) (currentBit!2841 (_2!2286 lt!68684))) lt!68810)))

(declare-fun b!44961 () Bool)

(declare-fun res!38042 () Bool)

(assert (=> b!44961 (=> (not res!38042) (not e!29946))))

(assert (=> b!44961 (= res!38042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68810))))

(declare-fun b!44962 () Bool)

(declare-fun lt!68815 () (_ BitVec 64))

(assert (=> b!44962 (= e!29946 (bvsle lt!68810 (bvmul lt!68815 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44962 (or (= lt!68815 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68815 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68815)))))

(assert (=> b!44962 (= lt!68815 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68684)))))))

(assert (= (and d!13094 res!38041) b!44961))

(assert (= (and b!44961 res!38042) b!44962))

(declare-fun m!68561 () Bool)

(assert (=> d!13094 m!68561))

(assert (=> d!13094 m!68395))

(assert (=> b!44842 d!13094))

(declare-fun d!13096 () Bool)

(declare-fun res!38043 () Bool)

(declare-fun e!29948 () Bool)

(assert (=> d!13096 (=> (not res!38043) (not e!29948))))

(assert (=> d!13096 (= res!38043 (= (size!1013 (buf!1359 thiss!1379)) (size!1013 (buf!1359 thiss!1379))))))

(assert (=> d!13096 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29948)))

(declare-fun b!44963 () Bool)

(declare-fun res!38044 () Bool)

(assert (=> b!44963 (=> (not res!38044) (not e!29948))))

(assert (=> b!44963 (= res!38044 (bvsle (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)) (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379))))))

(declare-fun b!44964 () Bool)

(declare-fun e!29947 () Bool)

(assert (=> b!44964 (= e!29948 e!29947)))

(declare-fun res!38045 () Bool)

(assert (=> b!44964 (=> res!38045 e!29947)))

(assert (=> b!44964 (= res!38045 (= (size!1013 (buf!1359 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44965 () Bool)

(assert (=> b!44965 (= e!29947 (arrayBitRangesEq!0 (buf!1359 thiss!1379) (buf!1359 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379))))))

(assert (= (and d!13096 res!38043) b!44963))

(assert (= (and b!44963 res!38044) b!44964))

(assert (= (and b!44964 (not res!38045)) b!44965))

(assert (=> b!44963 m!68433))

(assert (=> b!44963 m!68433))

(assert (=> b!44965 m!68433))

(assert (=> b!44965 m!68433))

(declare-fun m!68563 () Bool)

(assert (=> b!44965 m!68563))

(assert (=> b!44836 d!13096))

(declare-fun d!13098 () Bool)

(assert (=> d!13098 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!68818 () Unit!3192)

(declare-fun choose!11 (BitStream!1770) Unit!3192)

(assert (=> d!13098 (= lt!68818 (choose!11 thiss!1379))))

(assert (=> d!13098 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!68818)))

(declare-fun bs!3479 () Bool)

(assert (= bs!3479 d!13098))

(assert (=> bs!3479 m!68429))

(declare-fun m!68565 () Bool)

(assert (=> bs!3479 m!68565))

(assert (=> b!44836 d!13098))

(declare-fun d!13100 () Bool)

(declare-fun e!29949 () Bool)

(assert (=> d!13100 e!29949))

(declare-fun res!38046 () Bool)

(assert (=> d!13100 (=> (not res!38046) (not e!29949))))

(declare-fun lt!68819 () (_ BitVec 64))

(declare-fun lt!68820 () (_ BitVec 64))

(declare-fun lt!68822 () (_ BitVec 64))

(assert (=> d!13100 (= res!38046 (= lt!68819 (bvsub lt!68820 lt!68822)))))

(assert (=> d!13100 (or (= (bvand lt!68820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68820 lt!68822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13100 (= lt!68822 (remainingBits!0 ((_ sign_extend 32) (size!1013 (buf!1359 thiss!1379))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379))))))

(declare-fun lt!68821 () (_ BitVec 64))

(declare-fun lt!68823 () (_ BitVec 64))

(assert (=> d!13100 (= lt!68820 (bvmul lt!68821 lt!68823))))

(assert (=> d!13100 (or (= lt!68821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!68823 (bvsdiv (bvmul lt!68821 lt!68823) lt!68821)))))

(assert (=> d!13100 (= lt!68823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13100 (= lt!68821 ((_ sign_extend 32) (size!1013 (buf!1359 thiss!1379))))))

(assert (=> d!13100 (= lt!68819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2846 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2841 thiss!1379))))))

(assert (=> d!13100 (invariant!0 (currentBit!2841 thiss!1379) (currentByte!2846 thiss!1379) (size!1013 (buf!1359 thiss!1379)))))

(assert (=> d!13100 (= (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)) lt!68819)))

(declare-fun b!44966 () Bool)

(declare-fun res!38047 () Bool)

(assert (=> b!44966 (=> (not res!38047) (not e!29949))))

(assert (=> b!44966 (= res!38047 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!68819))))

(declare-fun b!44967 () Bool)

(declare-fun lt!68824 () (_ BitVec 64))

(assert (=> b!44967 (= e!29949 (bvsle lt!68819 (bvmul lt!68824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44967 (or (= lt!68824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!68824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!68824)))))

(assert (=> b!44967 (= lt!68824 ((_ sign_extend 32) (size!1013 (buf!1359 thiss!1379))))))

(assert (= (and d!13100 res!38046) b!44966))

(assert (= (and b!44966 res!38047) b!44967))

(assert (=> d!13100 m!68559))

(assert (=> d!13100 m!68515))

(assert (=> b!44836 d!13100))

(declare-fun b!45065 () Bool)

(declare-fun res!38116 () Bool)

(declare-fun e!29997 () Bool)

(assert (=> b!45065 (=> (not res!38116) (not e!29997))))

(declare-fun lt!69130 () tuple2!4386)

(assert (=> b!45065 (= res!38116 (isPrefixOf!0 (_2!2286 lt!68683) (_2!2286 lt!69130)))))

(declare-fun b!45066 () Bool)

(declare-fun res!38120 () Bool)

(assert (=> b!45066 (=> (not res!38120) (not e!29997))))

(assert (=> b!45066 (= res!38120 (invariant!0 (currentBit!2841 (_2!2286 lt!69130)) (currentByte!2846 (_2!2286 lt!69130)) (size!1013 (buf!1359 (_2!2286 lt!69130)))))))

(declare-fun call!541 () tuple2!4388)

(declare-fun c!3027 () Bool)

(declare-fun lt!69109 () tuple2!4386)

(declare-fun bm!538 () Bool)

(declare-fun lt!69103 () tuple2!4386)

(assert (=> bm!538 (= call!541 (reader!0 (ite c!3027 (_2!2286 lt!69103) (_2!2286 lt!68683)) (ite c!3027 (_2!2286 lt!69109) (_2!2286 lt!68683))))))

(declare-fun b!45067 () Bool)

(declare-fun res!38121 () Bool)

(assert (=> b!45067 (=> (not res!38121) (not e!29997))))

(assert (=> b!45067 (= res!38121 (= (size!1013 (buf!1359 (_2!2286 lt!69130))) (size!1013 (buf!1359 (_2!2286 lt!68683)))))))

(declare-fun b!45068 () Bool)

(declare-fun res!38119 () Bool)

(assert (=> b!45068 (=> (not res!38119) (not e!29997))))

(assert (=> b!45068 (= res!38119 (= (size!1013 (buf!1359 (_2!2286 lt!68683))) (size!1013 (buf!1359 (_2!2286 lt!69130)))))))

(declare-fun b!45069 () Bool)

(declare-fun e!29996 () tuple2!4386)

(declare-fun Unit!3196 () Unit!3192)

(assert (=> b!45069 (= e!29996 (tuple2!4387 Unit!3196 (_2!2286 lt!69109)))))

(assert (=> b!45069 (= lt!69103 (appendBitFromByte!0 (_2!2286 lt!68683) (select (arr!1527 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!69137 () (_ BitVec 64))

(assert (=> b!45069 (= lt!69137 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69117 () (_ BitVec 64))

(assert (=> b!45069 (= lt!69117 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69114 () Unit!3192)

(assert (=> b!45069 (= lt!69114 (validateOffsetBitsIneqLemma!0 (_2!2286 lt!68683) (_2!2286 lt!69103) lt!69137 lt!69117))))

(assert (=> b!45069 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!69103)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!69103))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!69103))) (bvsub lt!69137 lt!69117))))

(declare-fun lt!69141 () Unit!3192)

(assert (=> b!45069 (= lt!69141 lt!69114)))

(declare-fun lt!69104 () tuple2!4388)

(assert (=> b!45069 (= lt!69104 (reader!0 (_2!2286 lt!68683) (_2!2286 lt!69103)))))

(declare-fun lt!69116 () (_ BitVec 64))

(assert (=> b!45069 (= lt!69116 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69136 () Unit!3192)

(assert (=> b!45069 (= lt!69136 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2286 lt!68683) (buf!1359 (_2!2286 lt!69103)) lt!69116))))

(assert (=> b!45069 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!69103)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) lt!69116)))

(declare-fun lt!69122 () Unit!3192)

(assert (=> b!45069 (= lt!69122 lt!69136)))

(assert (=> b!45069 (= (head!345 (byteArrayBitContentToList!0 (_2!2286 lt!69103) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!345 (bitStreamReadBitsIntoList!0 (_2!2286 lt!69103) (_1!2287 lt!69104) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69113 () Unit!3192)

(declare-fun Unit!3197 () Unit!3192)

(assert (=> b!45069 (= lt!69113 Unit!3197)))

(assert (=> b!45069 (= lt!69109 (appendBitsMSBFirstLoop!0 (_2!2286 lt!69103) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!69121 () Unit!3192)

(assert (=> b!45069 (= lt!69121 (lemmaIsPrefixTransitive!0 (_2!2286 lt!68683) (_2!2286 lt!69103) (_2!2286 lt!69109)))))

(assert (=> b!45069 (isPrefixOf!0 (_2!2286 lt!68683) (_2!2286 lt!69109))))

(declare-fun lt!69143 () Unit!3192)

(assert (=> b!45069 (= lt!69143 lt!69121)))

(assert (=> b!45069 (= (size!1013 (buf!1359 (_2!2286 lt!69109))) (size!1013 (buf!1359 (_2!2286 lt!68683))))))

(declare-fun lt!69120 () Unit!3192)

(declare-fun Unit!3198 () Unit!3192)

(assert (=> b!45069 (= lt!69120 Unit!3198)))

(assert (=> b!45069 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!69109))) (currentByte!2846 (_2!2286 lt!69109)) (currentBit!2841 (_2!2286 lt!69109))) (bvsub (bvadd (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69138 () Unit!3192)

(declare-fun Unit!3199 () Unit!3192)

(assert (=> b!45069 (= lt!69138 Unit!3199)))

(assert (=> b!45069 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!69109))) (currentByte!2846 (_2!2286 lt!69109)) (currentBit!2841 (_2!2286 lt!69109))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!69103))) (currentByte!2846 (_2!2286 lt!69103)) (currentBit!2841 (_2!2286 lt!69103))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69135 () Unit!3192)

(declare-fun Unit!3200 () Unit!3192)

(assert (=> b!45069 (= lt!69135 Unit!3200)))

(declare-fun lt!69128 () tuple2!4388)

(assert (=> b!45069 (= lt!69128 (reader!0 (_2!2286 lt!68683) (_2!2286 lt!69109)))))

(declare-fun lt!69124 () (_ BitVec 64))

(assert (=> b!45069 (= lt!69124 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69131 () Unit!3192)

(assert (=> b!45069 (= lt!69131 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2286 lt!68683) (buf!1359 (_2!2286 lt!69109)) lt!69124))))

(assert (=> b!45069 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!69109)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) lt!69124)))

(declare-fun lt!69102 () Unit!3192)

(assert (=> b!45069 (= lt!69102 lt!69131)))

(declare-fun lt!69108 () tuple2!4388)

(assert (=> b!45069 (= lt!69108 call!541)))

(declare-fun lt!69119 () (_ BitVec 64))

(assert (=> b!45069 (= lt!69119 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69105 () Unit!3192)

(assert (=> b!45069 (= lt!69105 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2286 lt!69103) (buf!1359 (_2!2286 lt!69109)) lt!69119))))

(assert (=> b!45069 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!69109)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!69103))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!69103))) lt!69119)))

(declare-fun lt!69132 () Unit!3192)

(assert (=> b!45069 (= lt!69132 lt!69105)))

(declare-fun lt!69126 () List!526)

(assert (=> b!45069 (= lt!69126 (byteArrayBitContentToList!0 (_2!2286 lt!69109) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!69134 () List!526)

(assert (=> b!45069 (= lt!69134 (byteArrayBitContentToList!0 (_2!2286 lt!69109) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69140 () List!526)

(assert (=> b!45069 (= lt!69140 (bitStreamReadBitsIntoList!0 (_2!2286 lt!69109) (_1!2287 lt!69128) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!69110 () List!526)

(assert (=> b!45069 (= lt!69110 (bitStreamReadBitsIntoList!0 (_2!2286 lt!69109) (_1!2287 lt!69108) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69106 () (_ BitVec 64))

(assert (=> b!45069 (= lt!69106 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69144 () Unit!3192)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1770 BitStream!1770 BitStream!1770 BitStream!1770 (_ BitVec 64) List!526) Unit!3192)

(assert (=> b!45069 (= lt!69144 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2286 lt!69109) (_2!2286 lt!69109) (_1!2287 lt!69128) (_1!2287 lt!69108) lt!69106 lt!69140))))

(declare-fun tail!217 (List!526) List!526)

(assert (=> b!45069 (= (bitStreamReadBitsIntoList!0 (_2!2286 lt!69109) (_1!2287 lt!69108) (bvsub lt!69106 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!217 lt!69140))))

(declare-fun lt!69142 () Unit!3192)

(assert (=> b!45069 (= lt!69142 lt!69144)))

(declare-fun lt!69123 () Unit!3192)

(declare-fun lt!69129 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2250 array!2250 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3192)

(assert (=> b!45069 (= lt!69123 (arrayBitRangesEqImpliesEq!0 (buf!1359 (_2!2286 lt!69103)) (buf!1359 (_2!2286 lt!69109)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!69129 (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!69103))) (currentByte!2846 (_2!2286 lt!69103)) (currentBit!2841 (_2!2286 lt!69103)))))))

(declare-fun bitAt!0 (array!2250 (_ BitVec 64)) Bool)

(assert (=> b!45069 (= (bitAt!0 (buf!1359 (_2!2286 lt!69103)) lt!69129) (bitAt!0 (buf!1359 (_2!2286 lt!69109)) lt!69129))))

(declare-fun lt!69127 () Unit!3192)

(assert (=> b!45069 (= lt!69127 lt!69123)))

(declare-fun b!45071 () Bool)

(declare-fun Unit!3201 () Unit!3192)

(assert (=> b!45071 (= e!29996 (tuple2!4387 Unit!3201 (_2!2286 lt!68683)))))

(assert (=> b!45071 (= (size!1013 (buf!1359 (_2!2286 lt!68683))) (size!1013 (buf!1359 (_2!2286 lt!68683))))))

(declare-fun lt!69118 () Unit!3192)

(declare-fun Unit!3202 () Unit!3192)

(assert (=> b!45071 (= lt!69118 Unit!3202)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1770 array!2250 array!2250 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45071 (checkByteArrayBitContent!0 (_2!2286 lt!68683) srcBuffer!2 (_1!2293 (readBits!0 (_1!2287 call!541) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69125 () tuple2!4388)

(declare-fun b!45072 () Bool)

(assert (=> b!45072 (= e!29997 (= (bitStreamReadBitsIntoList!0 (_2!2286 lt!69130) (_1!2287 lt!69125) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2286 lt!69130) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!45072 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45072 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69107 () Unit!3192)

(declare-fun lt!69139 () Unit!3192)

(assert (=> b!45072 (= lt!69107 lt!69139)))

(declare-fun lt!69111 () (_ BitVec 64))

(assert (=> b!45072 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!69130)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) lt!69111)))

(assert (=> b!45072 (= lt!69139 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2286 lt!68683) (buf!1359 (_2!2286 lt!69130)) lt!69111))))

(declare-fun e!29995 () Bool)

(assert (=> b!45072 e!29995))

(declare-fun res!38118 () Bool)

(assert (=> b!45072 (=> (not res!38118) (not e!29995))))

(assert (=> b!45072 (= res!38118 (and (= (size!1013 (buf!1359 (_2!2286 lt!68683))) (size!1013 (buf!1359 (_2!2286 lt!69130)))) (bvsge lt!69111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45072 (= lt!69111 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!45072 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45072 (= lt!69125 (reader!0 (_2!2286 lt!68683) (_2!2286 lt!69130)))))

(declare-fun d!13102 () Bool)

(assert (=> d!13102 e!29997))

(declare-fun res!38117 () Bool)

(assert (=> d!13102 (=> (not res!38117) (not e!29997))))

(declare-fun lt!69112 () (_ BitVec 64))

(assert (=> d!13102 (= res!38117 (= (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!69130))) (currentByte!2846 (_2!2286 lt!69130)) (currentBit!2841 (_2!2286 lt!69130))) (bvsub lt!69112 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13102 (or (= (bvand lt!69112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69112 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69145 () (_ BitVec 64))

(assert (=> d!13102 (= lt!69112 (bvadd lt!69145 to!314))))

(assert (=> d!13102 (or (not (= (bvand lt!69145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!69145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!69145 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13102 (= lt!69145 (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))))))

(assert (=> d!13102 (= lt!69130 e!29996)))

(assert (=> d!13102 (= c!3027 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!69115 () Unit!3192)

(declare-fun lt!69133 () Unit!3192)

(assert (=> d!13102 (= lt!69115 lt!69133)))

(assert (=> d!13102 (isPrefixOf!0 (_2!2286 lt!68683) (_2!2286 lt!68683))))

(assert (=> d!13102 (= lt!69133 (lemmaIsPrefixRefl!0 (_2!2286 lt!68683)))))

(assert (=> d!13102 (= lt!69129 (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))))))

(assert (=> d!13102 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13102 (= (appendBitsMSBFirstLoop!0 (_2!2286 lt!68683) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!69130)))

(declare-fun b!45070 () Bool)

(assert (=> b!45070 (= e!29995 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 (_2!2286 lt!68683))) ((_ sign_extend 32) (currentBit!2841 (_2!2286 lt!68683))) lt!69111))))

(assert (= (and d!13102 c!3027) b!45069))

(assert (= (and d!13102 (not c!3027)) b!45071))

(assert (= (or b!45069 b!45071) bm!538))

(assert (= (and d!13102 res!38117) b!45066))

(assert (= (and b!45066 res!38120) b!45068))

(assert (= (and b!45068 res!38119) b!45065))

(assert (= (and b!45065 res!38116) b!45067))

(assert (= (and b!45067 res!38121) b!45072))

(assert (= (and b!45072 res!38118) b!45070))

(declare-fun m!68711 () Bool)

(assert (=> b!45070 m!68711))

(declare-fun m!68713 () Bool)

(assert (=> b!45069 m!68713))

(declare-fun m!68715 () Bool)

(assert (=> b!45069 m!68715))

(declare-fun m!68717 () Bool)

(assert (=> b!45069 m!68717))

(declare-fun m!68719 () Bool)

(assert (=> b!45069 m!68719))

(declare-fun m!68721 () Bool)

(assert (=> b!45069 m!68721))

(declare-fun m!68723 () Bool)

(assert (=> b!45069 m!68723))

(declare-fun m!68725 () Bool)

(assert (=> b!45069 m!68725))

(declare-fun m!68727 () Bool)

(assert (=> b!45069 m!68727))

(declare-fun m!68729 () Bool)

(assert (=> b!45069 m!68729))

(declare-fun m!68731 () Bool)

(assert (=> b!45069 m!68731))

(declare-fun m!68733 () Bool)

(assert (=> b!45069 m!68733))

(declare-fun m!68735 () Bool)

(assert (=> b!45069 m!68735))

(declare-fun m!68737 () Bool)

(assert (=> b!45069 m!68737))

(declare-fun m!68739 () Bool)

(assert (=> b!45069 m!68739))

(declare-fun m!68741 () Bool)

(assert (=> b!45069 m!68741))

(assert (=> b!45069 m!68725))

(declare-fun m!68743 () Bool)

(assert (=> b!45069 m!68743))

(declare-fun m!68745 () Bool)

(assert (=> b!45069 m!68745))

(assert (=> b!45069 m!68415))

(assert (=> b!45069 m!68719))

(assert (=> b!45069 m!68735))

(assert (=> b!45069 m!68731))

(declare-fun m!68747 () Bool)

(assert (=> b!45069 m!68747))

(declare-fun m!68749 () Bool)

(assert (=> b!45069 m!68749))

(declare-fun m!68751 () Bool)

(assert (=> b!45069 m!68751))

(declare-fun m!68753 () Bool)

(assert (=> b!45069 m!68753))

(declare-fun m!68755 () Bool)

(assert (=> b!45069 m!68755))

(declare-fun m!68757 () Bool)

(assert (=> b!45069 m!68757))

(declare-fun m!68759 () Bool)

(assert (=> b!45069 m!68759))

(declare-fun m!68761 () Bool)

(assert (=> b!45069 m!68761))

(declare-fun m!68763 () Bool)

(assert (=> b!45069 m!68763))

(declare-fun m!68765 () Bool)

(assert (=> b!45069 m!68765))

(declare-fun m!68767 () Bool)

(assert (=> b!45069 m!68767))

(declare-fun m!68769 () Bool)

(assert (=> b!45069 m!68769))

(declare-fun m!68771 () Bool)

(assert (=> b!45069 m!68771))

(declare-fun m!68773 () Bool)

(assert (=> b!45069 m!68773))

(declare-fun m!68775 () Bool)

(assert (=> b!45065 m!68775))

(declare-fun m!68777 () Bool)

(assert (=> bm!538 m!68777))

(declare-fun m!68779 () Bool)

(assert (=> b!45066 m!68779))

(declare-fun m!68781 () Bool)

(assert (=> b!45072 m!68781))

(declare-fun m!68783 () Bool)

(assert (=> b!45072 m!68783))

(declare-fun m!68785 () Bool)

(assert (=> b!45072 m!68785))

(declare-fun m!68787 () Bool)

(assert (=> b!45072 m!68787))

(declare-fun m!68789 () Bool)

(assert (=> b!45072 m!68789))

(declare-fun m!68791 () Bool)

(assert (=> b!45071 m!68791))

(declare-fun m!68793 () Bool)

(assert (=> b!45071 m!68793))

(declare-fun m!68795 () Bool)

(assert (=> d!13102 m!68795))

(assert (=> d!13102 m!68415))

(declare-fun m!68797 () Bool)

(assert (=> d!13102 m!68797))

(declare-fun m!68799 () Bool)

(assert (=> d!13102 m!68799))

(assert (=> b!44841 d!13102))

(declare-fun d!13130 () Bool)

(declare-fun res!38122 () Bool)

(declare-fun e!29999 () Bool)

(assert (=> d!13130 (=> (not res!38122) (not e!29999))))

(assert (=> d!13130 (= res!38122 (= (size!1013 (buf!1359 (_2!2286 lt!68683))) (size!1013 (buf!1359 (_2!2286 lt!68684)))))))

(assert (=> d!13130 (= (isPrefixOf!0 (_2!2286 lt!68683) (_2!2286 lt!68684)) e!29999)))

(declare-fun b!45073 () Bool)

(declare-fun res!38123 () Bool)

(assert (=> b!45073 (=> (not res!38123) (not e!29999))))

(assert (=> b!45073 (= res!38123 (bvsle (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))) (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68684))) (currentByte!2846 (_2!2286 lt!68684)) (currentBit!2841 (_2!2286 lt!68684)))))))

(declare-fun b!45074 () Bool)

(declare-fun e!29998 () Bool)

(assert (=> b!45074 (= e!29999 e!29998)))

(declare-fun res!38124 () Bool)

(assert (=> b!45074 (=> res!38124 e!29998)))

(assert (=> b!45074 (= res!38124 (= (size!1013 (buf!1359 (_2!2286 lt!68683))) #b00000000000000000000000000000000))))

(declare-fun b!45075 () Bool)

(assert (=> b!45075 (= e!29998 (arrayBitRangesEq!0 (buf!1359 (_2!2286 lt!68683)) (buf!1359 (_2!2286 lt!68684)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683)))))))

(assert (= (and d!13130 res!38122) b!45073))

(assert (= (and b!45073 res!38123) b!45074))

(assert (= (and b!45074 (not res!38124)) b!45075))

(assert (=> b!45073 m!68415))

(assert (=> b!45073 m!68411))

(assert (=> b!45075 m!68415))

(assert (=> b!45075 m!68415))

(declare-fun m!68801 () Bool)

(assert (=> b!45075 m!68801))

(assert (=> b!44841 d!13130))

(declare-fun d!13132 () Bool)

(declare-fun res!38125 () Bool)

(declare-fun e!30001 () Bool)

(assert (=> d!13132 (=> (not res!38125) (not e!30001))))

(assert (=> d!13132 (= res!38125 (= (size!1013 (buf!1359 thiss!1379)) (size!1013 (buf!1359 (_2!2286 lt!68684)))))))

(assert (=> d!13132 (= (isPrefixOf!0 thiss!1379 (_2!2286 lt!68684)) e!30001)))

(declare-fun b!45076 () Bool)

(declare-fun res!38126 () Bool)

(assert (=> b!45076 (=> (not res!38126) (not e!30001))))

(assert (=> b!45076 (= res!38126 (bvsle (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)) (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68684))) (currentByte!2846 (_2!2286 lt!68684)) (currentBit!2841 (_2!2286 lt!68684)))))))

(declare-fun b!45077 () Bool)

(declare-fun e!30000 () Bool)

(assert (=> b!45077 (= e!30001 e!30000)))

(declare-fun res!38127 () Bool)

(assert (=> b!45077 (=> res!38127 e!30000)))

(assert (=> b!45077 (= res!38127 (= (size!1013 (buf!1359 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45078 () Bool)

(assert (=> b!45078 (= e!30000 (arrayBitRangesEq!0 (buf!1359 thiss!1379) (buf!1359 (_2!2286 lt!68684)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379))))))

(assert (= (and d!13132 res!38125) b!45076))

(assert (= (and b!45076 res!38126) b!45077))

(assert (= (and b!45077 (not res!38127)) b!45078))

(assert (=> b!45076 m!68433))

(assert (=> b!45076 m!68411))

(assert (=> b!45078 m!68433))

(assert (=> b!45078 m!68433))

(declare-fun m!68803 () Bool)

(assert (=> b!45078 m!68803))

(assert (=> b!44841 d!13132))

(declare-fun d!13134 () Bool)

(assert (=> d!13134 (isPrefixOf!0 thiss!1379 (_2!2286 lt!68684))))

(declare-fun lt!69148 () Unit!3192)

(declare-fun choose!30 (BitStream!1770 BitStream!1770 BitStream!1770) Unit!3192)

(assert (=> d!13134 (= lt!69148 (choose!30 thiss!1379 (_2!2286 lt!68683) (_2!2286 lt!68684)))))

(assert (=> d!13134 (isPrefixOf!0 thiss!1379 (_2!2286 lt!68683))))

(assert (=> d!13134 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2286 lt!68683) (_2!2286 lt!68684)) lt!69148)))

(declare-fun bs!3485 () Bool)

(assert (= bs!3485 d!13134))

(assert (=> bs!3485 m!68399))

(declare-fun m!68805 () Bool)

(assert (=> bs!3485 m!68805))

(assert (=> bs!3485 m!68417))

(assert (=> b!44841 d!13134))

(declare-fun d!13136 () Bool)

(assert (=> d!13136 (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69151 () Unit!3192)

(declare-fun choose!9 (BitStream!1770 array!2250 (_ BitVec 64) BitStream!1770) Unit!3192)

(assert (=> d!13136 (= lt!69151 (choose!9 thiss!1379 (buf!1359 (_2!2286 lt!68683)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1771 (buf!1359 (_2!2286 lt!68683)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379))))))

(assert (=> d!13136 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1359 (_2!2286 lt!68683)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!69151)))

(declare-fun bs!3486 () Bool)

(assert (= bs!3486 d!13136))

(assert (=> bs!3486 m!68405))

(declare-fun m!68807 () Bool)

(assert (=> bs!3486 m!68807))

(assert (=> b!44841 d!13136))

(declare-fun d!13138 () Bool)

(assert (=> d!13138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1013 (buf!1359 (_2!2286 lt!68683)))) ((_ sign_extend 32) (currentByte!2846 thiss!1379)) ((_ sign_extend 32) (currentBit!2841 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3487 () Bool)

(assert (= bs!3487 d!13138))

(declare-fun m!68809 () Bool)

(assert (=> bs!3487 m!68809))

(assert (=> b!44841 d!13138))

(declare-fun lt!69303 () tuple2!4388)

(declare-fun lt!69322 () (_ BitVec 64))

(declare-fun b!45132 () Bool)

(declare-fun e!30027 () Bool)

(declare-fun lt!69316 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1770 (_ BitVec 64)) BitStream!1770)

(assert (=> b!45132 (= e!30027 (= (_1!2287 lt!69303) (withMovedBitIndex!0 (_2!2287 lt!69303) (bvsub lt!69322 lt!69316))))))

(assert (=> b!45132 (or (= (bvand lt!69322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69322 lt!69316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45132 (= lt!69316 (bitIndex!0 (size!1013 (buf!1359 (_2!2286 lt!68683))) (currentByte!2846 (_2!2286 lt!68683)) (currentBit!2841 (_2!2286 lt!68683))))))

(assert (=> b!45132 (= lt!69322 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)))))

(declare-fun b!45133 () Bool)

(declare-fun e!30028 () Unit!3192)

(declare-fun lt!69312 () Unit!3192)

(assert (=> b!45133 (= e!30028 lt!69312)))

(declare-fun lt!69313 () (_ BitVec 64))

(assert (=> b!45133 (= lt!69313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69306 () (_ BitVec 64))

(assert (=> b!45133 (= lt!69306 (bitIndex!0 (size!1013 (buf!1359 thiss!1379)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2250 array!2250 (_ BitVec 64) (_ BitVec 64)) Unit!3192)

(assert (=> b!45133 (= lt!69312 (arrayBitRangesEqSymmetric!0 (buf!1359 thiss!1379) (buf!1359 (_2!2286 lt!68683)) lt!69313 lt!69306))))

(assert (=> b!45133 (arrayBitRangesEq!0 (buf!1359 (_2!2286 lt!68683)) (buf!1359 thiss!1379) lt!69313 lt!69306)))

(declare-fun b!45134 () Bool)

(declare-fun res!38151 () Bool)

(assert (=> b!45134 (=> (not res!38151) (not e!30027))))

(assert (=> b!45134 (= res!38151 (isPrefixOf!0 (_1!2287 lt!69303) thiss!1379))))

(declare-fun b!45135 () Bool)

(declare-fun res!38150 () Bool)

(assert (=> b!45135 (=> (not res!38150) (not e!30027))))

(assert (=> b!45135 (= res!38150 (isPrefixOf!0 (_2!2287 lt!69303) (_2!2286 lt!68683)))))

(declare-fun b!45136 () Bool)

(declare-fun Unit!3203 () Unit!3192)

(assert (=> b!45136 (= e!30028 Unit!3203)))

(declare-fun d!13140 () Bool)

(assert (=> d!13140 e!30027))

(declare-fun res!38149 () Bool)

(assert (=> d!13140 (=> (not res!38149) (not e!30027))))

(assert (=> d!13140 (= res!38149 (isPrefixOf!0 (_1!2287 lt!69303) (_2!2287 lt!69303)))))

(declare-fun lt!69320 () BitStream!1770)

(assert (=> d!13140 (= lt!69303 (tuple2!4389 lt!69320 (_2!2286 lt!68683)))))

(declare-fun lt!69308 () Unit!3192)

(declare-fun lt!69317 () Unit!3192)

(assert (=> d!13140 (= lt!69308 lt!69317)))

(assert (=> d!13140 (isPrefixOf!0 lt!69320 (_2!2286 lt!68683))))

(assert (=> d!13140 (= lt!69317 (lemmaIsPrefixTransitive!0 lt!69320 (_2!2286 lt!68683) (_2!2286 lt!68683)))))

(declare-fun lt!69318 () Unit!3192)

(declare-fun lt!69304 () Unit!3192)

(assert (=> d!13140 (= lt!69318 lt!69304)))

(assert (=> d!13140 (isPrefixOf!0 lt!69320 (_2!2286 lt!68683))))

(assert (=> d!13140 (= lt!69304 (lemmaIsPrefixTransitive!0 lt!69320 thiss!1379 (_2!2286 lt!68683)))))

(declare-fun lt!69319 () Unit!3192)

(assert (=> d!13140 (= lt!69319 e!30028)))

(declare-fun c!3044 () Bool)

(assert (=> d!13140 (= c!3044 (not (= (size!1013 (buf!1359 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!69307 () Unit!3192)

(declare-fun lt!69310 () Unit!3192)

(assert (=> d!13140 (= lt!69307 lt!69310)))

(assert (=> d!13140 (isPrefixOf!0 (_2!2286 lt!68683) (_2!2286 lt!68683))))

(assert (=> d!13140 (= lt!69310 (lemmaIsPrefixRefl!0 (_2!2286 lt!68683)))))

(declare-fun lt!69315 () Unit!3192)

(declare-fun lt!69314 () Unit!3192)

(assert (=> d!13140 (= lt!69315 lt!69314)))

(assert (=> d!13140 (= lt!69314 (lemmaIsPrefixRefl!0 (_2!2286 lt!68683)))))

(declare-fun lt!69311 () Unit!3192)

(declare-fun lt!69305 () Unit!3192)

(assert (=> d!13140 (= lt!69311 lt!69305)))

(assert (=> d!13140 (isPrefixOf!0 lt!69320 lt!69320)))

(assert (=> d!13140 (= lt!69305 (lemmaIsPrefixRefl!0 lt!69320))))

(declare-fun lt!69309 () Unit!3192)

(declare-fun lt!69321 () Unit!3192)

(assert (=> d!13140 (= lt!69309 lt!69321)))

(assert (=> d!13140 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13140 (= lt!69321 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13140 (= lt!69320 (BitStream!1771 (buf!1359 (_2!2286 lt!68683)) (currentByte!2846 thiss!1379) (currentBit!2841 thiss!1379)))))

(assert (=> d!13140 (isPrefixOf!0 thiss!1379 (_2!2286 lt!68683))))

(assert (=> d!13140 (= (reader!0 thiss!1379 (_2!2286 lt!68683)) lt!69303)))

(assert (= (and d!13140 c!3044) b!45133))

(assert (= (and d!13140 (not c!3044)) b!45136))

(assert (= (and d!13140 res!38149) b!45134))

(assert (= (and b!45134 res!38151) b!45135))

(assert (= (and b!45135 res!38150) b!45132))

(assert (=> b!45133 m!68433))

(declare-fun m!68851 () Bool)

(assert (=> b!45133 m!68851))

(declare-fun m!68853 () Bool)

(assert (=> b!45133 m!68853))

(assert (=> d!13140 m!68417))

(assert (=> d!13140 m!68429))

(assert (=> d!13140 m!68799))

(declare-fun m!68855 () Bool)

(assert (=> d!13140 m!68855))

(declare-fun m!68857 () Bool)

(assert (=> d!13140 m!68857))

(declare-fun m!68859 () Bool)

(assert (=> d!13140 m!68859))

(declare-fun m!68861 () Bool)

(assert (=> d!13140 m!68861))

(assert (=> d!13140 m!68431))

(declare-fun m!68863 () Bool)

(assert (=> d!13140 m!68863))

(declare-fun m!68865 () Bool)

(assert (=> d!13140 m!68865))

(assert (=> d!13140 m!68797))

(declare-fun m!68867 () Bool)

(assert (=> b!45134 m!68867))

(declare-fun m!68871 () Bool)

(assert (=> b!45135 m!68871))

(declare-fun m!68873 () Bool)

(assert (=> b!45132 m!68873))

(assert (=> b!45132 m!68415))

(assert (=> b!45132 m!68433))

(assert (=> b!44841 d!13140))

(declare-fun d!13160 () Bool)

(assert (=> d!13160 (= (array_inv!938 (buf!1359 thiss!1379)) (bvsge (size!1013 (buf!1359 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!44838 d!13160))

(declare-fun d!13162 () Bool)

(assert (=> d!13162 (= (invariant!0 (currentBit!2841 (_2!2286 lt!68684)) (currentByte!2846 (_2!2286 lt!68684)) (size!1013 (buf!1359 (_2!2286 lt!68684)))) (and (bvsge (currentBit!2841 (_2!2286 lt!68684)) #b00000000000000000000000000000000) (bvslt (currentBit!2841 (_2!2286 lt!68684)) #b00000000000000000000000000001000) (bvsge (currentByte!2846 (_2!2286 lt!68684)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2846 (_2!2286 lt!68684)) (size!1013 (buf!1359 (_2!2286 lt!68684)))) (and (= (currentBit!2841 (_2!2286 lt!68684)) #b00000000000000000000000000000000) (= (currentByte!2846 (_2!2286 lt!68684)) (size!1013 (buf!1359 (_2!2286 lt!68684))))))))))

(assert (=> b!44837 d!13162))

(check-sat (not b!44906) (not b!45135) (not b!44963) (not d!13100) (not b!45073) (not b!45070) (not b!44947) (not b!45069) (not b!44965) (not b!45075) (not d!13070) (not d!13062) (not b!44948) (not b!45076) (not b!45078) (not b!44951) (not b!45134) (not b!45065) (not d!13138) (not b!45066) (not b!45133) (not d!13094) (not b!45071) (not b!45132) (not d!13102) (not d!13092) (not b!45072) (not b!44949) (not d!13140) (not d!13098) (not d!13134) (not b!44898) (not b!44952) (not b!44911) (not b!44887) (not bm!538) (not b!44908) (not d!13068) (not b!44953) (not b!44954) (not d!13136) (not d!13066) (not b!44950) (not d!13090) (not b!44899) (not b!44897))
