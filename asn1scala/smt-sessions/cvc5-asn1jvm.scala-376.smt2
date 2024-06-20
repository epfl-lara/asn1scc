; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8948 () Bool)

(assert start!8948)

(declare-fun b!44358 () Bool)

(declare-fun e!29564 () Bool)

(declare-fun e!29573 () Bool)

(assert (=> b!44358 (= e!29564 e!29573)))

(declare-fun res!37573 () Bool)

(assert (=> b!44358 (=> res!37573 e!29573)))

(declare-fun lt!67741 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!67742 () (_ BitVec 64))

(assert (=> b!44358 (= res!37573 (not (= lt!67742 (bvsub (bvadd lt!67741 to!314) i!635))))))

(declare-datatypes ((array!2239 0))(
  ( (array!2240 (arr!1520 (Array (_ BitVec 32) (_ BitVec 8))) (size!1009 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1762 0))(
  ( (BitStream!1763 (buf!1352 array!2239) (currentByte!2833 (_ BitVec 32)) (currentBit!2828 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3160 0))(
  ( (Unit!3161) )
))
(declare-datatypes ((tuple2!4346 0))(
  ( (tuple2!4347 (_1!2266 Unit!3160) (_2!2266 BitStream!1762)) )
))
(declare-fun lt!67740 () tuple2!4346)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44358 (= lt!67742 (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67740))) (currentByte!2833 (_2!2266 lt!67740)) (currentBit!2828 (_2!2266 lt!67740))))))

(declare-fun b!44359 () Bool)

(declare-fun res!37570 () Bool)

(assert (=> b!44359 (=> res!37570 e!29573)))

(declare-fun thiss!1379 () BitStream!1762)

(assert (=> b!44359 (= res!37570 (not (= (size!1009 (buf!1352 thiss!1379)) (size!1009 (buf!1352 (_2!2266 lt!67740))))))))

(declare-fun res!37566 () Bool)

(declare-fun e!29570 () Bool)

(assert (=> start!8948 (=> (not res!37566) (not e!29570))))

(declare-fun srcBuffer!2 () array!2239)

(assert (=> start!8948 (= res!37566 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1009 srcBuffer!2))))))))

(assert (=> start!8948 e!29570))

(assert (=> start!8948 true))

(declare-fun array_inv!934 (array!2239) Bool)

(assert (=> start!8948 (array_inv!934 srcBuffer!2)))

(declare-fun e!29566 () Bool)

(declare-fun inv!12 (BitStream!1762) Bool)

(assert (=> start!8948 (and (inv!12 thiss!1379) e!29566)))

(declare-fun b!44360 () Bool)

(assert (=> b!44360 (= e!29566 (array_inv!934 (buf!1352 thiss!1379)))))

(declare-fun b!44361 () Bool)

(declare-fun e!29568 () Bool)

(declare-fun e!29571 () Bool)

(assert (=> b!44361 (= e!29568 e!29571)))

(declare-fun res!37572 () Bool)

(assert (=> b!44361 (=> res!37572 e!29571)))

(declare-fun lt!67736 () tuple2!4346)

(declare-fun isPrefixOf!0 (BitStream!1762 BitStream!1762) Bool)

(assert (=> b!44361 (= res!37572 (not (isPrefixOf!0 thiss!1379 (_2!2266 lt!67736))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44361 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67743 () Unit!3160)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1762 BitStream!1762 (_ BitVec 64) (_ BitVec 64)) Unit!3160)

(assert (=> b!44361 (= lt!67743 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2266 lt!67736) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1762 (_ BitVec 8) (_ BitVec 32)) tuple2!4346)

(assert (=> b!44361 (= lt!67736 (appendBitFromByte!0 thiss!1379 (select (arr!1520 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44362 () Bool)

(declare-fun res!37574 () Bool)

(assert (=> b!44362 (=> res!37574 e!29573)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!44362 (= res!37574 (not (invariant!0 (currentBit!2828 (_2!2266 lt!67740)) (currentByte!2833 (_2!2266 lt!67740)) (size!1009 (buf!1352 (_2!2266 lt!67740))))))))

(declare-fun b!44363 () Bool)

(assert (=> b!44363 (= e!29571 e!29564)))

(declare-fun res!37568 () Bool)

(assert (=> b!44363 (=> res!37568 e!29564)))

(assert (=> b!44363 (= res!37568 (not (isPrefixOf!0 (_2!2266 lt!67736) (_2!2266 lt!67740))))))

(assert (=> b!44363 (isPrefixOf!0 thiss!1379 (_2!2266 lt!67740))))

(declare-fun lt!67738 () Unit!3160)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1762 BitStream!1762 BitStream!1762) Unit!3160)

(assert (=> b!44363 (= lt!67738 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2266 lt!67736) (_2!2266 lt!67740)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1762 array!2239 (_ BitVec 64) (_ BitVec 64)) tuple2!4346)

(assert (=> b!44363 (= lt!67740 (appendBitsMSBFirstLoop!0 (_2!2266 lt!67736) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29567 () Bool)

(assert (=> b!44363 e!29567))

(declare-fun res!37575 () Bool)

(assert (=> b!44363 (=> (not res!37575) (not e!29567))))

(assert (=> b!44363 (= res!37575 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67744 () Unit!3160)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1762 array!2239 (_ BitVec 64)) Unit!3160)

(assert (=> b!44363 (= lt!67744 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1352 (_2!2266 lt!67736)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4348 0))(
  ( (tuple2!4349 (_1!2267 BitStream!1762) (_2!2267 BitStream!1762)) )
))
(declare-fun lt!67739 () tuple2!4348)

(declare-fun reader!0 (BitStream!1762 BitStream!1762) tuple2!4348)

(assert (=> b!44363 (= lt!67739 (reader!0 thiss!1379 (_2!2266 lt!67736)))))

(declare-fun b!44364 () Bool)

(assert (=> b!44364 (= e!29570 (not e!29568))))

(declare-fun res!37569 () Bool)

(assert (=> b!44364 (=> res!37569 e!29568)))

(assert (=> b!44364 (= res!37569 (bvsge i!635 to!314))))

(assert (=> b!44364 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67737 () Unit!3160)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1762) Unit!3160)

(assert (=> b!44364 (= lt!67737 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!44364 (= lt!67741 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)))))

(declare-fun b!44365 () Bool)

(declare-fun res!37567 () Bool)

(assert (=> b!44365 (=> (not res!37567) (not e!29570))))

(assert (=> b!44365 (= res!37567 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 thiss!1379))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44366 () Bool)

(assert (=> b!44366 (= e!29573 (= (size!1009 (buf!1352 (_2!2266 lt!67736))) (size!1009 (buf!1352 (_2!2266 lt!67740)))))))

(declare-fun e!29569 () Bool)

(assert (=> b!44366 e!29569))

(declare-fun res!37571 () Bool)

(assert (=> b!44366 (=> (not res!37571) (not e!29569))))

(assert (=> b!44366 (= res!37571 (= (size!1009 (buf!1352 (_2!2266 lt!67740))) (size!1009 (buf!1352 thiss!1379))))))

(declare-fun b!44367 () Bool)

(declare-datatypes ((List!522 0))(
  ( (Nil!519) (Cons!518 (h!637 Bool) (t!1272 List!522)) )
))
(declare-fun head!341 (List!522) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1762 array!2239 (_ BitVec 64) (_ BitVec 64)) List!522)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1762 BitStream!1762 (_ BitVec 64)) List!522)

(assert (=> b!44367 (= e!29567 (= (head!341 (byteArrayBitContentToList!0 (_2!2266 lt!67736) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!341 (bitStreamReadBitsIntoList!0 (_2!2266 lt!67736) (_1!2267 lt!67739) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44368 () Bool)

(assert (=> b!44368 (= e!29569 (= lt!67742 (bvsub (bvsub (bvadd (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!8948 res!37566) b!44365))

(assert (= (and b!44365 res!37567) b!44364))

(assert (= (and b!44364 (not res!37569)) b!44361))

(assert (= (and b!44361 (not res!37572)) b!44363))

(assert (= (and b!44363 res!37575) b!44367))

(assert (= (and b!44363 (not res!37568)) b!44358))

(assert (= (and b!44358 (not res!37573)) b!44362))

(assert (= (and b!44362 (not res!37574)) b!44359))

(assert (= (and b!44359 (not res!37570)) b!44366))

(assert (= (and b!44366 res!37571) b!44368))

(assert (= start!8948 b!44360))

(declare-fun m!67651 () Bool)

(assert (=> b!44362 m!67651))

(declare-fun m!67653 () Bool)

(assert (=> b!44368 m!67653))

(declare-fun m!67655 () Bool)

(assert (=> b!44358 m!67655))

(declare-fun m!67657 () Bool)

(assert (=> b!44364 m!67657))

(declare-fun m!67659 () Bool)

(assert (=> b!44364 m!67659))

(declare-fun m!67661 () Bool)

(assert (=> b!44364 m!67661))

(declare-fun m!67663 () Bool)

(assert (=> b!44367 m!67663))

(assert (=> b!44367 m!67663))

(declare-fun m!67665 () Bool)

(assert (=> b!44367 m!67665))

(declare-fun m!67667 () Bool)

(assert (=> b!44367 m!67667))

(assert (=> b!44367 m!67667))

(declare-fun m!67669 () Bool)

(assert (=> b!44367 m!67669))

(declare-fun m!67671 () Bool)

(assert (=> b!44363 m!67671))

(declare-fun m!67673 () Bool)

(assert (=> b!44363 m!67673))

(declare-fun m!67675 () Bool)

(assert (=> b!44363 m!67675))

(declare-fun m!67677 () Bool)

(assert (=> b!44363 m!67677))

(declare-fun m!67679 () Bool)

(assert (=> b!44363 m!67679))

(declare-fun m!67681 () Bool)

(assert (=> b!44363 m!67681))

(declare-fun m!67683 () Bool)

(assert (=> b!44363 m!67683))

(declare-fun m!67685 () Bool)

(assert (=> b!44360 m!67685))

(declare-fun m!67687 () Bool)

(assert (=> b!44365 m!67687))

(declare-fun m!67689 () Bool)

(assert (=> b!44361 m!67689))

(declare-fun m!67691 () Bool)

(assert (=> b!44361 m!67691))

(assert (=> b!44361 m!67689))

(declare-fun m!67693 () Bool)

(assert (=> b!44361 m!67693))

(declare-fun m!67695 () Bool)

(assert (=> b!44361 m!67695))

(declare-fun m!67697 () Bool)

(assert (=> b!44361 m!67697))

(declare-fun m!67699 () Bool)

(assert (=> start!8948 m!67699))

(declare-fun m!67701 () Bool)

(assert (=> start!8948 m!67701))

(push 1)

(assert (not b!44368))

(assert (not b!44367))

(assert (not b!44365))

(assert (not b!44361))

(assert (not start!8948))

(assert (not b!44362))

(assert (not b!44363))

(assert (not b!44364))

(assert (not b!44360))

(assert (not b!44358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12908 () Bool)

(assert (=> d!12908 (= (array_inv!934 (buf!1352 thiss!1379)) (bvsge (size!1009 (buf!1352 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!44360 d!12908))

(declare-fun d!12910 () Bool)

(assert (=> d!12910 (= (array_inv!934 srcBuffer!2) (bvsge (size!1009 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8948 d!12910))

(declare-fun d!12912 () Bool)

(assert (=> d!12912 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2828 thiss!1379) (currentByte!2833 thiss!1379) (size!1009 (buf!1352 thiss!1379))))))

(declare-fun bs!3447 () Bool)

(assert (= bs!3447 d!12912))

(declare-fun m!67815 () Bool)

(assert (=> bs!3447 m!67815))

(assert (=> start!8948 d!12912))

(declare-fun d!12914 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12914 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 thiss!1379))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1009 (buf!1352 thiss!1379))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3448 () Bool)

(assert (= bs!3448 d!12914))

(declare-fun m!67817 () Bool)

(assert (=> bs!3448 m!67817))

(assert (=> b!44365 d!12914))

(declare-fun d!12916 () Bool)

(declare-fun res!37656 () Bool)

(declare-fun e!29647 () Bool)

(assert (=> d!12916 (=> (not res!37656) (not e!29647))))

(assert (=> d!12916 (= res!37656 (= (size!1009 (buf!1352 thiss!1379)) (size!1009 (buf!1352 thiss!1379))))))

(assert (=> d!12916 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29647)))

(declare-fun b!44453 () Bool)

(declare-fun res!37655 () Bool)

(assert (=> b!44453 (=> (not res!37655) (not e!29647))))

(assert (=> b!44453 (= res!37655 (bvsle (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)) (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379))))))

(declare-fun b!44454 () Bool)

(declare-fun e!29648 () Bool)

(assert (=> b!44454 (= e!29647 e!29648)))

(declare-fun res!37654 () Bool)

(assert (=> b!44454 (=> res!37654 e!29648)))

(assert (=> b!44454 (= res!37654 (= (size!1009 (buf!1352 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44455 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2239 array!2239 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44455 (= e!29648 (arrayBitRangesEq!0 (buf!1352 thiss!1379) (buf!1352 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379))))))

(assert (= (and d!12916 res!37656) b!44453))

(assert (= (and b!44453 res!37655) b!44454))

(assert (= (and b!44454 (not res!37654)) b!44455))

(assert (=> b!44453 m!67661))

(assert (=> b!44453 m!67661))

(assert (=> b!44455 m!67661))

(assert (=> b!44455 m!67661))

(declare-fun m!67819 () Bool)

(assert (=> b!44455 m!67819))

(assert (=> b!44364 d!12916))

(declare-fun d!12918 () Bool)

(assert (=> d!12918 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67804 () Unit!3160)

(declare-fun choose!11 (BitStream!1762) Unit!3160)

(assert (=> d!12918 (= lt!67804 (choose!11 thiss!1379))))

(assert (=> d!12918 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!67804)))

(declare-fun bs!3450 () Bool)

(assert (= bs!3450 d!12918))

(assert (=> bs!3450 m!67657))

(declare-fun m!67821 () Bool)

(assert (=> bs!3450 m!67821))

(assert (=> b!44364 d!12918))

(declare-fun d!12920 () Bool)

(declare-fun e!29651 () Bool)

(assert (=> d!12920 e!29651))

(declare-fun res!37661 () Bool)

(assert (=> d!12920 (=> (not res!37661) (not e!29651))))

(declare-fun lt!67818 () (_ BitVec 64))

(declare-fun lt!67821 () (_ BitVec 64))

(declare-fun lt!67819 () (_ BitVec 64))

(assert (=> d!12920 (= res!37661 (= lt!67818 (bvsub lt!67821 lt!67819)))))

(assert (=> d!12920 (or (= (bvand lt!67821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67821 lt!67819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12920 (= lt!67819 (remainingBits!0 ((_ sign_extend 32) (size!1009 (buf!1352 thiss!1379))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379))))))

(declare-fun lt!67820 () (_ BitVec 64))

(declare-fun lt!67817 () (_ BitVec 64))

(assert (=> d!12920 (= lt!67821 (bvmul lt!67820 lt!67817))))

(assert (=> d!12920 (or (= lt!67820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67817 (bvsdiv (bvmul lt!67820 lt!67817) lt!67820)))))

(assert (=> d!12920 (= lt!67817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12920 (= lt!67820 ((_ sign_extend 32) (size!1009 (buf!1352 thiss!1379))))))

(assert (=> d!12920 (= lt!67818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2833 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2828 thiss!1379))))))

(assert (=> d!12920 (invariant!0 (currentBit!2828 thiss!1379) (currentByte!2833 thiss!1379) (size!1009 (buf!1352 thiss!1379)))))

(assert (=> d!12920 (= (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)) lt!67818)))

(declare-fun b!44460 () Bool)

(declare-fun res!37662 () Bool)

(assert (=> b!44460 (=> (not res!37662) (not e!29651))))

(assert (=> b!44460 (= res!37662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67818))))

(declare-fun b!44461 () Bool)

(declare-fun lt!67822 () (_ BitVec 64))

(assert (=> b!44461 (= e!29651 (bvsle lt!67818 (bvmul lt!67822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44461 (or (= lt!67822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67822)))))

(assert (=> b!44461 (= lt!67822 ((_ sign_extend 32) (size!1009 (buf!1352 thiss!1379))))))

(assert (= (and d!12920 res!37661) b!44460))

(assert (= (and b!44460 res!37662) b!44461))

(assert (=> d!12920 m!67817))

(assert (=> d!12920 m!67815))

(assert (=> b!44364 d!12920))

(declare-fun d!12922 () Bool)

(declare-fun e!29652 () Bool)

(assert (=> d!12922 e!29652))

(declare-fun res!37663 () Bool)

(assert (=> d!12922 (=> (not res!37663) (not e!29652))))

(declare-fun lt!67827 () (_ BitVec 64))

(declare-fun lt!67824 () (_ BitVec 64))

(declare-fun lt!67825 () (_ BitVec 64))

(assert (=> d!12922 (= res!37663 (= lt!67824 (bvsub lt!67827 lt!67825)))))

(assert (=> d!12922 (or (= (bvand lt!67827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67825 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67827 lt!67825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12922 (= lt!67825 (remainingBits!0 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67740)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67740))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67740)))))))

(declare-fun lt!67826 () (_ BitVec 64))

(declare-fun lt!67823 () (_ BitVec 64))

(assert (=> d!12922 (= lt!67827 (bvmul lt!67826 lt!67823))))

(assert (=> d!12922 (or (= lt!67826 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67823 (bvsdiv (bvmul lt!67826 lt!67823) lt!67826)))))

(assert (=> d!12922 (= lt!67823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12922 (= lt!67826 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67740)))))))

(assert (=> d!12922 (= lt!67824 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67740))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67740)))))))

(assert (=> d!12922 (invariant!0 (currentBit!2828 (_2!2266 lt!67740)) (currentByte!2833 (_2!2266 lt!67740)) (size!1009 (buf!1352 (_2!2266 lt!67740))))))

(assert (=> d!12922 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67740))) (currentByte!2833 (_2!2266 lt!67740)) (currentBit!2828 (_2!2266 lt!67740))) lt!67824)))

(declare-fun b!44462 () Bool)

(declare-fun res!37664 () Bool)

(assert (=> b!44462 (=> (not res!37664) (not e!29652))))

(assert (=> b!44462 (= res!37664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67824))))

(declare-fun b!44463 () Bool)

(declare-fun lt!67828 () (_ BitVec 64))

(assert (=> b!44463 (= e!29652 (bvsle lt!67824 (bvmul lt!67828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44463 (or (= lt!67828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67828)))))

(assert (=> b!44463 (= lt!67828 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67740)))))))

(assert (= (and d!12922 res!37663) b!44462))

(assert (= (and b!44462 res!37664) b!44463))

(declare-fun m!67823 () Bool)

(assert (=> d!12922 m!67823))

(assert (=> d!12922 m!67651))

(assert (=> b!44358 d!12922))

(declare-fun d!12926 () Bool)

(declare-fun e!29653 () Bool)

(assert (=> d!12926 e!29653))

(declare-fun res!37665 () Bool)

(assert (=> d!12926 (=> (not res!37665) (not e!29653))))

(declare-fun lt!67831 () (_ BitVec 64))

(declare-fun lt!67830 () (_ BitVec 64))

(declare-fun lt!67833 () (_ BitVec 64))

(assert (=> d!12926 (= res!37665 (= lt!67830 (bvsub lt!67833 lt!67831)))))

(assert (=> d!12926 (or (= (bvand lt!67833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67833 lt!67831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12926 (= lt!67831 (remainingBits!0 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736)))))))

(declare-fun lt!67832 () (_ BitVec 64))

(declare-fun lt!67829 () (_ BitVec 64))

(assert (=> d!12926 (= lt!67833 (bvmul lt!67832 lt!67829))))

(assert (=> d!12926 (or (= lt!67832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67829 (bvsdiv (bvmul lt!67832 lt!67829) lt!67832)))))

(assert (=> d!12926 (= lt!67829 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12926 (= lt!67832 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))))))

(assert (=> d!12926 (= lt!67830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736)))))))

(assert (=> d!12926 (invariant!0 (currentBit!2828 (_2!2266 lt!67736)) (currentByte!2833 (_2!2266 lt!67736)) (size!1009 (buf!1352 (_2!2266 lt!67736))))))

(assert (=> d!12926 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))) lt!67830)))

(declare-fun b!44464 () Bool)

(declare-fun res!37666 () Bool)

(assert (=> b!44464 (=> (not res!37666) (not e!29653))))

(assert (=> b!44464 (= res!37666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67830))))

(declare-fun b!44465 () Bool)

(declare-fun lt!67834 () (_ BitVec 64))

(assert (=> b!44465 (= e!29653 (bvsle lt!67830 (bvmul lt!67834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44465 (or (= lt!67834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67834)))))

(assert (=> b!44465 (= lt!67834 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))))))

(assert (= (and d!12926 res!37665) b!44464))

(assert (= (and b!44464 res!37666) b!44465))

(declare-fun m!67825 () Bool)

(assert (=> d!12926 m!67825))

(declare-fun m!67827 () Bool)

(assert (=> d!12926 m!67827))

(assert (=> b!44368 d!12926))

(declare-fun d!12928 () Bool)

(declare-fun res!37669 () Bool)

(declare-fun e!29654 () Bool)

(assert (=> d!12928 (=> (not res!37669) (not e!29654))))

(assert (=> d!12928 (= res!37669 (= (size!1009 (buf!1352 (_2!2266 lt!67736))) (size!1009 (buf!1352 (_2!2266 lt!67740)))))))

(assert (=> d!12928 (= (isPrefixOf!0 (_2!2266 lt!67736) (_2!2266 lt!67740)) e!29654)))

(declare-fun b!44466 () Bool)

(declare-fun res!37668 () Bool)

(assert (=> b!44466 (=> (not res!37668) (not e!29654))))

(assert (=> b!44466 (= res!37668 (bvsle (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))) (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67740))) (currentByte!2833 (_2!2266 lt!67740)) (currentBit!2828 (_2!2266 lt!67740)))))))

(declare-fun b!44467 () Bool)

(declare-fun e!29655 () Bool)

(assert (=> b!44467 (= e!29654 e!29655)))

(declare-fun res!37667 () Bool)

(assert (=> b!44467 (=> res!37667 e!29655)))

(assert (=> b!44467 (= res!37667 (= (size!1009 (buf!1352 (_2!2266 lt!67736))) #b00000000000000000000000000000000))))

(declare-fun b!44468 () Bool)

(assert (=> b!44468 (= e!29655 (arrayBitRangesEq!0 (buf!1352 (_2!2266 lt!67736)) (buf!1352 (_2!2266 lt!67740)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736)))))))

(assert (= (and d!12928 res!37669) b!44466))

(assert (= (and b!44466 res!37668) b!44467))

(assert (= (and b!44467 (not res!37667)) b!44468))

(assert (=> b!44466 m!67653))

(assert (=> b!44466 m!67655))

(assert (=> b!44468 m!67653))

(assert (=> b!44468 m!67653))

(declare-fun m!67829 () Bool)

(assert (=> b!44468 m!67829))

(assert (=> b!44363 d!12928))

(declare-fun b!44535 () Bool)

(declare-fun res!37719 () Bool)

(declare-fun e!29689 () Bool)

(assert (=> b!44535 (=> (not res!37719) (not e!29689))))

(declare-fun lt!67953 () tuple2!4348)

(assert (=> b!44535 (= res!37719 (isPrefixOf!0 (_2!2267 lt!67953) (_2!2266 lt!67736)))))

(declare-fun b!44536 () Bool)

(declare-fun e!29690 () Unit!3160)

(declare-fun Unit!3166 () Unit!3160)

(assert (=> b!44536 (= e!29690 Unit!3166)))

(declare-fun lt!67944 () (_ BitVec 64))

(declare-fun b!44537 () Bool)

(declare-fun lt!67959 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1762 (_ BitVec 64)) BitStream!1762)

(assert (=> b!44537 (= e!29689 (= (_1!2267 lt!67953) (withMovedBitIndex!0 (_2!2267 lt!67953) (bvsub lt!67944 lt!67959))))))

(assert (=> b!44537 (or (= (bvand lt!67944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67944 lt!67959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44537 (= lt!67959 (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))))))

(assert (=> b!44537 (= lt!67944 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)))))

(declare-fun d!12930 () Bool)

(assert (=> d!12930 e!29689))

(declare-fun res!37720 () Bool)

(assert (=> d!12930 (=> (not res!37720) (not e!29689))))

(assert (=> d!12930 (= res!37720 (isPrefixOf!0 (_1!2267 lt!67953) (_2!2267 lt!67953)))))

(declare-fun lt!67961 () BitStream!1762)

(assert (=> d!12930 (= lt!67953 (tuple2!4349 lt!67961 (_2!2266 lt!67736)))))

(declare-fun lt!67946 () Unit!3160)

(declare-fun lt!67951 () Unit!3160)

(assert (=> d!12930 (= lt!67946 lt!67951)))

(assert (=> d!12930 (isPrefixOf!0 lt!67961 (_2!2266 lt!67736))))

(assert (=> d!12930 (= lt!67951 (lemmaIsPrefixTransitive!0 lt!67961 (_2!2266 lt!67736) (_2!2266 lt!67736)))))

(declare-fun lt!67952 () Unit!3160)

(declare-fun lt!67949 () Unit!3160)

(assert (=> d!12930 (= lt!67952 lt!67949)))

(assert (=> d!12930 (isPrefixOf!0 lt!67961 (_2!2266 lt!67736))))

(assert (=> d!12930 (= lt!67949 (lemmaIsPrefixTransitive!0 lt!67961 thiss!1379 (_2!2266 lt!67736)))))

(declare-fun lt!67960 () Unit!3160)

(assert (=> d!12930 (= lt!67960 e!29690)))

(declare-fun c!2967 () Bool)

(assert (=> d!12930 (= c!2967 (not (= (size!1009 (buf!1352 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!67962 () Unit!3160)

(declare-fun lt!67955 () Unit!3160)

(assert (=> d!12930 (= lt!67962 lt!67955)))

(assert (=> d!12930 (isPrefixOf!0 (_2!2266 lt!67736) (_2!2266 lt!67736))))

(assert (=> d!12930 (= lt!67955 (lemmaIsPrefixRefl!0 (_2!2266 lt!67736)))))

(declare-fun lt!67957 () Unit!3160)

(declare-fun lt!67945 () Unit!3160)

(assert (=> d!12930 (= lt!67957 lt!67945)))

(assert (=> d!12930 (= lt!67945 (lemmaIsPrefixRefl!0 (_2!2266 lt!67736)))))

(declare-fun lt!67956 () Unit!3160)

(declare-fun lt!67950 () Unit!3160)

(assert (=> d!12930 (= lt!67956 lt!67950)))

(assert (=> d!12930 (isPrefixOf!0 lt!67961 lt!67961)))

(assert (=> d!12930 (= lt!67950 (lemmaIsPrefixRefl!0 lt!67961))))

(declare-fun lt!67947 () Unit!3160)

(declare-fun lt!67948 () Unit!3160)

(assert (=> d!12930 (= lt!67947 lt!67948)))

(assert (=> d!12930 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12930 (= lt!67948 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12930 (= lt!67961 (BitStream!1763 (buf!1352 (_2!2266 lt!67736)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)))))

(assert (=> d!12930 (isPrefixOf!0 thiss!1379 (_2!2266 lt!67736))))

(assert (=> d!12930 (= (reader!0 thiss!1379 (_2!2266 lt!67736)) lt!67953)))

(declare-fun b!44538 () Bool)

(declare-fun lt!67958 () Unit!3160)

(assert (=> b!44538 (= e!29690 lt!67958)))

(declare-fun lt!67954 () (_ BitVec 64))

(assert (=> b!44538 (= lt!67954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67963 () (_ BitVec 64))

(assert (=> b!44538 (= lt!67963 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2239 array!2239 (_ BitVec 64) (_ BitVec 64)) Unit!3160)

(assert (=> b!44538 (= lt!67958 (arrayBitRangesEqSymmetric!0 (buf!1352 thiss!1379) (buf!1352 (_2!2266 lt!67736)) lt!67954 lt!67963))))

(assert (=> b!44538 (arrayBitRangesEq!0 (buf!1352 (_2!2266 lt!67736)) (buf!1352 thiss!1379) lt!67954 lt!67963)))

(declare-fun b!44539 () Bool)

(declare-fun res!37721 () Bool)

(assert (=> b!44539 (=> (not res!37721) (not e!29689))))

(assert (=> b!44539 (= res!37721 (isPrefixOf!0 (_1!2267 lt!67953) thiss!1379))))

(assert (= (and d!12930 c!2967) b!44538))

(assert (= (and d!12930 (not c!2967)) b!44536))

(assert (= (and d!12930 res!37720) b!44539))

(assert (= (and b!44539 res!37721) b!44535))

(assert (= (and b!44535 res!37719) b!44537))

(assert (=> d!12930 m!67659))

(declare-fun m!67879 () Bool)

(assert (=> d!12930 m!67879))

(declare-fun m!67881 () Bool)

(assert (=> d!12930 m!67881))

(declare-fun m!67883 () Bool)

(assert (=> d!12930 m!67883))

(declare-fun m!67885 () Bool)

(assert (=> d!12930 m!67885))

(declare-fun m!67887 () Bool)

(assert (=> d!12930 m!67887))

(declare-fun m!67889 () Bool)

(assert (=> d!12930 m!67889))

(declare-fun m!67891 () Bool)

(assert (=> d!12930 m!67891))

(assert (=> d!12930 m!67657))

(declare-fun m!67893 () Bool)

(assert (=> d!12930 m!67893))

(assert (=> d!12930 m!67695))

(declare-fun m!67895 () Bool)

(assert (=> b!44535 m!67895))

(assert (=> b!44538 m!67661))

(declare-fun m!67897 () Bool)

(assert (=> b!44538 m!67897))

(declare-fun m!67899 () Bool)

(assert (=> b!44538 m!67899))

(declare-fun m!67901 () Bool)

(assert (=> b!44537 m!67901))

(assert (=> b!44537 m!67653))

(assert (=> b!44537 m!67661))

(declare-fun m!67903 () Bool)

(assert (=> b!44539 m!67903))

(assert (=> b!44363 d!12930))

(declare-fun d!12966 () Bool)

(assert (=> d!12966 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67966 () Unit!3160)

(declare-fun choose!9 (BitStream!1762 array!2239 (_ BitVec 64) BitStream!1762) Unit!3160)

(assert (=> d!12966 (= lt!67966 (choose!9 thiss!1379 (buf!1352 (_2!2266 lt!67736)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1763 (buf!1352 (_2!2266 lt!67736)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379))))))

(assert (=> d!12966 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1352 (_2!2266 lt!67736)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67966)))

(declare-fun bs!3455 () Bool)

(assert (= bs!3455 d!12966))

(assert (=> bs!3455 m!67671))

(declare-fun m!67905 () Bool)

(assert (=> bs!3455 m!67905))

(assert (=> b!44363 d!12966))

(declare-fun d!12968 () Bool)

(assert (=> d!12968 (isPrefixOf!0 thiss!1379 (_2!2266 lt!67740))))

(declare-fun lt!67981 () Unit!3160)

(declare-fun choose!30 (BitStream!1762 BitStream!1762 BitStream!1762) Unit!3160)

(assert (=> d!12968 (= lt!67981 (choose!30 thiss!1379 (_2!2266 lt!67736) (_2!2266 lt!67740)))))

(assert (=> d!12968 (isPrefixOf!0 thiss!1379 (_2!2266 lt!67736))))

(assert (=> d!12968 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2266 lt!67736) (_2!2266 lt!67740)) lt!67981)))

(declare-fun bs!3456 () Bool)

(assert (= bs!3456 d!12968))

(assert (=> bs!3456 m!67681))

(declare-fun m!67907 () Bool)

(assert (=> bs!3456 m!67907))

(assert (=> bs!3456 m!67695))

(assert (=> b!44363 d!12968))

(declare-fun b!44614 () Bool)

(declare-fun res!37762 () Bool)

(declare-fun e!29728 () Bool)

(assert (=> b!44614 (=> (not res!37762) (not e!29728))))

(declare-fun lt!68204 () tuple2!4346)

(assert (=> b!44614 (= res!37762 (= (size!1009 (buf!1352 (_2!2266 lt!68204))) (size!1009 (buf!1352 (_2!2266 lt!67736)))))))

(declare-fun b!44615 () Bool)

(declare-fun res!37764 () Bool)

(assert (=> b!44615 (=> (not res!37764) (not e!29728))))

(assert (=> b!44615 (= res!37764 (= (size!1009 (buf!1352 (_2!2266 lt!67736))) (size!1009 (buf!1352 (_2!2266 lt!68204)))))))

(declare-fun d!12970 () Bool)

(assert (=> d!12970 e!29728))

(declare-fun res!37766 () Bool)

(assert (=> d!12970 (=> (not res!37766) (not e!29728))))

(declare-fun lt!68209 () (_ BitVec 64))

(assert (=> d!12970 (= res!37766 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68204))) (currentByte!2833 (_2!2266 lt!68204)) (currentBit!2828 (_2!2266 lt!68204))) (bvsub lt!68209 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12970 (or (= (bvand lt!68209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68209 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!68182 () (_ BitVec 64))

(assert (=> d!12970 (= lt!68209 (bvadd lt!68182 to!314))))

(assert (=> d!12970 (or (not (= (bvand lt!68182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68182 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12970 (= lt!68182 (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))))))

(declare-fun e!29727 () tuple2!4346)

(assert (=> d!12970 (= lt!68204 e!29727)))

(declare-fun c!2985 () Bool)

(assert (=> d!12970 (= c!2985 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!68203 () Unit!3160)

(declare-fun lt!68187 () Unit!3160)

(assert (=> d!12970 (= lt!68203 lt!68187)))

(assert (=> d!12970 (isPrefixOf!0 (_2!2266 lt!67736) (_2!2266 lt!67736))))

(assert (=> d!12970 (= lt!68187 (lemmaIsPrefixRefl!0 (_2!2266 lt!67736)))))

(declare-fun lt!68188 () (_ BitVec 64))

(assert (=> d!12970 (= lt!68188 (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))))))

(assert (=> d!12970 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12970 (= (appendBitsMSBFirstLoop!0 (_2!2266 lt!67736) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!68204)))

(declare-fun b!44616 () Bool)

(declare-fun res!37765 () Bool)

(assert (=> b!44616 (=> (not res!37765) (not e!29728))))

(assert (=> b!44616 (= res!37765 (invariant!0 (currentBit!2828 (_2!2266 lt!68204)) (currentByte!2833 (_2!2266 lt!68204)) (size!1009 (buf!1352 (_2!2266 lt!68204)))))))

(declare-fun b!44617 () Bool)

(declare-fun res!37767 () Bool)

(assert (=> b!44617 (=> (not res!37767) (not e!29728))))

(assert (=> b!44617 (= res!37767 (isPrefixOf!0 (_2!2266 lt!67736) (_2!2266 lt!68204)))))

(declare-fun b!44618 () Bool)

(declare-fun e!29726 () Bool)

(declare-fun lt!68183 () (_ BitVec 64))

(assert (=> b!44618 (= e!29726 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) lt!68183))))

(declare-fun b!44619 () Bool)

(declare-fun lt!68172 () tuple2!4346)

(declare-fun Unit!3167 () Unit!3160)

(assert (=> b!44619 (= e!29727 (tuple2!4347 Unit!3167 (_2!2266 lt!68172)))))

(declare-fun lt!68195 () tuple2!4346)

(assert (=> b!44619 (= lt!68195 (appendBitFromByte!0 (_2!2266 lt!67736) (select (arr!1520 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!68190 () (_ BitVec 64))

(assert (=> b!44619 (= lt!68190 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68199 () (_ BitVec 64))

(assert (=> b!44619 (= lt!68199 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68174 () Unit!3160)

(assert (=> b!44619 (= lt!68174 (validateOffsetBitsIneqLemma!0 (_2!2266 lt!67736) (_2!2266 lt!68195) lt!68190 lt!68199))))

(assert (=> b!44619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!68195)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!68195))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!68195))) (bvsub lt!68190 lt!68199))))

(declare-fun lt!68205 () Unit!3160)

(assert (=> b!44619 (= lt!68205 lt!68174)))

(declare-fun lt!68173 () tuple2!4348)

(assert (=> b!44619 (= lt!68173 (reader!0 (_2!2266 lt!67736) (_2!2266 lt!68195)))))

(declare-fun lt!68175 () (_ BitVec 64))

(assert (=> b!44619 (= lt!68175 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68196 () Unit!3160)

(assert (=> b!44619 (= lt!68196 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2266 lt!67736) (buf!1352 (_2!2266 lt!68195)) lt!68175))))

(assert (=> b!44619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!68195)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) lt!68175)))

(declare-fun lt!68212 () Unit!3160)

(assert (=> b!44619 (= lt!68212 lt!68196)))

(assert (=> b!44619 (= (head!341 (byteArrayBitContentToList!0 (_2!2266 lt!68195) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!341 (bitStreamReadBitsIntoList!0 (_2!2266 lt!68195) (_1!2267 lt!68173) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68191 () Unit!3160)

(declare-fun Unit!3168 () Unit!3160)

(assert (=> b!44619 (= lt!68191 Unit!3168)))

(assert (=> b!44619 (= lt!68172 (appendBitsMSBFirstLoop!0 (_2!2266 lt!68195) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!68184 () Unit!3160)

(assert (=> b!44619 (= lt!68184 (lemmaIsPrefixTransitive!0 (_2!2266 lt!67736) (_2!2266 lt!68195) (_2!2266 lt!68172)))))

(assert (=> b!44619 (isPrefixOf!0 (_2!2266 lt!67736) (_2!2266 lt!68172))))

(declare-fun lt!68189 () Unit!3160)

(assert (=> b!44619 (= lt!68189 lt!68184)))

(assert (=> b!44619 (= (size!1009 (buf!1352 (_2!2266 lt!68172))) (size!1009 (buf!1352 (_2!2266 lt!67736))))))

(declare-fun lt!68213 () Unit!3160)

(declare-fun Unit!3169 () Unit!3160)

(assert (=> b!44619 (= lt!68213 Unit!3169)))

(assert (=> b!44619 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68172))) (currentByte!2833 (_2!2266 lt!68172)) (currentBit!2828 (_2!2266 lt!68172))) (bvsub (bvadd (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68194 () Unit!3160)

(declare-fun Unit!3170 () Unit!3160)

(assert (=> b!44619 (= lt!68194 Unit!3170)))

(assert (=> b!44619 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68172))) (currentByte!2833 (_2!2266 lt!68172)) (currentBit!2828 (_2!2266 lt!68172))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68195))) (currentByte!2833 (_2!2266 lt!68195)) (currentBit!2828 (_2!2266 lt!68195))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68176 () Unit!3160)

(declare-fun Unit!3171 () Unit!3160)

(assert (=> b!44619 (= lt!68176 Unit!3171)))

(declare-fun lt!68202 () tuple2!4348)

(assert (=> b!44619 (= lt!68202 (reader!0 (_2!2266 lt!67736) (_2!2266 lt!68172)))))

(declare-fun lt!68208 () (_ BitVec 64))

(assert (=> b!44619 (= lt!68208 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68215 () Unit!3160)

(assert (=> b!44619 (= lt!68215 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2266 lt!67736) (buf!1352 (_2!2266 lt!68172)) lt!68208))))

(assert (=> b!44619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!68172)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) lt!68208)))

(declare-fun lt!68180 () Unit!3160)

(assert (=> b!44619 (= lt!68180 lt!68215)))

(declare-fun lt!68214 () tuple2!4348)

(declare-fun call!529 () tuple2!4348)

(assert (=> b!44619 (= lt!68214 call!529)))

(declare-fun lt!68207 () (_ BitVec 64))

(assert (=> b!44619 (= lt!68207 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68178 () Unit!3160)

(assert (=> b!44619 (= lt!68178 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2266 lt!68195) (buf!1352 (_2!2266 lt!68172)) lt!68207))))

(assert (=> b!44619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!68172)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!68195))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!68195))) lt!68207)))

(declare-fun lt!68193 () Unit!3160)

(assert (=> b!44619 (= lt!68193 lt!68178)))

(declare-fun lt!68186 () List!522)

(assert (=> b!44619 (= lt!68186 (byteArrayBitContentToList!0 (_2!2266 lt!68172) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!68198 () List!522)

(assert (=> b!44619 (= lt!68198 (byteArrayBitContentToList!0 (_2!2266 lt!68172) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68201 () List!522)

(assert (=> b!44619 (= lt!68201 (bitStreamReadBitsIntoList!0 (_2!2266 lt!68172) (_1!2267 lt!68202) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!68192 () List!522)

(assert (=> b!44619 (= lt!68192 (bitStreamReadBitsIntoList!0 (_2!2266 lt!68172) (_1!2267 lt!68214) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68210 () (_ BitVec 64))

(assert (=> b!44619 (= lt!68210 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68211 () Unit!3160)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1762 BitStream!1762 BitStream!1762 BitStream!1762 (_ BitVec 64) List!522) Unit!3160)

(assert (=> b!44619 (= lt!68211 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2266 lt!68172) (_2!2266 lt!68172) (_1!2267 lt!68202) (_1!2267 lt!68214) lt!68210 lt!68201))))

(declare-fun tail!214 (List!522) List!522)

(assert (=> b!44619 (= (bitStreamReadBitsIntoList!0 (_2!2266 lt!68172) (_1!2267 lt!68214) (bvsub lt!68210 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!214 lt!68201))))

(declare-fun lt!68206 () Unit!3160)

(assert (=> b!44619 (= lt!68206 lt!68211)))

(declare-fun lt!68177 () Unit!3160)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2239 array!2239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3160)

(assert (=> b!44619 (= lt!68177 (arrayBitRangesEqImpliesEq!0 (buf!1352 (_2!2266 lt!68195)) (buf!1352 (_2!2266 lt!68172)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!68188 (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68195))) (currentByte!2833 (_2!2266 lt!68195)) (currentBit!2828 (_2!2266 lt!68195)))))))

(declare-fun bitAt!0 (array!2239 (_ BitVec 64)) Bool)

(assert (=> b!44619 (= (bitAt!0 (buf!1352 (_2!2266 lt!68195)) lt!68188) (bitAt!0 (buf!1352 (_2!2266 lt!68172)) lt!68188))))

(declare-fun lt!68200 () Unit!3160)

(assert (=> b!44619 (= lt!68200 lt!68177)))

(declare-fun lt!68179 () tuple2!4348)

(declare-fun b!44620 () Bool)

(assert (=> b!44620 (= e!29728 (= (bitStreamReadBitsIntoList!0 (_2!2266 lt!68204) (_1!2267 lt!68179) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2266 lt!68204) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!44620 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44620 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!68181 () Unit!3160)

(declare-fun lt!68197 () Unit!3160)

(assert (=> b!44620 (= lt!68181 lt!68197)))

(assert (=> b!44620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!68204)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) lt!68183)))

(assert (=> b!44620 (= lt!68197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2266 lt!67736) (buf!1352 (_2!2266 lt!68204)) lt!68183))))

(assert (=> b!44620 e!29726))

(declare-fun res!37763 () Bool)

(assert (=> b!44620 (=> (not res!37763) (not e!29726))))

(assert (=> b!44620 (= res!37763 (and (= (size!1009 (buf!1352 (_2!2266 lt!67736))) (size!1009 (buf!1352 (_2!2266 lt!68204)))) (bvsge lt!68183 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44620 (= lt!68183 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!44620 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44620 (= lt!68179 (reader!0 (_2!2266 lt!67736) (_2!2266 lt!68204)))))

(declare-fun bm!526 () Bool)

(assert (=> bm!526 (= call!529 (reader!0 (ite c!2985 (_2!2266 lt!68195) (_2!2266 lt!67736)) (ite c!2985 (_2!2266 lt!68172) (_2!2266 lt!67736))))))

(declare-fun b!44621 () Bool)

(declare-fun Unit!3172 () Unit!3160)

(assert (=> b!44621 (= e!29727 (tuple2!4347 Unit!3172 (_2!2266 lt!67736)))))

(assert (=> b!44621 (= (size!1009 (buf!1352 (_2!2266 lt!67736))) (size!1009 (buf!1352 (_2!2266 lt!67736))))))

(declare-fun lt!68185 () Unit!3160)

(declare-fun Unit!3173 () Unit!3160)

(assert (=> b!44621 (= lt!68185 Unit!3173)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1762 array!2239 array!2239 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4366 0))(
  ( (tuple2!4367 (_1!2276 array!2239) (_2!2276 BitStream!1762)) )
))
(declare-fun readBits!0 (BitStream!1762 (_ BitVec 64)) tuple2!4366)

(assert (=> b!44621 (checkByteArrayBitContent!0 (_2!2266 lt!67736) srcBuffer!2 (_1!2276 (readBits!0 (_1!2267 call!529) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!12970 c!2985) b!44619))

(assert (= (and d!12970 (not c!2985)) b!44621))

(assert (= (or b!44619 b!44621) bm!526))

(assert (= (and d!12970 res!37766) b!44616))

(assert (= (and b!44616 res!37765) b!44615))

(assert (= (and b!44615 res!37764) b!44617))

(assert (= (and b!44617 res!37767) b!44614))

(assert (= (and b!44614 res!37762) b!44620))

(assert (= (and b!44620 res!37763) b!44618))

(declare-fun m!67969 () Bool)

(assert (=> b!44621 m!67969))

(declare-fun m!67971 () Bool)

(assert (=> b!44621 m!67971))

(declare-fun m!67973 () Bool)

(assert (=> b!44617 m!67973))

(declare-fun m!67975 () Bool)

(assert (=> b!44620 m!67975))

(declare-fun m!67977 () Bool)

(assert (=> b!44620 m!67977))

(declare-fun m!67979 () Bool)

(assert (=> b!44620 m!67979))

(declare-fun m!67981 () Bool)

(assert (=> b!44620 m!67981))

(declare-fun m!67983 () Bool)

(assert (=> b!44620 m!67983))

(declare-fun m!67985 () Bool)

(assert (=> bm!526 m!67985))

(declare-fun m!67987 () Bool)

(assert (=> b!44618 m!67987))

(declare-fun m!67989 () Bool)

(assert (=> b!44619 m!67989))

(declare-fun m!67991 () Bool)

(assert (=> b!44619 m!67991))

(declare-fun m!67993 () Bool)

(assert (=> b!44619 m!67993))

(declare-fun m!67995 () Bool)

(assert (=> b!44619 m!67995))

(declare-fun m!67997 () Bool)

(assert (=> b!44619 m!67997))

(assert (=> b!44619 m!67653))

(declare-fun m!67999 () Bool)

(assert (=> b!44619 m!67999))

(declare-fun m!68001 () Bool)

(assert (=> b!44619 m!68001))

(declare-fun m!68003 () Bool)

(assert (=> b!44619 m!68003))

(declare-fun m!68005 () Bool)

(assert (=> b!44619 m!68005))

(declare-fun m!68007 () Bool)

(assert (=> b!44619 m!68007))

(declare-fun m!68009 () Bool)

(assert (=> b!44619 m!68009))

(declare-fun m!68011 () Bool)

(assert (=> b!44619 m!68011))

(declare-fun m!68013 () Bool)

(assert (=> b!44619 m!68013))

(declare-fun m!68015 () Bool)

(assert (=> b!44619 m!68015))

(declare-fun m!68017 () Bool)

(assert (=> b!44619 m!68017))

(declare-fun m!68019 () Bool)

(assert (=> b!44619 m!68019))

(declare-fun m!68021 () Bool)

(assert (=> b!44619 m!68021))

(declare-fun m!68023 () Bool)

(assert (=> b!44619 m!68023))

(assert (=> b!44619 m!67997))

(declare-fun m!68025 () Bool)

(assert (=> b!44619 m!68025))

(declare-fun m!68027 () Bool)

(assert (=> b!44619 m!68027))

(declare-fun m!68029 () Bool)

(assert (=> b!44619 m!68029))

(declare-fun m!68031 () Bool)

(assert (=> b!44619 m!68031))

(declare-fun m!68033 () Bool)

(assert (=> b!44619 m!68033))

(declare-fun m!68035 () Bool)

(assert (=> b!44619 m!68035))

(declare-fun m!68037 () Bool)

(assert (=> b!44619 m!68037))

(assert (=> b!44619 m!68029))

(declare-fun m!68039 () Bool)

(assert (=> b!44619 m!68039))

(declare-fun m!68041 () Bool)

(assert (=> b!44619 m!68041))

(declare-fun m!68043 () Bool)

(assert (=> b!44619 m!68043))

(declare-fun m!68045 () Bool)

(assert (=> b!44619 m!68045))

(declare-fun m!68047 () Bool)

(assert (=> b!44619 m!68047))

(assert (=> b!44619 m!68035))

(declare-fun m!68049 () Bool)

(assert (=> b!44619 m!68049))

(assert (=> b!44619 m!68045))

(declare-fun m!68051 () Bool)

(assert (=> b!44616 m!68051))

(declare-fun m!68053 () Bool)

(assert (=> d!12970 m!68053))

(assert (=> d!12970 m!67653))

(assert (=> d!12970 m!67889))

(assert (=> d!12970 m!67885))

(assert (=> b!44363 d!12970))

(declare-fun d!13000 () Bool)

(declare-fun res!37770 () Bool)

(declare-fun e!29729 () Bool)

(assert (=> d!13000 (=> (not res!37770) (not e!29729))))

(assert (=> d!13000 (= res!37770 (= (size!1009 (buf!1352 thiss!1379)) (size!1009 (buf!1352 (_2!2266 lt!67740)))))))

(assert (=> d!13000 (= (isPrefixOf!0 thiss!1379 (_2!2266 lt!67740)) e!29729)))

(declare-fun b!44622 () Bool)

(declare-fun res!37769 () Bool)

(assert (=> b!44622 (=> (not res!37769) (not e!29729))))

(assert (=> b!44622 (= res!37769 (bvsle (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)) (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67740))) (currentByte!2833 (_2!2266 lt!67740)) (currentBit!2828 (_2!2266 lt!67740)))))))

(declare-fun b!44623 () Bool)

(declare-fun e!29730 () Bool)

(assert (=> b!44623 (= e!29729 e!29730)))

(declare-fun res!37768 () Bool)

(assert (=> b!44623 (=> res!37768 e!29730)))

(assert (=> b!44623 (= res!37768 (= (size!1009 (buf!1352 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44624 () Bool)

(assert (=> b!44624 (= e!29730 (arrayBitRangesEq!0 (buf!1352 thiss!1379) (buf!1352 (_2!2266 lt!67740)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379))))))

(assert (= (and d!13000 res!37770) b!44622))

(assert (= (and b!44622 res!37769) b!44623))

(assert (= (and b!44623 (not res!37768)) b!44624))

(assert (=> b!44622 m!67661))

(assert (=> b!44622 m!67655))

(assert (=> b!44624 m!67661))

(assert (=> b!44624 m!67661))

(declare-fun m!68055 () Bool)

(assert (=> b!44624 m!68055))

(assert (=> b!44363 d!13000))

(declare-fun d!13002 () Bool)

(assert (=> d!13002 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 thiss!1379)) ((_ sign_extend 32) (currentBit!2828 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3462 () Bool)

(assert (= bs!3462 d!13002))

(declare-fun m!68057 () Bool)

(assert (=> bs!3462 m!68057))

(assert (=> b!44363 d!13002))

(declare-fun d!13004 () Bool)

(assert (=> d!13004 (= (invariant!0 (currentBit!2828 (_2!2266 lt!67740)) (currentByte!2833 (_2!2266 lt!67740)) (size!1009 (buf!1352 (_2!2266 lt!67740)))) (and (bvsge (currentBit!2828 (_2!2266 lt!67740)) #b00000000000000000000000000000000) (bvslt (currentBit!2828 (_2!2266 lt!67740)) #b00000000000000000000000000001000) (bvsge (currentByte!2833 (_2!2266 lt!67740)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2833 (_2!2266 lt!67740)) (size!1009 (buf!1352 (_2!2266 lt!67740)))) (and (= (currentBit!2828 (_2!2266 lt!67740)) #b00000000000000000000000000000000) (= (currentByte!2833 (_2!2266 lt!67740)) (size!1009 (buf!1352 (_2!2266 lt!67740))))))))))

(assert (=> b!44362 d!13004))

(declare-fun d!13006 () Bool)

(assert (=> d!13006 (= (head!341 (byteArrayBitContentToList!0 (_2!2266 lt!67736) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!637 (byteArrayBitContentToList!0 (_2!2266 lt!67736) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44367 d!13006))

(declare-fun d!13008 () Bool)

(declare-fun c!2988 () Bool)

(assert (=> d!13008 (= c!2988 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29733 () List!522)

(assert (=> d!13008 (= (byteArrayBitContentToList!0 (_2!2266 lt!67736) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29733)))

(declare-fun b!44629 () Bool)

(assert (=> b!44629 (= e!29733 Nil!519)))

(declare-fun b!44630 () Bool)

(assert (=> b!44630 (= e!29733 (Cons!518 (not (= (bvand ((_ sign_extend 24) (select (arr!1520 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2266 lt!67736) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13008 c!2988) b!44629))

(assert (= (and d!13008 (not c!2988)) b!44630))

(assert (=> b!44630 m!67689))

(declare-fun m!68059 () Bool)

(assert (=> b!44630 m!68059))

(declare-fun m!68061 () Bool)

(assert (=> b!44630 m!68061))

(assert (=> b!44367 d!13008))

(declare-fun d!13010 () Bool)

(assert (=> d!13010 (= (head!341 (bitStreamReadBitsIntoList!0 (_2!2266 lt!67736) (_1!2267 lt!67739) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!637 (bitStreamReadBitsIntoList!0 (_2!2266 lt!67736) (_1!2267 lt!67739) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44367 d!13010))

(declare-fun d!13012 () Bool)

(declare-fun e!29740 () Bool)

(assert (=> d!13012 e!29740))

(declare-fun c!2996 () Bool)

(assert (=> d!13012 (= c!2996 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!68258 () List!522)

(declare-datatypes ((tuple2!4372 0))(
  ( (tuple2!4373 (_1!2279 List!522) (_2!2279 BitStream!1762)) )
))
(declare-fun e!29741 () tuple2!4372)

(assert (=> d!13012 (= lt!68258 (_1!2279 e!29741))))

(declare-fun c!2995 () Bool)

(assert (=> d!13012 (= c!2995 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13012 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13012 (= (bitStreamReadBitsIntoList!0 (_2!2266 lt!67736) (_1!2267 lt!67739) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68258)))

(declare-fun lt!68256 () (_ BitVec 64))

(declare-datatypes ((tuple2!4374 0))(
  ( (tuple2!4375 (_1!2280 Bool) (_2!2280 BitStream!1762)) )
))
(declare-fun lt!68257 () tuple2!4374)

(declare-fun b!44644 () Bool)

(assert (=> b!44644 (= e!29741 (tuple2!4373 (Cons!518 (_1!2280 lt!68257) (bitStreamReadBitsIntoList!0 (_2!2266 lt!67736) (_2!2280 lt!68257) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!68256))) (_2!2280 lt!68257)))))

(declare-fun readBit!0 (BitStream!1762) tuple2!4374)

(assert (=> b!44644 (= lt!68257 (readBit!0 (_1!2267 lt!67739)))))

(assert (=> b!44644 (= lt!68256 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!44646 () Bool)

(declare-fun length!225 (List!522) Int)

(assert (=> b!44646 (= e!29740 (> (length!225 lt!68258) 0))))

(declare-fun b!44645 () Bool)

(declare-fun isEmpty!127 (List!522) Bool)

(assert (=> b!44645 (= e!29740 (isEmpty!127 lt!68258))))

(declare-fun b!44643 () Bool)

(assert (=> b!44643 (= e!29741 (tuple2!4373 Nil!519 (_1!2267 lt!67739)))))

(assert (= (and d!13012 c!2995) b!44643))

(assert (= (and d!13012 (not c!2995)) b!44644))

(assert (= (and d!13012 c!2996) b!44645))

(assert (= (and d!13012 (not c!2996)) b!44646))

(declare-fun m!68063 () Bool)

(assert (=> b!44644 m!68063))

(declare-fun m!68065 () Bool)

(assert (=> b!44644 m!68065))

(declare-fun m!68067 () Bool)

(assert (=> b!44646 m!68067))

(declare-fun m!68069 () Bool)

(assert (=> b!44645 m!68069))

(assert (=> b!44367 d!13012))

(declare-fun d!13014 () Bool)

(declare-fun res!37773 () Bool)

(declare-fun e!29742 () Bool)

(assert (=> d!13014 (=> (not res!37773) (not e!29742))))

(assert (=> d!13014 (= res!37773 (= (size!1009 (buf!1352 thiss!1379)) (size!1009 (buf!1352 (_2!2266 lt!67736)))))))

(assert (=> d!13014 (= (isPrefixOf!0 thiss!1379 (_2!2266 lt!67736)) e!29742)))

(declare-fun b!44647 () Bool)

(declare-fun res!37772 () Bool)

(assert (=> b!44647 (=> (not res!37772) (not e!29742))))

(assert (=> b!44647 (= res!37772 (bvsle (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)) (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!67736))) (currentByte!2833 (_2!2266 lt!67736)) (currentBit!2828 (_2!2266 lt!67736)))))))

(declare-fun b!44648 () Bool)

(declare-fun e!29743 () Bool)

(assert (=> b!44648 (= e!29742 e!29743)))

(declare-fun res!37771 () Bool)

(assert (=> b!44648 (=> res!37771 e!29743)))

(assert (=> b!44648 (= res!37771 (= (size!1009 (buf!1352 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44649 () Bool)

(assert (=> b!44649 (= e!29743 (arrayBitRangesEq!0 (buf!1352 thiss!1379) (buf!1352 (_2!2266 lt!67736)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379))))))

(assert (= (and d!13014 res!37773) b!44647))

(assert (= (and b!44647 res!37772) b!44648))

(assert (= (and b!44648 (not res!37771)) b!44649))

(assert (=> b!44647 m!67661))

(assert (=> b!44647 m!67653))

(assert (=> b!44649 m!67661))

(assert (=> b!44649 m!67661))

(declare-fun m!68071 () Bool)

(assert (=> b!44649 m!68071))

(assert (=> b!44361 d!13014))

(declare-fun d!13016 () Bool)

(assert (=> d!13016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3463 () Bool)

(assert (= bs!3463 d!13016))

(assert (=> bs!3463 m!67825))

(assert (=> b!44361 d!13016))

(declare-fun d!13018 () Bool)

(declare-fun e!29748 () Bool)

(assert (=> d!13018 e!29748))

(declare-fun res!37778 () Bool)

(assert (=> d!13018 (=> (not res!37778) (not e!29748))))

(assert (=> d!13018 (= res!37778 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!68303 () Unit!3160)

(declare-fun choose!27 (BitStream!1762 BitStream!1762 (_ BitVec 64) (_ BitVec 64)) Unit!3160)

(assert (=> d!13018 (= lt!68303 (choose!27 thiss!1379 (_2!2266 lt!67736) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13018 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13018 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2266 lt!67736) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68303)))

(declare-fun b!44652 () Bool)

(assert (=> b!44652 (= e!29748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1009 (buf!1352 (_2!2266 lt!67736)))) ((_ sign_extend 32) (currentByte!2833 (_2!2266 lt!67736))) ((_ sign_extend 32) (currentBit!2828 (_2!2266 lt!67736))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13018 res!37778) b!44652))

(declare-fun m!68073 () Bool)

(assert (=> d!13018 m!68073))

(assert (=> b!44652 m!67691))

(assert (=> b!44361 d!13018))

(declare-fun b!44723 () Bool)

(declare-fun res!37840 () Bool)

(declare-fun e!29781 () Bool)

(assert (=> b!44723 (=> (not res!37840) (not e!29781))))

(declare-fun lt!68529 () tuple2!4346)

(assert (=> b!44723 (= res!37840 (isPrefixOf!0 thiss!1379 (_2!2266 lt!68529)))))

(declare-fun b!44724 () Bool)

(declare-fun e!29779 () Bool)

(declare-datatypes ((tuple2!4376 0))(
  ( (tuple2!4377 (_1!2281 BitStream!1762) (_2!2281 Bool)) )
))
(declare-fun lt!68532 () tuple2!4376)

(assert (=> b!44724 (= e!29779 (= (bitIndex!0 (size!1009 (buf!1352 (_1!2281 lt!68532))) (currentByte!2833 (_1!2281 lt!68532)) (currentBit!2828 (_1!2281 lt!68532))) (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68529))) (currentByte!2833 (_2!2266 lt!68529)) (currentBit!2828 (_2!2266 lt!68529)))))))

(declare-fun d!13020 () Bool)

(declare-fun e!29778 () Bool)

(assert (=> d!13020 e!29778))

(declare-fun res!37839 () Bool)

(assert (=> d!13020 (=> (not res!37839) (not e!29778))))

(declare-fun lt!68536 () tuple2!4346)

(assert (=> d!13020 (= res!37839 (= (size!1009 (buf!1352 (_2!2266 lt!68536))) (size!1009 (buf!1352 thiss!1379))))))

(declare-fun lt!68531 () (_ BitVec 8))

(declare-fun lt!68525 () array!2239)

(assert (=> d!13020 (= lt!68531 (select (arr!1520 lt!68525) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13020 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1009 lt!68525)))))

(assert (=> d!13020 (= lt!68525 (array!2240 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!68528 () tuple2!4346)

(assert (=> d!13020 (= lt!68536 (tuple2!4347 (_1!2266 lt!68528) (_2!2266 lt!68528)))))

(assert (=> d!13020 (= lt!68528 lt!68529)))

(assert (=> d!13020 e!29781))

(declare-fun res!37841 () Bool)

(assert (=> d!13020 (=> (not res!37841) (not e!29781))))

(assert (=> d!13020 (= res!37841 (= (size!1009 (buf!1352 thiss!1379)) (size!1009 (buf!1352 (_2!2266 lt!68529)))))))

(declare-fun lt!68527 () Bool)

(declare-fun appendBit!0 (BitStream!1762 Bool) tuple2!4346)

(assert (=> d!13020 (= lt!68529 (appendBit!0 thiss!1379 lt!68527))))

(assert (=> d!13020 (= lt!68527 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1520 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13020 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13020 (= (appendBitFromByte!0 thiss!1379 (select (arr!1520 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!68536)))

(declare-fun b!44725 () Bool)

(declare-fun res!37843 () Bool)

(assert (=> b!44725 (=> (not res!37843) (not e!29778))))

(declare-fun lt!68535 () (_ BitVec 64))

(declare-fun lt!68534 () (_ BitVec 64))

(assert (=> b!44725 (= res!37843 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68536))) (currentByte!2833 (_2!2266 lt!68536)) (currentBit!2828 (_2!2266 lt!68536))) (bvadd lt!68535 lt!68534)))))

(assert (=> b!44725 (or (not (= (bvand lt!68535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68534 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68535 lt!68534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44725 (= lt!68534 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44725 (= lt!68535 (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)))))

(declare-fun b!44726 () Bool)

(declare-fun e!29780 () Bool)

(assert (=> b!44726 (= e!29778 e!29780)))

(declare-fun res!37844 () Bool)

(assert (=> b!44726 (=> (not res!37844) (not e!29780))))

(declare-fun lt!68530 () tuple2!4376)

(assert (=> b!44726 (= res!37844 (and (= (_2!2281 lt!68530) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1520 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!68531)) #b00000000000000000000000000000000))) (= (_1!2281 lt!68530) (_2!2266 lt!68536))))))

(declare-fun lt!68526 () tuple2!4366)

(declare-fun lt!68533 () BitStream!1762)

(assert (=> b!44726 (= lt!68526 (readBits!0 lt!68533 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1762) tuple2!4376)

(assert (=> b!44726 (= lt!68530 (readBitPure!0 lt!68533))))

(declare-fun readerFrom!0 (BitStream!1762 (_ BitVec 32) (_ BitVec 32)) BitStream!1762)

(assert (=> b!44726 (= lt!68533 (readerFrom!0 (_2!2266 lt!68536) (currentBit!2828 thiss!1379) (currentByte!2833 thiss!1379)))))

(declare-fun b!44727 () Bool)

(assert (=> b!44727 (= e!29780 (= (bitIndex!0 (size!1009 (buf!1352 (_1!2281 lt!68530))) (currentByte!2833 (_1!2281 lt!68530)) (currentBit!2828 (_1!2281 lt!68530))) (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68536))) (currentByte!2833 (_2!2266 lt!68536)) (currentBit!2828 (_2!2266 lt!68536)))))))

(declare-fun b!44728 () Bool)

(assert (=> b!44728 (= e!29781 e!29779)))

(declare-fun res!37845 () Bool)

(assert (=> b!44728 (=> (not res!37845) (not e!29779))))

(assert (=> b!44728 (= res!37845 (and (= (_2!2281 lt!68532) lt!68527) (= (_1!2281 lt!68532) (_2!2266 lt!68529))))))

(assert (=> b!44728 (= lt!68532 (readBitPure!0 (readerFrom!0 (_2!2266 lt!68529) (currentBit!2828 thiss!1379) (currentByte!2833 thiss!1379))))))

(declare-fun b!44729 () Bool)

(declare-fun res!37838 () Bool)

(assert (=> b!44729 (=> (not res!37838) (not e!29778))))

(assert (=> b!44729 (= res!37838 (isPrefixOf!0 thiss!1379 (_2!2266 lt!68536)))))

(declare-fun b!44730 () Bool)

(declare-fun res!37842 () Bool)

(assert (=> b!44730 (=> (not res!37842) (not e!29781))))

(assert (=> b!44730 (= res!37842 (= (bitIndex!0 (size!1009 (buf!1352 (_2!2266 lt!68529))) (currentByte!2833 (_2!2266 lt!68529)) (currentBit!2828 (_2!2266 lt!68529))) (bvadd (bitIndex!0 (size!1009 (buf!1352 thiss!1379)) (currentByte!2833 thiss!1379) (currentBit!2828 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13020 res!37841) b!44730))

(assert (= (and b!44730 res!37842) b!44723))

(assert (= (and b!44723 res!37840) b!44728))

(assert (= (and b!44728 res!37845) b!44724))

(assert (= (and d!13020 res!37839) b!44725))

(assert (= (and b!44725 res!37843) b!44729))

(assert (= (and b!44729 res!37838) b!44726))

(assert (= (and b!44726 res!37844) b!44727))

(declare-fun m!68263 () Bool)

(assert (=> b!44724 m!68263))

(declare-fun m!68265 () Bool)

(assert (=> b!44724 m!68265))

(declare-fun m!68267 () Bool)

(assert (=> b!44723 m!68267))

(assert (=> b!44730 m!68265))

(assert (=> b!44730 m!67661))

(declare-fun m!68269 () Bool)

(assert (=> b!44725 m!68269))

(assert (=> b!44725 m!67661))

(declare-fun m!68271 () Bool)

(assert (=> b!44726 m!68271))

(declare-fun m!68273 () Bool)

(assert (=> b!44726 m!68273))

(declare-fun m!68275 () Bool)

(assert (=> b!44726 m!68275))

(declare-fun m!68277 () Bool)

(assert (=> d!13020 m!68277))

(declare-fun m!68279 () Bool)

(assert (=> d!13020 m!68279))

(assert (=> d!13020 m!68059))

(declare-fun m!68281 () Bool)

(assert (=> b!44727 m!68281))

(assert (=> b!44727 m!68269))

(declare-fun m!68283 () Bool)

(assert (=> b!44729 m!68283))

(declare-fun m!68285 () Bool)

(assert (=> b!44728 m!68285))

(assert (=> b!44728 m!68285))

(declare-fun m!68287 () Bool)

(assert (=> b!44728 m!68287))

(assert (=> b!44361 d!13020))

(push 1)

(assert (not b!44725))

(assert (not b!44646))

(assert (not b!44630))

(assert (not b!44453))

(assert (not b!44645))

(assert (not d!12930))

(assert (not b!44723))

(assert (not b!44535))

(assert (not b!44724))

(assert (not d!12966))

(assert (not b!44539))

(assert (not b!44624))

(assert (not d!12918))

(assert (not d!12970))

(assert (not d!13002))

(assert (not b!44621))

(assert (not b!44730))

(assert (not b!44468))

(assert (not b!44728))

(assert (not d!13018))

(assert (not d!12926))

(assert (not d!12920))

(assert (not d!13016))

(assert (not b!44455))

(assert (not d!12922))

(assert (not d!13020))

(assert (not b!44537))

(assert (not b!44618))

(assert (not b!44649))

(assert (not b!44647))

(assert (not b!44620))

(assert (not b!44617))

(assert (not d!12912))

(assert (not b!44644))

(assert (not b!44616))

(assert (not b!44652))

(assert (not b!44622))

(assert (not b!44538))

(assert (not b!44466))

(assert (not b!44729))

(assert (not d!12914))

(assert (not bm!526))

(assert (not b!44727))

(assert (not b!44726))

(assert (not d!12968))

(assert (not b!44619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

