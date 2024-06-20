; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14344 () Bool)

(assert start!14344)

(declare-fun b!74382 () Bool)

(declare-fun e!48634 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!74382 (= e!48634 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!3032 0))(
  ( (array!3033 (arr!2011 (Array (_ BitVec 32) (_ BitVec 8))) (size!1417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2408 0))(
  ( (BitStream!2409 (buf!1798 array!3032) (currentByte!3542 (_ BitVec 32)) (currentBit!3537 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6412 0))(
  ( (tuple2!6413 (_1!3320 BitStream!2408) (_2!3320 BitStream!2408)) )
))
(declare-fun lt!119696 () tuple2!6412)

(declare-fun thiss!1379 () BitStream!2408)

(declare-fun reader!0 (BitStream!2408 BitStream!2408) tuple2!6412)

(assert (=> b!74382 (= lt!119696 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!74383 () Bool)

(declare-fun res!61486 () Bool)

(declare-fun e!48638 () Bool)

(assert (=> b!74383 (=> (not res!61486) (not e!48638))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74383 (= res!61486 (validate_offset_bits!1 ((_ sign_extend 32) (size!1417 (buf!1798 thiss!1379))) ((_ sign_extend 32) (currentByte!3542 thiss!1379)) ((_ sign_extend 32) (currentBit!3537 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74384 () Bool)

(declare-fun res!61485 () Bool)

(assert (=> b!74384 (=> res!61485 e!48634)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74384 (= res!61485 (not (invariant!0 (currentBit!3537 thiss!1379) (currentByte!3542 thiss!1379) (size!1417 (buf!1798 thiss!1379)))))))

(declare-fun b!74386 () Bool)

(assert (=> b!74386 (= e!48638 (not e!48634))))

(declare-fun res!61488 () Bool)

(assert (=> b!74386 (=> res!61488 e!48634)))

(declare-fun lt!119698 () (_ BitVec 64))

(assert (=> b!74386 (= res!61488 (or (bvslt i!635 to!314) (not (= lt!119698 (bvsub (bvadd lt!119698 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2408 BitStream!2408) Bool)

(assert (=> b!74386 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4911 0))(
  ( (Unit!4912) )
))
(declare-fun lt!119697 () Unit!4911)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2408) Unit!4911)

(assert (=> b!74386 (= lt!119697 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74386 (= lt!119698 (bitIndex!0 (size!1417 (buf!1798 thiss!1379)) (currentByte!3542 thiss!1379) (currentBit!3537 thiss!1379)))))

(declare-fun b!74385 () Bool)

(declare-fun e!48637 () Bool)

(declare-fun array_inv!1263 (array!3032) Bool)

(assert (=> b!74385 (= e!48637 (array_inv!1263 (buf!1798 thiss!1379)))))

(declare-fun res!61487 () Bool)

(assert (=> start!14344 (=> (not res!61487) (not e!48638))))

(declare-fun srcBuffer!2 () array!3032)

(assert (=> start!14344 (= res!61487 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1417 srcBuffer!2))))))))

(assert (=> start!14344 e!48638))

(assert (=> start!14344 true))

(assert (=> start!14344 (array_inv!1263 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2408) Bool)

(assert (=> start!14344 (and (inv!12 thiss!1379) e!48637)))

(assert (= (and start!14344 res!61487) b!74383))

(assert (= (and b!74383 res!61486) b!74386))

(assert (= (and b!74386 (not res!61488)) b!74384))

(assert (= (and b!74384 (not res!61485)) b!74382))

(assert (= start!14344 b!74385))

(declare-fun m!119341 () Bool)

(assert (=> b!74386 m!119341))

(declare-fun m!119343 () Bool)

(assert (=> b!74386 m!119343))

(declare-fun m!119345 () Bool)

(assert (=> b!74386 m!119345))

(declare-fun m!119347 () Bool)

(assert (=> b!74385 m!119347))

(declare-fun m!119349 () Bool)

(assert (=> b!74384 m!119349))

(declare-fun m!119351 () Bool)

(assert (=> b!74382 m!119351))

(declare-fun m!119353 () Bool)

(assert (=> start!14344 m!119353))

(declare-fun m!119355 () Bool)

(assert (=> start!14344 m!119355))

(declare-fun m!119357 () Bool)

(assert (=> b!74383 m!119357))

(push 1)

(assert (not b!74386))

(assert (not start!14344))

(assert (not b!74385))

(assert (not b!74382))

(assert (not b!74383))

(assert (not b!74384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

