; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5946 () Bool)

(assert start!5946)

(declare-fun b!26268 () Bool)

(declare-fun res!22638 () Bool)

(declare-fun e!17842 () Bool)

(assert (=> b!26268 (=> res!22638 e!17842)))

(declare-datatypes ((array!1683 0))(
  ( (array!1684 (arr!1186 (Array (_ BitVec 32) (_ BitVec 8))) (size!724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1280 0))(
  ( (BitStream!1281 (buf!1051 array!1683) (currentByte!2376 (_ BitVec 32)) (currentBit!2371 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2926 0))(
  ( (tuple2!2927 (_1!1550 BitStream!1280) (_2!1550 BitStream!1280)) )
))
(declare-fun lt!37945 () tuple2!2926)

(declare-datatypes ((Unit!2151 0))(
  ( (Unit!2152) )
))
(declare-datatypes ((tuple2!2928 0))(
  ( (tuple2!2929 (_1!1551 Unit!2151) (_2!1551 BitStream!1280)) )
))
(declare-fun lt!37936 () tuple2!2928)

(declare-fun isPrefixOf!0 (BitStream!1280 BitStream!1280) Bool)

(assert (=> b!26268 (= res!22638 (not (isPrefixOf!0 (_1!1550 lt!37945) (_2!1551 lt!37936))))))

(declare-fun res!22635 () Bool)

(declare-fun e!17837 () Bool)

(assert (=> start!5946 (=> (not res!22635) (not e!17837))))

(declare-fun srcBuffer!2 () array!1683)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5946 (= res!22635 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!724 srcBuffer!2))))))))

(assert (=> start!5946 e!17837))

(assert (=> start!5946 true))

(declare-fun array_inv!693 (array!1683) Bool)

(assert (=> start!5946 (array_inv!693 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1280)

(declare-fun e!17843 () Bool)

(declare-fun inv!12 (BitStream!1280) Bool)

(assert (=> start!5946 (and (inv!12 thiss!1379) e!17843)))

(declare-fun b!26269 () Bool)

(assert (=> b!26269 (= e!17842 true)))

(declare-fun lt!37938 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26269 (= lt!37938 (bitIndex!0 (size!724 (buf!1051 (_1!1550 lt!37945))) (currentByte!2376 (_1!1550 lt!37945)) (currentBit!2371 (_1!1550 lt!37945))))))

(declare-fun lt!37934 () (_ BitVec 64))

(declare-fun lt!37942 () tuple2!2926)

(assert (=> b!26269 (= lt!37934 (bitIndex!0 (size!724 (buf!1051 (_1!1550 lt!37942))) (currentByte!2376 (_1!1550 lt!37942)) (currentBit!2371 (_1!1550 lt!37942))))))

(declare-fun b!26270 () Bool)

(declare-fun e!17845 () Bool)

(assert (=> b!26270 (= e!17837 (not e!17845))))

(declare-fun res!22639 () Bool)

(assert (=> b!26270 (=> res!22639 e!17845)))

(assert (=> b!26270 (= res!22639 (bvsge i!635 to!314))))

(assert (=> b!26270 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!37939 () Unit!2151)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1280) Unit!2151)

(assert (=> b!26270 (= lt!37939 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!37948 () (_ BitVec 64))

(assert (=> b!26270 (= lt!37948 (bitIndex!0 (size!724 (buf!1051 thiss!1379)) (currentByte!2376 thiss!1379) (currentBit!2371 thiss!1379)))))

(declare-fun b!26271 () Bool)

(declare-fun e!17848 () Bool)

(declare-fun e!17846 () Bool)

(assert (=> b!26271 (= e!17848 e!17846)))

(declare-fun res!22623 () Bool)

(assert (=> b!26271 (=> res!22623 e!17846)))

(declare-fun lt!37947 () tuple2!2928)

(assert (=> b!26271 (= res!22623 (not (isPrefixOf!0 (_2!1551 lt!37947) (_2!1551 lt!37936))))))

(assert (=> b!26271 (isPrefixOf!0 thiss!1379 (_2!1551 lt!37936))))

(declare-fun lt!37941 () Unit!2151)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1280 BitStream!1280 BitStream!1280) Unit!2151)

(assert (=> b!26271 (= lt!37941 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1551 lt!37947) (_2!1551 lt!37936)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1280 array!1683 (_ BitVec 64) (_ BitVec 64)) tuple2!2928)

(assert (=> b!26271 (= lt!37936 (appendBitsMSBFirstLoop!0 (_2!1551 lt!37947) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17840 () Bool)

(assert (=> b!26271 e!17840))

(declare-fun res!22641 () Bool)

(assert (=> b!26271 (=> (not res!22641) (not e!17840))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26271 (= res!22641 (validate_offset_bits!1 ((_ sign_extend 32) (size!724 (buf!1051 (_2!1551 lt!37947)))) ((_ sign_extend 32) (currentByte!2376 thiss!1379)) ((_ sign_extend 32) (currentBit!2371 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37943 () Unit!2151)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1280 array!1683 (_ BitVec 64)) Unit!2151)

(assert (=> b!26271 (= lt!37943 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1051 (_2!1551 lt!37947)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37931 () tuple2!2926)

(declare-fun reader!0 (BitStream!1280 BitStream!1280) tuple2!2926)

(assert (=> b!26271 (= lt!37931 (reader!0 thiss!1379 (_2!1551 lt!37947)))))

(declare-fun b!26272 () Bool)

(declare-fun e!17841 () Bool)

(declare-fun e!17847 () Bool)

(assert (=> b!26272 (= e!17841 e!17847)))

(declare-fun res!22632 () Bool)

(assert (=> b!26272 (=> res!22632 e!17847)))

(assert (=> b!26272 (= res!22632 (not (= (size!724 (buf!1051 (_2!1551 lt!37947))) (size!724 (buf!1051 (_2!1551 lt!37936))))))))

(declare-fun e!17839 () Bool)

(assert (=> b!26272 e!17839))

(declare-fun res!22631 () Bool)

(assert (=> b!26272 (=> (not res!22631) (not e!17839))))

(assert (=> b!26272 (= res!22631 (= (size!724 (buf!1051 (_2!1551 lt!37936))) (size!724 (buf!1051 thiss!1379))))))

(declare-fun b!26273 () Bool)

(declare-fun res!22625 () Bool)

(assert (=> b!26273 (=> res!22625 e!17842)))

(assert (=> b!26273 (= res!22625 (not (isPrefixOf!0 (_1!1550 lt!37942) (_2!1551 lt!37936))))))

(declare-fun b!26274 () Bool)

(declare-fun res!22630 () Bool)

(assert (=> b!26274 (=> res!22630 e!17842)))

(assert (=> b!26274 (= res!22630 (not (isPrefixOf!0 (_1!1550 lt!37942) (_1!1550 lt!37945))))))

(declare-fun b!26275 () Bool)

(declare-fun res!22628 () Bool)

(assert (=> b!26275 (=> res!22628 e!17841)))

(assert (=> b!26275 (= res!22628 (not (= (size!724 (buf!1051 thiss!1379)) (size!724 (buf!1051 (_2!1551 lt!37936))))))))

(declare-fun b!26276 () Bool)

(assert (=> b!26276 (= e!17845 e!17848)))

(declare-fun res!22634 () Bool)

(assert (=> b!26276 (=> res!22634 e!17848)))

(assert (=> b!26276 (= res!22634 (not (isPrefixOf!0 thiss!1379 (_2!1551 lt!37947))))))

(declare-fun lt!37932 () (_ BitVec 64))

(assert (=> b!26276 (validate_offset_bits!1 ((_ sign_extend 32) (size!724 (buf!1051 (_2!1551 lt!37947)))) ((_ sign_extend 32) (currentByte!2376 (_2!1551 lt!37947))) ((_ sign_extend 32) (currentBit!2371 (_2!1551 lt!37947))) lt!37932)))

(assert (=> b!26276 (= lt!37932 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37946 () Unit!2151)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1280 BitStream!1280 (_ BitVec 64) (_ BitVec 64)) Unit!2151)

(assert (=> b!26276 (= lt!37946 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1551 lt!37947) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1280 (_ BitVec 8) (_ BitVec 32)) tuple2!2928)

(assert (=> b!26276 (= lt!37947 (appendBitFromByte!0 thiss!1379 (select (arr!1186 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26277 () Bool)

(assert (=> b!26277 (= e!17846 e!17841)))

(declare-fun res!22627 () Bool)

(assert (=> b!26277 (=> res!22627 e!17841)))

(declare-fun lt!37937 () (_ BitVec 64))

(assert (=> b!26277 (= res!22627 (not (= lt!37937 (bvsub (bvadd lt!37948 to!314) i!635))))))

(assert (=> b!26277 (= lt!37937 (bitIndex!0 (size!724 (buf!1051 (_2!1551 lt!37936))) (currentByte!2376 (_2!1551 lt!37936)) (currentBit!2371 (_2!1551 lt!37936))))))

(declare-fun b!26278 () Bool)

(declare-fun res!22636 () Bool)

(assert (=> b!26278 (=> (not res!22636) (not e!17837))))

(assert (=> b!26278 (= res!22636 (validate_offset_bits!1 ((_ sign_extend 32) (size!724 (buf!1051 thiss!1379))) ((_ sign_extend 32) (currentByte!2376 thiss!1379)) ((_ sign_extend 32) (currentBit!2371 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26279 () Bool)

(declare-fun res!22633 () Bool)

(assert (=> b!26279 (=> res!22633 e!17842)))

(assert (=> b!26279 (= res!22633 (or (not (= (buf!1051 (_1!1550 lt!37942)) (buf!1051 (_1!1550 lt!37945)))) (not (= (buf!1051 (_1!1550 lt!37942)) (buf!1051 (_2!1551 lt!37936)))) (bvsge lt!37937 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26280 () Bool)

(declare-datatypes ((List!341 0))(
  ( (Nil!338) (Cons!337 (h!456 Bool) (t!1091 List!341)) )
))
(declare-fun head!178 (List!341) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1280 array!1683 (_ BitVec 64) (_ BitVec 64)) List!341)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1280 BitStream!1280 (_ BitVec 64)) List!341)

(assert (=> b!26280 (= e!17840 (= (head!178 (byteArrayBitContentToList!0 (_2!1551 lt!37947) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!178 (bitStreamReadBitsIntoList!0 (_2!1551 lt!37947) (_1!1550 lt!37931) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26281 () Bool)

(assert (=> b!26281 (= e!17847 e!17842)))

(declare-fun res!22629 () Bool)

(assert (=> b!26281 (=> res!22629 e!17842)))

(assert (=> b!26281 (= res!22629 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!37944 () List!341)

(assert (=> b!26281 (= lt!37944 (bitStreamReadBitsIntoList!0 (_2!1551 lt!37936) (_1!1550 lt!37945) lt!37932))))

(declare-fun lt!37935 () List!341)

(assert (=> b!26281 (= lt!37935 (bitStreamReadBitsIntoList!0 (_2!1551 lt!37936) (_1!1550 lt!37942) (bvsub to!314 i!635)))))

(assert (=> b!26281 (validate_offset_bits!1 ((_ sign_extend 32) (size!724 (buf!1051 (_2!1551 lt!37936)))) ((_ sign_extend 32) (currentByte!2376 (_2!1551 lt!37947))) ((_ sign_extend 32) (currentBit!2371 (_2!1551 lt!37947))) lt!37932)))

(declare-fun lt!37933 () Unit!2151)

(assert (=> b!26281 (= lt!37933 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1551 lt!37947) (buf!1051 (_2!1551 lt!37936)) lt!37932))))

(assert (=> b!26281 (= lt!37945 (reader!0 (_2!1551 lt!37947) (_2!1551 lt!37936)))))

(assert (=> b!26281 (validate_offset_bits!1 ((_ sign_extend 32) (size!724 (buf!1051 (_2!1551 lt!37936)))) ((_ sign_extend 32) (currentByte!2376 thiss!1379)) ((_ sign_extend 32) (currentBit!2371 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!37940 () Unit!2151)

(assert (=> b!26281 (= lt!37940 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1051 (_2!1551 lt!37936)) (bvsub to!314 i!635)))))

(assert (=> b!26281 (= lt!37942 (reader!0 thiss!1379 (_2!1551 lt!37936)))))

(declare-fun b!26282 () Bool)

(assert (=> b!26282 (= e!17843 (array_inv!693 (buf!1051 thiss!1379)))))

(declare-fun b!26283 () Bool)

(declare-fun res!22640 () Bool)

(assert (=> b!26283 (=> res!22640 e!17847)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26283 (= res!22640 (not (invariant!0 (currentBit!2371 (_2!1551 lt!37947)) (currentByte!2376 (_2!1551 lt!37947)) (size!724 (buf!1051 (_2!1551 lt!37947))))))))

(declare-fun b!26284 () Bool)

(declare-fun res!22637 () Bool)

(assert (=> b!26284 (=> res!22637 e!17842)))

(declare-fun length!67 (List!341) Int)

(assert (=> b!26284 (= res!22637 (<= (length!67 lt!37935) 0))))

(declare-fun b!26285 () Bool)

(declare-fun res!22624 () Bool)

(assert (=> b!26285 (=> res!22624 e!17841)))

(assert (=> b!26285 (= res!22624 (not (invariant!0 (currentBit!2371 (_2!1551 lt!37936)) (currentByte!2376 (_2!1551 lt!37936)) (size!724 (buf!1051 (_2!1551 lt!37936))))))))

(declare-fun b!26286 () Bool)

(assert (=> b!26286 (= e!17839 (= lt!37937 (bvsub (bvsub (bvadd (bitIndex!0 (size!724 (buf!1051 (_2!1551 lt!37947))) (currentByte!2376 (_2!1551 lt!37947)) (currentBit!2371 (_2!1551 lt!37947))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26287 () Bool)

(declare-fun res!22626 () Bool)

(assert (=> b!26287 (=> res!22626 e!17847)))

(assert (=> b!26287 (= res!22626 (not (invariant!0 (currentBit!2371 (_2!1551 lt!37947)) (currentByte!2376 (_2!1551 lt!37947)) (size!724 (buf!1051 (_2!1551 lt!37936))))))))

(assert (= (and start!5946 res!22635) b!26278))

(assert (= (and b!26278 res!22636) b!26270))

(assert (= (and b!26270 (not res!22639)) b!26276))

(assert (= (and b!26276 (not res!22634)) b!26271))

(assert (= (and b!26271 res!22641) b!26280))

(assert (= (and b!26271 (not res!22623)) b!26277))

(assert (= (and b!26277 (not res!22627)) b!26285))

(assert (= (and b!26285 (not res!22624)) b!26275))

(assert (= (and b!26275 (not res!22628)) b!26272))

(assert (= (and b!26272 res!22631) b!26286))

(assert (= (and b!26272 (not res!22632)) b!26283))

(assert (= (and b!26283 (not res!22640)) b!26287))

(assert (= (and b!26287 (not res!22626)) b!26281))

(assert (= (and b!26281 (not res!22629)) b!26284))

(assert (= (and b!26284 (not res!22637)) b!26273))

(assert (= (and b!26273 (not res!22625)) b!26268))

(assert (= (and b!26268 (not res!22638)) b!26274))

(assert (= (and b!26274 (not res!22630)) b!26279))

(assert (= (and b!26279 (not res!22633)) b!26269))

(assert (= start!5946 b!26282))

(declare-fun m!37677 () Bool)

(assert (=> b!26274 m!37677))

(declare-fun m!37679 () Bool)

(assert (=> b!26273 m!37679))

(declare-fun m!37681 () Bool)

(assert (=> b!26281 m!37681))

(declare-fun m!37683 () Bool)

(assert (=> b!26281 m!37683))

(declare-fun m!37685 () Bool)

(assert (=> b!26281 m!37685))

(declare-fun m!37687 () Bool)

(assert (=> b!26281 m!37687))

(declare-fun m!37689 () Bool)

(assert (=> b!26281 m!37689))

(declare-fun m!37691 () Bool)

(assert (=> b!26281 m!37691))

(declare-fun m!37693 () Bool)

(assert (=> b!26281 m!37693))

(declare-fun m!37695 () Bool)

(assert (=> b!26281 m!37695))

(declare-fun m!37697 () Bool)

(assert (=> b!26286 m!37697))

(declare-fun m!37699 () Bool)

(assert (=> b!26287 m!37699))

(declare-fun m!37701 () Bool)

(assert (=> b!26284 m!37701))

(declare-fun m!37703 () Bool)

(assert (=> b!26276 m!37703))

(declare-fun m!37705 () Bool)

(assert (=> b!26276 m!37705))

(declare-fun m!37707 () Bool)

(assert (=> b!26276 m!37707))

(assert (=> b!26276 m!37703))

(declare-fun m!37709 () Bool)

(assert (=> b!26276 m!37709))

(declare-fun m!37711 () Bool)

(assert (=> b!26276 m!37711))

(declare-fun m!37713 () Bool)

(assert (=> b!26277 m!37713))

(declare-fun m!37715 () Bool)

(assert (=> b!26283 m!37715))

(declare-fun m!37717 () Bool)

(assert (=> b!26268 m!37717))

(declare-fun m!37719 () Bool)

(assert (=> b!26270 m!37719))

(declare-fun m!37721 () Bool)

(assert (=> b!26270 m!37721))

(declare-fun m!37723 () Bool)

(assert (=> b!26270 m!37723))

(declare-fun m!37725 () Bool)

(assert (=> b!26269 m!37725))

(declare-fun m!37727 () Bool)

(assert (=> b!26269 m!37727))

(declare-fun m!37729 () Bool)

(assert (=> b!26282 m!37729))

(declare-fun m!37731 () Bool)

(assert (=> start!5946 m!37731))

(declare-fun m!37733 () Bool)

(assert (=> start!5946 m!37733))

(declare-fun m!37735 () Bool)

(assert (=> b!26285 m!37735))

(declare-fun m!37737 () Bool)

(assert (=> b!26280 m!37737))

(assert (=> b!26280 m!37737))

(declare-fun m!37739 () Bool)

(assert (=> b!26280 m!37739))

(declare-fun m!37741 () Bool)

(assert (=> b!26280 m!37741))

(assert (=> b!26280 m!37741))

(declare-fun m!37743 () Bool)

(assert (=> b!26280 m!37743))

(declare-fun m!37745 () Bool)

(assert (=> b!26271 m!37745))

(declare-fun m!37747 () Bool)

(assert (=> b!26271 m!37747))

(declare-fun m!37749 () Bool)

(assert (=> b!26271 m!37749))

(declare-fun m!37751 () Bool)

(assert (=> b!26271 m!37751))

(declare-fun m!37753 () Bool)

(assert (=> b!26271 m!37753))

(declare-fun m!37755 () Bool)

(assert (=> b!26271 m!37755))

(declare-fun m!37757 () Bool)

(assert (=> b!26271 m!37757))

(declare-fun m!37759 () Bool)

(assert (=> b!26278 m!37759))

(push 1)

(assert (not b!26282))

(assert (not b!26276))

(assert (not b!26287))

(assert (not b!26280))

(assert (not b!26274))

(assert (not b!26281))

(assert (not b!26278))

(assert (not b!26271))

(assert (not b!26268))

(assert (not b!26273))

(assert (not b!26283))

(assert (not start!5946))

(assert (not b!26269))

(assert (not b!26270))

(assert (not b!26285))

(assert (not b!26284))

(assert (not b!26286))

(assert (not b!26277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

